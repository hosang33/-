package kr.pren.batch;

import org.quartz.CronScheduleBuilder;
import org.quartz.JobBuilder;
import org.quartz.JobDetail;
import org.quartz.Scheduler;
import org.quartz.Trigger;
import org.quartz.TriggerBuilder;
import org.quartz.impl.StdSchedulerFactory;

public class StoreBatch {

	public static void main(String[] args) throws Exception{

		JobDetail jobDetail = JobBuilder
							  .newJob(UserGradeUpgradeJob.class)
							  .withIdentity("messageJob","storegroup")
							  .build();

		Trigger trigger = TriggerBuilder
						  .newTrigger()
						  .withIdentity("monthlyTrigger","storegroup")
					      .withSchedule(CronScheduleBuilder.cronSchedule("0 0 12 0 * ?"))
					      .build();

		Scheduler scheduler = StdSchedulerFactory.getDefaultScheduler();
		scheduler.scheduleJob(jobDetail,trigger);
		scheduler.start();
	}
}
