<%@page import="kr.pren.vo.Message"%>
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
	
	//메세지 읽음으로 변경
	int msgNo = Integer.parseInt(request.getParameter("msgNo"));
	MessageDao messageDao = MessageDao.getInstance();
	Message findMsg = messageDao.getMessageByNo(msgNo);
	
	//로그인한 유저가 아니라면 메인으로 팅겨내기
	if (loginedUser.getNo()!=findMsg.getReceiveUserNo() && loginedUser.getNo()!=findMsg.getSendUserNo()) {
		response.sendRedirect("../main/index.jsp");
	}	
	//로그인한 유저가 메세지를 받는 유저와 같다면 읽음으로 처리 
	if(loginedUser.getNo() ==findMsg.getReceiveUserNo()) {
		messageDao.updateMessageStateByNo(msgNo);
	} 
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
							<a href="message_mysend.jsp">보낸 메시지</a>
						</div>
						
						<div class="panel-body">
							<a href="message_progress.jsp">거래중 메시지</a>
						</div>
					</div>
				</div>
		<div class="col-sm-10">
			<div class="row">
				<h2>내용</h2>
			</div>
			<div class="row">
				<textarea rows="30" cols="110" style=" word-break:break-all;" readonly="readonly"><%=findMsg.getContent() %></textarea>
			</div>
			<div class="row">
			<div class="col-sm-9"></div>
			<div class="col-sm-1">
				<input type="button" value="답변하기" style="display: <%=loginedUser.getNo()==findMsg.getSendUserNo()? "none" : "block"  %>" onclick="location.href='message_resend_form.jsp?receiveUserNo=<%=findMsg.getSendUserNo()%>&msgState=<%=findMsg.getSellState()%>'"></input>
			</div>
			<div class="col-sm-2"></div>
			</div>
		</div>
	</div>
</div>
<%@ include file="../../common/footer.jsp"%>
</body>
</html>