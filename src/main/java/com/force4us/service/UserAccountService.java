package com.force4us.service;

import com.force4us.entity.UserAccountEntity;
import org.apache.ibatis.annotations.Param;

/**
 * @Describe:
 * @Author:zhenzhuobin
 * @Date:
 */
public interface UserAccountService {

    int inserUseraccount(UserAccountEntity userAccountEntity);

    UserAccountEntity findByUserId(Long userId);
    int updateUserAccount(UserAccountEntity userAccount);
    int addAlipayAccount(@Param("userId")Long userId,@Param("realName")String realName, @Param("alipayAccount")String alipayAccount, @Param("alipayPassword")
            String alipayPassword);
}
