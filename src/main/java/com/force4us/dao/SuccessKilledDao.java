package com.force4us.dao;

import com.force4us.entity.SeckillEntity;
import com.force4us.entity.SuccessKilledEntity;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by chengjinqian on 2017/4/17.
 */
public interface SuccessKilledDao {

    /**
     * 插入购买明细，可过滤重复
     * @param seckillId
     * @param userPhone
     * @return 插入的行数
     */
    int insertSuccessKilled(@Param("seckillId") long seckillId, @Param("userPhone") long userPhone);

    /**
     * 根据秒杀商品ID查询明细SuccessKilled对象， 携带了Seckill秒杀产品对象
     * @param seckillId
     * @param userPhone
     * @return
     */
    SuccessKilledEntity queryByIdWithSeckill(@Param("seckillId") long seckillId, @Param("userPhone") long userPhone);

    List<SuccessKilledEntity> findSuccessKilledByUserId(@Param("userId") Long userId);

    List<SuccessKilledEntity> findSuccesskilledBySeckillId(@Param("seckilled") long seckilledId);

    List<SeckillEntity> findSuccesskilled();
}
