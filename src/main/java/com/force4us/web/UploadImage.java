package com.force4us.web;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import sun.java2d.pipe.ValidatePipe;

import java.io.IOException;
import java.io.InputStream;

@Controller
@RequestMapping(value = "/uploadImage")
public class UploadImage {
  private static final Logger LOGGER = LoggerFactory.getLogger(UploadImage.class);
    @RequestMapping(value = "/addImage",method = RequestMethod.POST)
    public void addImage(MultipartFile multipartFile){
        try {
            InputStream inputStream = multipartFile.getInputStream();
            String fileName = multipartFile.getOriginalFilename();
            LOGGER.info("fileName: "+fileName);
        } catch (IOException e) {
            e.printStackTrace();
        }

    }
}
