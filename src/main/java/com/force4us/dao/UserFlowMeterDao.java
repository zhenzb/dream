package com.force4us.dao;

import com.force4us.entity.UserFlowMeterEntity;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

/**
 * @Describe:
 * @Author:zhenzhuobin
 * @Date:
 */
public interface UserFlowMeterDao {

    List<UserFlowMeterEntity> findByUserIdAndType(@Param("userId") Long userId,@Param("type") int type);

    int saveUserFlowMeter(@Param("id") Long id,@Param("remarks") String remarks,@Param("version") int version,@Param("dateCreated") Date dateCreated,
                                 @Param("lastModified") Date lastModified,@Param("userId") Long userId,@Param("orginalGold") int orginalGold,@Param("changeGold") int changeGold,
                                 @Param("currentGold") int currentGold,@Param("reason") String reason,@Param("recordStatus") int recordStatus,
                                 @Param("changeSilverBean")int changeSilverBean,@Param("currentSilverBean") int currentSilverBean,@Param("originalSilverBean")int originalSilverBean,
                                 @Param("type")int type,@Param("alipayAccount")String alipayAccount);
}
