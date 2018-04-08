package com.force4us.QuartzTimeTask;
import static org.quartz.JobBuilder.newJob;
import static org.quartz.TriggerBuilder.newTrigger;
import static org.quartz.CronScheduleBuilder.*;
import org.quartz.*;

public class QuartzManager {

    private static String JOB_GROUP_NAME = "EXTJWEB_JOBGROUP_NAME";
    private static String TRIGGER_GROUP_NAME = "EXTJWEB_TRIGGERGROUP_NAME";

    /**
     * @Description: 添加一个定时任务
     *
     * @param sched
     *            调度器
     *
     * @param jobName
     *            任务名
     * @param jobGroupName
     *            任务组名
     * @param triggerName
     *            触发器名
     * @param triggerGroupName
     *            触发器组名
     * @param jobClass
     *            任务
     * @param time
     *            时间设置，参考quartz说明文档
     *
     * @Title: QuartzManager.java
     */
    public static void addJob(Scheduler sched, String jobName, String jobGroupName, String triggerName, String triggerGroupName, @SuppressWarnings("rawtypes") Class jobClass, String time) {
        try {
            //JobDetail jobDetail = new JobDetail(jobName, jobGroupName, jobClass);// 任务名，任务组，任务执行类
            JobDetail jobDetail = JobBuilder.newJob(jobClass).withIdentity(jobName,jobGroupName).build();
            // 触发器
            //CronTrigger trigger = new CronTrigger(triggerName, triggerGroupName);// 触发器名,触发器组
            TriggerBuilder<Trigger> triggerBuilder = TriggerBuilder.newTrigger();
            triggerBuilder.withIdentity(triggerName,triggerGroupName);
            triggerBuilder.startNow();
            triggerBuilder.withSchedule(CronScheduleBuilder.cronSchedule(time));
            CronTrigger trigger = (CronTrigger) triggerBuilder.build();
            //trigger.setCronExpression(time);// 触发器时间设定
            sched.scheduleJob(jobDetail, trigger);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
