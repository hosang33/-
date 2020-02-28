package kr.pren.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.pren.util.IbatisUtil;
import kr.pren.vo.Message;


public class MessageDao {
	private static MessageDao instance = new MessageDao();
	private MessageDao() {}
	public static  MessageDao getInstance() {
		return instance;
	}
	
	private SqlMapClient sqlmap = IbatisUtil.getSqlmap();
	
	@SuppressWarnings("unchecked")
	public List<Message> getAllMessage(Map<String,Object> map) throws SQLException {
		return sqlmap.queryForList("Messages.getAllMessage",map);
	}
	
	public int getMessageCount(int id) throws SQLException {
		return (int) sqlmap.queryForObject("Messages.getMessageCount",id);
	}
	
	public void insertMessage(Message UsersendMessage) throws SQLException {
		sqlmap.insert("Messages.insertMessage",UsersendMessage);
	}
	
	public Message getMessageByNo(int msgNo) throws SQLException {
		return (Message) sqlmap.queryForObject("Messages.getMessageByNo",msgNo);
	}
	
	public void updateMessageStateByNo(int msgNo) throws SQLException {
		sqlmap.update("Messages.updateMessageStateByNo",msgNo);
	}
}
