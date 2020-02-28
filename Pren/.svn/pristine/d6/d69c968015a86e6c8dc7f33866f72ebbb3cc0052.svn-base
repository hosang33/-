<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="kr.pren.vo.Pagination"%>
<%@page import="kr.pren.dao.MessageDao"%>
<%@page import="kr.pren.util.NumberUtils"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="kr.pren.vo.Notice"%>
<%@page import="kr.pren.dao.NoticeDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<title>목록</title>
<style type="text/css">
  	.dropdown:hover .dropdown-menu {
    display: block;
    margin-top: 0;
	}
	.dropdown-toggle::after {
    display:none;
	}
	.dropdown-menu::before, 
	.dropdown-menu::after {
    border: none;
    content: none;
	}
	.red, .red a {

  	color: red;
	}
	
  	
</style>
</head>
<body>
<%
	 
%>
<%@ include file="../../common/nav3.jsp" %>
<div class="container" style="height: 740px;">
	<div class="page-header">
		<h1>공지사항 리스트</h1>
	</div>
	
<%
	NoticeDao noticeDao = NoticeDao.getInstance();
	

	//잘못된 페이지번호로 접속시 무조건 1번페이지 반환 
	int pageNo = NumberUtils.stringToNumber(request.getParameter("pageno"),1); 
	//해당 테이블의 보여줄 전체 행의 번호를 조회
	int totalRows = noticeDao.countNotice();
	//map객체 생성 후 조회범위를 put
	Pagination pagination = new Pagination(pageNo, totalRows);
	//추천순 등록순
	String sort = request.getParameter("sort") == null ? "date" : request.getParameter("sort");

	Map<String, Object> map = new HashMap<>();
	
	map.put("begin",pagination.getBeginIndex());
	map.put("end",pagination.getEndIndex());
	map.put("sort", sort);
	//List<Notice> notices = noticeDao.pageNotice(map);
	List<Notice> notices = noticeDao.selectSeeorDateNotice(map);
	

%>
	<div class="row">
		<div class="col-xs-12">
		<form action="notice_center.jsp" method="get" id="form-sort">
			<div class="form-group pull-right" style="height: 30px; width:150px;">
				<select class="form-control" name="sort" id="sort" onchange="changeSortNotice()">
					<option value="date" <%=sort.equals("date")? "selected" : "" %>>등록순</option>				
					<option value="like" <%=sort.equals("like")? "selected" : "" %>>추천순</option>		
				</select>
			</div>
		</form>
		<form>
			<table class="table">
				<colgroup>
					<col width="20%"/>
					<col width="50%"/>
					<col width="20%"/>
					<col width="10%"/>
				</colgroup>
				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>등록일</th>
						<th>조회수</th>
					</tr>
				</thead>
				<tbody>
				<%
					for(Notice notice:notices){
					SimpleDateFormat  format = new SimpleDateFormat("yyyy-MM-dd / HH:mm");
					String formatedDate = format.format(notice.getDate());
				%>
					<tr>
						<td><%=notice.getNo() %></td>
						<td><a href="notice_detail.jsp?noticeNo=<%=notice.getNo() %>" id="noticeTotalView"><%=notice.getTitle() %></a></td>
						<td id="noticedate"><%=formatedDate %></td>
						<td id="noticeTotalView"><%=notice.getTotalView() %></td>
					</tr>	
				<%
					}
				%>		
				
				</tbody>
			</table>
			</form>
			<div class="row">
		<div class="col-sm-12 text-center">
			<ul class="pagination">
			
			<li class="<%=pageNo > 1 ? "" : "disabled"%>"><a href="notice_center.jsp?pageno=<%=pageNo-1%>&sort=<%=sort %>">&laquo;</a></li>
			
			<%
				for (int num =pagination.getBeginPage(); num<=pagination.getEndPage(); num++) {
			%>
				<li class="<%=pageNo == num ? "active" : ""%>"><a href="notice_center.jsp?pageno=<%=num%>&sort=<%=sort %>"><%=num%></a></li>
			<%
				}
			%>
			<li class="<%=pageNo < pagination.getTotalPagesCount() ? "" : "disabled"%>"><a href="notice_center.jsp?pageno=<%=pageNo+1%>&sort=<%=sort %>">&raquo;</a></li>
			</ul>
		</div>
	</div>
		</div>
	</div>

	<div class="row">
		<div class="col-xs-12">
  
	<%
		 if(loginedUser != null && loginedUser.getNo()==41){
	%>
			<a href="notice_form.jsp" class="btn btn-primary pull-right">새 글쓰기</a>
	<%
		 }
	%>
		
		</div>
		
	</div>
	
	
	
</div>

<%@ include file="../../common/footer.jsp"%>

<script type="text/javascript">
	function changeSortNotice() {
		
		document.getElementById("form-sort").submit();
	}
	
	
	
</script>
</body>
</html>