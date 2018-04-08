package com.force4us.service.impl;

import com.force4us.comm.SnowflakeIdWorker;
import com.force4us.dao.SeckillDao;
import com.force4us.dao.SuccessKilledDao;
import com.force4us.dao.cache.RedisDao;
import com.force4us.dto.Exposer;
import com.force4us.dto.SeckillExecution;
import com.force4us.entity.SeckillEntity;
import com.force4us.entity.SuccessKilledEntity;
import com.force4us.entity.UserEntity;
import com.force4us.enums.SeckillStatEnum;
import com.force4us.exception.RepeatKillException;
import com.force4us.exception.SeckillCloseException;
import com.force4us.exception.SeckillException;
import com.force4us.service.SeckillService;
import org.apache.commons.collections4.MapUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.DigestUtils;

import javax.servlet.http.HttpSession;
import java.util.*;

/**
 * Created by chengjinqian on 2017/4/18.
 */
@Service
public class SeckillServiceImpl implements SeckillService {
    //日志对象
    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private SeckillDao seckillDao;

    @Autowired
    private SuccessKilledDao successKilledDao;

    @Autowired
    private RedisDao redisDao;

    //加入一个混淆字符串(秒杀接口)的salt，为了我避免用户猜出我们的md5值，值任意给，越复杂越好
    private final String salt = "sadjgioqwelrhaljflutoiu293480523*&%*&*#";

    public List<SeckillEntity> getSeckillList() {
        return seckillDao.queryAll(0, 4);
    }

    public List<SeckillEntity> findSeckillEntityByState() {
        return seckillDao.findSeckillEntityByState(1);
    }

    @Override
    public List<SeckillEntity> findSeckillEntity() {

        return seckillDao.findSeckillEntity();
    }

    @Override
    public List<SeckillEntity> findSeckillEntityByStateAndName(String name) {

        return seckillDao.findSeckillEntityByStateAndName(1,name);
    }

    public SeckillEntity getById(long seckillId) {
        return seckillDao.queryById(seckillId);
    }

    public Exposer exportSeckillUrl(long seckillId) {
        //缓存优化
        //1。访问redi


        SeckillEntity seckillEntity = redisDao.getSeckill(seckillId);
        if (seckillEntity == null) {
            //2.访问数据库
            seckillEntity = seckillDao.queryById(seckillId);
            if (seckillEntity == null) {//说明查不到这个秒杀产品的记录
                return new Exposer(false, seckillId);
            } else {
                //3,放入redis
                redisDao.putSeckill(seckillEntity);
            }

        }
        Date startTime = seckillEntity.getStartTime();
        Date endTime = seckillEntity.getEndTime();
        Date nowTime = new Date();
        //若是秒杀未开启
        if (nowTime.getTime() < startTime.getTime() || nowTime.getTime() > endTime.getTime()) {
            return new Exposer(false, seckillId, nowTime.getTime(), startTime.getTime(), endTime.getTime());
        }

        //秒杀开启，返回秒杀商品的id、用给接口加密的md5
        String md5 = getMD5(seckillId);
        return new Exposer(true, md5, seckillId);
    }

    private String getMD5(long seckillId) {
        String base = seckillId + "/" + salt;
        String md5 = DigestUtils.md5DigestAsHex(base.getBytes());
        return md5;
    }

    @Transactional
    /**
     * 使用注解控制事务方法的优点:
     * 1.开发团队达成一致约定，明确标注事务方法的编程风格
     * 2.保证事务方法的执行时间尽可能短，不要穿插其他网络操作RPC/HTTP请求或者剥离到事务方法外部
     * 3.不是所有的方法都需要事务，如只有一条修改操作、只读操作不要事务控制
     */
    public SeckillExecution executeSeckill(long seckillId, long userPhone, String md5) throws SeckillException, RepeatKillException, SeckillCloseException {
        if (md5 == null || !md5.equals(getMD5(seckillId))) {
            throw new SeckillException("seckill data rewrite");
        }
        //执行秒杀逻辑：减库存+记录购买行为
        Date nowTime = new Date();
        try {
            //否则更新了库存，秒杀成功,增加明细
            int insertCount = successKilledDao.insertSuccessKilled(seckillId, userPhone);
            //看是否该明细被重复插入，即用户是否重复秒杀
            if (insertCount <= 0) {
                throw new RepeatKillException("seckill repeated");
            } else {

                //减库存,热点商品竞争，update方法会拿到行级锁
                int updateCount = seckillDao.reduceNumber(seckillId, nowTime);
                if (updateCount <= 0) {
                    //没有更新库存记录，说明秒杀结束 rollback
                    throw new SeckillCloseException("seckill is closed");
                } else {
                    //秒杀成功,得到成功插入的明细记录,并返回成功秒杀的信息 commit
                    SuccessKilledEntity successKilledEntity = successKilledDao.queryByIdWithSeckill(seckillId, userPhone);
                    return new SeckillExecution(seckillId, SeckillStatEnum.SUCCESS, successKilledEntity);
                }

            }
        } catch (SeckillCloseException e1) {
            throw e1;
        } catch (RepeatKillException e2) {
            throw e2;
        } catch (Exception e) {
            logger.error(e.getMessage(), e);
            //所有编译器异常，转化成运行期异常
            throw new SeckillException("seckill inner error:" + e.getMessage());
        }
    }

    public SeckillExecution executeSeckillProcedure(long seckillId, long userPhone, String md5, HttpSession session) throws SeckillException, RepeatKillException, SeckillCloseException {
        if (md5 == null || !md5.equals(getMD5(seckillId))) {
            return new SeckillExecution(seckillId, SeckillStatEnum.DATE_REWRITE);
        }
        SeckillEntity seckillEntity = seckillDao.queryById(seckillId);
        Date time = new Date();
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("id", Long.valueOf(String.valueOf(SnowflakeIdWorker.getId()).substring(0,5)));
        map.put("seckillId", seckillId);
        map.put("userId",((UserEntity)session.getAttribute("user")).getId());
        map.put("seckillName", seckillEntity.getName());
        map.put("price", seckillEntity.getPrice());
        map.put("phone", userPhone);
        map.put("killTime", time);
        map.put("result", null);
        try {
            seckillDao.killByProcedure(map);
            int result = MapUtils.getInteger(map, "result", -2);
            if (result == 1) {
                SuccessKilledEntity successKill = successKilledDao.queryByIdWithSeckill(seckillId, userPhone);
                return new SeckillExecution(seckillId, SeckillStatEnum.SUCCESS, successKill);
            } else {
                return new SeckillExecution(seckillId, SeckillStatEnum.stateOf(result));
            }
        } catch (Exception e) {
            logger.error(e.getMessage(), e);
            return new SeckillExecution(seckillId, SeckillStatEnum.INNER_ERROR);
        }
    }
}
