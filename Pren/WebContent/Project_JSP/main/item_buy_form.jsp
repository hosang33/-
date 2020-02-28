<%@page import="kr.pren.dao.MainCategoryDao"%>
<%@page import="kr.pren.vo.MainCategory"%>
<%@page import="kr.pren.dao.OrderDao"%>
<%@page import="kr.pren.vo.Review"%>
<%@page import="kr.pren.dao.ReviewDao"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="kr.pren.vo.SubCategory"%>
<%@page import="kr.pren.dao.SubCategoryDao"%>
<%@page import="kr.pren.vo.Option"%>
<%@page import="kr.pren.vo.SaleItem"%>
<%@page import="kr.pren.vo.ItemImage"%>
<%@page import="java.util.List"%>
<%@page import="kr.pren.dao.UserDao"%>
<%@page import="kr.pren.dao.OptionDao"%>
<%@page import="kr.pren.dao.ItemImageDao"%>
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

.mainimg {
	width: 100%;
}
</style>
</head>
<body>
	<%@ include file="../../common/nav.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-sm-12">
				<h3 class="text-center" style="margin-bottom: 20px;">주문하기</h3>
			</div>
		</div>
		<%
		
			int productNo = Integer.parseInt(request.getParameter("productNo"));
		
			SaleItemDao saleItemDao = SaleItemDao.getInstance();
			ItemImageDao itemImageDao = ItemImageDao.getInstance();
			OptionDao optionDao = OptionDao.getInstance();
			UserDao userDao = UserDao.getInstance();
			
			List<ItemImage> itemImages = itemImageDao.getItemImageByNo(productNo);
			SaleItem saleItem = saleItemDao.getSaleItemByNo(productNo);
			User user = userDao.getUserByNo(saleItem.getUser().getNo());
			List<Option> options = optionDao.getOptionByNo(productNo);
			SubCategoryDao subCategoryDao = SubCategoryDao.getInstance();
			SubCategory subCategory = subCategoryDao.getSubCategoryByNo(saleItem.getSubCategoryNo());
			
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd / HH:mm");
			String formatedDate = format.format(saleItem.getUploadDate());
						
			ReviewDao reviewDao = ReviewDao.getInstance();
			List<Review> reviews = reviewDao.getReviewByItemNo(saleItem.getNo());
			OrderDao orderDao = OrderDao.getInstance();
		%>
		<form class="well" action="add_order.jsp?productNo=<%=productNo %>" method="post" >
			<div class="row">
				<div class="col-sm-12">
					<h3 class="text-left">상품정보</h3>
					<div class="row">
						<div class="col-sm-3">
							<img alt="" class="mainimg" style="width: 200px; height: 200px; border: 1px solid red;" src="../../resources/images/item_logo/<%=saleItem.getLogoName() !=null ? saleItem.getLogoName() : "productImg.jpg"%>">
						</div>
						<div class="col-sm-9 form-group">
							<span class="label label-primary"><%=subCategory.getName() %></span>
						<hr />
							<input style="width: 700px; font-size: 30px; margin-top: -50px;" type="text" name="itemName" value="<%=saleItem.getTitle()%>" readonly>
							<input style="width: 700px; font-size: 30px; margin-top: -50px;" type="hidden" name="itemUserName" value="<%=user.getName() %>" readonly>
						</div>
					</div>
					<div class="form-group">
					
						<h4 class="list-group-item-heading" style="margin-top: 15px; font-size: 25px;">기본옵션</h4>

							<%
								for(Option o : options){
									if(o.getPlus().equals("n")){
							%>
							<span style="margin-left: 5px; font-size: 17px;"><%=o.getTitle() %></span>
						<%
								}
							}
						%>
					</div>
					
					<div class="col-md-12 form-group" style="padding-left: 0;" >
						<h4 class="list-group-item-heading" style="margin-top: 15px; font-size: 25px;">추가옵션</h4>
						<div class="checkbox" style="width: 100%;">
						<%
								for(Option o : options){
									if(o.getPlus().equals("y")){
						%>
							<p style="margin-left: 20px;">
								<input type="hidden" name="optionNo" id="optionNo-<%=o.getNo()%>">
								<input name="optionprice" type="checkbox" value="<%=o.getPrice() %>" onclick="calc(this,<%=o.getNo()%>)">
									<%=o.getTitle() %>: <strong><%=o.getPrice() %>원<strong/>
							</p>
						<%
									}
								}
						%>
						</div>
						
						<hr />
						<div class="row">
							<div class="col-sm-12 text-right">
								<p style="margin-top: -10px; font-size: 20px;">
									<!--<input type="text" value="<%=saleItem.getPrice() %>" id="saleItemPrice">-->
									<input type="text" id="sumtext" name="sumtext" value="<%=saleItem.getPrice() %>" readonly>원
								</p>
							</div>
						</div>
						<div class="box form-group">
							<div class="box-title">주문서 작성</div>
							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<textarea name="sheet" rows="5" id="request" class="form-control"></textarea>
									</div>
								</div>
							</div>
						</div>
						<div class="form-group">
							<div class="box-title">결제 수단</div>
							<div class="form-group">
								<div class="radio" style="margin-right: 30px;">
									<h4>무통장 결제</h4>
									<input type="text" class="form-control" name="userBankNo"style="width: 250px; "/>
								</div>
							</div>
						</div>
						<button type="submit" class="btn btn-primary btn-block">주문하기</button>
					</div>
				</div>
			</div>
		</form>
	</div>
	<%@ include file="../../common/footer.jsp"%>
<script type="text/javascript">

	function calc(cBox,optionNo){
		var currentSumPrice = parseInt(document.getElementById("sumtext").value);
	    if (cBox.checked){
	   		currentSumPrice += parseInt(cBox.value);
	   		document.getElementById("optionNo-"+optionNo).value = optionNo;
	    }else{
	    	currentSumPrice -= parseInt(cBox.value); 
	    	document.getElementById("optionNo-"+optionNo).value = 0;
	    }
	  	document.getElementById("sumtext").value = currentSumPrice;
	}

</script>
</body>
</html>