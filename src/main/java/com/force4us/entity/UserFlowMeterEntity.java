package com.force4us.entity;

import java.util.Date;

/**
 * @Describe:
 * @Author:zhenzhuobin
 * @Date:
 */
public class UserFlowMeterEntity {

    private Long id;
    private String remarks;
    private Integer version;
    private Date dateCreated;
    private Date lastModified;
    private Long userId;
    private Integer originalGold;
    private Integer changeGold;
    private Integer currentGold;
    private String reason;
    private Integer recordStatus;
    private Integer changeSilverBean;
    private Integer currentSilverBean;
    private Integer originalSilverBean;
    private Integer type;
    private String alipayAccount;

    public void setAlipayAccount(String alipayAccount) {
        this.alipayAccount = alipayAccount;
    }

    public String getAlipayAccount() {

        return alipayAccount;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public Integer getType() {

        return type;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }

    public void setVersion(Integer version) {
        this.version = version;
    }

    public void setDateCreated(Date dateCreated) {
        this.dateCreated = dateCreated;
    }

    public void setLastModified(Date lastModified) {
        this.lastModified = lastModified;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public void setOriginalGold(Integer originalGold) {
        this.originalGold = originalGold;
    }

    public void setChangeGold(Integer changeGold) {
        this.changeGold = changeGold;
    }

    public void setCurrentGold(Integer currentGold) {
        this.currentGold = currentGold;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    public void setRecordStatus(Integer recordStatus) {
        this.recordStatus = recordStatus;
    }

    public void setChangeSilverBean(Integer changeSilverBean) {
        this.changeSilverBean = changeSilverBean;
    }

    public void setCurrentSilverBean(Integer currentSilverBean) {
        this.currentSilverBean = currentSilverBean;
    }

    public void setOriginalSilverBean(Integer originalSilverBean) {
        this.originalSilverBean = originalSilverBean;
    }

    public Long getId() {
        return id;
    }

    public String getRemarks() {
        return remarks;
    }

    public Integer getVersion() {
        return version;
    }

    public Date getDateCreated() {
        return dateCreated;
    }

    public Date getLastModified() {
        return lastModified;
    }

    public Long getUserId() {
        return userId;
    }

    public Integer getOriginalGold() {
        return originalGold;
    }

    public Integer getChangeGold() {
        return changeGold;
    }

    public Integer getCurrentGold() {
        return currentGold;
    }

    public String getReason() {
        return reason;
    }

    public Integer getRecordStatus() {
        return recordStatus;
    }

    public Integer getChangeSilverBean() {
        return changeSilverBean;
    }

    public Integer getCurrentSilverBean() {
        return currentSilverBean;
    }

    public Integer getOriginalSilverBean() {
        return originalSilverBean;
    }

    @Override
    public String toString() {
        return "UserFlowMeterEntity{" +
                "id=" + id +
                ", remarks='" + remarks + '\'' +
                ", version=" + version +
                ", dateCreated=" + dateCreated +
                ", lastModified=" + lastModified +
                ", userId=" + userId +
                ", originalGold=" + originalGold +
                ", changeGold=" + changeGold +
                ", currentGold=" + currentGold +
                ", reason='" + reason + '\'' +
                ", recordStatus=" + recordStatus +
                ", changeSilverBean=" + changeSilverBean +
                ", currentSilverBean=" + currentSilverBean +
                ", originalSilverBean=" + originalSilverBean +
                ", type=" + type +
                '}';

}
}


