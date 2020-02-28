<%@page import="kr.pren.vo.Review"%>
<%@page import="kr.pren.dao.ReviewDao"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="kr.pren.vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	User loginedUser = (User)session.getAttribute("LOGINED_USER");
	
	String reviewSaveDirectory = "C:\\projects\\web_workspace\\semiproject\\WebContent\\resources\\images\\review";
	
	
	MultipartRequest multipartRequest = new MultipartRequest(request,
			reviewSaveDirectory,
			1024*1024*10,
			"utf-8");
	
	
	int productNo = Integer.parseInt(multipartRequest.getParameter("productNo"));
	int reviewNo = Integer.parseInt(multipartRequest.getParameter("itemNo"));
	String content = multipartRequest.getParameter("reviewContent");
	String filename = multipartRequest.getFilesystemName("reviewFile");
	
	
	
	ReviewDao reviewDao = ReviewDao.getInstance();
	
	Review review = reviewDao.getReviewByNo(reviewNo);
	review.setContent(content);
	review.setReviewImg(filename);
	
	reviewDao.updateReview(review);
	
	
%>