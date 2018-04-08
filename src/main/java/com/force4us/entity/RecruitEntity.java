package com.force4us.entity;

public class RecruitEntity extends BaseEntity {

    private String companyName;
    private String positionType;
    private String recruitNumber;
    private String education;
    private String duration;
    private String jobTime;
    private String jobAddress;
    private String welfare;
    private String contactsName;
    private Long contactsPhone;
    private String remarks;
    private String logoUrl;
    private Long userId;

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public Long getUserId() {

        return userId;
    }

    public void setContactsName(String contactsName) {
        this.contactsName = contactsName;
    }

    public void setContactsPhone(Long contactsPhone) {
        this.contactsPhone = contactsPhone;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }

    public String getContactsName() {

        return contactsName;
    }

    public Long getContactsPhone() {
        return contactsPhone;
    }

    public String getRemarks() {
        return remarks;
    }

    public void setLogoUrl(String logoUrl) {
        this.logoUrl = logoUrl;
    }

    public String getLogoUrl() {

        return logoUrl;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    public void setPositionType(String positionType) {
        this.positionType = positionType;
    }



    public void setEducation(String education) {
        this.education = education;
    }

    public void setDuration(String duration) {
        this.duration = duration;
    }

    public void setJobTime(String jobTime) {
        this.jobTime = jobTime;
    }

    public void setJobAddress(String jobAddress) {
        this.jobAddress = jobAddress;
    }

    public void setWelfare(String welfare) {
        this.welfare = welfare;
    }


    public void setRecruitNumber(String recruitNumber) {
        this.recruitNumber = recruitNumber;
    }

    public String getRecruitNumber() {

        return recruitNumber;
    }

    public String getCompanyName() {


        return companyName;
    }

    public String getPositionType() {
        return positionType;
    }

    public String getEducation() {
        return education;
    }

    public String getDuration() {
        return duration;
    }

    public String getJobTime() {
        return jobTime;
    }

    public String getJobAddress() {
        return jobAddress;
    }

    public String getWelfare() {
        return welfare;
    }

    @Override
    public String toString() {
        return "RecruitEntity{" +
                "companyName='" + companyName + '\'' +
                ", positionType='" + positionType + '\'' +
                ", recruitNumber='" + recruitNumber + '\'' +
                ", education='" + education + '\'' +
                ", duration='" + duration + '\'' +
                ", jobTime='" + jobTime + '\'' +
                ", jobAddress='" + jobAddress + '\'' +
                ", welfare='" + welfare + '\'' +
                ", contactsName='" + contactsName + '\'' +
                ", contactsPhone=" + contactsPhone +
                ", remarks='" + remarks + '\'' +
                ", logoUrl='" + logoUrl + '\'' +
                '}';
    }
}
