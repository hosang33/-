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
	Notice notice = noticeDao.getNoticeByNo(noticeNo);
	
%>

<div class="container" style="height: 740px;">
	<form id="selectNotice" action="notice_update_confirm.jsp" method="post" >
	<input type="hidden" name="noticeNo" value="<%=notice.getNo() %>" /> 
		<h3 class="text-center" style="margin-bottom: 20px;">공지사항</h3>
		
		<div class="form-group">
    		<label  style="font-size: 25px;">제목</label>
    		<input type="text" class="form-control" name="noticeTitle" value="<%=notice.getTitle() %>" />
  		</div>
  		<div class="form-group">
    		<label  style="font-size: 25px;">상세내용</label>
    		<textarea class="form-control" rows="10" name="noticeContent"><%=notice.getContent() %></textarea>
  		</div>
  		<button type="button" class="btn btn-success btn-block" onclick="update()" id="update_notice">수정하기</button>
  		<button type="button" class="btn btn-success btn-block" onclick="backNotice()" id="back_notice">목록으로</button>
	</form>
</div>
<%@ include file="../../common/footer.jsp"%>
<script	type="text/javascript">
	function update(){
		 var change1 = document.getElementById("selectNotice");
		 change1.action="notice_update_confirm.jsp";
		 change1.submit();
	}
	function backNotice(){
		 var change2 = document.getElementById("selectNotice");
		 change2.action="notice_center.jsp";
		 change2.submit();
	}
</script>
</body>
</html>