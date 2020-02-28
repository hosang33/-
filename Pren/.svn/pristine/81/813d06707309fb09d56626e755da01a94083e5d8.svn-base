
<%@page import="java.util.StringJoiner"%>
<%@page import="java.util.Iterator"%>
<%@page import="kr.pren.vo.MainCategory"%>
<%@page import="kr.pren.dao.MainCategoryDao"%>
<%@page import="kr.pren.vo.SubCategory"%>
<%@page import="kr.pren.dao.SubCategoryDao"%>
<%@page import="kr.pren.vo.Pagination"%>
<%@page import="kr.pren.util.NumberUtils"%>
<%@page import="kr.pren.dao.OrderDao"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="kr.pren.util.DateUtils"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.pren.vo.Order"%>
<%@page import="java.util.List"%>
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
  <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/chart.js@2.7.3/dist/Chart.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-datalabels@0.7.0"></script>
</head>
<body>
	<%@ include file="../../common/management_nav.jsp" %>
	<%
		OrderDao orderDao = OrderDao.getInstance();
		List <Order> orderList = new ArrayList<Order>();
		Map<String,Object> map = new HashMap<>();
		Pagination pagination = new Pagination();
		
		int pageNo = NumberUtils.stringToNumber(request.getParameter("pageno"),1);
		int selectedCategory = NumberUtils.stringToNumber(request.getParameter("selectedCategory"), 0);
		
		int totalRows = 0;
		String isSolo = "전체";
		String startDate = "";
		String endDate = "";
		
		List<String> propits = orderDao.getProfitByGroup();
		Iterator<String> iterator = propits.iterator();
		
		StringJoiner joiner = new StringJoiner(",");
		while (iterator.hasNext()) {
			joiner.add(iterator.next());
		}


		if(request.getParameter("isDefaultPage") == null) { //초기 페이지라면 
			Date nowDate = new Date();
			Calendar cal = Calendar.getInstance();
			cal.add(Calendar.DATE, -7);
			startDate = DateUtils.dateToString(cal.getTime());
			cal.setTime(nowDate);
			cal.add(Calendar.DATE, +1);
			endDate = DateUtils.dateToString(cal.getTime());
			
			map.put("isSolo", "전체");
			map.put("startDate",startDate);
			map.put("endDate", endDate);
		
			pagination.setPageNo(pageNo);
			totalRows = orderDao.getAllOrderCount(map);
			pagination.setTotalRows(totalRows);
			
			map.put("begin",pagination.getBeginIndex());
			map.put("end",pagination.getEndIndex());
			orderList =  orderDao.getAllOrderManager(map); 
			
		} else {
			
			startDate =request.getParameter("startDate");
			endDate = request.getParameter("endDate");
			isSolo =request.getParameter("isSolo");
			if (selectedCategory != 0) {
				map.put("selectedCategory", selectedCategory);
			}
			map.put("isSolo", isSolo);
			map.put("startDate", startDate);
			map.put("endDate", endDate);
			totalRows = orderDao.getAllOrderCount(map);
			
			pagination.setPageNo(pageNo);
			pagination.setTotalRows(totalRows);			
			map.put("begin",pagination.getBeginIndex());
			map.put("end",pagination.getEndIndex());
			orderList =  orderDao.getAllOrderManager(map);
		 }
	%>
