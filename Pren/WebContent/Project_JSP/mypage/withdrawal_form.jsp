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
	<%@ include file="../../common/nav2.jsp" %>
<div class="container" style="height:740px;">
	<div class="row">
		<div class="col-sm-2">
			<div class="panel panel-default">
				<div class="panel-body"><span style="font-size: 23px;">계정 설정</span></div>
				<div class="panel-body"><a href="my_info_form.jsp">계정</a></div>
				<div class="panel-body"><a href="withdrawal_form.jsp">회원탈퇴</a></div>
			</div>
		</div>
		<div class="col-sm-10">
			<div class="row">
				<form action="withdrawal.jsp">
				<div class="col-sm-12">
					<div class="box-title" style="font-size:23pt;">회원탈퇴</div>
					<div class="form-group">
						<label class="control-label" style="margin-top:20px;">탈퇴사유</label>
						<div class="radio">
							<label><input name="reason" type="radio" value="1" checked />다른 계정이름으로 사용하기 위해</label>
						</div>
						<div class="radio">
							<label><input name="reason" type="radio" value="2"	 />사용빈도가 낮고 개인정보 유출이 우려돼서</label>
						</div>
						<div class="radio">
							<label><input name="reason" type="radio" value="3" />사이트 이용시 장애가 많아서</label>
						</div>
						<div class="radio">
							<label><input name="reason" type="radio" value="4"  />서비스의 질에 대한 불만이 많아서</label>
						</div>
						<div class="radio">
							<label><input name="reason" type="radio" value="5"  />사이트 이용시 고객응대가 나빠서</label>
						</div>
						<div class="radio">
							<label><input name="reason" type="radio" value="6" />기타</label>
						</div>
						<input name="reason_etc" class="form-control">
					</div>
					<div class="form-group">
						<label for="" class="control-label">이메일 확인</label>
						<input name="emailConfirm" id="email" class="form-control" />
					</div>
						<button type="submit" class="btn-pren btn btn-danger btn-block">회원탈퇴</button>
				</div>
				</form>
			</div>
		</div>
	</div>
</div>
	<%@ include file="../../common/footer.jsp" %>
	<script type="text/javascript">
		
	</script>
</body>
</html>