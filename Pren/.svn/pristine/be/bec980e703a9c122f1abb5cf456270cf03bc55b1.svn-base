<%@page import="kr.pren.vo.Option"%>
<%@page import="kr.pren.dao.OptionDao"%>
<%@page import="kr.pren.util.DateUtils"%>
<%@page import="kr.pren.vo.Order"%>
<%@page import="java.util.List"%>
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
	

	OrderDao orderDao = OrderDao.getInstance();
	OptionDao optionDao = OptionDao.getInstance();
	List<Order> orderList =	orderDao.getAllOrderBySellerUserNo(loginedUser.getNo());
%>
	<div class="container">
		<div class="row">
			<div class="col-sm-2">
				<div class="panel panel-default">
					<div class="panel-body"><span style="font-size: 23px;">상품관리</span></div>
					<div class="panel-body"><a href="sell_management.jsp">상품관리</a></div>
					<div class="panel-body"><a href="add_item_form.jsp">상품등록</a></div>
					<div class="panel-body"><a href="buy_request_list.jsp">판매현황</a></div>
				</div>
			</div>
			<div class="col-sm-10" style="border: 1px solid #e0e0eb ; margin-bottom: 800px">
				<div class="row" style="padding-left: 20px; ">
					<h3>구매 관리</h3>
				</div>
				<div class="row form-group">
					<div class="col-sm-12 btn-group btn-group-justified">
						<div class="btn-group">
							<button type="button" class="btn btn-default" onclick="changeDisplay('전체')" name="displayAll">전체</button>
						</div>
						<div class="btn-group">
							<button type="button" class="btn btn-default" onclick="changeDisplay('대기중')" name="displayProgress">대기중</button>
						</div>
						<div class="btn-group">
							<button type="button" class="btn btn-default" onclick="changeDisplay('작업중')" name="displayProgress">작업중</button>
						</div>
						<div class="btn-group">
							<button type="button" class="btn btn-default" onclick="changeDisplay('작업완료')" name="displayDone">작업완료</button>
						</div>
						<div class="btn-group">
							<button type="button" class="btn btn-default" onclick="changeDisplay('완료')" name="displayDone">완료</button>
						</div>
						<div class="btn-group">
							<button type="button" class="btn btn-default" onclick="changeDisplay('환불')" name="displayRefund">환불</button>
						</div>
					</div>
						
					
				</div>
				<div class="row" style=" margin-left: 2px;
    									margin-right: 5px;">
					<table class="table table-bordered table-condensed"
						style="table-layout: fixed; ">
						<colgroup>
							<col width="10%">
							<col width="10%">
							<col width="10%">
							<col width="10%">
							<col width="10%">
							<col width="10%">
							<col width="10%">
							<col width="10%">
							<col width="10%">
						</colgroup>
						<thead>
							<tr>
								<th>주문번호</th>
								<th>상품명</th>
								<th>구매자</th>
								<th>금액</th>
								<th>주문상태</th>
								<th>주문날짜</th>
								<th>접수날짜</th>
								<th>요청보기</th>
								<th>작업수행</th>
								<th>작업완료</th>
							</tr>
						</thead>
						<tbody>
							<%
								for (Order orderlist : orderList) {
									List<Option> findOptionList =	optionDao.getAllOptionByOrderNo(orderlist.getNo());
							%>
							<tr id="row-<%=orderlist.getNo()%>">
								<td><%=orderlist.getNo() %></td>
								<td><%=orderlist.getSaleItem().getTitle() %></td>
								<td><%=orderlist.getUser().getNickName() %></td>
								<td><%=orderlist.getTotalPrice() %></td>
								<td id="tdState-<%=orderlist.getNo()%>"><%=orderlist.getState() %></td>
								<td><%=DateUtils.dateToStringPlusTime(orderlist.getCreateDate()) %></td>
								<td><%=DateUtils.dateToStringPlusTime(orderlist.getCompleateDate()) %></td>	
								<td>
									<button type="button" class="btn btn-default " 
											data-container="body" data-toggle="popover" data-placement="left"
											data-content=
															"
															&lt;<strong>구매자 요청 메세지</strong>> <br/> <%=orderlist.getSheet() %><br />
															<%
																for (Option i : findOptionList) {
															%>
																<strong><%=i.getTitle()%></strong> : <%=i.getPrice() %><br />
															<%
																}
															%>												
															"
									> 
											
											요청보기
  									</button>
								</td>					
								<td>	
									<button type="button" class="btn btn-primary btn-xs" id="change-refund"
									 <%=orderlist.getState().equals("대기중")? "":"disabled" %>
									 onclick="changeRefund(<%= orderlist.getNo()%>,'작업중')">작업수행</button>
								</td>
								<td>
									<button type="button" class="btn btn-primary btn-xs " id="change-refund"
									 <%=orderlist.getState().equals("작업중")? "":"disabled" %>
									 onclick="changeRefund(<%= orderlist.getNo()%>,'작업완료')">작업완료</button>
								</td>
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
<script type="text/javascript">
	function changeDisplay(selectedStatus) {
		
		var tds = document.querySelectorAll("[id^='tdState']");
		for (var i = 0; i<tds.length; i++) {			
			var td = tds[i];
			var orderNo = td.getAttribute("id").replace("tdState-", "");
			
			if (selectedStatus == "전체") {
				document.getElementById("row-" + orderNo).style.display = "";						
			} else {
				var status = td.textContent;
				if (selectedStatus == status) {
					document.getElementById("row-" + orderNo).style.display = "";		
				} else {
					document.getElementById("row-" + orderNo).style.display = 'none';						
				}
			}
		}
	}
	
	function changeRefund(getOrderNo,value) {
		location.href = "../buy_management/buy_changeState.jsp?whereReturnPage=buyRequestListP&getOrderNo=" + getOrderNo +"&value=" + value  
	}
	
	$(document).ready(function(){
	    $('[data-toggle="popover"]').popover({html:true});   
	});
</script>
		<%@ include file="../../common/footer.jsp"%>
</body>
</html>