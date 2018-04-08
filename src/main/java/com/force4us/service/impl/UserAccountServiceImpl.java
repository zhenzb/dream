package com.force4us.service.impl;

import com.force4us.dao.UserAccountDao;
import com.force4us.entity.UserAccountEntity;
import com.force4us.service.UserAccountService;
import com.force4us.service.UserAddressService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @Describe:
 * @Author:zhenzhuobin
 * @Date:
 */
@Service
public class UserAccountServiceImpl implements UserAccountService {

    @Autowired
    UserAccountDao userAccountDao;
    public int inserUseraccount(UserAccountEntity userAccountEntity) {

        int userAccountNumber = userAccountDao.insertUserAccount(userAccountEntity.getId(), userAccountEntity.getUserId(), userAccountEntity.getDateCreated(),
                userAccountEntity.getLastModified(), userAccountEntity.getRecordStatus(), userAccountEntity.getGold(), userAccountEntity.getSilverBean(),
                userAccountEntity.getRemarks());
        return userAccountNumber;
    }

    public UserAccountEntity findByUserId(Long userId) {
        UserAccountEntity UserAccount = userAccountDao.findByUserId(userId);
        return UserAccount;
    }

    @Override
    public int updateUserAccount(UserAccountEntity userAccount) {
        int updateNumber = userAccountDao.updateUserAccount(userAccount.getUserId(), userAccount.getSilverBean());
        return updateNumber;
    }

    @Override
    public int addAlipayAccount(Long userId,String realName, String alipayAccount, String alipayPassword) {
        int i = userAccountDao.addAlipayAccount(userId,realName, alipayAccount, alipayPassword);
        return i;
    }
}
