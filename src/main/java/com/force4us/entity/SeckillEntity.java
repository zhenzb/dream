package com.force4us.entity;

import org.springframework.stereotype.Component;

import java.io.Serializable;
import java.util.Date;

/**
 * Created by chengjinqian on 2017/4/17.
 */
public class SeckillEntity implements Serializable{
    private long seckillId;
    private String name;
    private String merchantDescribe;
    private int number;
    private double price;
    private long originalPrice;
    private int state;
    private String imgUrl;
    private String bigOneImgUrl;
    private String bigTwoImgUrl;
    private String bigThreeImgUrl;
    private Date startTime;
    private Date endTime;
    private Date createTime;
    private Long adminId;
    private String userName;
    private String address;

    public void setAddress(String address) {
        this.address = address;
    }

    public String getAddress() {

        return address;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserName() {

        return userName;
    }

    public void setMerchantDescribe(String merchantDescribe) {
        this.merchantDescribe = merchantDescribe;
    }

    public void setAdminId(Long adminId) {
        this.adminId = adminId;
    }

    public String getMerchantDescribe() {

        return merchantDescribe;
    }

    public Long getAdminId() {
        return adminId;
    }

    public long getOriginalPrice() {
        return originalPrice;
    }

    public void setOriginalPrice(long originalPrice) {
        this.originalPrice = originalPrice;
    }

    public void setState(int state) {
        this.state = state;
    }

    public int getState() {
        return state;
    }

    public String getBigOneImgUrl() {
        return bigOneImgUrl;
    }

    public String getBigTwoImgUrl() {
        return bigTwoImgUrl;
    }

    public String getBigThreeImgUrl() {
        return bigThreeImgUrl;
    }

    public void setBigOneImgUrl(String bigOneImgUrl) {
        this.bigOneImgUrl = bigOneImgUrl;
    }

    public void setBigTwoImgUrl(String bigTwoImgUrl) {
        this.bigTwoImgUrl = bigTwoImgUrl;
    }

    public void setBigThreeImgUrl(String bigThreeImgUrl) {
        this.bigThreeImgUrl = bigThreeImgUrl;
    }

    public long getSeckillId() {
        return seckillId;
    }

    public void setPrice(double price) {
        this.price = price;
    }
    public double getPrice() {
        return price;
    }

    public void setImgUrl(String imgUrl) {
        this.imgUrl = imgUrl;
    }

    public String getImgUrl() {
        return imgUrl;
    }

    public void setSeckillId(long seckillId) {
        this.seckillId = seckillId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getNumber() {
        return number;
    }

    public void setNumber(int number) {
        this.number = number;
    }

    public Date getStartTime() {
        return startTime;
    }

    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    @Override
    public String toString() {
        return "SeckillEntity{" +
                "seckillId=" + seckillId +
                ", name='" + name + '\'' +
                ", merchantDescribe='" + merchantDescribe + '\'' +
                ", number=" + number +
                ", price=" + price +
                ", originalPrice=" + originalPrice +
                ", state=" + state +
                ", imgUrl='" + imgUrl + '\'' +
                ", bigOneImgUrl='" + bigOneImgUrl + '\'' +
                ", bigTwoImgUrl='" + bigTwoImgUrl + '\'' +
                ", bigThreeImgUrl='" + bigThreeImgUrl + '\'' +
                ", startTime=" + startTime +
                ", endTime=" + endTime +
                ", createTime=" + createTime +
                ", adminId=" + adminId +
                ", userName='" + userName + '\'' +
                ", address='" + address + '\'' +
                '}';
    }
}
