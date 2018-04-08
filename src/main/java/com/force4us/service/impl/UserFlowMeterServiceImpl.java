package com.force4us.service.impl;

import com.force4us.dao.UserFlowMeterDao;
import com.force4us.entity.UserFlowMeterEntity;
import com.force4us.service.UserFlowMeterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Describe:
 * @Author:zhenzhuobin
 * @Date:
 */
@Service
public class UserFlowMeterServiceImpl implements UserFlowMeterService {
    @Autowired
    UserFlowMeterDao userFlowMeterDao;
    public List<UserFlowMeterEntity> findByUserIdAndType(Long userId, int type) {
        List<UserFlowMeterEntity> userFlowMeterList = userFlowMeterDao.findByUserIdAndType(userId, type);
        return userFlowMeterList;
    }

    public int addUserFlowMeter(UserFlowMeterEntity userFlowMeterEntity) {
        int userFlowMeterNumber = userFlowMeterDao.saveUserFlowMeter(userFlowMeterEntity.getId(), userFlowMeterEntity.getRemarks(), userFlowMeterEntity.getVersion(),
                userFlowMeterEntity.getDateCreated(), userFlowMeterEntity.getLastModified(), userFlowMeterEntity.getUserId(),
                userFlowMeterEntity.getChangeGold(), userFlowMeterEntity.getCurrentGold(), userFlowMeterEntity.getOriginalGold(),
                userFlowMeterEntity.getReason(), userFlowMeterEntity.getRecordStatus(), userFlowMeterEntity.getChangeSilverBean(),
                userFlowMeterEntity.getCurrentSilverBean(), userFlowMeterEntity.getOriginalSilverBean(), userFlowMeterEntity.getType(),
                userFlowMeterEntity.getAlipayAccount());
        return userFlowMeterNumber;
    }


}
