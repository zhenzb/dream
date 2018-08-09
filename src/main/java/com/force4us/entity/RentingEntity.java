package com.force4us.entity;

public class RentingEntity extends BaseEntity{
        private String houseName;
        private String houseSize;
        private Integer housePrice;
        private String contactsName;
        private String phone;
        private String houseImage;
        private String houseImageOne;
        private String houseImageTwo;
        private String houseImageThree;
        private String houseAddress;
        private String remarks;


    public String getHouseName() {
        return houseName;
    }

    public void setHouseName(String houseName) {
        this.houseName = houseName;
    }


    public Integer getHousePrice() {
        return housePrice;
    }

    public void setHousePrice(Integer housePrice) {
        this.housePrice = housePrice;
    }

    public String getHouseImage() {
        return houseImage;
    }

    public void setHouseImage(String houseImage) {
        this.houseImage = houseImage;
    }

    public String getHouseAddress() {
        return houseAddress;
    }

    public void setHouseAddress(String houseAddress) {
        this.houseAddress = houseAddress;
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }

    public String getHouseImageOne() {
        return houseImageOne;
    }

    public void setHouseImageOne(String houseImageOne) {
        this.houseImageOne = houseImageOne;
    }

    public String getHouseImageTwo() {
        return houseImageTwo;
    }

    public void setHouseImageTwo(String houseImageTwo) {
        this.houseImageTwo = houseImageTwo;
    }

    public String getHouseImageThree() {
        return houseImageThree;
    }

    public void setHouseImageThree(String houseImageThree) {
        this.houseImageThree = houseImageThree;
    }

    public String getHouseSize() {
        return houseSize;
    }

    public void setHouseSize(String houseSize) {
        this.houseSize = houseSize;
    }

    public String getContactsName() {
        return contactsName;
    }

    public void setContactsName(String contactsName) {
        this.contactsName = contactsName;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }
}
