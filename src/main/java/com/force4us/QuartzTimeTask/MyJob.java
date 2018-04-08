package com.force4us.QuartzTimeTask;

import com.force4us.comm.GlobalConstant;
import com.force4us.service.PublishGoodsService;
import com.force4us.service.RecruitService;
import com.force4us.web.indexController;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.swing.text.GapContent;

//@Component
public class MyJob {
    private static final Logger LOGGER = LoggerFactory.getLogger(MyJob.class);
    @Autowired
    PublishGoodsService publishGoodsService;
    @Autowired
    RecruitService recruitService;
    public void executes() {
        new Thread(){
        public void run () {
            LOGGER.info("线程开启......");
            int i = publishGoodsService.updateGoodsState(GlobalConstant.PUBLISH);
            if(0 <= i){
                LOGGER.info(i+"件商品成功发布");
            }else {
                LOGGER.error("检索商品发布状态失败");
            }
            LOGGER.info("线程结束...");
        }
    }.start();
        int i = recruitService.updateRecruitRecordStatus(GlobalConstant.PUBLISH);
        if(0 <= i){
            LOGGER.info(i+"条招聘信息成功发布");
        }else {
            LOGGER.error("检索招聘信息发布状态失败");
        }
    }
}
