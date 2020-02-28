<%@page import="java.text.SimpleDateFormat"%>
<%@page import="kr.pren.dao.UserDao"%>
<%@page import="kr.pren.vo.Pagination"%>
<%@page import="kr.pren.util.NumberUtils"%>
<%@page import="kr.pren.vo.Message"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="kr.pren.dao.MessageDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>프랜</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<style type="text/css">
th, td {
	text-align: center;
}

td {
	overflow: hidden;
	text-overflow;
	ellipsis;
}
</style>
</head>
<body>
<%@ include file="../../common/nav2.jsp"%>
<%
	
	MessageDao messageDao = MessageDao.getInstance();
	Map<String, Object> map = new HashMap<>();

	//잘못된 페이지번호로 접속시 무조건 1번페이지 반환 
	int pageNo = NumberUtils.stringToNumber(request.getParameter("pageno"),1); 
	//해당 테이블의 보여줄 전체 행의 번호를 조회
	int totalRows = messageDao.getMessageCount(loginedUser.getNo());
	//map객체 생성 후 조회범위를 put
	Pagination pagination = new Pagination(pageNo, totalRows);
	
	//맵에 시작값과 끝값을 넣고 유저번호를 넣음
	map.put("begin",pagination.getBeginIndex());
	map.put("end",pagination.getEndIndex());
	map.put("userNo",loginedUser.getNo());
	map.put("state","안읽음");
	List<Message> messages = messageDao.getAllMessage(map);
	
%> 

	<div class="container">
		<div class="row" style=" margin-bottom: 800px;">
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
			<div class="col-sm-10" style="border: 1px solid #e0e0eb;">
				<h3>안 읽은 메세지</h3>
			
				<table class="table table-striped table-bordered"
					style="table-layout: fixed;">
					<colgroup>
						<col width="10%">
						<col width="40%">
						<col width="25%">
						<col width="25%">
					</colgroup>
					<thead>
						<tr>
							<th>보낸사람</th>
							<th>내용 미리보기</th>
							<th>전송일</th>
							<th>읽음</th>
						</tr>
					</thead>
					<tbody>
					<% 
					if(messages.isEmpty()) {
					%>
					<div class="row" style="font-weight: bold; text-align: center; height: 147px; font-size: 50px;">
						<span>메시지가 존재하지 않습니다.</span>
					</div>
					<% 
					
					} else {
					
						for(Message i : messages) {
						UserDao userDao = UserDao.getInstance();
						User findUser =  userDao.getUserByNo(i.getSendUserNo());
						//날짜변환/2
						SimpleDateFormat  format = new SimpleDateFormat("yyyy-MM-dd / HH:mm");
						String formatedDate = format.format(i.getSendDate());
					%>
						<tr>
							<td><%=findUser.getName()%></td>
							<td onclick="location.href='message_detail.jsp?msgNo=<%=i.getNo()%>&msgState=<%=i.getSellState()%>'"><%=i.getContent() %></td>
							<td><%=formatedDate %></td>
							<td><%=i.getIsRead() =="y" ? "읽음" : "읽지않음" %></td>
						</tr>
					<%
							}
						}
					%>
						
					</tbody>
				</table>
			</div>
				<%@ include file="../../common/paging.jsp" %>
		</div>
		
	</div>
		
		<%@ include file="../../common/footer.jsp"%>
</body>
</html>