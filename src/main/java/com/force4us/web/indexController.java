package com.force4us.web;

import com.force4us.QuartzTimeTask.QuartzManager;
import com.force4us.QuartzTimeTask.dynamicQuartzTask;
import com.force4us.comm.GlobalConstant;
import com.force4us.comm.entity.Seckilled;
import com.force4us.dao.cache.RedisDao;
import com.force4us.entity.*;
import com.force4us.service.*;
import com.sun.org.apache.xpath.internal.operations.Mod;
import org.apache.ibatis.annotations.Param;
import org.quartz.Scheduler;
import org.quartz.SchedulerException;
import org.quartz.SchedulerFactory;
import org.quartz.impl.StdSchedulerFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.scheduling.quartz.SchedulerFactoryBean;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * @Describe:
 * @Author:zhenzhuobin
 * @Date:
 */
@Controller
@RequestMapping(value = "")
public class indexController {
    private static final Logger LOGGER = LoggerFactory.getLogger(indexController.class);
    @Autowired
    private SeckillService seckillService;
    @Autowired
    private SuccessKilledService successKilledService;
    @Autowired
    private UserFlowMeterService userFlowMeterService;
    @Autowired
    private PublishGoodsService publishGoodsService;
    @Autowired
    private MessageService messageService;
    @Autowired
    private RedisDao redisDao;
    @Autowired
    RecruitService recruitService;
    @Autowired
    RentingService rentingService;
    @Value("${img_host}")
    String IMAGEURL;

    @RequestMapping(value="/goods")
    public String list(Model model, HttpSession session,HttpServletResponse response) {
        List<MessageEntity> messageAll;
        List list1;
        List<SeckillEntity> successKilled;
        //String number;
        /* list1 = redisDao.getSeckillList("seckillList");
        successKilled = redisDao.getSeckillList("successKilledList");
        messageAll = redisDao.getSeckillList("MessageEntityList");
        number = redisDao.getNumber("seckillSize");*/
        //LOGGER.info("redis:"+list1);
        // if(null == list1 || null ==successKilled || null ==messageAll || null == number) {
        List<SeckillEntity> list = seckillService.findSeckillEntityByState();
        list1 = ergodicList(list);
        successKilled = successKilledService.findSuccessKilled();
        messageAll = messageService.findMessageAll();
        //List<SeckillEntity> seckillSize = seckillService.findSeckillEntity();
        /*redisDao.setListRedis("seckillList",list1);
        redisDao.setListRedis("successKilledList",successKilled);
        redisDao.setListRedis("MessageEntityList",messageAll);
        redisDao.putNumber("seckillSize",seckillSize.size());*/
        //}
        model.addAttribute("list",list1);
        session.setAttribute("successKilled",successKilled);
        model.addAttribute("messageList",messageAll);
        //session.setAttribute("successSize",seckillSize.size());
        UserEntity user = (UserEntity)session.getAttribute("user");
        if(null !=user) {
            Cookie cookie = new Cookie("user", String.valueOf(user.getId()));
            //cookie.setMaxAge(7 * 24 * 60 * 60); //不设置过期时间cookies随浏览器关闭而消失
            response.addCookie(cookie);
        }
        return "list";
    }

    @RequestMapping(value = "/searchList",method= RequestMethod.GET)
    public String searchList(Model model,HttpServletRequest request) {
        String zzb = request.getParameter("zzb");
        List<SeckillEntity> list = seckillService.findSeckillEntityByStateAndName(zzb);
        List list1 = ergodicList(list);
        List<SeckillEntity> successKilledEntity = successKilledService.findSuccessKilled();
        List<MessageEntity> messageAll = messageService.findMessageAll();
        model.addAttribute("messageList",messageAll);
        model.addAttribute("list",list1);
        model.addAttribute("successKilled", successKilledEntity);
        return "list";
    }

    @RequestMapping(value = "/login",method = RequestMethod.GET)
    public String login(){
        return "login";
    }

    @RequestMapping(value = "/register",method = RequestMethod.GET)
    public String register(){
        return "register";
    }

    @RequestMapping(value = "/logout",method=RequestMethod.GET)
    public String logout(HttpSession session){
        session.removeAttribute("user");
        session.removeAttribute("userAccount");
        return "list";
    }
    @RequestMapping(value = "/error",method = RequestMethod.GET)
    public String error(){
        return "error";
    }

