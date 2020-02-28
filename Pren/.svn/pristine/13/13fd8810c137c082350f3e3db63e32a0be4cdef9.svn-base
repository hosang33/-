package kr.pren.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.pren.util.IbatisUtil;
import kr.pren.vo.Order;
import kr.pren.vo.SaleItem;

public class OrderDao {
	private static OrderDao instance = new OrderDao();
	private OrderDao() {}
	public static  OrderDao getInstance() {
		return instance;
	}
	private SqlMapClient sqlmap = IbatisUtil.getSqlmap();
	
	public void insertOrder(Order order) throws SQLException {
		sqlmap.insert("orders.insertOrder",order);
	} 
	@SuppressWarnings("unchecked")
	public List<Order> getAllOrderByUserNo(int userNo) throws SQLException {
		return sqlmap.queryForList("orders.getAllOrderByUserNo",userNo);
				
	}
	@SuppressWarnings("unchecked")
	public List<Order> getAllOrderBySellerUserNo(int userNo) throws SQLException {
		return sqlmap.queryForList("orders.getAllOrderBySellerUserNo",userNo);
	}
	
	@SuppressWarnings("unchecked")
	public List<Order> getAllOrderBySearchForm(Map<String, Object> searchMap) throws SQLException {
		return sqlmap.queryForList("orders.getAllOrderBySearchForm",searchMap);
		
	} 
	
	public Order getOrderByItemNoAndUserNo(Map<String, Object> map) throws SQLException {
		return (Order) sqlmap.queryForObject("orders.getOrderByItemNoAndUserNo",map);
	}
	
	// 유저번호 최신 주문아이템 조회하기
	
	public Order getNewOrderByMap (Map<String, Object> map) throws SQLException {
		return (Order) sqlmap.queryForObject("orders.getNewOrderByMap", map);
	}
	
	//주문번호로 주문 아이템 조회하기
	public Order getOrderByOrderNo (int orderNo) throws SQLException {
		return (Order) sqlmap.queryForObject("orders.getOrderByOrderNo", orderNo);
	}
	// 메인카테고리별 총매출 조회
	@SuppressWarnings("unchecked")
	public List<String> getProfitByGroup() throws SQLException {
		return sqlmap.queryForList("orders.getProfitByGroup");
	}
	// 주문삭제하기
	public void deleteOrder(int productNo) throws SQLException {
		sqlmap.delete("orders.deleteOrder", productNo);
	}
	
	//관리자가 필요한 주문정보리스트 조회
	@SuppressWarnings("unchecked")
	public List<Order> getAllOrderManager(Map<String, Object> Map) throws SQLException{
		return sqlmap.queryForList("orders.getAllOrderManager",Map);
	}
	//관리자 페이지 페이징처리에 필요한 총 행의 수
	public int getAllOrderCount(Map<String,Object> map) throws SQLException {
		return (int) sqlmap.queryForObject("orders.getAllOrderCount",map);
	}
	//주문번호로 상태 업데이트 
	public void updateOrderByNo(Map<String,Object> map) throws SQLException {
		sqlmap.update("orders.updateOrderByNo",map);
	} 
	
}
