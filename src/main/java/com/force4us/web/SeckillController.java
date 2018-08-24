package com.force4us.web;

import com.force4us.comm.ArrayUtil;
import com.force4us.comm.GlobalConstant;
import com.force4us.dto.Exposer;
import com.force4us.dto.SeckillExecution;
import com.force4us.dto.SeckillResult;
import com.force4us.entity.SeckillEntity;
import com.force4us.entity.UserAddressEntity;
import com.force4us.entity.UserEntity;
import com.force4us.enums.SeckillStatEnum;
import com.force4us.exception.RepeatKillException;
import com.force4us.exception.SeckillCloseException;
import com.force4us.service.SeckillService;
import com.force4us.service.UserAddressService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Date;

/**
 * Created by chengjinqian on 2017/4/19.
 */
@Controller
@RequestMapping("/seckill")
public class SeckillController {

    @Autowired
    private SeckillService seckillService;

    @Autowired
    private UserAddressService userAddressService;
    @Value("${img_host}")
    String IMAGEURL;

    @RequestMapping(value = "/detail",method = RequestMethod.GET)
    public String detail(@RequestParam("seckillId") Long seckillId, Model model, HttpServletResponse response,HttpServletRequest request,HttpSession session){
        if(seckillId == null){
            return "redirect:/";
        }
        SeckillEntity seckillEntity = seckillService.getById(seckillId);
        Cookie[] cookies = request.getCookies();
        UserEntity user = (UserEntity) session.getAttribute("user");
       if(null !=user) {
            ArrayUtil arrayUtil = new ArrayUtil();
            boolean falg = arrayUtil.checkArray(cookies, "address");
            if (!falg) {
                UserAddressEntity userAddress = userAddressService.findUserAddressByUserIdAndState( user.getId(), GlobalConstant.ISDEFAULT);
                if (null != userAddress) {
                    Cookie cookie3 = new Cookie("address", "true");
                    cookie3.setMaxAge(7 * 24 * 60 * 60);
                    Cookie cookie1 = new Cookie("realName", "true");
                    cookie1.setMaxAge(7 * 24 * 60 * 60);
                    Cookie cookie2 = new Cookie("killPhone"+user.getId(), String.valueOf(userAddress.getMobileNo()));
                    cookie2.setMaxAge(7 * 24 * 60 * 60);
                    Cookie cookie4 = new Cookie("killPhone", String.valueOf(userAddress.getMobileNo()));
                    cookie2.setMaxAge(7 * 24 * 60 * 60);
                    response.addCookie(cookie3);
                    response.addCookie(cookie1);
                    response.addCookie(cookie2);
                    response.addCookie(cookie4);
                }
            }
        }
        if(seckillEntity == null){
            return "forward:/error";
        }
        String imgUrl = seckillEntity.getImgUrl();
        String bigOneImgUrl = seckillEntity.getBigOneImgUrl();
        String bigTwoImgUrl = seckillEntity.getBigTwoImgUrl();
        String bigThreeImgUrl = seckillEntity.getBigThreeImgUrl();
        seckillEntity.setImgUrl(IMAGEURL + imgUrl);
        seckillEntity.setBigOneImgUrl(IMAGEURL+bigOneImgUrl);
        seckillEntity.setBigTwoImgUrl(IMAGEURL+bigTwoImgUrl);
        seckillEntity.setBigThreeImgUrl(IMAGEURL+bigThreeImgUrl);
        model.addAttribute("seckill", seckillEntity);
        long endTime = seckillEntity.getEndTime().getTime();
        long currentTime = System.currentTimeMillis();
        Cookie cookie = null;
        if(currentTime>endTime){
            cookie = new Cookie("seckill_time","false");
        }else {
            cookie = new Cookie("seckill_time", "true");
        }
        if(null !=request.getParameter("s")){
            cookie = new Cookie("s", "true");
        }
        response.addCookie(cookie);
        return "commoditydetail";
    }

    //ajax ,json暴露秒杀接口的方法
    @RequestMapping(value="/{seckillId}/exposer",method = RequestMethod.POST,produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public SeckillResult<Exposer> exposer(@PathVariable("seckillId") Long seckillId){
        SeckillResult<Exposer> result;

        try {
            Exposer exposer = seckillService.exportSeckillUrl(seckillId);
            result = new SeckillResult<Exposer>(true,exposer);
        } catch (Exception e) {
            e.printStackTrace();
            result = new SeckillResult<Exposer>(false,e.getMessage());
        }

        return result;
    }


    @RequestMapping(value="/{seckillId}/{md5}/execution", method = RequestMethod.POST,
                    produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public SeckillResult<SeckillExecution> execute(@PathVariable("seckillId") Long seckillId,
                                                   @PathVariable("md5") String md5,
                                                   @CookieValue(value="killPhone", required = false) Long phone,
                                                   HttpSession session){
        if(phone == null){
            return new SeckillResult<SeckillExecution>(false,"未注册");
        }

        SeckillResult<SeckillExecution> result;

        try {
            SeckillExecution execution = seckillService.executeSeckillProcedure(seckillId,phone, md5,session);
            return new SeckillResult<SeckillExecution>(true,execution);
        } catch (RepeatKillException e1) {
            SeckillExecution execution = new SeckillExecution(seckillId, SeckillStatEnum.REPEAT_KILL);
            return new SeckillResult<SeckillExecution>(true,execution);
        } catch(SeckillCloseException e2){
            SeckillExecution execution = new SeckillExecution(seckillId, SeckillStatEnum.END);
            return new SeckillResult<SeckillExecution>(true,execution);
        }catch(Exception e){
            SeckillExecution execution = new SeckillExecution(seckillId, SeckillStatEnum.INNER_ERROR);
            return new SeckillResult<SeckillExecution>(true,execution);
        }
    }

    @RequestMapping(value = "/time/now", method = RequestMethod.GET)
    @ResponseBody
    public SeckillResult<Long> time(){
        Date now = new Date();
        return new SeckillResult<Long>(true,now.getTime());
    }


    @RequestMapping("/test")
    public String test(){
        return "helloworld";
    }
}
