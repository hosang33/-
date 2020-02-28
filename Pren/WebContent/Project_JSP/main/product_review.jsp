<%@page import="kr.pren.vo.User"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="kr.pren.dao.ReviewDao"%>
<%@page import="kr.pren.vo.SaleItem"%>
<%@page import="kr.pren.dao.SaleItemDao"%>
<%@page import="kr.pren.dao.OrderDao"%>
<%@page import="kr.pren.vo.Order"%>
<%@page import="kr.pren.vo.Review"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
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

	
	int productNo = Integer.parseInt(multipartRequest.getParameter("itemNo"));
	String content = multipartRequest.getParameter("reviewContent");
	int starScore = Integer.parseInt(multipartRequest.getParameter("starScore"));
	String filename = multipartRequest.getFilesystemName("reviewFile");
	int userNo = Integer.parseInt(multipartRequest.getParameter("userNo"));
	

		Map<String,Object> map = new HashMap<>();
		map.put("userNo", loginedUser.getNo());
		map.put("productNo", productNo);
		
		
		OrderDao orderDao = OrderDao.getInstance();
		Order order = orderDao.getNewOrderByMap(map);
		
		Review review = new Review(); 
		review.setOrderNo(order.getNo());
		review.setContent(content);
		review.setStar(starScore);
		review.setReviewImg(filename);
		review.setItemNo(productNo);
		review.setUserNo(userNo);
		
		ReviewDao reviewDao = ReviewDao.getInstance();
		reviewDao.insertReview(review);
		
		
		response.sendRedirect("product_display.jsp?productNo=" + productNo);
%>