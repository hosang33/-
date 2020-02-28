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

		<div class="container" style="height:795px;">
			<div class="row"  style="height:300px;">
				<div class="col-sm-4 col-sm-offset-4">
					<form action="find_id.jsp" method="post">
					<h3>아이디/비밀번호 찾기</h3>
						<%
							String fail_id = request.getParameter("notid");
							if("selectid".equals(fail_id)){
						%>
							<div class="row">
								<div class="col-sm-12">
									<div class="alert alert-danger">
										<strong>Problem</strong> 아이디가 존재하지 않습니다.
									</div>
								</div>
							</div>
						<% 
							}
						%>
						<%
							String fail_pwd = request.getParameter("notpwd");
							if("selectpwd".equals(fail_pwd)){
						%>
							<div class="row">
								<div class="col-sm-12">
									<div class="alert alert-danger">
										<strong>Problem</strong> 잘못된 입력입니다.
									</div>
								</div>
							</div>
						<% 
							}
						%>
					<div class="panel panel-default">
						<div class="panel-heading">아이디찾기</div>
						<div class="panel-body">
							<div class="form-group">
								<input type="text" class="form-control" name="username" id="user-name" placeholder="이름을 입력해주세요."/>							
							</div>
							<div class="form-group">
								<input type="text" class="form-control" name="userphone" id="user-phone" placeholder="번호를 입력해주세요."/>
							</div>
							<div class="form-group">
								<button type="submit" class="btn btn-default btn-block">아이디 찾기</button>
							</div>
						</div>
					</div>
					</form>
					<form action="find_pwd.jsp" method="post">
					<div class="panel panel-default">
						<div class="panel-heading">비밀번호 찾기</div>
						<div class="panel-body">
							<div class="form-group">
								<input type="text" class="form-control" name="useremail" placeholder="아이디를 입력해주세요."/>							
							</div>
							<div class="form-group">
							<select name="question" class="form-control">
								<option value="treasure">나의 보물 1호?</option>
								<option value="parents">부모님 이름은?</option>
							</select>  
							</div>
							<div class="form-group">
								<input type="text" class="form-control" name="questionconfirm" placeholder="질문에 답해주세요."/>							
							</div>
							<div class="form-group">
								<button type="submit" class="btn btn-default btn-block">비밀번호 찾기</button>
							</div>
						</div>
					</div>
					</form>
				</div>
			</div>
		</div>

<%@ include file="../../common/footer.jsp" %>
</body>
</html>