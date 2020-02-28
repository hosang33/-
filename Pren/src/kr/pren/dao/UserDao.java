package kr.pren.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.pren.util.IbatisUtil;
import kr.pren.vo.Order;
import kr.pren.vo.User;

public class UserDao {
	private static UserDao instance = new UserDao();
	private UserDao() {}
	public static  UserDao getInstance() {
		return instance;
	}
	
	private SqlMapClient sqlmap = IbatisUtil.getSqlmap();
	
	public void insertUser(User user) throws Exception {
		sqlmap.insert("users.insertUser", user);
	}
	public User getUserById(String userId) throws Exception{
		return (User) sqlmap.queryForObject("users.getUserById", userId);
	}

	public User findUserById(User user) throws Exception{
		return (User) sqlmap.queryForObject("users.findUserById",user);
	}
	
	public User getUserByNo(int userNo) throws SQLException {
		return (User) sqlmap.queryForObject("users.getUserByNo",userNo);
	}
	public User findUserByPwd(User user) throws Exception{
		return (User) sqlmap.queryForObject("users.findUserByPwd",user);
	}  
	public void updatepwd (Map<String, Object> updatepwd) throws Exception{
		sqlmap.update("users.updatepwd",updatepwd);
	}
	public void dropOutUser (Map<String, Object> dropEmail) throws Exception{
		sqlmap.update("users.dropOutUser",dropEmail);
	}
	public void updateUserNickname (Map<String, Object> userInfo) throws Exception{
		sqlmap.update("users.updateUserNickname", userInfo);
	}
	public void updateUserDayofTime (User user) throws Exception{
		sqlmap.update("users.updateUserDayofTime", user);
	}
	public void updateUserDayofWeek (Map<String, Object> userInfoDay) throws Exception{
		sqlmap.update("users.updateUserDayofWeek", userInfoDay);
	}
	public User getUserByWeekorTimeByNo(int userNo) throws Exception{
		return (User) sqlmap.queryForObject("users.getUserByWeekorTimeByNo",userNo);
	}
	public void updateUserPassword (Map<String, Object> userInfoPwd) throws Exception{
		sqlmap.update("users.updateUserPassword", userInfoPwd);
	}
	public void updateUserBank (Map<String, Object> userBankNo) throws Exception{
		sqlmap.update("users.updateUserBank", userBankNo);
	}
	public void updateUserRefundBankNo (User user) throws Exception{
		sqlmap.update("users.updateUserRefundBankNo", user);
	}
	public void updateUserProfit (Order findOrder) throws SQLException {
			sqlmap.update("users.updateUserProfit",findOrder);
	}
	public void updateCompleteDate (Order findOrder) throws SQLException {
		sqlmap.update("users.updateCompleteDate",findOrder);
}
	@SuppressWarnings("unchecked")
	public List<User> getUserManagement () throws Exception {
		return sqlmap.queryForList("users.getUserManagement");
	}
	public int countManagement (Map<String, Object> userCount) throws Exception {
		return (int) sqlmap.queryForObject("users.countManagement",userCount);
	}
	@SuppressWarnings("unchecked")
	public List<User> getUserManagementpage (Map<String, Object> userManagement) throws Exception{
		return sqlmap.queryForList("users.getUserManagementpage",userManagement);
	}
	public void updateUserImg (User user) throws Exception{
		sqlmap.update("users.updateUserImg",user);
	}
	public void stopUser (int userNo) throws Exception{
		sqlmap.update("users.stopUser",userNo);
	}
}
