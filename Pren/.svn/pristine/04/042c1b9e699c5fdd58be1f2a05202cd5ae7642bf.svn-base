<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="kr.pren.dao.UserDao"%>
<%@page import="kr.pren.vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
		request.setCharacterEncoding("utf-8");

		User loginedUser = (User)session.getAttribute("LOGINED_USER");
		int userNo = loginedUser.getNo();
		
		UserDao userDao = UserDao.getInstance();
		
		String password = request.getParameter("userpwd");
		String changeuserpwd = request.getParameter("changeuserpwd");
		String changeuserpwdconfirm = request.getParameter("changeuserpwdconfirm");
		
		Map<String, Object> userInfoPwd = new HashMap<>();
		userInfoPwd.put("userno", userNo);
		userInfoPwd.put("userpassword", changeuserpwd);
		
		if(loginedUser.getPassword().equals(password)){
			if(changeuserpwd.equals(changeuserpwdconfirm)){
				userDao.updateUserPassword(userInfoPwd);
				session.invalidate();
				response.sendRedirect("../main/index.jsp?successpwd=confirm");
			}else{
				response.sendRedirect("my_info_form.jsp?fail=replay");
			}		
		}else{
			response.sendRedirect("my_info_form.jsp?fail=replay");
		}
		

%>