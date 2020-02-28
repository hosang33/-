<%@page import="kr.pren.dao.NoticeDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	request.setCharacterEncoding("utf-8");

	int noticeNo = Integer.parseInt(request.getParameter("noticeNo"));
	
	NoticeDao noticeDao = NoticeDao.getInstance();
	
	noticeDao.deleteNotice(noticeNo);
	
	response.sendRedirect("notice_center.jsp");
%>