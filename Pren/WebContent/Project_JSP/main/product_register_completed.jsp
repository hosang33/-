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
<div class="container" style="margin-bottom: 300px;">
	<div class="jumbotron" style="margin-top: 170px;">
		<h1>상품등록이  완료되었습니다.</h1>
		<p>상품 심사가 완료되면 자동으로 등록됩니다</p>
		<p>
			<a href="../sell_management/sell_management.jsp" class="btn btn-primary">상품관리 페이지</a>나
			<a href="../mypage/my_info_form.jsp" class="btn btn-primary">개인정보</a>페이지를 방문해보세요.
		</p>
	</div>
</div>
<%@ include file="../../common/footer.jsp"%>
</body>
</html>