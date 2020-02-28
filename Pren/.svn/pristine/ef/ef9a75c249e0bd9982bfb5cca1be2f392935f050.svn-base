<%@page import="kr.pren.vo.Order"%>
<%@page import="java.util.List"%>
<%@page import="kr.pren.dao.OrderDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title></title>
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
<body onload="onload()">
	<%@ include file="../../common/nav2.jsp"%>
<%
	OrderDao orderDao = OrderDao.getInstance();
	List<Order> orderList = orderDao.getAllOrderByUserNo(loginedUser.getNo()); // 나중에 수정
	int progress = 0; 
	int done= 0; 
	int cancel= 0; 
	for (Order order : orderList) {
		if ("작업중".equals(order.getState())) {
			progress += 1;
		} else if ("완료".equals(order.getState())) {
			done += 1;
		} else if ("취소".equals(order.getState())) {
			cancel += 1;
		} 
	}
	
%>
	<div class="container">
		<div class="row">
			<div class="col-sm-2">
				<div class="panel panel-default" >
					<div class="panel-body">
						<span style="font-size: 23px;">마이프랜</span>
					</div>
					<div class="panel-body">
						<a href="my_buy.jsp">나의 구매</a>
					</div>
					<div class="panel-body">
						<a href="steam_list.jsp">찜목록</a>
					</div>
				</div>
			</div>
			<div class="col-sm-10" style="border: 1px solid #e0e0eb;">
				<div class="row" style="padding-left: 20px; ">
					<h3>나의 구매</h3>
				</div>
				<div class="row" style=" margin-left: 2px;
    									margin-right: 5px;">
					<table class="table table-bordered table-condensed"
						style="table-layout: fixed; ">
						<colgroup>
							<col width="33%">
							<col width="33%">
							<col width="33%">


						</colgroup>
						<thead>
							<tr>
								<th>작업중</th>
								<th>완료</th>
								<th>취소</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td><%=progress %></td>
								<td><%=done%></td>
								<td><%=cancel%></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
<script type="text/javascript">
	
</script>
		<%@ include file="../../common/footer.jsp"%>
</body>
</html>