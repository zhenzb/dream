package com.force4us.web;

import com.force4us.dto.ResponseMessage;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;

@Controller
@RequestMapping(value = "/message")

public class PublishMessage {
    private static final Logger LOGGER = LoggerFactory.getLogger(PublishMessage.class);
    @RequestMapping(value = "/addMessage",method = RequestMethod.POST)
    public ResponseMessage addMessage(HttpServletRequest request){
    ResponseMessage responseMessage = new ResponseMessage();
        String container = request.getParameter("container");
        LOGGER.info("container: "+container);
        return responseMessage;
    }
}
