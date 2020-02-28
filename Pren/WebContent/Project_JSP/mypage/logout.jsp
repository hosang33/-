<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	session.invalidate(); //세션을 무효화 시킨다.
	
	response.sendRedirect("../main/index.jsp");
%>