<%@page import="kr.pren.dao.UserDao"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="kr.pren.vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	User loginedUser = (User)session.getAttribute("LOGINED_USER");

	String nickname = request.getParameter("usernickname");
	int userNo = loginedUser.getNo();
	
	Map<String, Object> userInfo = new HashMap<>();
	
	userInfo.put("updatenickname",nickname);
	userInfo.put("value",userNo);
	
	UserDao userDao = UserDao.getInstance();
	userDao.updateUserNickname(userInfo);
	
	session.invalidate();
	
	response.sendRedirect("../main/index.jsp?changenickname=alert");
%>