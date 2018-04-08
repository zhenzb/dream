package com.force4us.dao;

import com.force4us.entity.UserAddressEntity;
import com.force4us.entity.UserEntity;
import org.apache.ibatis.annotations.Param;

import java.util.Date;

public interface UserDao {

    int insertUser(@Param("id") long id,@Param("userName") String userName, @Param("password") String password, @Param("mobileNo") Long mobileNo, @Param("headUrl") String headUrl,
                   @Param("createDate") Date createDate, @Param("lastModified") Date lastModified, @Param("recordState") int recordState);

    UserEntity findUserByUserNameAndPassword(@Param("userName") String userName, @Param("password") String password);

    int insertUserAddress(@Param("createDate") Date createDate, @Param("lastModified") Date lastModified, @Param("state") int state,
            @Param("realName") String realName,@Param("mobileNo") Long mobileNo,@Param("detailedAddress") String DetailedAddress,@Param("userId") Long userId);

    UserEntity findUserByUserName(@Param("userName")String userName);

    int updateUserHeadImage(@Param("userId")long userId,@Param("headUrl")String headUrl);


}
