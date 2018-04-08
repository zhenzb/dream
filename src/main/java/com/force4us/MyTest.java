package com.force4us;

import com.force4us.QuartzTimeTask.QuartzManager;
import com.force4us.QuartzTimeTask.dynamicQuartzTask;
import org.quartz.Scheduler;
import org.quartz.SchedulerException;
import org.quartz.SchedulerFactory;
import org.quartz.impl.StdSchedulerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/test")
public class MyTest {

    @RequestMapping(value = "/z")
    public void zzb() {
        SchedulerFactory gSchedulerFactory = new StdSchedulerFactory();
        Scheduler sche = null;
        try {
            sche = gSchedulerFactory.getScheduler();
        } catch (SchedulerException e) {
            e.printStackTrace();
        }
        QuartzManager.addJob(sche, "zzb_name","zzb_group",
                "triger_name","trigger_group",dynamicQuartzTask.class, "0/1 * * * * ?");
    }
}
