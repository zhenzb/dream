package com.force4us.service;

import com.force4us.entity.UserFlowMeterEntity;

import java.util.List;

/**
 * @Describe:
 * @Author:zhenzhuobin
 * @Date:
 */
public interface UserFlowMeterService {

    List<UserFlowMeterEntity> findByUserIdAndType(Long userId,int type);

    int addUserFlowMeter(UserFlowMeterEntity userFlowMeterEntity);
}
