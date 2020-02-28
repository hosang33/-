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
<%@ include file="../../common/nav.jsp"%>
<div class="container" style="height: 740px;">
	<form id="notice-confirm" action="notice.jsp" method="post" class="well">
		<h3 class="text-center" style="margin-bottom: 20px;">공지사항</h3>
		
		<div class="form-group">
    		<label  style="font-size: 25px;">제목</label>
    		<input type="text" class="form-control" name="titlename" >
  		</div>
  		<div class="form-group">
    		<label  style="font-size: 25px;">상세내용</label>
    		<textarea class="form-control" rows="10" name="detailcontent"></textarea>
  		</div>
  		<button type="submit" class="btn btn-primary btn-block">등록하기</button>
	</form>
</div>
<%@ include file="../../common/footer.jsp"%>
</body>
</html>