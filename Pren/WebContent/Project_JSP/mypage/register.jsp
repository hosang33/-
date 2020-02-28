<%@page import="kr.pren.dao.UserDao"%>
<%@page import="kr.pren.vo.User"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	request.setCharacterEncoding("utf-8");

	String email = request.getParameter("useremail");
	String pwd = request.getParameter("userpwd");
	String pwdconfirm = request.getParameter("userpwdconfirm");
	String question = request.getParameter("question");
	String questionConfirm = request.getParameter("questionconfirm");
	String name = request.getParameter("username");
	String phone = request.getParameter("userphone");
	
	
	int idx = email.indexOf("@");
	
	String nickName = email.substring(0, idx);
	
	
	User user = new User();
	
	user.setEmail(email);
	user.setPassword(pwd);
	user.setQuizQuestion(question);
	user.setQuizAnswer(questionConfirm);
	user.setName(name);
	user.setPhoneNum(phone);
	user.setNickName(nickName);
	
	if(!pwd.equals(pwdconfirm)){
		response.sendRedirect("register_form.jsp?fail_pwd=pwd");
		return;
	}
	
	UserDao userDao = UserDao.getInstance();
	User sameUser  = userDao.getUserById(user.getEmail());
	
	if(sameUser != null){
		response.sendRedirect("register_form.jsp?fail_id=dup");
		return;
	}
	
	userDao.insertUser(user);
	
	response.sendRedirect("login_form.jsp?success=sign");
	
%>