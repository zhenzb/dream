package com.force4us.entity;

/**
 * @Describe:
 * @Author:zhenzhuobin
 * @Date:
 */
public class UserAddressEntity extends BaseEntity{
    private Long userId;
    private int state;
    private String realName;
    private Long mobileNo;
    private String detailedAddress;

    public void setState(int state) {
        this.state = state;
    }

    public int getState() {

        return state;
    }

    public void setMobileNo(Long mobileNo) {
        this.mobileNo = mobileNo;
    }

    public Long getMobileNo() {
        return mobileNo;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public void setRealName(String realName) {
        this.realName = realName;
    }



    public void setDetailedAddress(String detailedAddress) {
        this.detailedAddress = detailedAddress;
    }

    public Long getUserId() {
        return userId;
    }

    public String getRealName() {
        return realName;
    }



    public String getDetailedAddress() {
        return detailedAddress;
    }

    @Override
    public String toString() {
        return "UserAddressEntity{" +
                "userId=" + userId +
                ", state=" + state +
                ", realName='" + realName + '\'' +
                ", mobileNo=" + mobileNo +
                ", detailedAddress='" + detailedAddress + '\'' +
                '}';
    }
}
