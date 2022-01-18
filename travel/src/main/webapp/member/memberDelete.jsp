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
		if ($("#pass").val() == "") {
			alert("비밀번호를 입력해주세요.");
			$("#pass").focus();
			return false;
		}

		var formdata = $("#frm").serialize();
		
		$.ajax({
			type : "post",
			url : "memberDeleteSave.do",
			data : formdata,
			datatype : "text",
			success : function(data) {
				if (data == "ok") {
					alert("탈퇴 완료");
					opener.parent.location="loginWrite.do";
					window.close();
				} else {
					alert("탈퇴 실패");
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
		회원탈퇴
	</div>
	
	<form name = "frm" id = "frm">
	
	<input type = "hidden" name = "userid" id = "userid" value="<%=USERID %>">
	
	<div style="display:table;position:relative;width:100%;float:left;top:10px;">
		<div style=";display:table-row;text-align:center;">
			<div class="cellLineReview1">아이디</div>
			<div class="cellLineReview2">
				<%=USERID %>
			</div>
		</div>
		<div style=";display:table-row;text-align:center;">
			<div class="cellLineReview1">비밀번호</div>
			<div class="cellLineReview2">
				<input type = "password" name = "pass" id = "pass" placeholder="비밀번호를 입력해주세요.">
			</div>
		</div>
 	</div>
 	
 	</form>
 	
 	<div style="position:absolute;width:100%;text-align:center;top:20px;margin-top:150px;">
		<button type = "button" name = "btn_save" id = "btn_save">저장</button>
		<button type = "button" onclick = "self.close()">닫기</button>
	</div>
	
</body>
</html>