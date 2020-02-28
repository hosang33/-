package kr.pren.dao;


import java.sql.SQLException;


import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.pren.util.IbatisUtil;
import kr.pren.vo.Option;

public class OptionDao {
	private static OptionDao instance = new OptionDao();
	private OptionDao() {}
	public static  OptionDao getInstance() {
		return instance;
	}
	
	private SqlMapClient sqlmap = IbatisUtil.getSqlmap();

	// 추가 옵션 등록
		public void insertOption(Option option) throws SQLException {
			sqlmap.insert("options.insertOption", option);
		}

	@SuppressWarnings("unchecked")
	public List<Option> getOptionByNo (int productNo) throws SQLException {
		return sqlmap.queryForList("options.getOptionByNo", productNo);
	}
	
	@SuppressWarnings("unchecked")
	public List<Option> getAllOptionByOrderNo (int orderNo) throws SQLException {
		return  sqlmap.queryForList("options.getAllOptionByOrderNo",orderNo);
	}
	
	public void insertOrderOption(Map<String, Object> map) throws SQLException {
		sqlmap.insert("options.insertOrderOption",map);
	}
	
	public void deleteAllOrderOptionByOptionNo(int optionNo) throws SQLException {
		sqlmap.delete("options.deleteAllOrderOptionByOptionNo",optionNo);
	}
	public void deleteAllOptionByItemNo(int itemNo) throws SQLException {
		sqlmap.delete("options.deleteAllOptionByItemNo",itemNo);
	}
}
