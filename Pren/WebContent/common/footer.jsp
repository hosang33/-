<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<footer class="page-footer font-small indigo" style="background-color: #F2F2F2;">
	<div class="container">
		<div class="row">
		<div class="col-sm-3">
			 <div class="navbar-header">
			<a href="../main/index.jsp" class="navbar-brand" style="margin-top: 20px;"><img src="../../resources/images/default/logo.png" style="width: 120px; height: 30px;"></a>
		</div>
		</div>
		<div class="col-sm-6" style="margin-top: 10px;"> 
			<a type="button"  data-toggle="modal" data-target="#service-agree">개인정보 처리방침</a>
			<a type="button"  data-toggle="modal" data-target="#service-agree">서비스 이용약관</a>
    		<a href="../management_page/notice_center.jsp">공지사항</a>
    		 <p style="font-size: 12px;">
    		 	상호 : (주) 탈트 | 사업자등록번호 : 737-88-01166 통신판매업신고 : 2019-고양덕양구-1362 | 경기도 고양시 덕양구 동송로 70, 힐스테이트 삼송역 102동 19층 (삼송동) | 대표 : 이승민	 	
    		 </p>
    		 <p style="font-size: 12px;">
    		 	Copyright © 2018 talt inc, ltd. All rights reserved
    		 </p>
		</div>
		<div class="col-sm-3 text-right" style="margin-top: 40px;">
			<a href="" style="margin-right: 10px;"><img src="../../resources/images/default/sns.png"></a>
			<a href="" style="margin-right: 10px;"><img src="../../resources/images/default/sns.png"></a>
			<a href="" style="margin-right: 10px;"><img src="../../resources/images/default/sns.png"></a>
			<a href="" style="margin-right: 10px;"><img src="../../resources/images/default/sns.png"></a>
		</div>
		
		
		  <div class="modal fade" id="service-agree" role="dialog">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">서비스 이용약관 동의</h4>
        </div>
        <div class="modal-body">
          <%@ include file="../../common/service_agree.jsp" %>
        </div>
		        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>
	</div>
	</div>
</footer>