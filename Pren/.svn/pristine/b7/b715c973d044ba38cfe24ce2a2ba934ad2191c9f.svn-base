<%@page import="kr.pren.util.CookieUtils"%>
<%@page import="kr.pren.vo.Review"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="kr.pren.dao.UserDao"%>
<%@page import="kr.pren.util.NumberUtils"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="kr.pren.vo.SaleItem"%>
<%@page import="kr.pren.dao.SaleItemDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  	<title>프랜</title>
  	<meta charset="utf-8">
  	<meta name="viewport" content="width=device-width, initial-scale=1">
  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
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
<%@ include file="../../common/nav3.jsp" %>


 		<%
 			// 메인카테고리 번호 조회
 			int mainCateNo = Integer.parseInt(request.getParameter("maincategory"));
 			// 서브카테고리 번호 조회
 			int subCateNo = NumberUtils.stringToNumber(request.getParameter("subcategory"), 0);
 			// 정렬방식 조회
 			String sort = request.getParameter("sort") == null ? "date" : request.getParameter("sort");
 			
 			
		 	// 해당 메인카테고리의 서브카테고리 목록조회
 			MainCategory mainCate = mainDao.getMainCategoryByNo(mainCateNo);
 			List<SubCategory> subList =  subDao.getSubCategoryByMainNo(mainCateNo);
 			
 			
 			Map<String, Object> map = new HashMap<String, Object>();
 			map.put("main", mainCateNo);
 			if (subCateNo != 0) {
	 			map.put("sub", subCateNo);
 			} 
 			map.put("sort", sort);
 			
 			if (loginedUser != null) {
	 			map.put("userNo", loginedUser.getNo());
 				System.out.println("사용자번호: " + loginedUser.getNo());
 			}
 			 
 			SaleItemDao saleItemDao = SaleItemDao.getInstance();
 			System.out.println(map);
 			List<SaleItem> salesItems = saleItemDao.getSaleItemOrderByLike(map);
 			
 			// 쿠키 조회하기
 			Cookie[] cookies = request.getCookies();
 				
	 		String recentProductNo = CookieUtils.getCookieValue(cookies, "recent");
	 		String[] productNos = null;
	 		
	 		if (recentProductNo != null) {
	 			productNos = recentProductNo.split(":");
	 		}
 		%>

<body>
<div class="container" style="width: 100%;">

	<hr/>
	<div class="dropdown" style="text-align: right;">
  		<button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown" style="cursor: pointer; border-radius: 10px; font-weight: bold;">최근 본 상품
  			<span class="caret"></span>
  		</button>
  		<ul class="dropdown-menu dropdown-menu-right">
  		<%
  			if (productNos == null) {
  		%>
  			<li>최근 본 상품이 없습니다.</li>
  		<%
  			} else {
  				for(String str : productNos) {
  				System.out.println(str + "------------------------------------------");
  				SaleItem saleItem = saleItemDao.getSaleItemByNo(NumberUtils.stringToNumber(str));
  			
  			
  		%>
  			<li>
  					<%
  						if(saleItem != null) {
  					%>
  				<a href="product_display.jsp?productNo=<%=saleItem.getNo()%>">
  					<div style="display: inline-block; float: left;">
  						<img alt="최근본사진" src="../../resources/images/item_logo/<%=saleItem.getLogoName() !=null ? saleItem.getLogoName() : "productImg.jpg"%>" style="width: 111px; height: 75px; display: inline-block; float: left;">
  						
  					</div>
					<div style="display: inline-block; float: right; margin-left: 20px;">
							<h4 style="margin-left: 5px;"><%=saleItem.getTitle() %></h4>
						<p>
							<strong class="text-danger pull-right" style="font-size: 30px;"><%=NumberUtils.numberWithComma(saleItem.getPrice()) %>원</strong>
						</p>
					</div>
  				</a>
					<%
  						}
					%>					
  			
  			</li>
  		<%
  				}
  			}
  		%>
 		</ul>
	</div>
	<div class="row" style="height: 10px;">
		<form class="form-inline" style="text-align: right;" action="category_display.jsp" method="get"  id="form-sort">
			<div class="form-group">
				<input type="text" class="hidden" name="maincategory" value="<%=mainCateNo %>">
				<input type="text" class="hidden" name="subcategory" value="<%=subCateNo %>">
				<select class="form-control" name="sort" id="sort" onchange="changeSortSaleItems()" style="margin-right: 200px;">
					<option value="date" <%=sort.equals("date") ? "selected" : "" %>>등록순</option>				
					<option value="like" <%=sort.equals("like") ? "selected" : "" %>>추천순</option>			
				</select>
			</div>
		</form>
	</div>
	
	<div class="row" style="height: 25px;">
	
	</div>
 	<div class="col-sm-2">
 		<div class="panel panel-default" style="width: 70%; margin-top: 10px; margin-left: 50px;">
 		
 		
			<div class="panel-body" style="margin-bottom: 5px; padding-bottom: 5px;">
				<span style="font-size: 19px;"><%=mainCate.getName() %></span>
			</div>
			<%
				for (SubCategory s : subList) {
			%>
			<div class="panel-body" style="font-size: 14px; padding-bottom: 5px;">
				<a href="category_display.jsp?maincategory=<%=mainCate.getNo() %>&subcategory=<%=s.getNo() %>"><%=s.getName() %></a>
			</div>
		<%
				}
 			
		%>
		</div>
 	</div>
 	<div class="col-sm-10">
 		<div class="row">
 		<%
 		if (salesItems.isEmpty()) {
 		%>	
 			<div style="font-weight: bold; text-align: center; height: 600px; font-size: 40px; padding-top: 250px;">
 				등록된 상품이 존재하지 않습니다.
 			</div>
 		<% 	
 		} else {
 			
	 		for(SaleItem item : salesItems) {
	 			if(item.getState().equals("pass")) {
		 		UserDao userDao = UserDao.getInstance();
	 			User user = userDao.getUserByNo(item.getUser().getNo());
	 			
 		%>
	 		
	 		<%@include file="../../common/display_item.jsp" %>
 		<%
	 			}
	 			}
 			}
 		%>
 		</div>
 		
 		
 	</div>
 	<div style="height: 750px;"> </div>
</div>
	<%@ include file="../../common/footer.jsp" %>
</body>
<script type="text/javascript">
	function changeSortSaleItems() {
		
		// 폼의 아이디를 끌어와서 제출.
		document.getElementById("form-sort").submit();
		
	}
	
	
	$.fn.generateStars = function() {
	    return this.each(function(i,e){$(e).html($('<span/>').width($(e).text()*16));});
	};
	
		// 숫자 평점을 별로 변환하도록 호출하는 함수
	$('.star-prototype').generateStars();
</script>
</html>