    @RequestMapping(value = "/goldPersonalCenter",method = RequestMethod.GET)
    public ModelAndView goldPersonalCenter(ModelAndView modelAndView,HttpSession session){
        UserEntity user = (UserEntity)session.getAttribute("user");
        List<UserFlowMeterEntity> userFlowMeterList = userFlowMeterService.findByUserIdAndType(user.getId(), GlobalConstant.GOLD);
        modelAndView.setViewName("goldPersonalCenter");
        modelAndView.addObject("userFlowMeterList",userFlowMeterList);
        return modelAndView;
    }
    @RequestMapping(value = "/silverBeanPersonalCenter",method = RequestMethod.GET)
    public ModelAndView silverPersonalCenter(ModelAndView modelAndView,HttpSession session){
        UserEntity user = (UserEntity)session.getAttribute("user");
        List<UserFlowMeterEntity> userFlowMeterList = userFlowMeterService.findByUserIdAndType(user.getId(), GlobalConstant.SILVERBEAN);
        modelAndView.addObject("userFlowMeterList",userFlowMeterList);
        modelAndView.setViewName("silverBeanPersonalCenter");
        return modelAndView;
    }
    @RequestMapping(value = "/messagePersonalCenter",method = RequestMethod.GET)
    public ModelAndView messagePersonalCenter(ModelAndView modelAndView){
        modelAndView.setViewName("messagePersonalCenter");
        return modelAndView;
    }

    @RequestMapping(value = "/systemMessage",method = RequestMethod.GET)
    public ModelAndView systemMessage(HttpServletRequest request,ModelAndView modelAndView){
        String id = request.getParameter("i");
        MessageEntity systemMessage = messageService.findMessageById(Long.valueOf(id));
        modelAndView.setViewName("systemMessage");
        modelAndView.addObject("systemMessage",systemMessage);
        return modelAndView;
    }

    @RequestMapping(value = "/pg",method = RequestMethod.GET)
    public ModelAndView publishGoods(ModelAndView modelAndView){
        modelAndView.setViewName("publishGoods");
        return modelAndView;
    }

    @RequestMapping(value="/publishList",method = RequestMethod.GET)
    public ModelAndView publishList(ModelAndView modelAndView,HttpSession session){
        UserEntity user = (UserEntity)session.getAttribute("user");
        List<SeckillEntity> publishGoodsList = publishGoodsService.findByAdminId(user.getId());
        modelAndView.addObject("punlishGoodsList",publishGoodsList);
        modelAndView.setViewName("personalCenter");
        return modelAndView;
    }

    private List<Seckilled> ergodicList(List<SeckillEntity> list){
        List<Seckilled> list1 = new ArrayList();
        for (int i=0;i<list.size();i++) {
            LOGGER.info("商品id"+list.get(i).getSeckillId());
            List<SuccessKilledEntity> successKilledEntity = successKilledService.findSuccessKilledBySeckillId(list.get(i).getSeckillId());
            System.out.println(successKilledEntity.toString());
            Seckilled seckilled = new Seckilled();
            seckilled.setSeckillSize(successKilledEntity.size());
            seckilled.setSeckillId(list.get(i).getSeckillId());
            seckilled.setImgUrl(IMAGEURL+list.get(i).getImgUrl());
            seckilled.setName(list.get(i).getName());
            seckilled.setStartTime(list.get(i).getStartTime());
            seckilled.setEndTime(list.get(i).getEndTime());
            seckilled.setAddress(list.get(i).getAddress());
            //seckilled.setUserName(i < successKilledEntity.size()?successKilledEntity.get(i).getUserName():null);
            list1.add(seckilled);
        }
        return  list1;
    }

    @RequestMapping(value = "/recruit")
    public ModelAndView recruit(ModelAndView modelAndView){
        List<RecruitEntity> list = new ArrayList<RecruitEntity>();
        List<RecruitEntity> recruitList = recruitService.findRecruitByRecordStatus(GlobalConstant.PUBLISH);
        for (RecruitEntity recruitEntity:recruitList) {
            String logoUrl = recruitEntity.getLogoUrl();
           String newLogoUrl = IMAGEURL+logoUrl;
           recruitEntity.setLogoUrl(newLogoUrl);
           list.add(recruitEntity);
        }
        modelAndView.addObject("recruitList",list);
        modelAndView.setViewName("recruit");
        return modelAndView;
    }

    @RequestMapping(value = "searchRecruit")
    public String searchRecruit(Model model,HttpServletRequest request){
        String zzb = request.getParameter("zzb");
        List<RecruitEntity> recruitByNameList = recruitService.findRecruitByName(zzb, zzb);
        model.addAttribute("recruitList",recruitByNameList);
        List<MessageEntity> messageAll = messageService.findMessageAll();
        model.addAttribute("messageList",messageAll);
        return "recruit";
    }

    @RequestMapping(value = "/publishRecruit")
    public ModelAndView publishRecruit(ModelAndView modelAndView){
        modelAndView.setViewName("publishRecruit");
        return modelAndView;
    }

