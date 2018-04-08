package com.force4us.dao.cache;

import com.force4us.dao.SeckillDao;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

/**
 * Created by chengjinqian on 2017/4/20.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring/spring-dao.xml"})
public class RedisDaoTest {

    private long id = 1001;

    @Autowired
    private RedisDao redisDao;

    @Autowired
    private SeckillDao seckillDao;

    @Test
    public void testSeckill() throws Exception {
        //get and put

        /*SeckillEntity seckillEntity = redisDao.getSeckill(id);
        if (seckillEntity == null) {
            seckillEntity = seckillDao.queryById(id);
            if (seckillEntity != null) {
                String result = redisDao.putSeckill(seckillEntity);
                System.out.println(result);
                seckillEntity = redisDao.getSeckill(id);
                System.out.println(seckillEntity);
            }
        }*/
    }



}