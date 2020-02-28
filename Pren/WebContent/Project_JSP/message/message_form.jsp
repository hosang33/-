<%@page import="kr.pren.dao.MessageDao"%>
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
<%@ include file="../../common/nav2.jsp" %>
<%
	int productNo = Integer.parseInt(request.getParameter("productNo"));
%>
<div class="container">
	<div class="row" style="margin-bottom: 800px;">
		<div class="col-sm-2">
					<div class="panel panel-default">
						<div class="panel-body">
							<span style="font-size: 23px;">메시지</span>
						</div>
						<div class="panel-body">
							<a href="message_all.jsp">전체 메시지</a>
						</div>
						<div class="panel-body">
							<a href="message_read.jsp">안 읽은 메시지</a>
						</div>
					
						<div class="panel-body">
							<a href="message_progress.jsp">거래중 메시지</a>
						</div>
					</div>
				</div>
		<div class="col-sm-10">
			<form action="message_send.jsp">
			<input type="hidden" name = "productNo" value="<%=productNo%>"/>
			<input type="hidden" name = "userNo" value="<%=loginedUser.getNo()%>"/>
				<div class="row">
					<h2>작성하기</h2>
				</div>
				<div class="row">
					<textarea rows="30" cols="110" style=" word-break:break-all;" name="contents"></textarea>
				</div>
				<div class="row">
					<div class="col-sm-9"></div>
					<div class="col-sm-1">
						<input type="submit" value="보내기" ></input>
					</div>
					<div class="col-sm-2"></div>
				</div>
			</form>
		</div>
	</div>
</div>
<%@ include file="../../common/footer.jsp"%>
</body>
</html>