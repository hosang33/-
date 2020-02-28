<%@page import="kr.pren.util.PathUtil"%>
<%@page import="java.util.StringJoiner"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="kr.pren.vo.User"%>
<%@page import="kr.pren.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	request.setCharacterEncoding("utf-8");

	String email = request.getParameter("useremail");
	String password = request.getParameter("userpwd");
	String path = request.getParameter("path");
	
	if (path != null) {
		if(path.contains("null")){
		 path = "../main/index.jsp";
		}
		path = PathUtil.encodeUrlPath(path);	
	} else {
		path = "../main/index.jsp";
	}
	
	UserDao userDao = UserDao.getInstance();
	User user = userDao.getUserById(email);
	
	if(user == null){
		response.sendRedirect("login_form.jsp?failid=errorid&path=" + path);
		return;
	}
	
	if(user.getEmail() == null){
		response.sendRedirect("login_form.jsp?failid=errorid&path=" + path);
		return;
	}
	
	if(!user.getPassword().equals(password)){
		response.sendRedirect("login_form.jsp?failpwd=errorpwd&path=" + path);
		return;
	}
	
	
	session.setAttribute("LOGINED_USER", user);


	if(user.getIsDelete().equals("y")){
		session.invalidate();
		response.sendRedirect("../main/index.jsp?delete=id");
		return;
	}
	
	
	if(user.getEmail().equals("admin@naver.com")){
		response.sendRedirect("/semiproject/Project_JSP/management_page/member_management.jsp");
		return;
	}
	
	
	if("../semiproject/Project_JSP/mypage/register_form.jsp".equals(path)){
		response.sendRedirect("/semiproject/Project_JSP/main/index.jsp");	
		return;
	}

	if("/semiproject/Project_JSP/mypage/register_form.jsp".equals(path)){
		response.sendRedirect("/semiproject/Project_JSP/main/index.jsp");	
		return;
	}
	
		
	if(path.contains("fail") ){
		response.sendRedirect("../main/index.jsp");
	}else{
		response.sendRedirect(path);	
	}
	
		
		
	
%>