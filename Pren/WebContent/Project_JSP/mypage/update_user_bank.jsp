<%@page import="kr.pren.dao.UserDao"%>
<%@page import="kr.pren.vo.User"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	User loginedUser = (User)session.getAttribute("LOGINED_USER");
	int userNo = loginedUser.getNo();

	String bankname = request.getParameter("bankname");
	String userbankno = request.getParameter("userbankno");
	
	Map<String, Object> userbank = new HashMap<>();
	userbank.put("bankName", bankname);
	userbank.put("sellBankNo",userbankno);
	userbank.put("userno",userNo);
	
	UserDao userDao = UserDao.getInstance();
	userDao.updateUserBank(userbank);
	
	response.sendRedirect("my_info_form.jsp");
%>