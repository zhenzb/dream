package com.force4us.service;

import com.force4us.entity.SeckillEntity;
import com.force4us.entity.SuccessKilledEntity;

import java.util.List;

public interface SuccessKilledService {


    List<SuccessKilledEntity> findSuccessKilledByUserId(Long UserId);

    List<SuccessKilledEntity> findSuccessKilledBySeckillId(long seckilled);

    List<SeckillEntity> findSuccessKilled();

}
