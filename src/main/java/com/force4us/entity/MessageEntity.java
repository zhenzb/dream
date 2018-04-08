package com.force4us.entity;

import java.util.Date;

public class MessageEntity extends BaseEntity {

    private Long messageId;
    private String content;
    private String messageTitle;
    private Date sendDate;
    private Long userId;
    private int state;
    private Long adminId;

    public void setContent(String content) {
        this.content = content;
    }

    public String getContent() {

        return content;
    }

    public void setMessageId(Long messageId) {
        this.messageId = messageId;
    }

    public void setMessageTitle(String messageTitle) {
        this.messageTitle = messageTitle;
    }

    public void setSendDate(Date sendDate) {
        this.sendDate = sendDate;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public void setState(int state) {
        this.state = state;
    }

    public void setAdminId(Long adminId) {
        this.adminId = adminId;
    }

    public Long getMessageId() {

        return messageId;
    }



    public String getMessageTitle() {
        return messageTitle;
    }

    public Date getSendDate() {
        return sendDate;
    }

    public Long getUserId() {
        return userId;
    }

    public int getState() {
        return state;
    }

    public Long getAdminId() {
        return adminId;
    }

    @Override
    public String toString() {
        return "MessageEntity{" +
                "messageId=" + messageId +
                ", content='" + content + '\'' +
                ", messageTitle='" + messageTitle + '\'' +
                ", sendDate=" + sendDate +
                ", userId=" + userId +
                ", state=" + state +
                ", adminId=" + adminId +
                '}';
    }
}
