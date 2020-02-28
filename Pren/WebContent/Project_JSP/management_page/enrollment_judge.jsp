<%@page import="kr.pren.dao.UserDao"%>
<%@page import="kr.pren.vo.SubCategory"%>
<%@page import="kr.pren.dao.SubCategoryDao"%>
<%@page import="kr.pren.util.DateUtils"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="kr.pren.vo.SaleItem"%>
<%@page import="kr.pren.dao.SaleItemDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <title>등록 심사</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<body>
	<%@ include file="../../common/management_nav.jsp" %>
<div class="container">
	<div class="row">
		<div class="col-sm-2">
				<div class="panel panel-default">
				<div class="panel-body"><span style="font-size: 23px;">관리자 설정</span></div>
				<div class="panel-body"><a href="sales_inquiry.jsp">매출 조회</a></div>
				<div class="panel-body"><a href="enrollment_judge.jsp">물건 심사</a></div>
				<div class="panel-body"><a href="member_management.jsp">회원 관리</a></div>
			</div>
		</div>
		<%
			SaleItem saleItem = new SaleItem();
			SaleItemDao saleItemDao = SaleItemDao.getInstance();
			List<SaleItem>saleItemState = saleItemDao.getSaleItemsState();
		%>
		<div class="col-sm-10">
			<h3>상품 심사</h3>
			<table class="table">
				<thead>
					<tr>					
						<th>상품번호</th>
						<th>올린 날짜</th>
						<th>제목</th>
						<th>판매자명</th>
						<th>카테고리 분류</th>
						<th>검사결과</th>
						<th></th>
					</tr>
				</thead>
				
				<tbody>
				<%
					for(SaleItem s : saleItemState){
						SubCategoryDao subCategoryDao = SubCategoryDao.getInstance();
						//SubCategory subCategory = new SubCategory();
						SubCategory subName =  subCategoryDao.getSubCategoryByNo(s.getSubCategoryNo());
					if (s.getState().equals("심사대기")) {	
				%>
					
						<tr id="<%=s.getState()%>">
							<td><%=s.getNo() %></td>
							<td><%=DateUtils.dateToString(s.getUploadDate()) %></td>
							<td><a href="../main/product_display.jsp?productNo=<%=s.getNo() %>"><%=s.getTitle()%></a></td>
							<td><%=s.getUser().getName() %></td>						
							<td><%=subName.getName()%></td>
							<td><input type="hidden" name="saleItemNo" value="<%=s.getNo() %>"></td>
							<td>
								<div class="form-group">
									<select name="state" class="form-control" id="state-box-<%=s.getNo() %>">
										<option value="screening" <%=s.getState().equals("screening") ? "selected" : "" %>>심사중</option>
										<option value="fail" <%=s.getState().equals("fail") ? "selected" : "" %>>심사탈락</option>
										<option value="pass" <%=s.getState().equals("pass") ? "selected" : "" %>>심사완료</option>
									</select>
								</div>
							</td>
							<td>					
								<button type="button" class="btn btn-primary" onclick="changeState(<%=s.getNo() %>)">상태변경</button>
							</td>
						</tr>
				<%
					}	
				}
				%>
				</tbody>
			</table>
		</div>
	</div>
</div>
<%@ include file="../../common/footer.jsp" %>
<script type="text/javascript">

// 옵션태그를 선택해서 값을 변경해야 하는데 원하는 데이터만 값을 변경이 가능하도록 select태그에 아이디 값을 주고
// 옆에 있는 상태변경 버튼을 누를시  버튼에 있는 이밴트객체에 있는 값과 같이 주어서 원하는 데이터만 변경이 가능
// location.href 는 현재 접속중인 페이지 정보를 갖고 있다. 또한 값을 변경할 수 있다.
	function changeState(no) {
		var productState = document.getElementById("state-box-" + no).value;
		location.href = "screening_completion.jsp?state=" + productState + "&saleItemNo=" + no;
	}

</script>
</body>
</html>