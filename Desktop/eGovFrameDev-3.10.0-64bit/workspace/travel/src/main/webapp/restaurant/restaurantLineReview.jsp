<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%
String USERID = (String) session.getAttribute("MEMBER_SESSION_ID"); 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<link rel="stylesheet" href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  	<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
  	
</head>

<style>
.cellLineReview1 {
	border:1px solid #ccc;display:table-cell;vertical-align:middle;width:100px;font-size:14px;font-weight:bold;
}
.cellLineReview2 {
	border:1px solid #ccc;display:table-cell;vertical-align:middle;text-align:left;padding:7px;
}
</style>

<script>

$( function() {
	
	$("#btn_save").click(function(){
		
		if ($("#content").val() == "") {
			alert("내용을 입력해주세요.");
			$("#content").focus();
			return false;
		}
		
		if ($("#content").val().trim().length > 100) {
			alert("내용을 100자 이내로 작성해주세요.");
			$("#content").focus();
			return false;s
		}
		
		if ($("#pass").val() == "") {
			alert("비밀번호를 입력해주세요.");
			$("#pass").focus();
			return false;
		}
		
		if ($("#pass").val().trim().length > 10) {
			alert("비밀번호를 10자 이내로 작성해주세요.");
			$("$pass").focuse();
			return false;
		}
		
		if ($("#name").val() == "") {
			alert("글쓴이를 입력해주세요.");
			$("#name").focus();
			return false;
		}
		
		
		var formdata = $("#frm").serialize();
		
		$.ajax({
			type : "post",
			url : "restaurantLineReviewSave.do",
			data : formdata,
			datatype : "text",
			success : function(data) {
				if (data == "ok") {
					alert("저장완료");
					opener.parent.location.reload();
					window.close();
				} else {
					alert("저장실패");
				}
			},
			error : function() {
				alert("오류발생");
			}
				
		});
	});
});

</script>

<body>

	<div style = "font-size:25px;font-weight:bold;text-align:center;">
		<font color = "blue">${vo.title }</font> 한줄 리뷰 & 평가
	</div>
	
	<form name = "frm" id = "frm">
	
	<input type = "hidden" name = "punq" id = "punq" value = "${vo.unq }">
	<input type = "hidden" name = "userid" id = "userid" value="<%=USERID %>">
	<input type = "hidden" name = "category" id = "category" value="restaurant">
	<input type = "hidden" name = "title" id = "title" value="${vo.title }">
	
	<div style="display:table;position:relative;width:100%;float:left;top:10px;">
		<div style=";display:table-row;text-align:center;">
			<div class="cellLineReview1">글쓴이</div>
			<div class="cellLineReview2">
				<input type = "text" name = "name" id = "name">
			</div>
		</div>
		<div style=";display:table-row;text-align:center;">
			<div class="cellLineReview1">비밀번호</div>
			<div class="cellLineReview2">
				<input type = "password" name = "pass" id = "pass" placeholder="10자 이내로 작성해주세요.">
			</div>
		</div>
 		<div style=";display:table-row;text-align:center;width:500px;">
			<div class="cellLineReview1">내용</div>
			<div class="cellLineReview2">
				<textarea name = "content" id = "content" style="width:98%;height:50px;" placeholder="100자 이내로 작성해주세요." autofocus></textarea>
			</div>
		</div>
		<div style=";display:table-row;text-align:center;">
			<div class="cellLineReview1">평점</div>
			<div class="cellLineReview2">
				<select name = "grade" id = "grade" style = "width:100px;">
  					<option value="5">5 (아주좋음)</option>
  					<option value="4">4 (좋음)</option>
  					<option value="3" selected>3 (보통)</option>
  					<option value="2">2 (나쁨)</option>
  					<option value="1">1 (아주나쁨)</option>
  				</select>
			</div>
		</div>
 	</div>
 	
 	</form>
 	
 	<div style="position:absolute;width:100%;text-align:center;top:20px;margin-top:240px;">
		<button type = "button" name = "btn_save" id = "btn_save">저장</button>
		<button type = "button" onclick = "self.close()">닫기</button>
	</div>
	
</body>
</html>