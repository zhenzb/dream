package com.force4us.service;

import com.force4us.entity.SeckillEntity;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public interface PublishGoodsService {

     int addGoods(Long flashSaleId, String merchantDescribe, String validEndDate, String validBeginDate, Integer currentPrice, Long originalPrice, Integer amount, String productName,String goodsAdress,
                  String bannerUrl, String bannerUrl_1, String bannerUrl_2, String bannerUrl_3, Long adminId);

     List<SeckillEntity> findByAdminId(Long adminId);

     int updateGoodsState(int state);
}
