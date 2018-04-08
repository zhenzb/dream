package com.force4us.service.impl;

import com.force4us.comm.GlobalConstant;
import com.force4us.dao.RecruitDao;
import com.force4us.entity.RecruitEntity;
import com.force4us.service.RecruitService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Service
public class RecruitServiceImpl implements RecruitService {
    @Autowired
    RecruitDao recruitDao;
    @Override
    public int insertRecruit(Long id, String companyName, String positionType, String recruitNumber, String education,
                             String duration, String jobTime, String jobAddress, String welfare, String contactsName,
                             long contactsPhone, String remarks,String logoUrl,long userId) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date validBeginDate1 = null;
        try {
            validBeginDate1 = sdf.parse(jobTime);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        int recruitResult = recruitDao.insertRecruit(id, companyName, positionType, recruitNumber, education, duration,
                validBeginDate1, jobAddress, welfare, contactsName, contactsPhone, remarks,logoUrl,userId, GlobalConstant.UNPUBLISH);
        return recruitResult;
    }

    @Override
    public List<RecruitEntity> findRecruitByRecordStatus(int recordStatus) {
        List<RecruitEntity> recruitList = recruitDao.findRecruitByRecordStatus(recordStatus);
        return recruitList;
    }

    @Override
    public RecruitEntity findbRecruityByIdAndRecordStatus(Long id, int recordStatus) {
        RecruitEntity recruitEntity = recruitDao.findbRecruityByIdAndRecordStatus(recordStatus,id);
        return recruitEntity;
    }

    @Override
    public List<RecruitEntity> findRecruitByUserId(long userId) {
        List<RecruitEntity> recruitByUserId = recruitDao.findRecruitByUserId(userId);
        return recruitByUserId;
    }

    @Override
    public List<RecruitEntity> findRecruitByName(String companyName, String positionType) {
        List<RecruitEntity> recruitByNameList = recruitDao.findRecruitByName(1,companyName, positionType);
        return recruitByNameList;
    }

    @Override
    public int updateRecruitRecordStatus(int recordStatus) {
        int i = recruitDao.updateRecruitRecordStatus(recordStatus);
        return i;
    }
}
