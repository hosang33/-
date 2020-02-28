<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Random"%>
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
	
		String email = request.getParameter("useremail");
		String question = request.getParameter("question");
		String questionconfirm = request.getParameter("questionconfirm");
		User users = new User();
		users.setEmail(email);
		users.setQuizQuestion(question);
		users.setQuizAnswer(questionconfirm);
		
		
		UserDao userDao = UserDao.getInstance();
		User user = userDao.findUserByPwd(users);
		
		if(user == null){
			response.sendRedirect("find_idpwd.jsp?notpwd=selectpwd");
			return;
		}
		
		int no = user.getNo();
		
		Random rnd =new Random();

		StringBuffer buf =new StringBuffer();
		
		
		for(int i=0;i<7;i++){
		    if(rnd.nextBoolean()){
		        buf.append((char)((int)(rnd.nextInt(26))+97));
		    }else{
		        buf.append((rnd.nextInt(10)));
		    }
		}
		
		String buff = buf.toString();
		Map<String, Object> randompwd = new HashMap<>();
		randompwd.put("pwd",buff);
		randompwd.put("value",no);
			
		userDao.updatepwd(randompwd);
		
		
	%>
	
	<div class="row">
		<div class="col-sm-12">
			<div class="row">
				<div class="col-sm-3"></div>
				<div class="col-sm-6" style="margin-top:180px;">				
				<div class="jumbotron">
					<h2>비밀번호 찾기</h2>
					<br />
					<div class="">
						<h4>회원님의 임시 비밀번호는<strong><%=buff %></strong>입니다.</h4>
					</div>
				</div>
				<div class="btn-group btn-group-justified" role="group" aria-label="...">
  					<div class="btn-group" role="group">
    					<button onclick="location.href='login_form.jsp'" type="button" class="btn btn-default" onclick="">로그인하기</button>
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