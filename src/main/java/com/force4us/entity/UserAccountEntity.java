package com.force4us.entity;

/**
 * @Describe:
 * @Author:zhenzhuobin
 * @Date:
 */
public class UserAccountEntity extends BaseEntity {
    private Long userId;
    private String realName;
    private String alipayAccount;
    private String alipayPassword;
    private Integer gold;
    private Integer silverBean;
    private String remarks;
    private String levelImg;

    public void setRealName(String realName) {
        this.realName = realName;
    }

    public void setAlipayAccount(String alipayAccount) {
        this.alipayAccount = alipayAccount;
    }

    public String getAlipayAccount() {

        return alipayAccount;
    }

    public void setAlipayPassword(String alipayPassword) {
        this.alipayPassword = alipayPassword;
    }

    public String getRealName() {

        return realName;
    }


    public String getAlipayPassword() {
        return alipayPassword;
    }

    public void setLevelImg(String levelImg) {
        this.levelImg = levelImg;
    }

    public String getLevelImg() {

        return levelImg;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public void setGold(Integer gold) {
        this.gold = gold;
    }

    public void setSilverBean(Integer silverBean) {
        this.silverBean = silverBean;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }

    public Long getUserId() {
        return userId;
    }

    public Integer getGold() {
        return gold;
    }

    public Integer getSilverBean() {
        return silverBean;
    }

    public String getRemarks() {
        return remarks;
    }

    @Override
    public String toString() {
        return "UserAccountEntity{" +
                "userId=" + userId +
                ", realName='" + realName + '\'' +
                ", alipayAcount='" + alipayAccount + '\'' +
                ", alipayPassword='" + alipayPassword + '\'' +
                ", gold=" + gold +
                ", silverBean=" + silverBean +
                ", remarks='" + remarks + '\'' +
                ", levelImg='" + levelImg + '\'' +
                '}';
    }
}
