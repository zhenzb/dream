package com.force4us.service.impl;

import com.force4us.dao.UserAddressDao;
import com.force4us.entity.UserAddressEntity;
import com.force4us.service.UserAddressService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @Describe:
 * @Author:zhenzhuobin
 * @Date:
 */
@Service
public class UserAddressServiceImpl implements UserAddressService {

    @Autowired
   private  UserAddressDao userAddressDao;
    public UserAddressEntity findUserAddressByUserIdAndState(long userId,int state) {
        UserAddressEntity userAddressByUserIdAndState = userAddressDao.findUserAddressByUserIdAndState(userId, state);
        return userAddressByUserIdAndState;
    }
}
