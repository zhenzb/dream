package com.force4us.service;

import com.force4us.entity.RecruitEntity;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface RecruitService {
    int insertRecruit(@Param("id")Long id, @Param("companyName")String companyName, @Param("positionType")String positionType, @Param("recruitNumber")String recruitNumber,
                      @Param("education")String education, @Param("duration")String duration, @Param("jobTime")String jobTime,
                      @Param("jobAddress")String jobAddress, @Param("welfare")String welfare, @Param("ContactsName")String ContactsName,
                      @Param("ContactsPhone")long ContactsPhone, @Param("Remarks")String Remarks,@Param("logoUrl") String logoUrl,@Param("userId")long userId);

    List<RecruitEntity> findRecruitByRecordStatus (int recordStatus);

    RecruitEntity findbRecruityByIdAndRecordStatus(Long id,int recordStatus);

    List<RecruitEntity> findRecruitByUserId(long userId);

    List<RecruitEntity> findRecruitByName(String companyName,String positionType);

    int updateRecruitRecordStatus(int recordStatus);
}
