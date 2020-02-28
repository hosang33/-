<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Calendar"%>
<%@page import="kr.pren.util.DateUtils"%>
<%@page import="kr.pren.util.ParameterUtils"%>
<%@page import="kr.pren.util.NumberUtils"%>
<%@page import="java.text.Format"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.HashMap"%>
<%@page import="kr.pren.vo.Order"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="kr.pren.dao.OrderDao"%>
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
<script src="../../resources/js/time_Utils.js"></script>
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
<body >
	<%@ include file="../../common/nav2.jsp"%>
	<%
		OrderDao orderDao = OrderDao.getInstance();
		List<Order> orderList = new ArrayList<Order>();
		Map<String,Object> map = new HashMap<>();
		
		String selectState = "";
		String startDate = "";
		String endDate = "";
		int selectDisplayNum = 0;
		
		
		if(request.getParameter("isdefaultPage")==null) { //초기 페이지라면 
			Date nowDate = new Date();
			Calendar cal = Calendar.getInstance();
			cal.add(Calendar.DATE, -7);
			
			startDate = DateUtils.dateToString(cal.getTime());
			cal.setTime(nowDate);
			cal.add(Calendar.DATE, +1);
			endDate = DateUtils.dateToString(cal.getTime());
			
			map.put("userNo", loginedUser.getNo());
			map.put("selectState", "전체");
			map.put("startDate",startDate);
			map.put("endDate", endDate);
			map.put("selectDisplayNum", 5);
			orderList =  orderDao.getAllOrderBySearchForm(map);
			
		}
		else {
			selectState =request.getParameter("selectState");
			startDate =request.getParameter("startDate");
			endDate = request.getParameter("endDate");
			selectDisplayNum =Integer.parseInt(request.getParameter("selectDisplayNum"));
			
			map.put("userNo", loginedUser.getNo());
			map.put("selectState", selectState);
			map.put("startDate", startDate);
			map.put("endDate", endDate);
			map.put("selectDisplayNum", selectDisplayNum);
			orderList =  orderDao.getAllOrderBySearchForm(map);
		}
		
	%>
	<div class="container">
			<div class="row" style="">
				<div class="col-sm-2">
					<div class="panel panel-default">
						<div class="panel-body">
							<span style="font-size: 23px;">구매관리</span>
						</div>
						<div class="panel-body">
							<a href="buy_management.jsp">구매 관리</a>
						</div>
						<div class="panel-body">
							<a href="buy_history.jsp">결제 내역</a>
						</div>
					</div>
				</div>
				<div class="col-sm-10"
					style="border: 1px solid #e0e0eb; margin-bottom: 800px;">
					<div class="row" style="padding-left: 20px;">
						<h3>결제 내역</h3>
					</div>
					<div class="row">
						<form class="form-inline"  id="buy-history-form" action="buy_history.jsp">
							<input type="hidden" name="isdefaultPage" value="not">
							<div class="form-group">
								<select class="form-control" id="orderSelect"
									style="margin-left: 18px ; margin-right: 8px;" name="selectState"
									onchange="goSubmit()">
									<option <%=selectState.equals("전체")? "selected" :"" %>>전체</option>
									<option <%=selectState.equals("완료")? "selected" :"" %>>완료</option>
									<option <%=selectState.equals("환불")? "selected" :"" %>>환불</option>
								</select>
							</div>
							<div class="form-group">
								<input type="date" id="start-date" style="height: 30px"
									name="startDate" onchange="goSubmit()" value="<%=startDate%>">
							</div>
							<span class="sm-18">~</span>
							<div class="form-group">
								<input type="date" id="end-date" style="height: 30px"
									name="endDate" onchange="goSubmit()" value="<%=endDate%>">
							</div>
							<div class="form-group ">
								<select class="form-control" id="select-count"
									style="margin-right: 7px; margin-left: 7px"
									name="selectDisplayNum" onchange="goSubmit()">
									<option <%=selectDisplayNum==5? "selected" :"" %>>5</option>
									<option <%=selectDisplayNum==10? "selected" :"" %>>10</option>
									<option <%=selectDisplayNum==20? "selected" :"" %>>20</option>
								</select>
							</div>
						</form>
					</div>
					<hr style="margin-top: 10px;margin-bottom: 10px;"/>
					<div class="row" style="margin-left: 2px; margin-right: 5px;">
						<table class="table table-bordered table-condensed"
							style="table-layout: fixed;">
							<colgroup>
								<col width="15%">
								<col width="15%">
								<col width="10%">
								<col width="20%">
								<col width="20%">
								<col width="20%">
							</colgroup>
							<thead>
								<tr>
									<th>주문번호</th>
									<th>상품명</th>
									<th>판매자</th>
									<th>금액</th>
									<th>주문상태</th>
									<th>주문날짜</th>

								</tr>
							</thead>
							<tbody>
								<%
									for (Order list : orderList) {
								%>
								
								<tr>
									<td><%=list.getNo()%></td>
									<td><%=list.getSaleItem().getTitle()%></td>
									<td><%=list.getUser().getNickName()%></td>
									<td><%=list.getTotalPrice()%></td>
									<td><%=list.getState()%></td>
									<td><%=DateUtils.dateToStringPlusTime(list.getCreateDate())%></td>
								</tr>
								<%
									}
								%>

							</tbody>
						</table>
					</div>
				</div>
			</div>
		
	</div>
	<%@ include file="../../common/footer.jsp"%>
</body>
<script type="text/javascript">

	function goSubmit() {
		document.querySelector("#buy-history-form").submit();
		
	}
</script>
</html>