<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	Cookie[] cookies = request.getCookies();
	for (int i=0; i<cookies.length; i++) {
		String str = cookies[i].getName();
		if(str.equals("recent")) {
			cookies[i].setMaxAge(0);
			response.addCookie(cookies[i]);
		}
	}
%>

