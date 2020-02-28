<%@page import="kr.pren.vo.Review"%>
<%@page import="kr.pren.dao.ReviewDao"%>
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
</head>
<style>
	.filebox label { 
   
      display: inline-block; padding: .5em .75em; color: #999; 
      font-size: inherit; line-height: normal; vertical-align: middle; 
      background-color: #fdfdfd; cursor: pointer; border: 1px solid black;
      color: black;
      border-bottom-color: black; border-radius: .25em; 
   }
   
   .filebox input[type="file"] {
      /* 파일 필드 숨기기 */
      position: absolute; width: 1px; height: 1px; padding: 0; 
      margin: -1px; overflow: hidden; clip:rect(0,0,0,0); border: 0; 
      
   }
</style>
<body>
<div class="container">
<%
	int reviewNo = Integer.parseInt(request.getParameter("reviewNo"));

	ReviewDao reviewDao = ReviewDao.getInstance();
	Review review = reviewDao.getReviewByNo(reviewNo);
%>
<div style="margin-top: 50px;">
               <form id="review-form" action="review_update.jsp" method="post" enctype="multipart/form-data" class="well">
               		<input type="hidden" name="itemNo" id ="item" value="<%=review.getNo() %>">
               		<input type="hidden" name="productNo" id ="productNo" value="<%=review.getItemNo() %>">
                  <div class="form-group">
                      <label  style="font-size: 15px;">리뷰내용</label>
                      <textarea id="review-content" class="form-control" rows="5" name="reviewContent"></textarea>
                    </div>
                     <div class="filebox" style="display: inline-block; float: right; margin-top: 20px;">
                         <label for="photo-upload">사진올리기</label> 
                         <input type="file" id="photo-upload" name="reviewFile"> 
                      </div>
                  <div>
                     <button type="button" class="btn btn-danger btn-block" onclick="submitReview()">등록하기</button>
                  </div>
               </form>
            </div>
</div>
</body>
<script type="text/javascript">
function submitReview() {
	   var content = document.getElementById("review-content").value;
	   if (content == "") {
	      alert("수정 할 내용을 입력해주세요.");
	      return;
	   }
	   document.getElementById("review-form").submit();
	   self.close();
	   alert("수정 완료!");
	   opener.location.reload();
	}

</script>
</html>
