package com.force4us.web;

import com.force4us.comm.GlobalConstant;
import com.force4us.comm.ImageUtil;
import com.force4us.comm.UploadFileUtil;
import com.force4us.dto.ResponseMessage;
import com.force4us.entity.UserAccountEntity;
import com.force4us.entity.UserEntity;
import com.force4us.entity.UserFlowMeterEntity;
import com.force4us.service.RecruitService;
import com.force4us.service.UserAccountService;
import com.force4us.service.UserFlowMeterService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import sun.misc.BASE64Decoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.math.BigDecimal;
import java.util.Date;
import java.util.Random;

@Controller
@RequestMapping(value = "/recruit")
@ResponseBody
public class RecruitController {
    @Autowired
    RecruitService recruitService;
    @Autowired
    AddUserAccount addUserAccount;
    @Value("${img_host}")
    String IMAGEURL;
    @Value("${img.localhost}")
    String IMAGELOCALHOST;
    @RequestMapping(value = "/addRecruit")
    public ResponseMessage addRecruit(@Param("id")Long id, @Param("companyName")String companyName, @Param("positionType")String positionType, @Param("recruitNumber")String recruitNumber,
                                      @Param("education")String education, @Param("duration")String duration, @Param("validBeginDate")String validBeginDate,
                                      @Param("jobAddress")String jobAddress, @Param("welfare")String welfare, @Param("contactsName")String contactsName,
                                      @Param("contactsPhone")long contactsPhone, @Param("remarks")String remarks, MultipartFile logoUrl,
                                      HttpSession session, HttpServletRequest request){
        id=System.currentTimeMillis();
        String fileNameNew = null;
        String stream = null;
        try {
            InputStream inputStream = logoUrl.getInputStream();
            String originalFilename = logoUrl.getOriginalFilename();
            if(originalFilename!=null && !"".equals(originalFilename)) {
                String suffx = originalFilename.substring(originalFilename.lastIndexOf(".")).toLowerCase();
                Random random = new Random();
                 fileNameNew = random.nextInt(10000) + System.currentTimeMillis() + suffx;
                 stream = ImageUtil.convertImageStreamToByte(inputStream, suffx.substring(1));
                if (!"".equals(logoUrl)) {
                    BASE64Decoder decoder = new BASE64Decoder();
                    byte[] bytes = decoder.decodeBuffer(stream);
                    ByteArrayInputStream bais = new ByteArrayInputStream(bytes);
                    UploadFileUtil uploadFileUtil = new UploadFileUtil();
                    String zz = request.getSession().getServletContext().getRealPath("/");
                    zz = zz + "resource\\upload\\image\\";
                    uploadFileUtil.uploadFile(bais, zz, fileNameNew);
                }
                //stream =IMAGEURL+IMAGELOCALHOST.substring(2,IMAGELOCALHOST.lastIndexOf("\\")).replace("\\", "/")+"/";
            stream = IMAGEURL + "resource/upload/image/";
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        UserEntity user = (UserEntity) session.getAttribute("user");
        int i = recruitService.insertRecruit(id, companyName, positionType, recruitNumber, education, duration,
                validBeginDate, jobAddress, welfare, contactsName, contactsPhone, remarks,stream + fileNameNew,user.getId());
        ResponseMessage responseMessage = new ResponseMessage();
        if(1== i){
            boolean b = addUserAccount.addAccount(user.getId(), 1000,"发布招聘",GlobalConstant.SILVERBEAN);
            if(b) {
                responseMessage.setMessage(GlobalConstant.PUBLISHSUCCESS);
                responseMessage.setState(GlobalConstant.SUCCESS);
            }else {
                responseMessage.setState(GlobalConstant.ERROR);
                responseMessage.setMessage(GlobalConstant.PUBLISHERROR);
            }
    }else {
            responseMessage.setState(GlobalConstant.ERROR);
            responseMessage.setMessage(GlobalConstant.PUBLISHERROR);
        }
        return responseMessage;
    }
}
