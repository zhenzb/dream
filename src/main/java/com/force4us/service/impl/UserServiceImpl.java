package com.force4us.service.impl;

import com.force4us.dao.UserDao;
import com.force4us.entity.UserAddressEntity;
import com.force4us.entity.UserEntity;
import com.force4us.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import sun.nio.cs.US_ASCII;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    UserDao userDao;
    public int addUser(UserEntity userEntity) {
        int  number = userDao.insertUser(userEntity.getId(),userEntity.getUserName(), userEntity.getPassword(), userEntity.getMobileNo(), userEntity.getHeadUrl(),
                userEntity.getDateCreated(),userEntity.getLastModified(),userEntity.getRecordStatus());
        return number;
    }

    public UserEntity findUserEntityByUserNameAndPassword(UserEntity userEntity) {
        UserEntity user = userDao.findUserByUserNameAndPassword(userEntity.getUserName(), userEntity.getPassword());
        return user;
    }

    public int addUserAddress(UserAddressEntity userAddressEntity) {
        int number = userDao.insertUserAddress(userAddressEntity.getDateCreated(), userAddressEntity.getLastModified(), userAddressEntity.getState(),
                userAddressEntity.getRealName(), userAddressEntity.getMobileNo(),  userAddressEntity.getDetailedAddress(), userAddressEntity.getUserId());
        return number;
    }

    public UserEntity findUserEntityByUserName(String userName) {
        return userDao.findUserByUserName(userName);
    }

    @Override
    public int updateUserHeadImage(long userId, String headUrl) {
        int i = userDao.updateUserHeadImage(userId, headUrl);
        return i;
    }
}
