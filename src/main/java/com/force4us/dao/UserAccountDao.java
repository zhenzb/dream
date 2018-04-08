package com.force4us.dao;

import com.force4us.entity.UserAccountEntity;
import org.apache.ibatis.annotations.Param;

import java.util.Date;

/**
 * @Describe:
 * @Author:zhenzhuobin
 * @Date:
 */
public interface UserAccountDao {

    int insertUserAccount(@Param("id") Long id,@Param("userId") Long userId,@Param("dateCreate") Date dateCreate,@Param("lastModified") Date lastModified,
                                        @Param("recordStatus") int recordStatus,@Param("gold") int gold,@Param("silverBean") int silverBean,@Param("remarks") String remarks);

    UserAccountEntity findByUserId(@Param("userId") Long userId);
    int updateUserAccount(@Param("userId") long userid,@Param("SilverBean") int SilverBean);
    int addAlipayAccount(@Param("userId")Long userId,@Param("realName")String realName,@Param("alipayAccount")String alipayAccount,@Param("alipayPassword")
                         String alipayPassword);
}
