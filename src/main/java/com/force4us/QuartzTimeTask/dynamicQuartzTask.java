package com.force4us.QuartzTimeTask;

import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.quartz.SchedulerFactoryBean;

public class dynamicQuartzTask implements Job {
    @Autowired
    SchedulerFactoryBean schedulerFactoryBean;
    @Override
    public void execute(JobExecutionContext jobExecutionContext) throws JobExecutionException {
        System.out.println("wwwwwwwwwwwwwwwwwwwww quartz..........");
    }


}
