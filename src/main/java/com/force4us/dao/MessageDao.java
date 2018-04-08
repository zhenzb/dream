package com.force4us.dao;

import com.force4us.entity.MessageEntity;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface MessageDao {

    List<MessageEntity> findMessageAll();
    MessageEntity findMessageById(@Param("id") long id);

}
