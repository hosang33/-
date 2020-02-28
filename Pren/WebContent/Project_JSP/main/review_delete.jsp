<%@page import="kr.pren.vo.Review"%>
<%@page import="kr.pren.dao.ReviewDao"%>
<%@page import="kr.pren.vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	User loginedUser = (User)session.getAttribute("LOGINED_USER");
	
	int reviewNo = Integer.parseInt(request.getParameter("reviewNo"));
	int productNo = Integer.parseInt(request.getParameter("productNo"));
	
	ReviewDao reviewDao = ReviewDao.getInstance();
	
	
	reviewDao.deleteReview(reviewNo);
	
	response.sendRedirect("product_display.jsp?productNo=" + productNo);
%>