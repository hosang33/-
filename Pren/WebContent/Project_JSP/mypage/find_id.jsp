<%@page import="kr.pren.dao.UserDao"%>
<%@page import="kr.pren.vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <title></title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<body>
	<%@ include file="../../common/nav.jsp" %>
<div class="container" style="height:780px;">
	<%
	 	request.setCharacterEncoding("utf-8");
		String username = request.getParameter("username");
		String userphone = request.getParameter("userphone");
		User users = new User();
		users.setName(username);
		users.setPhoneNum(userphone);
		
		
		UserDao userDao = UserDao.getInstance();
		User user = userDao.findUserById(users);
		
		if(user == null){
			response.sendRedirect("find_idpwd.jsp?notid=selectid");
			return;
		}
		
	%>
	
	<div class="row">
		<div class="col-sm-12">
			<div class="row">
				<div class="col-sm-3"></div>
				<div class="col-sm-6" style="margin-top:180px;">				
				<div class="jumbotron">
					<h2>아이디 찾기</h2>
					<br />
					<div>
						<h4>회원님의 아이디는<strong><%=user.getEmail() %></strong>입니다.</h4>
					</div>
				</div>
				<div class="btn-group btn-group-justified" role="group" aria-label="...">
  					<div class="btn-group" role="group">
    					<button onclick="location.href='login_form.jsp'" type="button" class="btn btn-default" onclick="">로그인하기</button>
 					 </div>
 					 <div class="btn-group" role="group">
    					<button  onclick="location.href='find_idpwd.jsp'" type="button" class="btn btn-default">비밀번호찾기</button>
  					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
</div>
	<%@ include file="../../common/footer.jsp" %>

</body>
</html>