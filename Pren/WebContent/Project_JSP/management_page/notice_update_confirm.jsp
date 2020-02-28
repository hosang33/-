<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="kr.pren.vo.Notice"%>
<%@page import="kr.pren.dao.NoticeDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	
	int noticeNo = Integer.parseInt(request.getParameter("noticeNo"));
	
	NoticeDao noticeDao= NoticeDao.getInstance();
	
	Notice notice = noticeDao.getNoticeByNo(noticeNo);
	
	String title = request.getParameter("noticeTitle");
	String content = request.getParameter("noticeContent");
	
	Map<String, Object> criteria = new HashMap<>();
	criteria.put("value",noticeNo);
	criteria.put("noticeTitle",title);
	criteria.put("noticeContent",content);
	
	noticeDao.updateNotice(criteria);
	
	
	response.sendRedirect("notice_center.jsp");
%>