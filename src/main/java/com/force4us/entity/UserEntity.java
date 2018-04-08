package com.force4us.entity;

public class UserEntity extends BaseEntity{
    private String userName;
    private String password;
    private Long mobileNo;
    private String headUrl;

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setMobileNo(Long mobileNo) {
        this.mobileNo = mobileNo;
    }

    public void setHeadUrl(String headUrl) {
        this.headUrl = headUrl;
    }

    public String getUserName() {
        return userName;
    }

    public String getPassword() {
        return password;
    }

    public Long getMobileNo() {
        return mobileNo;
    }

    public String getHeadUrl() {
        return headUrl;
    }

    @Override
    public String toString() {
        return "UserEntity{" +
                "userName='" + userName + '\'' +
                ", password='" + password + '\'' +
                ", mobileNo=" + mobileNo +
                ", headUrl='" + headUrl + '\'' +
                '}';
    }
}
