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
</head>
<body>
	<%@ include file="../../common/nav.jsp" %>
<div class="container" style="height:790px;">
	<div class="row">
		<div class="col-sm-12">
			<h3>회원가입</h3>
		</div>	
			
	<%

		String fail_pwd = request.getParameter("fail_pwd");
		if("pwd".equals(fail_pwd)){
	%>
		<div class="row">
			<div class="col-sm-12">
				<div class="alert alert-danger">
					<strong>회원가입 실패</strong>비밀번호가 일치하지 않습니다.
				</div>
			</div>
		</div>
	<% 
		}
		String fail_id = request.getParameter("fail_id");
		if("dup".equals(fail_id)){
	%>
		<div class="row">
			<div class="col-sm-12">
				<div class="alert alert-danger">
					<strong>회원가입 실패</strong>동일한 아이디가 이미 존재합니다.
				</div>
			</div>
		</div>
	<% 
		}
	%>
	</div>
	
	<form id="registers-form" action="register.jsp" method="post" >
		<div class="row">
			<div class="col-sm-8">
				<div class="form-group">
					<input type="email" class="form-control" name="useremail" placeholder="이메일을 입력해주세요" id="user-email"/>
				</div>
				<div class="form-group">
					<input type="password" class="form-control" name="userpwd" placeholder="비밀번호를 입력해주세요" id="user-pwd"/>
				</div>
				<div class="form-group">
					<input type="password" class="form-control" name="userpwdconfirm" placeholder="비밀번호 확인" id="user-pwd-con"/>
				</div>
				<div class="form-group">
					<select id="quiz-question" name="question" class="form-control" onchange="selectQuestion">
						<option value="treasure">나의 보물 1호?</option>
						<option value="parents">부모님 이름은?</option>
					</select>
				</div>
				<div class="form-group">
					<input type="text" class="form-control" name="questionconfirm" placeholder="답변 확인" id="user-question"/>
				</div>
				<div class="form-group">
					<input type="text" class="form-control" name="username" placeholder="이름을 입력해주세요" id="user-name"/>
				</div>
				<div class="form-group">
					<input type="text" class="form-control" name="userphone" placeholder="번호를 입력해주세요." id="user-phone"/>
				</div>
			</div>
			
			<div class="col-sm-4">
				<div class="panel-heading">
					<h4>이용약관 내용 동의</h4> 
				</div>
				<div class="panel-body">
					<div class="checkbox">
						<label><input type="checkbox" id="ch-all" onchange="checkAllorNot()"/>전체동의 </label>
					</div>
					<hr>
					<div class="checkbox">
						<label><input id="che1" type="checkbox" name="check" onchange="updateTotalPrice()"/>만 14세 이상입니다(필수)</label>
					</div>
					<div class="checkbox">
						<label><input id="che2" type="checkbox" name="check" onchange="updateTotalPrice()"/>서비스 이용약관동의(필수)</label>
						<a type="button"  data-toggle="modal" data-target="#service-agree">[전문보기]</a>
					</div>
					<div class="checkbox">
						<label><input id="che3" type="checkbox" name="check" onchange="updateTotalPrice()"/>개인정보 수집 동의(필수)</label>
						<a type="button"  data-toggle="modal" data-target="#service-agree">[전문보기]</a>
					</div>
					
				</div>
				<div>
					<button type="button" onclick="checkFormfield()" class="btn btn-lg btn-default btn-block">회원가입</button>
				</div>
				
				<div class="menu-wrap">
					<span class="pull-left"><a href="find_idpwd.jsp">아이디 /비밀번호찾기</a></span>
				<span class="pull-right"><a href="login_form.jsp">로그인</a></span>
				</div>
			</div>
		</div>
	</form>
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

	<%@ include file="../../common/footer.jsp" %>
<script type="text/javascript">
	//여백시 문구창
	function checkFormfield(){
		var id = document.querySelector("#user-email").value;
		if(id == "" ){
			alert("이메일을 입력하세요");
			return;
		}
		var pwd = document.querySelector("#user-pwd").value;
		if(pwd == ""){
			alert("비밀번호를 입력하세요");
			return;
		}
		var question = document.querySelector("#user-question").value;
		if(question == ""){
			alert("답변을 입력하세요");
			return;
		}
		var name = document.querySelector("#user-name").value;
		if(name == ""){
			alert("이름을 입력하세요");
			return;
		}
		var phone = document.querySelector("#user-phone").value;
		if(phone == ""){
			alert("번호를 입력하세요");
			return;
		}
		
		var check1 = document.querySelector("#che1").checked;
		if(!check1){
			alert("약관에 동의를 눌러주세요")
			return;
		}
		var check2 = document.querySelector("#che2").checked;
		if(!check2){
			alert("약관에 동의를 눌러주세요")
			return;
		}
		var check3 = document.querySelector("#che3").checked;
		if(!check3){
			alert("약관에 동의를 눌러주세요")
			return;
		}
		
		document.getElementById("registers-form").submit();
	}
	//전체 선택하기	
	function checkAllorNot(){
		var checkedStatus = document.querySelector("#ch-all").checked;
		var checkboxes = document.querySelectorAll("input[name='check']");

		for(var i=0; i<checkboxes.length; i++){
			var checkbox = checkboxes[i];
			checkbox.checked = checkedStatus;
		}
		updateTotalPrice();
	}
	

	
	
		
</script>	
	
</body>
</html>