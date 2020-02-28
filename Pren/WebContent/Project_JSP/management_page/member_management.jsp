<%@page import="kr.pren.vo.Pagination"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="kr.pren.util.NumberUtils"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="kr.pren.dao.UserDao"%>
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
	<%@ include file="../../common/management_nav.jsp" %>
<div class="container" style="height: 800px;">
	<%
	String sort = request.getParameter("selectmanagement");
	sort = sort == null ? "name" : sort;
	String searchmanagement = request.getParameter("searchmanagement");
	
	UserDao userDao = UserDao.getInstance();
	//잘못된 페이지번호로 접속시 무조건 1번페이지 반환 
	int pageNo = NumberUtils.stringToNumber(request.getParameter("pageno"),1); 
	Map<String, Object> userCount = new HashMap<>();
	userCount.put("sort",sort);
	userCount.put("value",searchmanagement);
	//해당 테이블의 보여줄 전체 행의 번호를 조회
	int totalRows = userDao.countManagement(userCount);
	//map객체 생성 후 조회범위를 put
	Pagination pagination = new Pagination(pageNo, totalRows);	
		
	Map<String, Object> userManagement = new HashMap<>();
	
	userManagement.put("begin",pagination.getBeginIndex());
	userManagement.put("end",pagination.getEndIndex());
	userManagement.put("sort",sort);
	userManagement.put("value",searchmanagement);
	
	List<User> users = userDao.getUserManagementpage(userManagement);
	%>
	<div class="row">
		<div class="col-sm-2">
				<div class="panel panel-default">
				<div class="panel-body"><span style="font-size: 23px;">관리자 설정</span></div>
				<div class="panel-body"><a href="sales_inquiry.jsp">매출 조회</a></div>
				<div class="panel-body"><a href="enrollment_judge.jsp">물건 심사</a></div>
				<div class="panel-body"><a href="member_management.jsp">회원 관리</a></div>
			</div>
		</div>
		<div class="col-sm-10">
			<label>회원 관리</label>
			<form id="management-form" action="member_management.jsp" method="get">
				<input type="hidden" name="pageno" id="page-no" value="<%=pageNo %>" />
				<div class="pull-right" style="margin-bottom:20px;">
					<span>
						<select name="selectmanagement" style="height:32px;">
							<option value="name" <%=sort.equals("name") ? "selected" :"" %>>이름</option>
							<option value="email" <%=sort.equals("email") ? "selected" :"" %>>이메일</option>
						</select>
					</span>
					<input type="text" name="searchmanagement" size="25" style="height:32px;" value="<%=searchmanagement == null ? "" : searchmanagement %>" />
					<button type="submit" class="btn">검색</button>
				</div>
			</form>
			<form action="stop_user_management.jsp">
			<table class="table">
				<thead>
					<tr>
						
						<th>회원번호</th>
						<th>이름</th>
						<th>닉네임</th>
						<th>이메일</th>
						<th>번호</th>
						<th>가입날짜</th>
						<th>탈퇴여부</th>
						<th></th>

					</tr>
				</thead>
				
				<tbody>
				<%
						for(User u:users){
							SimpleDateFormat  format = new SimpleDateFormat("yyyy-MM-dd");
							String formatedDate = format.format(u.getCreateDate());
					%>	
					<tr>
						<td><%=u.getNo() %> </td>
						<td><%=u.getName() %></td>
						<td><%=u.getNickName() %></td>
						<td><%=u.getEmail() %></td>	
						<td><%=u.getPhoneNum() %></td>
						<td><%= formatedDate %></td>						
						<td><%=u.getIsDelete() %></td>	
						<td><button type="submit" class="btn btn-danger btn-xs" name="userNo" value="<%=u.getNo() %>">중지</button></td>					
					</tr>
					<%
						}
					%>
				</tbody>
			</table>
			</form>
		</div>
		<div class="row">
		<div class="col-sm-12 text-center">
			<ul class="pagination">
			
			<li class="<%=pageNo > 1 ? "" : "disabled"%>"><a href="<%=pageNo-1%>" onclick="searchPage(<%=pageNo-1%>, event)" >&laquo;</a></li>
			
			<%
				for (int num =pagination.getBeginPage(); num<=pagination.getEndPage(); num++) {
			%>
				<li class="<%=pageNo == num ? "active" : ""%>"><a href="<%=num%>" onclick="searchPage(<%=num %> , event)" ><%=num%></a></li>
			<%
				}
			%>
			<li class="<%=pageNo < pagination.getTotalPagesCount() ? "" : "disabled"%>"><a href="<%=pageNo+1%>" onclick="searchPage(<%=pageNo+1%>, event)">&raquo;</a></li>
			</ul>
		</div>
	</div>
	</div>
</div>

	<%@ include file="../../common/footer.jsp" %>
<script >
	function searchPage(pageNo, event){
		event.preventDefault();
		document.getElementById("page-no").value = pageNo;
		document.getElementById("management-form").submit();
	}
</script>
</body>
</html>