    @RequestMapping(value = "/recruitDetails")
    public ModelAndView recruitDetails(ModelAndView modelAndView, @RequestParam(value = "i") long id){
        RecruitEntity recruitEntity = recruitService.findbRecruityByIdAndRecordStatus(id, GlobalConstant.PUBLISH);
        modelAndView.addObject("recruit",recruitEntity);
        modelAndView.setViewName("recruitDetails");
        return modelAndView;
    }

    @RequestMapping(value = "/recruitCenter")
    public ModelAndView recruitCenter(ModelAndView modelAndView,HttpSession session){
        UserEntity user = (UserEntity) session.getAttribute("user");
        List<RecruitEntity> recruitList = recruitService.findRecruitByUserId(user.getId());
        modelAndView.addObject("recruitlist",recruitList);
        modelAndView.setViewName("recruitCenter");
        return modelAndView;
    }

    @RequestMapping(value = "/withdrawals")
    public ModelAndView Withdrawals(ModelAndView modelAndView,HttpSession session){
        UserEntity user = (UserEntity)session.getAttribute("user");
        List<UserFlowMeterEntity> userFlowMeterList = userFlowMeterService.findByUserIdAndType(user.getId(), GlobalConstant.money);
        modelAndView.setViewName("withdrawals");
        modelAndView.addObject("userFlowMeterList",userFlowMeterList);
        return modelAndView;
    }
    @RequestMapping(value = "/publishMessage")
    public ModelAndView publishMessage(ModelAndView modelAndView){
        modelAndView.setViewName("publishMessage");
        return modelAndView;
    }

    @RequestMapping(value = "",method= RequestMethod.GET)
    public ModelAndView showRenting(ModelAndView modelAndView){
        List<RentingEntity> list1 = new ArrayList<RentingEntity>();
            List list = rentingService.findList(0);
        for (Object renting:list) {
            RentingEntity renting1 = (RentingEntity) renting;
            String houseImage = renting1.getHouseImage();
            String houseImageOne = renting1.getHouseImageOne();
            String houseImageTwo = renting1.getHouseImageTwo();
            String houseImageThree = renting1.getHouseImageThree();
            String pictureUrl = IMAGEURL+houseImage;
            String pictureUrl_1 = IMAGEURL+houseImageOne;
            String pictureUrl_2 = IMAGEURL+houseImageTwo;
            String pictureUrl_3 = IMAGEURL+houseImageThree;
            renting1.setHouseImage(pictureUrl);
            renting1.setHouseImageOne(pictureUrl_1);
            renting1.setHouseImageTwo(pictureUrl_2);
            renting1.setHouseImageThree(pictureUrl_3);
            list1.add(renting1);
        }
       modelAndView.addObject("rentingList",list1);
       modelAndView.setViewName("renting");
       return modelAndView;
    }
    @RequestMapping(value = "/rentingDetile")
    public ModelAndView rentingDetile(ModelAndView modelAndView,@RequestParam(value = "i") long id){
        RentingEntity renting = rentingService.findRrnting(id);
        modelAndView.addObject("renting",renting);
        modelAndView.setViewName("rentingDetile");
        return modelAndView;
    }
    @RequestMapping(value = "/rentingpublish")
    public ModelAndView publishrenting(ModelAndView modelAndView){
        modelAndView.setViewName("rentingpublish");
        return modelAndView;
    }

    @RequestMapping(value = "/rentingCenter")
    public ModelAndView rentingCenter(ModelAndView modelAndView,HttpSession session) {
        UserEntity user = (UserEntity) session.getAttribute("user");
        List<RecruitEntity> rentingtList = rentingService.findList(0,user.getId());
        modelAndView.addObject("rentingList", rentingtList);
        modelAndView.setViewName("rentingCenter");
        return modelAndView;
    }


@Autowired
SchedulerFactoryBean schedulerFactoryBean;
    @RequestMapping(value = "/z")
    public void zzb() {
        Scheduler sche = null;
        try {
            sche = schedulerFactoryBean.getScheduler();
        } catch (Exception e) {
            e.printStackTrace();
        }
        SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date parse = null;
        try {
            parse = sd.parse("2018-03-02 15:35:00");
        } catch (ParseException e) {
            e.printStackTrace();
        }
        SimpleDateFormat cron = new SimpleDateFormat("ss mm HH dd MM ? YYYY");
        String format = cron.format(parse.getTime());
        QuartzManager.addJob(sche, "zzb_names","zzb_groups",
                "triger_names","trigger_groups",dynamicQuartzTask.class, format);
    }
}
