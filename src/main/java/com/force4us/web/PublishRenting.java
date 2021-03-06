package com.force4us.web;

import com.force4us.comm.GlobalConstant;
import com.force4us.comm.ImageUtil;
import com.force4us.comm.UploadFileUtil;
import com.force4us.dto.ResponseMessage;
import com.force4us.entity.UserEntity;
import com.force4us.service.PublishGoodsService;
import com.force4us.service.RentingService;
import com.force4us.service.UserAccountService;
import com.force4us.service.UserFlowMeterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import sun.misc.BASE64Decoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Random;

@Controller
@RequestMapping(value = "/PublishRenting")
public class PublishRenting {
    @Value("${img_host}")
    String IMAGEURL;
    @Value("${img.localhost}")
    String IMAGELOCALHOST;
    @Autowired
    PublishGoodsService publishGoodsService;
    @Autowired
    UserAccountService userAccountService;
    @Autowired
    UserFlowMeterService userFlowMeterService;
    @Autowired
    RentingService rentingService;
    @Autowired
    AddUserAccount addUserAccount;


    @RequestMapping("/addRenting")
    @ResponseBody
    public ResponseMessage addRenting(Long flashSaleId, String houseName, String houseSize, Integer housePrice, String houseAddress, String contactsName,
                                    String phone,String remark, MultipartFile houseImage,MultipartFile houseImage_one, MultipartFile houseImage_two, MultipartFile houseImage_three,
                                    HttpSession session, HttpServletRequest request){
        ResponseMessage responseMessage = new ResponseMessage();
        try {
        String stream="";
        String stream_1="";
        String stream_2="";
        String stream_3="";
        String fileNameNew ="";
        String fileNameNew_1 ="";
        String fileNameNew_2 ="";
        String fileNameNew_3 ="";
        InputStream inputStream = houseImage.getInputStream();
        InputStream inputStream_1 = houseImage_one.getInputStream();
        InputStream inputStream_2 = houseImage_two.getInputStream();
        InputStream inputStream_3 = houseImage_three.getInputStream();
        String fileNameOld = houseImage.getOriginalFilename();
        String fileNameOld_1 = houseImage_one.getOriginalFilename();
        String fileNameOld_2 = houseImage_two.getOriginalFilename();
        String fileNameOld_3 = houseImage_three.getOriginalFilename();
            if(fileNameOld!=null && !"".equals(fileNameOld)) {
                String suffx = fileNameOld.substring(fileNameOld.lastIndexOf(".")).toLowerCase();
                String suffx_1 = fileNameOld_1.substring(fileNameOld_1.lastIndexOf(".")).toLowerCase();
                String suffx_2 = fileNameOld_2.substring(fileNameOld_2.lastIndexOf(".")).toLowerCase();
                String suffx_3 = fileNameOld_3.substring(fileNameOld_3.lastIndexOf(".")).toLowerCase();
                Random random = new Random();
                Random random_1 = new Random();
                Random random_2 = new Random();
                Random random_3 = new Random();
                fileNameNew = random.nextInt(1000) + System.currentTimeMillis() + suffx;
                fileNameNew_1 = random_1.nextInt(1000) + System.currentTimeMillis() + suffx_1;
                fileNameNew_2 = random_2.nextInt(1000) + System.currentTimeMillis() + suffx_2;
                fileNameNew_3 = random_3.nextInt(1000) + System.currentTimeMillis() + suffx_3;
                stream = ImageUtil.convertImageStreamToByte(inputStream, suffx.substring(1));
                stream_1 = ImageUtil.convertImageStreamToByte(inputStream_1, suffx_1.substring(1));
                stream_2 = ImageUtil.convertImageStreamToByte(inputStream_2, suffx_2.substring(1));
                stream_3 = ImageUtil.convertImageStreamToByte(inputStream_3, suffx_3.substring(1));
            }
            //添加url
            if (!"".equals(houseImage)) {
                BASE64Decoder decoder = new BASE64Decoder();
                byte[] bytes = decoder.decodeBuffer(stream);
                byte[] bytes_1 = decoder.decodeBuffer(stream_1);
                byte[] bytes_2 = decoder.decodeBuffer(stream_2);
                byte[] bytes_3= decoder.decodeBuffer(stream_3);
                ByteArrayInputStream bais = new ByteArrayInputStream(bytes);
                ByteArrayInputStream bais_1 = new ByteArrayInputStream(bytes_1);
                ByteArrayInputStream bais_2 = new ByteArrayInputStream(bytes_2);
                ByteArrayInputStream bais_3 = new ByteArrayInputStream(bytes_3);
                //bannerUrl = webAddActionService.uploadImg(bais, OSSClientConstants.IMGTYPE, fileName);
               //stream = IMAGELOCALHOST;
                try {
                    UploadFileUtil uploadFileUtil = new UploadFileUtil();
                    //String zz = request.getSession().getServletContext().getRealPath("/");
                    String zz = IMAGELOCALHOST;
                    //zz = zz + "resource\\upload\\image\\";
                    uploadFileUtil.uploadFile(bais, zz, fileNameNew);
                    uploadFileUtil.uploadFile(bais_1, zz, fileNameNew_1);
                    uploadFileUtil.uploadFile(bais_2, zz, fileNameNew_2);
                    uploadFileUtil.uploadFile(bais_3, zz, fileNameNew_3);
                } catch (Exception e) {
                    e.printStackTrace();
                }

            }
            //stream =IMAGEURL+IMAGELOCALHOST.substring(2,IMAGELOCALHOST.lastIndexOf("\\")).replace("\\", "/")+"/";
            //stream =  IMAGEURL + "resource/upload/image/";
            stream ="upload/";
            UserEntity user = (UserEntity) session.getAttribute("user");
            int i = rentingService.saveRenting(flashSaleId, houseName, houseSize, housePrice,houseAddress,contactsName, phone, remark,
                    stream + fileNameNew, stream + fileNameNew_1, stream + fileNameNew_2, stream + fileNameNew_3, user.getId());
        if(1 == i){
            boolean b = addUserAccount.addAccount(user.getId(), 1000,"发布商品",GlobalConstant.SILVERBEAN);
            if(b) {
                responseMessage.setState(GlobalConstant.SUCCESS);
                responseMessage.setMessage(GlobalConstant.PUBLISHSUCCESS);
            }else {
                responseMessage.setState(GlobalConstant.ERROR);
                responseMessage.setMessage(GlobalConstant.PUBLISHERROR);
            }
        }else {
            responseMessage.setState(GlobalConstant.ERROR);
            responseMessage.setMessage(GlobalConstant.PUBLISHERROR);
        }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return responseMessage;
    }
}
