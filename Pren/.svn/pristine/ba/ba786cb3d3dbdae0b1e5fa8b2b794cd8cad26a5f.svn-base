<%@page import="kr.pren.util.StringUtils"%>
<%@page import="kr.pren.dao.UserDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="kr.pren.vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	User loginedUser = (User)session.getAttribute("LOGINED_USER");
	int userNo = loginedUser.getNo();
	
	Map<String, Object> userInfoDay = new HashMap<>();
	
	String[] days = request.getParameterValues("dayofweek");
	
	userInfoDay.put("callDate", StringUtils.arrayToStringWithDelim(days, ","));
	userInfoDay.put("userno", userNo);
	
	UserDao userDao = UserDao.getInstance();
	userDao.updateUserDayofWeek(userInfoDay);
	
		
	int firstTime = Integer.parseInt(request.getParameter("firsttime"));
	int lastTime = Integer.parseInt(request.getParameter("lasttime"));
	
	User userTime = new User();
	userTime.setCallFirstTime(firstTime);
	userTime.setCallLastTime(lastTime);
	userTime.setNo(userNo);
	
	userDao.updateUserDayofTime(userTime);
	
	response.sendRedirect("my_info_form.jsp");
	
%>