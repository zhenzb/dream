package com.force4us.comm.entity;

import com.force4us.entity.SeckillEntity;

import java.io.Serializable;
import java.util.Date;

/**
 * @Describe:
 * @Author:zhenzhuobin
 * @Date:
 */
public class Seckilled implements Serializable{


    private int seckillSize;
    private long seckillId;
    private String name;
    private int number;
    private double price;
    private int state;
    private String imgUrl;
    private String bigOneImgUrl;
    private String bigTwoImgUrl;
    private String bigThreeImgUrl;
    private Date startTime;
    private Date endTime;
    private Date createTime;
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
    public void setSeckillSize(int seckillSize) {
        this.seckillSize = seckillSize;
    }

    public int getSeckillSize() {
        return seckillSize;
    }

    @Override
    public String toString() {
        return "Seckilled{" +
                "seckillSize=" + seckillSize +
                ", seckillId=" + seckillId +
                ", name='" + name + '\'' +
                ", number=" + number +
                ", price=" + price +
                ", state=" + state +
                ", imgUrl='" + imgUrl + '\'' +
                ", bigOneImgUrl='" + bigOneImgUrl + '\'' +
                ", bigTwoImgUrl='" + bigTwoImgUrl + '\'' +
                ", bigThreeImgUrl='" + bigThreeImgUrl + '\'' +
                ", startTime=" + startTime +
                ", endTime=" + endTime +
                ", createTime=" + createTime +
                ", userName='" + userName + '\'' +
                ", address='" + address + '\'' +
                '}';
    }
}
