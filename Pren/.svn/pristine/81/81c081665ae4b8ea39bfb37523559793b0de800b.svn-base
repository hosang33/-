package kr.pren.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.pren.util.IbatisUtil;
import kr.pren.vo.MainCategory;

public class MainCategoryDao {
	private static MainCategoryDao instance = new MainCategoryDao();
	private MainCategoryDao() {}
	public static  MainCategoryDao getInstance() {
		return instance;
	}
	
	private SqlMapClient sqlmap = IbatisUtil.getSqlmap();
	
	
	// 메인카테고리 전체조회
	@SuppressWarnings("unchecked")
	public List<MainCategory> getMainCategory () throws SQLException {
		return sqlmap.queryForList("maincategories.getMainCategory");
		
	}
	
	// 번호에 해당하는 메인카테고리 조회
	public MainCategory getMainCategoryByNo(int mainNo) throws SQLException {
		return (MainCategory) sqlmap.queryForObject("maincategories.getMainCategoryByNo", mainNo);
	}
	
	
}
