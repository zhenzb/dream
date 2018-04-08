package com.force4us.service;

import com.force4us.entity.MessageEntity;

import java.util.List;

public interface MessageService {

    List<MessageEntity> findMessageAll();
    MessageEntity findMessageById(long id);
}
