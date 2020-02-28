<%@page import="kr.pren.util.PathUtil"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.util.StringJoiner"%>
<%@page import="kr.pren.vo.Steam"%>
<%@page import="kr.pren.dao.SteamDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	int productNo = Integer.parseInt(request.getParameter("productNo"));
	int userNo = Integer.parseInt(request.getParameter("userNo"));
	String path = request.getParameter("path");
	path = PathUtil.encodeUrlPath(path);
	
	SteamDao steamDao = SteamDao.getInstance();
	
	Steam steam = new Steam();
	steam.setItemNo(productNo);
	steam.setUserNo(userNo);
	
	steamDao.insertSteam(steam);
	
	response.sendRedirect(path);
%>
