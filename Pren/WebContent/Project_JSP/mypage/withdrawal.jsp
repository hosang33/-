<%@page import="kr.pren.vo.User"%>
<%@page import="kr.pren.dao.UserDao"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 	
	request.setCharacterEncoding("utf-8");
	
	User loginedUser = (User)session.getAttribute("LOGINED_USER");

	String reason = request.getParameter("reason");
	String reason_etc = request.getParameter("reason_etc");
	String emailConfirm = request.getParameter("emailConfirm");

	if(!loginedUser.getEmail().equals(emailConfirm)){
		response.sendRedirect("withdrawal_form.jsp");
		return;
	}
	
	Map<String, Object> dropEmail = new HashMap<>();
	dropEmail.put("deleteSelect",reason);
	dropEmail.put("deleteReason",reason_etc);
	dropEmail.put("userEmail",emailConfirm);
	
	UserDao userDao = UserDao.getInstance();
	userDao.dropOutUser(dropEmail);

	session.invalidate();
	
	
	response.sendRedirect("../main/index.jsp");
%>