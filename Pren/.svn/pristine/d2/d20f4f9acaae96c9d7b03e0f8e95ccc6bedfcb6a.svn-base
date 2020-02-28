<%@page import="kr.pren.dao.SteamDao"%>
<%@page import="kr.pren.dao.ReviewDao"%>
<%@page import="kr.pren.util.NumberUtils"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="kr.pren.dao.UserDao"%>
<%@page import="kr.pren.vo.SaleItem"%>
<%@page import="kr.pren.dao.SaleItemDao"%>
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
		


	SaleItemDao saleItemDao = SaleItemDao.getInstance();
	// 유저번호로 등록한 상품 리스트 조회(등록 날짜순으로)
	List<SaleItem> SaleItemsDates =  saleItemDao.getSaleItemsDateByUserNo(loginedUser.getNo());
	// 유저번호로 등록한 상품 리스트 조회(좋아요 순으로)
	List<SaleItem> SaleItemsLikes =  saleItemDao.getSaleItemsLikeByUserNo(loginedUser.getNo());

	boolean isAleadyLike = false;
	
	
%>
<body>
<div class="container">
	<hr/>
	<div class="row">
		<div class="col-sm-8 col-md-offset-3">
			<div class="btn-group btn-group-justified">
				<div class="btn-group">
					<button type="button" class="btn btn-default" onclick="showbox1()">등록순</button>
				</div>
				<div class="btn-group">
					<button type="button" class="btn btn-default" onclick="showbox2()">추천순</button>
				</div>
			</div>
		</div>
	</div>
	<div class="col-sm-2">
 		<div class="panel panel-default">
			<div class="panel-body"><span style="font-size: 23px;">상품관리</span></div>
			<div class="panel-body"><a href="sell_management.jsp">상품관리</a></div>
			<div class="panel-body"><a href="add_item_form.jsp">상품등록</a></div>
			<div class="panel-body"><a href="buy_request_list.jsp">판매현황</a></div>
		</div>
 	</div>
 	
	<div class="row" id="newsbox-1">
		<%
 			for(SaleItem s : SaleItemsDates){
 				SimpleDateFormat  format = new SimpleDateFormat("yyyy-MM-dd / HH:mm");
	 			String formatedDate = format.format(s.getUploadDate());
	 			
	 			ReviewDao reviewDao = ReviewDao.getInstance();
	 			SteamDao steamDao = SteamDao.getInstance();
	 			 
	 			double reviewScoreAvg = reviewDao.getTotalStarScoreAvg(s.getNo());
	 			  
	 			int steamCount = steamDao.getSteamCountByItemNo(s.getNo());
 		%>
		<div style="margin-left: 220px;">
			<div class="col-sm-3 thumbnail" style="padding-bottom: 20px; width: 217px; margin: 10px 10px;">
	 			<a href="../main/product_display.jsp?productNo=<%=s.getNo() %>" style="text-decoration: none; cursor: pointer;">
	 			<div id="mall-section">
	       			<div class="mall-item">
	           			<img src="../../resources/images/item_logo/<%=s.getLogoName() !=null ? s.getLogoName() : "productImg.jpg"%>" style="width: 200px; height: 200px; width: 100%">
	           			<div>
	           				<div style="margin-bottom: 10px; margin-top:10px;">
		          				<img class="img-circle" src="../../resources/images/user_profile/<%=loginedUser.getProfileImgName() !=null ? loginedUser.getProfileImgName() : "person.png" %>" style="width: 27px; height: 27px; border: 1px solid rgb(221, 221, 221); border: radius: 100%; margin-right: 5px; display: inline-block; vertical-align: middle;">
		          				<strong><%=loginedUser.getName() %></strong>
	           				</div>
	           				<div class="row">
		          				<div class="title" style="padding: 0px 15px; height: 60px;">
		          					<p><%=s.getTitle() %></p>	
		          					<span style="background-color: rgb(213, 213, 213); color: rgb(107, 107, 107); border-radius: 3px; font-size: 12px; padding: 2px 9px; float: right;"><%=s.getIsSolo().equals("y") ? "개인" : "기업" %></span>
		          				</div>
		          				<div style="margin-top: 15px; margin-bottom: 10px;">
		          					<span style="padding-left: 15px; relative; font-size: 11px; color: rgb(79, 172, 254);"><%=reviewScoreAvg %></span>
		          				</div>
	           				</div>
	           			</div>
	          			<div style="margin-top: 5px; padding: 7px 5px; border-top: 1px solid rgb(229, 229, 229); position: relative;">
	          				<span style="float: right">
	          					<span style="font-size: 18px; font-weight: bold;"><%=NumberUtils.numberWithComma(s.getPrice()) %></span> 원
	          				</span>
	          			</div>
	          			<div style="float: right; display: inline-block;">
	          				<span style="float: right; font-size: 11px;"><%=formatedDate %></span>
	          			</div>
	          			</div>
	      			</div>
	  			</a>
	 		</div>
 		</div>
 		<%
 			}
		%>
		
	</div>
	<div class="row" id="newsbox-2">
		<%
 			for(SaleItem s : SaleItemsLikes){
 				SimpleDateFormat  format = new SimpleDateFormat("yyyy-MM-dd / HH:mm");
	 			String formatedDate = format.format(s.getUploadDate());
 		%>
		<div style="margin-left: 220px;">
			<div class="col-sm-3 thumbnail" style="padding-bottom: 20px; width: 217px; margin: 10px 10px;">
	 			<a href="../main/product_display.jsp?productNo=<%=s.getNo() %>" style="text-decoration: none; cursor: pointer;">
	 			<div id="mall-section">
	       			<div class="mall-item">
	           			<img src="../../resources/images/item_logo/<%=s.getLogoName() !=null ? s.getLogoName() : "productImg.jpg"%>" style="width: 200px; height: 200px; width: 100%">
	           			<div>
	           				<div style="margin-bottom: 10px; margin-top:10px;">
		          				<img class="img-circle" src="../../resources/images/user_profile/<%=loginedUser.getProfileImgName() !=null ? loginedUser.getProfileImgName() : "person.jpg" %>" style="width: 27px; height: 27px; border: 1px solid rgb(221, 221, 221); border: radius: 100%; margin-right: 5px; display: inline-block; vertical-align: middle;">
		          				<strong><%=loginedUser.getName() %></strong>
	           				</div>
	           				<div class="row">
		          				<div class="title" style="padding: 0px 15px; height: 60px;">
		          					<p><%=s.getTitle() %></p>	
		          					<span style="background-color: rgb(213, 213, 213); color: rgb(107, 107, 107); border-radius: 3px; font-size: 12px; padding: 2px 9px; float: right;"><%=s.getIsSolo().equals("y") ? "개인" : "기업" %></span>
		          				</div>
		          				<div style="margin-top: 15px; margin-bottom: 10px;">
		          					<span style="padding-left: 15px; relative; font-size: 11px; color: rgb(79, 172, 254);">평가점수</span>
		          				</div>
	           				</div>
	           			</div>
	          			<div style="margin-top: 5px; padding: 7px 5px; border-top: 1px solid rgb(229, 229, 229); position: relative;">
	          				<a href="/semiproject/Project_JSP/myfren/steam_list.jsp?productNo=<%=s.getNo() %>" class="btn btn-default <%=isAleadyLike ? "disabled" : "" %>" style="border: none;" style="border: none;">
	          					<span class="glyphicon glyphicon-heart red"></span>
	          				</a>
	          				<span style="float: right">
	          					<span style="font-size: 18px; font-weight: bold;"><%=NumberUtils.numberWithComma(s.getPrice()) %></span> 원
	          				</span>
	          			</div>
	          			<div style="float: right; display: inline-block;">
	          				<span style="float: right; font-size: 11px;"><%=formatedDate %></span>
	          			</div>
	          			</div>
	      			</div>
	  			</a>
	 		</div>
 		</div>
 		<%
 			}
		%>
		
	</div>
	<script type="text/javascript">
	// 즉시 실행 함수
	// 웹페이지 로딩시 페이지와 관련된 초기화 작업을 실행할 목적으로 사용한다.
  	(function() {
		document.querySelector("#newsbox-2").style.display = 'none';
	})();
  	
	// 다른 함수에서 호출하는(실행하는) 함수
  	function hideAllBox() {
  		document.querySelector("#newsbox-1").style.display = 'none';
  		document.querySelector("#newsbox-2").style.display = 'none';
	}
  	// 버튼 클릭시 실행되는 함수
  	function showbox1() {
  		hideAllBox(); 	// 수행문에서 다른 함수 실행
  		document.querySelector("#newsbox-1").style.display = 'block';		
	}
 	// 버튼 클릭시 실행되는 함수
	function showbox2() {
		hideAllBox(); 	// 수행문에서 다른 함수 실행
		document.querySelector("#newsbox-2").style.display = 'block';			
	}

 	

	$.fn.generateStars = function() {
	    return this.each(function(i,e){$(e).html($('<span/>').width($(e).text()*16));});
	};
	
		// 숫자 평점을 별로 변환하도록 호출하는 함수
	$('.star-prototype').generateStars();
		
  </script>
</div>
</body>
  <%@ include file="../../common/footer.jsp" %>
</html>








































