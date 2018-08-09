package com.force4us.service;


import com.force4us.entity.RentingEntity;

import java.util.List;

public interface RentingService {

     List findList(int status);

     List findList(int status,Long userId);

     RentingEntity findRrnting(Long id);

     int saveRenting(Long flashSaleId, String houseName, String houseSize, Integer housePrice, String houseAddress, String contactsName,
                     String phone,String remark,String houseImage,String houseImageOne,String houseTwo,String houseThree,Long userId);
}
