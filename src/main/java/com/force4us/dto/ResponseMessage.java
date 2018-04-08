package com.force4us.dto;

import com.fasterxml.jackson.annotation.JsonInclude;

/**
 * @Describe:
 * @Author:zhenzhuobin
 * @Date:
 */
@JsonInclude(JsonInclude.Include.NON_NULL)
public class ResponseMessage<T> {
    private Long id;
    private String state;
    private String message;
    private  T object;

    public void setId(Long id) {
        this.id = id;
    }

    public void setState(String state) {
        this.state = state;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public void setObject(T object) {
        this.object = object;
    }

    public Long getId() {
        return id;
    }

    public String getState() {
        return state;
    }

    public String getMessage() {
        return message;
    }

    public T getObject() {
        return object;
    }

    @Override
    public String toString() {
        return "ResponseMessage{" +
                "id=" + id +
                ", state='" + state + '\'' +
                ", message='" + message + '\'' +
                ", object=" + object +
                '}';
    }
}