<div class="container">
	<div class="row" style="height: 740px;">
		<div class="col-sm-12">
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
					<label style="margin:25px 0px;">매출 현황</label>
					<div class="row">
						<div class="col-sm-12">
							<form class="form-inline" action="sales_inquiry.jsp">
								<input type="hidden" value="1" name="isDefaultPage">
									<div class="form-group">
										<label>기간   :</label>
										<div class="form-group">
											<input type="date" id="start-date" style="height: 30px" name="startDate"  value="<%=startDate%>">
										</div>
										<span class="sm-18">~</span>
										<div class="form-group">
											<input type="date" id="end-date" style="height: 30px" name="endDate" value="<%=endDate%>">
										</div>
										<div class="form-group">
											<button type="submit" class="btn btn-default">조회</button>
										</div>
									</div>
									<hr />
									<div class="form-group">
										<label>카테고리   :</label>
											<select name="selectedCategory" class="form-control">
												<option value="0" <%=selectedCategory == 0? "selected" : ""%>>전체</option>
											<%
												MainCategoryDao maincategory = MainCategoryDao.getInstance();
												List<MainCategory> mainCateList	=	maincategory.getMainCategory();
												for (MainCategory i : mainCateList) {
											%>
												<option value="<%=i.getNo()%>" <%=selectedCategory == i.getNo()? "selected" : ""%>><%=i.getName()%></option>
											<%
												}
											%>
											</select>
									</div>
									<hr />
									<div class="form-group">
										<label class="form-inline">
										<input type="radio" name="isSolo" value="전체" id="sales-person-select" <%=isSolo.equals("전체")? "checked": "" %> > 전체
										</label>
										<label class="form-inline">
										<input type="radio" name="isSolo" value="y" id="sales-person-select" <%=isSolo.equals("y")? "checked": "" %>> 개인
										</label>
										<label class="form-inline">
										<input type="radio" name="isSolo" value="n" id="sales-company-select" <%=isSolo.equals("n")? "checked": "" %>> 기업
										</label>
									</div>
							</form>
							<hr />
							</div>
						</div>	
						<div class="row" style="margin-left: 2px;  margin-right: 5px; magin-top:30px;">
							<table class="table table-bordered table-condensed" style="table-layout: fixed; ">
							<colgroup>
								<col width="16%">
								<col width="16%">
								<col width="16%">
								<col width="16%">
								<col width="16%">
								<col width="15%">
							</colgroup>
							<thead>
								<tr>
									<th>물품번호</th>
									<th>물품 이름</th>
									<th>가격 </th>
									<th>취소/반품</th>
									<th>카테고리</th>
									<th>개인/회사</th>
								</tr>
							</thead>
							<tbody>
								<% 
									int totalProfit = 0;
									for(Order orders : orderList) {
								%>
								<tr>
									<td><%=orders.getItemNo() %></td>
									<td><%=orders.getSaleItem().getTitle() %></td>
									<td><%=orders.getSaleItem().getPrice() %></td>
									<td><%=orders.getState() %></td>
									<td><%=orders.getSubcategory().getName() %></td>
									<td><%=orders.getSaleItem().getIsSolo() %></td>
									<% totalProfit += orders.getSaleItem().getPrice();%>
								</tr>
								<%
									}
								%>
							</tbody>
						</table>
					</div>	
					<hr />
					<div class="row">
						<div class="col-sm-12" style="margin-bottom:240px;">
							<div class="row">
								<div class="col-sm-6">
									<div style="width:500px"> 
										<canvas id="myChart">
										</canvas>
									</div>
								</div>
								<div class="col-sm-6"> 
								<div class="row" style="height: 200px"></div>
								<div class="row">
									<h3 class="pull-right text-right " style="margin-right:80px;">총 수익(수수료10%) : <strong><%=(int)(totalProfit*0.1) %></strong>원</h3>
									<h4 class="pull-right text-right " style="margin-right:80px;">총 판매액 : <strong><%=totalProfit %></strong>원</h4>
								</div>
									
								</div>
							</div>
						</div>
					</div>			
				</div>
			</div>
		</div>
		<%@ include file="../../common/paging.jsp" %>
	</div>
</div>
	<%@ include file="../../common/footer.jsp" %>
</body>
<script type="text/javascript">
var ctx = document.getElementById("myChart").getContext('2d');
var myDoughnutChart = new Chart(ctx, {
    type: 'doughnut',
		    data: {
		        labels: ["디자인", "마케팅", "IT프로그래밍", "번역/통역", "영상/사진/음악", "문서/작문","상담/컨설팅","레슨","행사/공연","기타"],
		        datasets: [{
		            data: [<%=joiner%>],
		            backgroundColor: ['#EBEDEF', '#D6DBDF', '#AEB6BF', '#85929E', '#5D6D7E','#34495E','#2E4053','#283747','#212F3C','#1B2631'],
		            borderWidth: 0.5 ,
		            borderColor: '#ddd'
		        }]
		    },
    		options: {
    	       
    	        legend: {
    	            display: true,
    	            position: 'left',
    	            labels: {
    	                boxWidth: 20,
    	                fontColor: '#111',
    	                padding: 15
    	            }
    	        },
    	        tooltips: {
    	            enabled: true
    	        },
    	        plugins: {
    	            datalabels: {
    	                color: '#111',
    	                textAlign: 'center',
    	                font: {
    	                    lineHeight: 1.6
    	                },
    	                formatter: function(value, ctx) {
    	                    return ctx.chart.data.labels[ctx.dataIndex] + '\n' + value + '원';
    	                }
    	            }
    	        }
    	    }
});


</script>
</html>