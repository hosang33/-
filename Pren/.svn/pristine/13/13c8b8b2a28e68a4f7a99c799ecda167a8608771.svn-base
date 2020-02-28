package kr.pren.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.pren.util.IbatisUtil;
import kr.pren.vo.SaleItem;

public class SaleItemDao {
	private static SaleItemDao instance = new SaleItemDao();
	private SaleItemDao() {}
	public static  SaleItemDao getInstance() {
		return instance;
	}
	
	private SqlMapClient sqlmap = IbatisUtil.getSqlmap();
	
	// 상품등록
	public void insertSaleItem(SaleItem saleItem) throws SQLException {
		sqlmap.insert("saleitems.insertSaleItem", saleItem);
	}
	
	// 유저의 찜목록 아이템 모두 가져오기
	@SuppressWarnings("unchecked")
	public List<SaleItem> getAllSteamItems(int userNo) throws SQLException {
		return sqlmap.queryForList("saleitems.getAllSteamItems",userNo);
	}
	
	@SuppressWarnings("unchecked")
	public List<SaleItem> getSaleItemOrderByLike(Map<String, Object> param) throws SQLException {
		return sqlmap.queryForList("saleitems.getSaleItemOrderByLike", param);
	}
		
	// 상품번호로  아이템 한개 조회 
	public SaleItem getSaleItemByNo(int ItemNo) throws SQLException {
		return (SaleItem) sqlmap.queryForObject("saleitems.getSaleItemByNo",ItemNo);
	}
		
	// 유저 번호로 상품번호 찾기
	public SaleItem getSaleItemNo(int userNo) throws SQLException {
		return (SaleItem) sqlmap.queryForObject("saleitems.getSaleItemNo",userNo);
	}
	
	// 유저번호로 등록한 상품 리스트 조회(등록 날짜순으로)
	@SuppressWarnings("unchecked")
	public List<SaleItem> getSaleItemsDateByUserNo(int userNo) throws SQLException {
		return sqlmap.queryForList("saleitems.getSaleItemsDateByUserNo", userNo);
	}
	// 유저번호로 등록한 상품 리스트 조회(좋아요 순으로)
	@SuppressWarnings("unchecked")
	public List<SaleItem> getSaleItemsLikeByUserNo(int userNo) throws SQLException {
		return sqlmap.queryForList("saleitems.getSaleItemsLikeByUserNo", userNo);
	}
	// 심사대기중 상품 리스트 조회
	@SuppressWarnings("unchecked")
	public List<SaleItem> getSaleItemsState() throws SQLException{
		return sqlmap.queryForList("saleitems.getSaleItemsState");
	}
	// 상품 심사 결과 업데이트
	public void updateSaleitem(Map<String, Object> saleItem) throws Exception {
		sqlmap.update("saleitems.updateSaleitem", saleItem);
	}
	//검색 결과 
	@SuppressWarnings("unchecked")
	public List<SaleItem> getItemBySearch(Map<String, Object> map) throws SQLException {
		return sqlmap.queryForList("saleitems.getItemBySearch", map);
	}  
	
	// 상품 삭제하기
	public void deleteSaleitem(int productNo) throws SQLException {
		sqlmap.delete("saleitems.deleteSaleitem", productNo);
	}
}

























