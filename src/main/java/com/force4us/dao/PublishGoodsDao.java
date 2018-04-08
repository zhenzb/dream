package com.force4us.dao;

import com.force4us.entity.SeckillEntity;
import org.apache.ibatis.annotations.Param;
import org.springframework.web.multipart.MultipartFile;

import java.util.Date;
import java.util.List;

public interface PublishGoodsDao {
    int insertGoods(@Param("flashSaleId") Long flashSaleId, @Param("merchantDescribe") String merchantDescribe, @Param("validEndDate") Date validEndDate,
                    @Param("validBeginDate") Date validBeginDate, @Param("createDate") Date createDate, @Param("currentPrice") Integer currentPrice, @Param("state") Integer state,
                    @Param("originalPrice") Long originalPrice, @Param("amount") Integer amount, @Param("productName") String productName,
                    @Param("bannerUrl") String bannerUrl, @Param("bannerUrl_1") String bannerUrl_1,
                    @Param("bannerUrl_2") String bannerUrl_2, @Param("bannerUrl_3") String bannerUrl_3, @Param("adminId") Long adminId,@Param("goodsAddress") String goodsAddress);

    List<SeckillEntity> findByAdminId(@Param("adminId") Long adminId);

    int updateGoodsState(int state);
}
