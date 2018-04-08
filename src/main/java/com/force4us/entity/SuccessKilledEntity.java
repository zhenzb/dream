package com.force4us.entity;

import java.util.Date;

/**
 * Created by chengjinqian on 2017/4/17.
 */
public class SuccessKilledEntity {
    private long id;

    private long seckillId;

    private long userId;

    private long userPhone;

    private String seckillName;

    private double price;
    private short state;

    private Date createTime;

    private SeckillEntity seckillEntity;

    private String userName;

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserName() {

        return userName;
    }

    public void setSeckillName(String seckillName) {
        this.seckillName = seckillName;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getSeckillName() {
        return seckillName;
    }

    public double getPrice() {
        return price;
    }

    public void setId(long id) {
        this.id = id;
    }

    public void setUserId(long userId) {
        this.userId = userId;
    }

    public long getId() {
        return id;
    }

    public long getUserId() {
        return userId;
    }

    public long getSeckillId() {
        return seckillId;
    }

    public void setSeckillId(long seckillId) {
        this.seckillId = seckillId;
    }

    public long getUserPhone() {
        return userPhone;
    }

    public void setUserPhone(long userPhone) {
        this.userPhone = userPhone;
    }

    public short getState() {
        return state;
    }

    public void setState(short state) {
        this.state = state;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public SeckillEntity getSeckillEntity() {
        return seckillEntity;
    }

    public void setSeckillEntity(SeckillEntity seckillEntity) {
        this.seckillEntity = seckillEntity;
    }

    @Override
    public String toString() {
        return "SuccessKilledEntity{" +
                "id=" + id +
                ", seckillId=" + seckillId +
                ", userId=" + userId +
                ", userPhone=" + userPhone +
                ", seckillName='" + seckillName + '\'' +
                ", price=" + price +
                ", state=" + state +
                ", createTime=" + createTime +
                ", seckillEntity=" + seckillEntity +
                ", userName='" + userName + '\'' +
                '}';
    }
}
