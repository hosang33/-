<%@page import="java.text.SimpleDateFormat"%>
<%@page import="kr.pren.vo.Notice"%>
<%@page import="kr.pren.dao.NoticeDao"%>
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
	<%
		int noticeNo = Integer.parseInt(request.getParameter("noticeNo"));
	
		NoticeDao noticeDao = NoticeDao.getInstance();
		
		noticeDao.updateTotalView(noticeNo);
		Notice notice = noticeDao.getNoticeByNo(noticeNo);

	%>
	<div class="container" style="height:800px;">
	<form action="delete_notice.jsp" id="noticesel">
		<h3 style="margin-bottom: 20px;">공지사항</h3>
	<ul class="list-group" >
		<li class="list-group-item">
			<input type="hidden" value="<%=noticeNo %>" name="noticeNo"/>
			<h4 class="list-group-item-heading" style="margin-top: 15px;"><%=notice.getTitle() %><a href="notice_center.jsp"><span class="pull-right" style="margin-right: 20px;">뒤로</span></a></h4>
			<hr/>
			<p class="list-group-item-text" name="noticeContents" value="<%=notice.getContent() %>" >
				<%=notice.getContent() %>
			</p>
				<input type="hidden" value="<%=notice.getContent() %>" name="noticeContents"/>
			<p>
				<%
				SimpleDateFormat  format = new SimpleDateFormat("yyyy-MM-dd / HH:mm");
				String formatedDate = format.format(notice.getDate());
				%>
				<span class="pull-right"><%=formatedDate %></span>
			</p>
		</li>
	</ul>
				<%
				 if(loginedUser != null && loginedUser.getNo()==41){
				%>
				<button type="button" class="btn btn-danger pull-right" id="nochk1" onclick="noticechk1()">삭제하기</button>
				<button type="button" class="btn btn-primary pull-right" id="nochk2" onclick="noticechk2()">수정하기</button>
				<%
				 }
				%>
			</form>
	</div>
	<%@ include file="../../common/footer.jsp"%>
	<script type="text/javascript">
		function noticechk1(){
			var chk1 = document.getElementById("nochk1");
			var form1 = document.getElementById("noticesel")
			form1.action = "delete_notice.jsp";
			form1.submit();
		}
		var dab;
		function noticechk2(){
			var chk2 = document.getElementById("nochk1");
			var form2 = document.getElementById("noticesel")
			form2.action = "update_notice.jsp";
			form2.submit();
		}
	</script>
</body>
</html>