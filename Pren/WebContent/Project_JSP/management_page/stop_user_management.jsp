<%@page import="kr.pren.dao.UserDao"%>
<%@page import="kr.pren.vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
		request.setCharacterEncoding("utf-8");

		
		int userNo = Integer.parseInt(request.getParameter("userNo"));
		
		System.out.println(userNo);
		
		UserDao userDao = UserDao.getInstance();
		userDao.stopUser(userNo);

		response.sendRedirect("member_management.jsp");
%>