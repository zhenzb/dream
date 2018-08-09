package com.force4us.service.impl;

import com.force4us.dao.RentingDao;
import com.force4us.entity.RentingEntity;
import com.force4us.service.RentingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Service
public class RentingServiceimpl implements RentingService {
    @Autowired
    RentingDao rentingDao;
    @Override
    public List findList(int status) {
        List list = rentingDao.findList(status);
        return list;
    }

    @Override
    public List findList(int status, Long userId) {
        List rntingByuserId = rentingDao.findRntingByuserId(userId);
        return rntingByuserId;
    }

    @Override
    public RentingEntity findRrnting(Long id) {
        RentingEntity renting = rentingDao.findRenting(id);
        return renting;
    }

    @Override
    public int saveRenting(Long flashSaleId, String houseName, String houseSize, Integer housePrice, String houseAddress, String contactsName, String phone, String remark, String houseImage, String houseImageOne, String houseTwo, String houseThree, Long userId) {
        int i = 0;
        if(null == flashSaleId){
           flashSaleId = System.currentTimeMillis();
       }
        SimpleDateFormat sdf  = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date date = new Date();
        String dateCreated = sdf.format(date);
        Date validBeginDate1 = null;
        try {
            validBeginDate1 = sdf.parse(dateCreated);
            i = rentingDao.insertRenting(flashSaleId, validBeginDate1, validBeginDate1, 0, houseName, houseSize, housePrice, contactsName, phone, houseImage, houseImageOne, houseTwo, houseThree, houseAddress, remark, userId);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return i;
    }
}
