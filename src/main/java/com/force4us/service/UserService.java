package com.force4us.service;

import com.force4us.entity.UserAddressEntity;
import com.force4us.entity.UserEntity;

public interface UserService {

    int addUser(UserEntity userEntity);

    UserEntity findUserEntityByUserNameAndPassword(UserEntity userEntity);

    int addUserAddress(UserAddressEntity userAddressEntity);

    UserEntity findUserEntityByUserName(String userName);
    int updateUserHeadImage(long userId,String headUrl);
}
