package com.force4us.dao;

import com.force4us.entity.RentingEntity;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

public interface RentingDao {

    List findList(@Param("recordStatus")int status);

    RentingEntity findRenting(@Param("id")Long id);

    List findRntingByuserId(@Param("userId")Long userId);

    int insertRenting(@Param("id") Long id, @Param("dateCreated")Date dateCreated, @Param("lastModified")Date lastModified, @Param("recordStatus")int recordStatus, @Param("houseName")String houseName, @Param("houseSize")String houseSize,@Param("housePrice") Integer housePrice,
                      @Param("contactsName")String contactsName, @Param("phone")String phone,@Param("houseImage") String houseImage,@Param("houseImageOne") String houseImageOne, @Param("houseImageTwo")String houseImageTwo, @Param("houseImageThree")String houseImageThree, @Param("houseAddress")String houseAddress,@Param("remarks") String remarks,@Param("userId") Long userId);
}
