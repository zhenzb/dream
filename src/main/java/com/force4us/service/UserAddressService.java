package com.force4us.service;

import com.force4us.entity.UserAddressEntity;

/**
 * @Describe:
 * @Author:zhenzhuobin
 * @Date:
 */
public interface UserAddressService {
   UserAddressEntity findUserAddressByUserIdAndState(long userId,int state);
}
