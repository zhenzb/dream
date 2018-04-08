package com.force4us.dao;

import com.force4us.entity.SeckillEntity;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.Date;
import java.util.List;

/**
 * 配置spring和junit整合，junit启动时加载springIoC容器
 * Created by chengjinqian on 2017/4/17.
 */
@RunWith(SpringJUnit4ClassRunner.class)
//告诉junit spring配置文件
@ContextConfiguration({"classpath:spring/spring-dao.xml"})
public class SeckillEntityDaoTest {

    @Autowired
    private SeckillDao seckillDao;

    @Test
    public void reduceNumber() throws Exception {
        Date killTime = new Date();
        int updateCount = seckillDao.reduceNumber(1000L,killTime);
        System.out.println("updateCount= " + updateCount);
    }

    @Test
    public void queryById() throws Exception {
        long id = 1000;
        SeckillEntity seckillEntity = seckillDao.queryById(id);
        System.out.println(seckillEntity.getName());
        System.out.println(seckillEntity);
    }

    @Test
    public void queryAll() throws Exception {
        List<SeckillEntity> seckillEntities = seckillDao.queryAll(0,100);
        for(SeckillEntity seckillEntity : seckillEntities){
            System.out.println(seckillEntity);
        }
    }

}