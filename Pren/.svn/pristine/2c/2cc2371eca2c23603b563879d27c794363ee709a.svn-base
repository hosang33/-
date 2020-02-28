package kr.pren.dao;

import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.pren.util.IbatisUtil;
import kr.pren.vo.Notice;

public class NoticeDao {
	private static NoticeDao instance = new NoticeDao();
	private NoticeDao() {}
	public static  NoticeDao getInstance() {
		return instance;
	}
	
	private SqlMapClient sqlmap = IbatisUtil.getSqlmap();
	
	public void insertNotice(Notice notice) throws Exception{
		sqlmap.insert("notices.insertNotice",notice);
	}
	public Notice getNoticeByNo(int noticeNo) throws Exception{
		return (Notice)sqlmap.queryForObject("notices.getNoticeByNo",noticeNo);
	}
	@SuppressWarnings("unchecked")
	public List<Notice> getNotices()throws Exception{
		return sqlmap.queryForList("notices.getNotices");
	}
	public void updateTotalView(int noticeNo) throws Exception{
		sqlmap.update("notices.updateTotalView",noticeNo);
	}
	public void deleteNotice(int noticeNo) throws Exception{
		sqlmap.delete("notices.deleteNotice",noticeNo);
	}
	public void updateNotice(Map<String, Object> criteria) throws Exception{
		sqlmap.update("notices.updateNotice",criteria);
	}
	public int countNotice() throws Exception{
		return (int) sqlmap.queryForObject("notices.countNotice");
	}
	@SuppressWarnings("unchecked")
	public List<Notice> pageNotice (Map<String, Object> criteria) throws Exception{
		return  sqlmap.queryForList("notices.pageNotice",criteria);
	}
	@SuppressWarnings("unchecked")
	public List<Notice> selectSeeorDateNotice (Map<String, Object> criteria) throws Exception{
		return sqlmap.queryForList("notices.selectSeeorDateNotice",criteria);
	}
}
