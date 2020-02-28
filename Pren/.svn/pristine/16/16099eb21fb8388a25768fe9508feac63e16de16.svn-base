<%@page import="kr.pren.dao.SteamDao"%>
<%@page import="kr.pren.dao.ItemImageDao"%>
<%@page import="kr.pren.vo.Option"%>
<%@page import="java.util.List"%>
<%@page import="kr.pren.dao.OptionDao"%>
<%@page import="kr.pren.dao.SaleItemDao"%>
<%@page import="kr.pren.dao.ReviewDao"%>
<%@page import="kr.pren.dao.OrderDao"%>
<%@page import="kr.pren.vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	User loginedUser = (User)session.getAttribute("LOGINED_USER");
	
	int productNo = Integer.parseInt(request.getParameter("productNo"));
	
	SaleItemDao saleItemDao = SaleItemDao.getInstance();
	OrderDao orderDao = OrderDao.getInstance();
	ReviewDao reviewDao = ReviewDao.getInstance();
	OptionDao optionDao = OptionDao.getInstance();
	ItemImageDao imgDao = ItemImageDao.getInstance();
	SteamDao steamDao = SteamDao.getInstance();
	
	List<Option> options = optionDao.getOptionByNo(productNo);
	for(Option i : options) {
		optionDao.deleteAllOrderOptionByOptionNo(i.getNo());
	}
	optionDao.deleteAllOptionByItemNo(productNo);
	imgDao.deleteAllIamageByItemNo(productNo);
	steamDao.deleteSteamByItemNo(productNo);
	reviewDao.deleteAllReview(productNo);
	orderDao.deleteOrder(productNo);
	saleItemDao.deleteSaleitem(productNo);
	
	response.sendRedirect("category_display.jsp?maincategory=1");

%>