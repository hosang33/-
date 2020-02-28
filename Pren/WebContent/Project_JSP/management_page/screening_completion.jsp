<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="kr.pren.dao.SaleItemDao"%>
<%@page import="kr.pren.vo.SaleItem"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	
	

	String state = request.getParameter("state");           
	int saleItemNo = Integer.parseInt(request.getParameter("saleItemNo"));
	
	
	SaleItemDao saleItemDao = SaleItemDao.getInstance();
	
	Map<String, Object> saleItem = new HashMap<>();
	saleItem.put("saleNo", saleItemNo);
	saleItem.put("saleState", state);
	
	
	saleItemDao.updateSaleitem(saleItem);
	
	
	response.sendRedirect("enrollment_judge.jsp");
	
%>