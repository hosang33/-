package kr.pren.batch;

import java.sql.SQLException;
import java.util.List;

import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

import kr.pren.dao.MessageDao;

//고객의 등급을 포인트를 기준으로 업그레이드하는 Job
public class UserGradeUpgradeJob implements Job{
	
	@Override
	public void execute(JobExecutionContext jobExecutionContext) throws JobExecutionException {
	
		try {
			MessageDao msgDao = MessageDao.getInstance();
			msgDao.deleteMonth();
		} catch (SQLException e) {
			throw new JobExecutionException(e);
		}
	}
	
}
