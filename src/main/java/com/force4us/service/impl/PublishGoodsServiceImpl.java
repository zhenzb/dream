package com.force4us.service.impl;

import com.force4us.comm.GlobalConstant;
import com.force4us.dao.PublishGoodsDao;
import com.force4us.entity.SeckillEntity;
import com.force4us.service.PublishGoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Service
public class PublishGoodsServiceImpl implements PublishGoodsService {
    @Autowired
    PublishGoodsDao publishGoodsDao;
    @Override
    public int addGoods(Long flashSaleId, String merchantDescribe, String validEndDate, String validBeginDate, Integer currentPrice, Long originalPrice, Integer amount, String productName,String goodsAddress,
                        String bannerUrl, String bannerUrl_1, String bannerUrl_2, String bannerUrl_3, Long adminId) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        int i = 0;
        try {
            Date validBeginDate1 = sdf.parse(validBeginDate);
            Date validEndDate1 = sdf.parse(validEndDate);
            i = publishGoodsDao.insertGoods(flashSaleId, merchantDescribe, validEndDate1, validBeginDate1, new Date(), currentPrice, GlobalConstant.UNPUBLISH
                    , originalPrice, amount, productName, bannerUrl, bannerUrl_1, bannerUrl_2, bannerUrl_3, adminId, goodsAddress);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return i;

    }

    @Override
    public List<SeckillEntity> findByAdminId(Long adminId) {
        List<SeckillEntity> seckillList = publishGoodsDao.findByAdminId(adminId);
        return seckillList;
    }

    @Override
    public int updateGoodsState(int state) {
        int i = publishGoodsDao.updateGoodsState(state);
        return i;
    }
}
