package com.force4us.service.impl;

import com.force4us.dao.SuccessKilledDao;
import com.force4us.entity.SeckillEntity;
import com.force4us.entity.SuccessKilledEntity;
import com.force4us.service.SuccessKilledService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SuccessKilledServiceImpl implements SuccessKilledService{
    @Autowired
    SuccessKilledDao successKilledDao;

    public List<SuccessKilledEntity> findSuccessKilledByUserId(Long UserId) {
        List<SuccessKilledEntity> successKilledEntityList = successKilledDao.findSuccessKilledByUserId(UserId);
        return successKilledEntityList;
    }

    public List<SuccessKilledEntity> findSuccessKilledBySeckillId(long seckilled) {
        List<SuccessKilledEntity> successkilledBySeckillId = successKilledDao.findSuccesskilledBySeckillId(seckilled);
        return successkilledBySeckillId;
    }

    public List<SeckillEntity> findSuccessKilled() {
        List<SeckillEntity> successkilledBySeckillId = successKilledDao.findSuccesskilled();
        return successkilledBySeckillId;
    }
}
