package com.force4us.dao;

import com.force4us.entity.RecruitEntity;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

public interface RecruitDao {

    int insertRecruit(@Param("id")Long id,@Param("companyName")String companyName,@Param("positionType")String positionType,@Param("recruitNumber")String recruitNumber,
                      @Param("education")String education,@Param("duration")String duration,@Param("jobTime")Date jobTime,
                      @Param("jobAddress")String jobAddress,@Param("welfare")String welfare,@Param("contactsName")String contactsName,
                      @Param("contactsPhone")long contactsPhone,@Param("remarks")String remarks,@Param("logoUrl")String logoUrl,
                      @Param("userId")long userId,@Param("recordStatus")int recordStatus);

    List<RecruitEntity> findRecruitByRecordStatus (int recordStatus);

    RecruitEntity findbRecruityByIdAndRecordStatus(@Param(value = "recordStatus") int recordStatus,@Param(value = "id") Long id);

    List<RecruitEntity> findRecruitByUserId(@Param(value = "userId")long userId);

    List<RecruitEntity> findRecruitByName(@Param(value = "recordStatus") int recordStatus,@Param(value = "companyName")String companyName,@Param(value = "positionType")String positionType);

    int updateRecruitRecordStatus(int recordStatus);
}
