<%@page import="javax.xml.ws.Response"%>
<%@page import="kr.pren.dao.MessageDao"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="kr.pren.vo.Order"%>
<%@page import="kr.pren.dao.OrderDao"%>
<%@page import="kr.pren.vo.SaleItem"%>
<%@page import="kr.pren.dao.SaleItemDao"%>
<%@page import="kr.pren.vo.User"%>
<%@page import="kr.pren.vo.Message"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//User loginedUser = (User)session.getAttribute("LOGINED_USER");
	int userNo =Integer.parseInt(request.getParameter("userNo"));
	String contents = request.getParameter("contents");	
	int productNo = Integer.parseInt(request.getParameter("productNo")); 
	
	SaleItemDao saleItemDao = SaleItemDao.getInstance();
	SaleItem findItem =   saleItemDao.getSaleItemByNo(productNo);
	
	//구매자의 주문내역에 구매한 상품번호와 같은지  조회하기위해 유저번호랑 상품번호를 전해준다
	//유
	//유저번호와 상품번호를 주문내역db에서 조회해서 메세지의 거래상태를 변환시킴
	Map<String,Object> map = new HashMap<>();
	map.put("itemNo", productNo);
	map.put("userNo", userNo);
	OrderDao orderDao = OrderDao.getInstance();
	Order findOrders = orderDao.getOrderByItemNoAndUserNo(map);
	
	Message message = new Message();
	if (findOrders==null) {
		message.setSellState("거래전");
	} else if(findOrders.getState().equals("거래완료")) {
		message.setSellState("거래완료");
	} else {
		message.setSellState("거래중");
	}

	
	//상품번호가 있다  세션 유저의 Order item_no랑 product no가 일치하면 거래중인 것이다
	//Order db에 product no를 넣어서 값이 null이 아니라면 적는다
	message.setContent(contents);
	message.setIsRead("n");
	message.setStar("n");
	message.setReceiveUserNo(findItem.getUser().getNo()); //상품번호의 유저번호를 넣자
	message.setSendUserNo(userNo);
	MessageDao messageDao = MessageDao.getInstance();
	messageDao.insertMessage(message);
	
	response.sendRedirect("message_all.jsp");
%>
