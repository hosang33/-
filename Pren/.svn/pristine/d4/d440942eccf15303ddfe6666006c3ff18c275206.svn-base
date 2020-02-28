<%@page import="kr.pren.dao.NoticeDao"%>
<%@page import="kr.pren.vo.Notice"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String title = request.getParameter("titlename");
	String detailcontent = request.getParameter("detailcontent");
	
	Notice notice = new Notice();
	notice.setTitle(title);
	notice.setContent(detailcontent);
	
	NoticeDao noticeDao = NoticeDao.getInstance();
	noticeDao.insertNotice(notice);
	
	response.sendRedirect("notice_center.jsp");
%>