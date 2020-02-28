<%@page import="kr.pren.dao.UserDao"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="kr.pren.vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	User loginedUser = (User)session.getAttribute("LOGINED_USER");
	
	String reviewSaveDirectory = "C:\\projects\\web_workspace\\semiproject\\WebContent\\resources\\images\\user_profile";
	
	
	MultipartRequest multipartRequest = new MultipartRequest(request,
			reviewSaveDirectory,
			1024*1024*10,
			"utf-8");
	
	String filename = multipartRequest.getFilesystemName("userimage");

	User user = new User();
	user.setProfileImgName(filename);
	user.setNo(loginedUser.getNo());
	
	
	UserDao userDao = UserDao.getInstance();
	userDao.updateUserImg(user);
	
	response.sendRedirect("my_info_form.jsp");
%>