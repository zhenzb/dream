package com.force4us.service.impl;

import com.force4us.dao.MessageDao;
import com.force4us.entity.MessageEntity;
import com.force4us.service.MessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MessageServiceImpl implements MessageService{

    @Autowired
    MessageDao messageDao;

    @Override
    public List<MessageEntity> findMessageAll() {
        List<MessageEntity> messageAll = messageDao.findMessageAll();
        return messageAll;
    }

    @Override
    public MessageEntity findMessageById(long id) {
        MessageEntity messageList = messageDao.findMessageById(id);
        return messageList;
    }
}
