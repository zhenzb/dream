package com.force4us.web;

import com.force4us.comm.DateUtil;
import com.force4us.comm.GlobalConstant;
import com.force4us.comm.ImageUtil;
import com.force4us.comm.UploadFileUtil;
import com.force4us.dto.ResponseMessage;
import com.force4us.entity.UserAccountEntity;
import com.force4us.entity.UserAddressEntity;
import com.force4us.entity.UserEntity;
import com.force4us.entity.UserFlowMeterEntity;
import com.force4us.service.UserAccountService;
import com.force4us.service.UserFlowMeterService;
import com.force4us.service.UserService;
import org.apache.ibatis.annotations.Param;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.DigestUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import sun.misc.BASE64Decoder;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.*;

import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

@Controller
@RequestMapping(value = "/user")
public class UserController {
    @Value("${img_host}")
    String IMAGEURL;
    @Value("${img.localhost}")
    String IMAGELOCALHOST;
    private static final  Logger LOGGER = LoggerFactory.getLogger(UserController.class);
    @Autowired
    UserService userService;
    @Autowired
    UserAccountService userAccountService;
    @Autowired
    UserFlowMeterService userFlowMeterService;
    @Autowired
    AddUserAccount addUserAccount;
    Map<String,Object> map = new HashMap<String,Object>();
    @RequestMapping(value = "/addUser",method =POST)
    @ResponseBody
    public ResponseMessage addUser(UserEntity userEntity, HttpSession session, HttpServletRequest request){
        LOGGER.info("[用户注册] request_params:"+userEntity.toString()+" code:"+request.getParameter("code"));
        ResponseMessage responseMessage = new ResponseMessage();
        responseMessage.setState(GlobalConstant.ERROR);
        responseMessage.setMessage(GlobalConstant.UNREGISTER);
        if(null !=userEntity.getUserName()&&null !=userEntity.getPassword()&&null !=request.getParameter("code")) {
            String code = (String)session.getAttribute("randCode");
            LOGGER.info("randCode:"+code+"  code:"+request.getParameter("code"));
            if(!request.getParameter("code").equalsIgnoreCase(code)){
                responseMessage.setState(GlobalConstant.ERROR);
                responseMessage.setMessage(GlobalConstant.UN_RAND_CODE);
                return responseMessage;
            }
            String user = (String)map.get(userEntity.getUserName());
            map.put(userEntity.getUserName(), userEntity.getUserName());
            if(null == user) {
                UserEntity userEntityByUserName = userService.findUserEntityByUserName(userEntity.getUserName());
                if (null == userEntityByUserName) {
                    String md5_password = DigestUtils.md5DigestAsHex(userEntity.getPassword().getBytes());
                    LOGGER.info("md5_password: " + md5_password);
                    long userId = System.currentTimeMillis();
                    String substring = String.valueOf(userId).substring(6, String.valueOf(userId).length());
                    userEntity.setId(Long.valueOf(substring));
                    userEntity.setPassword(md5_password);
                    DateUtil dateUtil = new DateUtil();
                    userEntity.setDateCreated(dateUtil.getDateTiem());
                    userEntity.setLastModified(dateUtil.getDateTiem());
                    userEntity.setRecordStatus(GlobalConstant.INIT_SATTE);
                    int number = userService.addUser(userEntity);
                    if (number ==1) {
                        addUserAccount(substring);
                    }
                    map.remove(userEntity.getUserName());
                    responseMessage.setState(GlobalConstant.SUCCESS);
                    responseMessage.setMessage(GlobalConstant.REGISTER);
                } else {
                    responseMessage.setState(GlobalConstant.ERROR);
                    responseMessage.setMessage(GlobalConstant.ALREADYEXTIES);
                }
            }else {
                LOGGER.info("map.get(userName)_" + map.get(userEntity.getUserName()));
            }
        }
        LOGGER.info("[用户注册] response :"+responseMessage.toString());
        return responseMessage;
    }
    @RequestMapping(value = "/login")
    public String login(HttpServletRequest request,HttpServletResponse response, HttpSession session,
                              Model model){
        String userName = request.getParameter("userName");
        String password = request.getParameter("password");
        String code = request.getParameter("code");
        String[] isAuto = request.getParameterValues("isAuto");
        LOGGER.info("[用户登录] request_params:userName_"+userName+" password_"+password+" code_"+code+" isAuto_");
        if(isAuto != null) {
            if ("1".equals(isAuto[0])) {
               /* Cookie c = new Cookie("JSESSIONID", session.getId());
                c.setMaxAge(60 * 60);
                c.setPath("/");*/
                Cookie[] cookies = request.getCookies();
                Cookie cookie = cookies[0];
                cookie.setMaxAge(60*60);
                cookie.setPath("/");
                response.addCookie(cookie);
            }
        }
        if(null !=userName && null != password && null !=code){
            String sessionCode = (String)session.getAttribute("randCode");
            long randCodeTime = (Long)session.getAttribute("randCodeTime");
            LOGGER.info("userName_"+userName+"  sessionCode_"+sessionCode+"  randCodeTime_"+randCodeTime);
            if(sessionCode.equalsIgnoreCase(code) && System.currentTimeMillis()-randCodeTime<60000){
                String md5_password = DigestUtils.md5DigestAsHex(password.getBytes());
                UserEntity user = new UserEntity();
                user.setUserName(userName);
                user.setPassword(md5_password);
                UserEntity userEntity = userService.findUserEntityByUserNameAndPassword(user);
                if(null !=userEntity){
                    UserAccountEntity userAccount = userAccountService.findByUserId(userEntity.getId());
                    model.addAttribute("message",GlobalConstant.LOGIN);
                    session.setAttribute("user",userEntity);
                    UserAccountEntity userAccountEntity = checkUserLevel(userAccount);
                    session.setAttribute("userAccount",userAccountEntity);

                }else {
                    model.addAttribute("message",GlobalConstant.UN_LOGIN);
                    return "login";
                }
            }else {
                model.addAttribute("message",GlobalConstant.UN_RAND_CODE);
                return "login";
            }

        }
        LOGGER.info("[用户登录] response_message:"+model.toString());
        return "list";
    }

