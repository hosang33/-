<%@page import="kr.pren.vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <style type="text/css">
  	.dropdown:hover .dropdown-menu {
    display: block;
    margin-top: 0;
	}
  </style>
<div class="navbar navbar-default" style="background-color: #F2F2F2; height: auto">
<div class="container">
<%
	//세션객체에서 LOGIEND_USER로 저장된 User객체를 조회
	User loginedUser = (User)session.getAttribute("LOGINED_USER");
%>
		<div class="navbar-header">
			<a href="../main/index.jsp" class="navbar-brand"><img src="../../resources/images/default/logo.png" style="width: 120px; height: 30px;"></a>
		</div>
		<ul class="nav navbar-nav navbar-right">
		<%
			if(loginedUser != null){
		%>
			<li><a href="../myfren/my_buy.jsp">마이프렌</a></li>
			<li><a href="../message/message_all.jsp?pageno=1">메세지</a></li>
			<li><a href="../buy_management/buy_management.jsp">구매</a></li>
			<li><a href=<%=loginedUser.getNo() == 41? "../management_page/member_management.jsp":"../mypage/my_info_form.jsp"  %>><%=loginedUser.getNickName() %></a></li>
			<li><a href="../mypage/logout.jsp">로그아웃</a></li>
		<%
			}
		%>
		</ul>
		<% 
			if(loginedUser == null){ 
				String path = request.getRequestURI();
		%>
		<ul class="nav navbar-nav navbar-right">
			<li><a href="../mypage/login_form.jsp?path=<%=path%>">로그인</a></li>
			<li><a href="../mypage/register_form.jsp">회원가입</a></li>
		</ul>
		<%
			}
		%>
		</div>
		<div class="container">
		<div class="nav navbar-nav navbar-left">
			<ul class="nav navbar-nav" >
      <li class="dropdown">
        <a href="../myfren/my_buy.jsp" class="dropdown-toggle" data-toggle="dropdown">마이프렌</a>
        <ul class="dropdown-menu">
          <li><a href="../myfren/my_buy.jsp">나의 구매</a></li>
          <li><a href="../myfren/steam_list.jsp">찜목록</a></li>
        </ul>
      </li>
      <li class="dropdown">
        <a href="../buy_management/buy_management.jsp">구매관리</a>
        <ul class="dropdown-menu">
          <li><a href="../buy_management/buy_management.jsp">구매관리</a></li>
          <li><a href="../buy_management/buy_history.jsp?">결제내역</a></li>
        </ul>
      </li>
      <li class="dropdown">
        <a href="../message/message_all.jsp" >메세지</a>
        <ul class="dropdown-menu">
          <li><a href="../message/message_all.jsp?pageno=1">전체 메시지</a></li>
          <li><a href="../message/message_read.jsp?pageno=1">안 읽은 메시지</a></li>
          <li><a href="../message/message_star.jsp?pageno=1">별표 메시지</a></li>
          <li><a href="../message/message_progress.jsp?pageno=1">거래중 메시지</a></li>
        </ul>
      </li>
      <li class="dropdown">
        <a href="../mypage/my_info_form.jsp">계정설정</a>
        <ul class="dropdown-menu">
          <li><a href="../mypage/my_info_form.jsp">계정</a></li>
          <li><a href="../mypage/withdrawal.jsp">회원 탈퇴</a></li>
        </ul>
      </li>
      <li class="dropdown">
        <a href="../sell_management/sell_management.jsp">판매물건관리</a>
        <ul class="dropdown-menu">
          <li><a href="../sell_management/sell_management.jsp">상품관리</a></li>
          <li><a href="../sell_management/add_item_form.jsp">상품등록</a></li>
          <li><a href="../sell_management/buy_request_list.jsp">판매현황</a></li>
        </ul>
      </li>
    </ul>
		</div>
		</div>
	
</div>