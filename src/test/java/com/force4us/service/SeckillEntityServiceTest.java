package com.force4us.service;

import com.force4us.dto.Exposer;
import com.force4us.dto.SeckillExecution;
import com.force4us.entity.SeckillEntity;
import com.force4us.exception.RepeatKillException;
import com.force4us.exception.SeckillCloseException;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

/**
 * Created by chengjinqian on 2017/4/18.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({
        "classpath:spring/spring-dao.xml",
        "classpath:spring/spring-service.xml"})
public class SeckillEntityServiceTest {
    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    
    @Autowired
    private SeckillService seckillService;

    @Test
    public void getSeckillList() throws Exception {
        List<SeckillEntity> list = seckillService.getSeckillList();
        logger.info("list={}", list);
    }

    @Test
    public void getById() throws Exception {
        long id = 1000;
        SeckillEntity seckillEntity = seckillService.getById(id);
        logger.info("seckill={}", seckillEntity);
    }

    @Test
    public void exportSeckillLogic() throws Exception {
        long id = 1000;
        Exposer exposer = seckillService.exportSeckillUrl(id);
        if(exposer.isExposed()){
            logger.info("expose={}", exposer);
            long phone = 18810464493L;
            String md5 = exposer.getMd5();

            try {
                SeckillExecution execution = seckillService.executeSeckill(id, phone, md5);
                logger.info("result={}", execution);
            } catch (RepeatKillException e1) {
                logger.error(e1.getMessage());
            } catch (SeckillCloseException e2) {
                logger.error(e2.getMessage());
            }
        }else{
            //秒杀未开启
            logger.warn("expose={}", exposer);
        }

    }


    @Test
    public void executeSeckillProcedure(){
        long seckillId = 1002;
        long phone = 18810464493L;
        Exposer exposer = seckillService.exportSeckillUrl(seckillId);
        if(exposer.isExposed()){
            String md5 = exposer.getMd5();
            //SeckillExecution seckillExcution = seckillService.executeSeckillProcedure(seckillId, phone, md5);
           // logger.info("============="+seckillExcution.getStateInfo());
        }
    }


}