    @RequestMapping(value = "/addAddress",method = POST)
    @ResponseBody
    public ResponseMessage addAddress(@RequestParam(value = "realName") String realName,
                                      @RequestParam(value = "mobileNo") String mobileNo,
                                      @RequestParam(value = "detailedAddress") String detailedAddress,
                                      HttpSession session){
        LOGGER.info("[添加地址] addAddress request_params:realName_"+realName+"  mobileNo_"+mobileNo+"  detailedAddress_"+detailedAddress);
        ResponseMessage responseMessage = new ResponseMessage();
        responseMessage.setState(GlobalConstant.ERROR);
        responseMessage.setMessage(GlobalConstant.UN_ADDRES);
        if(!StringUtils.isEmpty(realName)&& !StringUtils.isEmpty(mobileNo)&&!StringUtils.isEmpty(detailedAddress)){
            UserEntity user = (UserEntity)session.getAttribute("user");
            LOGGER.info("userId_"+user.getId());
            DateUtil dateUtil = new DateUtil();
            UserAddressEntity userAddressEntity = new UserAddressEntity();
            userAddressEntity.setDateCreated(dateUtil.getDateTiem());
            userAddressEntity.setLastModified(dateUtil.getDateTiem());
            userAddressEntity.setRecordStatus(GlobalConstant.INIT_SATTE);
            userAddressEntity.setUserId(user.getId());
            userAddressEntity.setState(GlobalConstant.ISDEFAULT);
            userAddressEntity.setRealName(realName);
            userAddressEntity.setMobileNo(Long.parseLong(mobileNo));
            userAddressEntity.setDetailedAddress(detailedAddress);
            int number = userService.addUserAddress(userAddressEntity);
            if(number>0){
                responseMessage.setState(GlobalConstant.SUCCESS);
                responseMessage.setMessage(GlobalConstant.ADDRESS_SUCCESS);
            }
        }
        LOGGER.info("[添加地址] addAddress Response_message:]"+responseMessage.toString());
        return responseMessage;
    }

    public static UserAccountEntity checkUserLevel(UserAccountEntity userAccountEntity){
        Integer silverBean = userAccountEntity.getSilverBean();
        if(GlobalConstant.PUHY <= silverBean && silverBean < GlobalConstant.BYHY){
            userAccountEntity.setRemarks(GlobalConstant.PT);
            userAccountEntity.setLevelImg(GlobalConstant.PTIMG);
        }else if(GlobalConstant.BYHY <= silverBean && silverBean < GlobalConstant.HJHY){
            userAccountEntity.setRemarks(GlobalConstant.BY);
            userAccountEntity.setLevelImg(GlobalConstant.BYIMG);
        }else if(GlobalConstant.HJHY <= silverBean && silverBean < GlobalConstant.BJHY){
            userAccountEntity.setRemarks(GlobalConstant.HJ);
            userAccountEntity.setLevelImg(GlobalConstant.HJIMG);
        }else if(GlobalConstant.BJHY <= silverBean && silverBean < GlobalConstant.ZSHY){
            userAccountEntity.setRemarks(GlobalConstant.BJ);
            userAccountEntity.setLevelImg(GlobalConstant.BJIMG);
        }else if(GlobalConstant.ZSHY <= silverBean && silverBean < GlobalConstant.HZHY){
            userAccountEntity.setRemarks(GlobalConstant.ZS);
            userAccountEntity.setLevelImg(GlobalConstant.ZSIMG);
        }else if(silverBean>=GlobalConstant.HZHY){
            userAccountEntity.setRemarks(GlobalConstant.HZ);
            userAccountEntity.setLevelImg(GlobalConstant.HZIMG);
        }
        return userAccountEntity;
    }

