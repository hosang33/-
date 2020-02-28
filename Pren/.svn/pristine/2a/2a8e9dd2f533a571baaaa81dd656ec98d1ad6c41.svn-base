<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <title>프랜</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<body>
<%@ include file="../../common/nav.jsp" %>

<div class="container" style="height:790px;">
	<div class="row">
		<div class="col-sm-4 col-sm-offset-4" style="margin-top:50px;">
			<h2>로그인</h2>
	<%
		request.setCharacterEncoding("utf-8");
		String success = request.getParameter("success");
		if("sign".equals(success)){
	%>
		<div class="row">
			<div class="col-sm-12">
				<div class="alert alert-success">
					<strong>회원가입 완료</strong>로그인 해주세요.
				</div>
			</div>
		</div>
	<% 
		}

		String fail = request.getParameter("failid");
		if("errorid".equals(fail)){
	%>
		<div class="row">
			<div class="col-sm-12">
				<div class="alert alert-danger">
					<strong>입력오류</strong>없는 아이디입니다.
				</div>
			</div>
		</div>
	<% 
		}

		String failpwd = request.getParameter("failpwd");
		if("errorpwd".equals(failpwd)){
	%>
		<div class="row">
			<div class="col-sm-12">
				<div class="alert alert-danger">
					<strong>입력오류</strong>없는 비밀번호입니다.
				</div>
			</div>
		</div>
	<% 
		}
			
		String path = request.getParameter("path");

	%>

			<form action="login.jsp" method="post">
				<%
					if (path != null) {
				%>
				<input type="hidden" name="path" value="<%=path%>">
				<%
					}
				%>
				<div class="form-group">
					<input type="text" class="form-control" name="useremail" placeholder="아이디를 입력해주세요."/>
				</div>
				<div class="form-group">
					<input type="password" class="form-control" name="userpwd" placeholder="비밀번호를 입력해주세요."/>
				</div>
				<div class="form-group">
					<button type="submit" class="btn btn-default form-control">로그인</button>
				</div>
			</form>	
			
			<div class="findidpwd">
				<span class="pull-left"><a href="find_idpwd.jsp">아이디 /비밀번호찾기</a></span>
				<span class="pull-right"><a href="register_form.jsp">회원가입</a></span>
			</div>

		</div>
	</div>
</div>

	<%@ include file="../../common/footer.jsp" %>
</body>
</html>