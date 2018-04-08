package com.force4us.web;

import com.force4us.comm.GlobalConstant;
import com.force4us.entity.UserAccountEntity;
import com.force4us.entity.UserFlowMeterEntity;
import com.force4us.service.UserAccountService;
import com.force4us.service.UserFlowMeterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.Date;

@Service
public class AddUserAccount {
    @Autowired
    UserFlowMeterService userFlowMeterService;
    @Autowired
    UserAccountService userAccountService;
    public boolean addAccount(Long userId,Integer changeValue,String reason,int chargeType) {
        boolean flag = false;
        Integer valueResult = 0;
        try {
            UserAccountEntity userAccount = userAccountService.findByUserId(userId);
            if(chargeType == GlobalConstant.SILVERBEAN){
                valueResult = userAccount.getSilverBean();
            }else if( chargeType == GlobalConstant.GOLD || chargeType == GlobalConstant.money){
                valueResult = userAccount.getGold();
            }
            double silverBeanResult = add(valueResult.doubleValue(), changeValue);
            if(silverBeanResult < 0){
                return flag;
            }
            userAccount.setSilverBean(new Double(silverBeanResult).intValue());
            userAccountService.updateUserAccount(userAccount);
            UserFlowMeterEntity userFlowMeterEntity = new UserFlowMeterEntity();
            long l = System.currentTimeMillis();
            String goodsId = String.valueOf(l).substring(6, String.valueOf(l).length());
            userFlowMeterEntity.setId(Long.valueOf(goodsId));
            userFlowMeterEntity.setRecordStatus(0);
            userFlowMeterEntity.setVersion(0);
            userFlowMeterEntity.setDateCreated(new Date());
            userFlowMeterEntity.setLastModified(new Date());
            userFlowMeterEntity.setUserId(userId);
            userFlowMeterEntity.setOriginalSilverBean(valueResult);
            userFlowMeterEntity.setChangeSilverBean(changeValue);
            userFlowMeterEntity.setCurrentSilverBean(new Double(silverBeanResult).intValue());
            userFlowMeterEntity.setOriginalGold(0);
            userFlowMeterEntity.setChangeGold(GlobalConstant.INT_GOLD);
            userFlowMeterEntity.setCurrentGold(GlobalConstant.INT_GOLD);
            userFlowMeterEntity.setReason(reason);
            userFlowMeterEntity.setType(chargeType);
            userFlowMeterEntity.setAlipayAccount(userAccount.getAlipayAccount());
            userFlowMeterService.addUserFlowMeter(userFlowMeterEntity);
            flag = true;
        }catch (Exception e){
            e.printStackTrace();
        }
        return flag;
    }


    public static double add(double v1, double v2) {
        BigDecimal b1 = new BigDecimal(Double.toString(v1));// 建议写string类型的参数，下同
        BigDecimal b2 = new BigDecimal(Double.toString(v2));
        return b1.add(b2).doubleValue();
    }
}