    @RequestMapping(value = "/uploadHeadImage")
    @ResponseBody
    public ResponseMessage uploadHeadImage(MultipartFile headPhone,HttpSession session,HttpServletRequest request){
        ResponseMessage responseMessage = new ResponseMessage();
        String fileNameNew =null;
        String stream = null;
        try {
            InputStream inputStream = headPhone.getInputStream();
            String fileName = headPhone.getOriginalFilename();
            if(fileName !=null &&  !"".equals(fileName)) {
                String suffx = fileName.substring(fileName.lastIndexOf(".")).toLowerCase();
                Random random = new Random();
                fileNameNew = random.nextInt(10000) + System.currentTimeMillis() + suffx;
                stream = ImageUtil.convertImageStreamToByte(inputStream, suffx.substring(1));
                BASE64Decoder decoder = new BASE64Decoder();
                byte[] bytes = decoder.decodeBuffer(stream);
                ByteArrayInputStream bais = new ByteArrayInputStream(bytes);
                UploadFileUtil uploadFileUtil = new UploadFileUtil();
                String zz = request.getSession().getServletContext().getRealPath("/");
                zz = zz+"resource\\upload\\image\\";
                uploadFileUtil.uploadFile(bais, zz, fileNameNew);
                //stream = IMAGEURL + IMAGELOCALHOST.substring(2, IMAGELOCALHOST.lastIndexOf("\\")).replace("\\", "/") + "/";
               stream = IMAGEURL+"resource/upload/image/";
                }
                UserEntity user = (UserEntity)session.getAttribute("user");
                int i = userService.updateUserHeadImage(user.getId(), stream + fileNameNew);
                if(1 == i){
                    session.removeAttribute("user");
                    UserEntity userEntityByUserName = userService.findUserEntityByUserName(user.getUserName());
                    session.setAttribute("user",userEntityByUserName);
                    responseMessage.setState(GlobalConstant.SUCCESS);
                    responseMessage.setMessage("设置成功");
                }else{
                    responseMessage.setState(GlobalConstant.ERROR);
                    responseMessage.setMessage("设置失败");
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
            return responseMessage;
    }

    @RequestMapping(value = "/addAlipayAccount")
    @ResponseBody
    public ResponseMessage addAlipayAccount(@Param("realName")String realName,@Param("alipayAcount")String alipayAcount,
                                            @Param("alipayPassword")String alipayPassword,HttpSession session){
        ResponseMessage responseMessage = new ResponseMessage();
        if(realName !=null && alipayAcount != null & alipayPassword !=null){
            UserEntity user = (UserEntity)session.getAttribute("user");
            int i = userAccountService.addAlipayAccount(user.getId(),realName, alipayAcount, alipayPassword);
            if(1 == i){
                responseMessage.setState(GlobalConstant.SUCCESS);
                responseMessage.setMessage("恭喜您！绑定成功");
            }else {
                responseMessage.setState(GlobalConstant.ERROR);
                responseMessage.setMessage("绑定失败，请重新绑定");
            }
        }else{
            responseMessage.setState(GlobalConstant.ERROR);
            responseMessage.setMessage("提交不合法");
        }
        LOGGER.info("[绑定支付宝：]"+responseMessage.toString());
        return responseMessage;
    }

    @RequestMapping(value = "findUserAccount")
    @ResponseBody
    public ResponseMessage findUserAccount(HttpSession session){
        UserEntity user = (UserEntity) session.getAttribute("user");
        ResponseMessage<UserAccountEntity> responseMessage = new ResponseMessage<UserAccountEntity>();
        UserAccountEntity byUserIdUserAccount = userAccountService.findByUserId(user.getId());
        if(byUserIdUserAccount !=null){
            if(byUserIdUserAccount.getAlipayAccount() != null){
                responseMessage.setState(GlobalConstant.SUCCESS);
                responseMessage.setObject(byUserIdUserAccount);
            }else {
                responseMessage.setState(GlobalConstant.ERROR);
                responseMessage.setMessage("未绑定Alipay");
            }
        }else {
            responseMessage.setState(GlobalConstant.ERROR);
            responseMessage.setMessage("非法操作");
        }
        LOGGER.info(responseMessage.toString());
        return responseMessage;
    }

    @RequestMapping(value = "/rechargeAccount",method = POST)
    @ResponseBody
    public ResponseMessage rechargeAccount(@Param("money")Integer money,@Param("alipayPassword")String alipayPassword, HttpSession session){
        ResponseMessage responseMessage = new ResponseMessage();
        if(money < 2){
            responseMessage.setState(GlobalConstant.ERROR);
            responseMessage.setMessage("提现金额不能小于2元");
            return responseMessage;
        }
        UserEntity user = (UserEntity) session.getAttribute("user");
        UserAccountEntity userAccount = userAccountService.findByUserId(user.getId());
        if(!alipayPassword.equals(userAccount.getAlipayPassword())){
            responseMessage.setState(GlobalConstant.ERROR);
            responseMessage.setMessage("提现密码错误");
            return responseMessage;
        }
        boolean b = addUserAccount.addAccount(user.getId(), -money*10000,"提现",GlobalConstant.money);
        if(b){
            responseMessage.setState(GlobalConstant.SUCCESS);
            responseMessage.setMessage("恭喜您，提现成功24小时内到账");
        }else{
            responseMessage.setState(GlobalConstant.ERROR);
            responseMessage.setMessage("提现失败！您的余额不足，快去赚取金币吧");
        }
        LOGGER.info(responseMessage.toString());
        return responseMessage;
    }

    public void addUserAccount(String userId){

        UserAccountEntity userAccountEntity = new UserAccountEntity();
        userAccountEntity.setId(System.currentTimeMillis());
        userAccountEntity.setUserId(Long.valueOf(userId));
        userAccountEntity.setDateCreated(new Date());
        userAccountEntity.setLastModified(new Date());
        userAccountEntity.setRecordStatus(GlobalConstant.INIT_SATTE);
        userAccountEntity.setGold(GlobalConstant.INT_GOLD);
        userAccountEntity.setSilverBean(GlobalConstant.INT_SILVERBEAN);
        userAccountEntity.setRemarks(GlobalConstant.USER_LEVEL);
        userAccountService.inserUseraccount(userAccountEntity);
        UserFlowMeterEntity userFlowMeterEntity = new UserFlowMeterEntity();
        userFlowMeterEntity.setId(System.currentTimeMillis());
        userFlowMeterEntity.setVersion(0);
        userFlowMeterEntity.setDateCreated(new Date());
        userFlowMeterEntity.setLastModified(new Date());
        userFlowMeterEntity.setUserId(Long.valueOf(userId));
        userFlowMeterEntity.setReason(GlobalConstant.REGISTER);
        userFlowMeterEntity.setRecordStatus(GlobalConstant.INIT_SATTE);
        userFlowMeterEntity.setOriginalSilverBean(0);
        userFlowMeterEntity.setChangeSilverBean(GlobalConstant.INT_SILVERBEAN);
        userFlowMeterEntity.setCurrentSilverBean(GlobalConstant.INT_SILVERBEAN);
        userFlowMeterEntity.setChangeGold(0);
        userFlowMeterEntity.setCurrentGold(0);
        userFlowMeterEntity.setOriginalGold(0);
        userFlowMeterEntity.setType(GlobalConstant.SILVERBEAN);
        userFlowMeterService.addUserFlowMeter(userFlowMeterEntity);
        userFlowMeterEntity.setId(System.currentTimeMillis()+1);
        userFlowMeterEntity.setVersion(0);
        userFlowMeterEntity.setDateCreated(new Date());
        userFlowMeterEntity.setLastModified(new Date());
        userFlowMeterEntity.setUserId(Long.valueOf(userId));
        userFlowMeterEntity.setRecordStatus(GlobalConstant.INIT_SATTE);
        userFlowMeterEntity.setOriginalGold(0);
        userFlowMeterEntity.setChangeGold(GlobalConstant.INT_GOLD);
        userFlowMeterEntity.setCurrentGold(GlobalConstant.INT_GOLD);
        userFlowMeterEntity.setChangeSilverBean(0);
        userFlowMeterEntity.setCurrentSilverBean(0);
        userFlowMeterEntity.setOriginalSilverBean(0);
        userFlowMeterEntity.setType(GlobalConstant.GOLD);
        userFlowMeterService.addUserFlowMeter(userFlowMeterEntity);
    }
}

