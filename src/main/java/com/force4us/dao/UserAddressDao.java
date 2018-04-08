package com.force4us.dao;

import com.force4us.entity.UserAddressEntity;
import org.apache.ibatis.annotations.Param;

/**
 * @Describe:
 * @Author:zhenzhuobin
 * @Date:
 */
public interface UserAddressDao {

    UserAddressEntity findUserAddressByUserIdAndState(@Param("userId") Long userId, @Param("state") int state);
}
