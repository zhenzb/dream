package com.force4us.entity;

import java.io.Serializable;
import java.util.Date;

public class BaseEntity implements Serializable{
    private Long id;
    private Date dateCreated;
    private Date lastModified;
    private int recordStatus;

    public void setId(Long id) {
        this.id = id;
    }

    public void setDateCreated(Date dateCreated) {
        this.dateCreated = dateCreated;
    }

    public Date getDateCreated() {

        return dateCreated;
    }

    public void setLastModified(Date lastModified) {
        this.lastModified = lastModified;
    }


    public Long getId() {
        return id;
    }



    public Date getLastModified() {
        return lastModified;
    }

    public int getRecordStatus() {
        return recordStatus;
    }

    public void setRecordStatus(int recordStatus) {
        this.recordStatus = recordStatus;
    }

    @Override
    public String toString() {
        return "BaseEntity{" +
                "id=" + id +
                ", dateCreated=" + dateCreated +
                ", lastModified=" + lastModified +
                ", recordStatus=" + recordStatus +
                '}';
    }
}
