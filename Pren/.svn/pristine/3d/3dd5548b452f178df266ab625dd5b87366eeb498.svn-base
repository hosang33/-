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
	request.setCharacterEncoding("utf-8");
	String msgState = request.getParameter("msgState");
	int sendUserNo = Integer.parseInt(request.getParameter("sendUserNo"));
	int receiveUserNo = Integer.parseInt(request.getParameter("receiveUserNo"));
	String contents = request.getParameter("contents");	
	
	Message message = new Message();

	
	//상품번호가 있다  세션 유저의 Order item_no랑 product no가 일치하면 거래중인 것이다
	//Order db에 product no를 넣어서 값이 null이 아니라면 적는다
	message.setContent(contents);
	message.setIsRead("n");
	message.setStar("n");
	message.setSellState(msgState);
	message.setReceiveUserNo(receiveUserNo); //상품번호의 유저번호를 넣자
	message.setSendUserNo(sendUserNo);
	MessageDao messageDao = MessageDao.getInstance();
	messageDao.insertMessage(message);
	
	response.sendRedirect("message_all.jsp");
%>
