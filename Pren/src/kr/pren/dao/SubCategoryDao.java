package kr.pren.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.pren.util.IbatisUtil;
import kr.pren.vo.SubCategory;

public class SubCategoryDao {
	private static SubCategoryDao instance = new SubCategoryDao();
	private SubCategoryDao() {}
	public static  SubCategoryDao getInstance() {
		return instance;
	}
	
	private SqlMapClient sqlmap = IbatisUtil.getSqlmap();
	
	
	// 메인카테고리번호로 서브카테고리 조회
	@SuppressWarnings("unchecked")
	public List<SubCategory> getSubCategoryByMainNo (int mainNo) throws SQLException {
		return sqlmap.queryForList("subcategories.getSubCategoryByMainNo", mainNo);	
	}
	
	// 서브카테고리 전체조회
	@SuppressWarnings("unchecked")
	public List<SubCategory> getAllSubCategories()throws SQLException{
		return sqlmap.queryForList("subcategories.getAllSubCategories");	
	}
	
	public SubCategory getSubCategoryByNo (int subCateNo) throws SQLException {
		return (SubCategory) sqlmap.queryForObject("subcategories.getSubCategoryByNo", subCateNo);
	}
}
