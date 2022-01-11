<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	
	<link rel="stylesheet" href="/css/admin_layout.css">
	<link rel="stylesheet" href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
	
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
		 
</head>

<style>
.buttonMap {
	border:none;background-image:url(/images/map/mapMouseout.png);background-size:38px 20px;width:38px;height:20px;text-align:center;font-size:small;
}
button.on {
	border:none;background-image:url(/images/map/mapMouseover.png);background-size:38px 20px;width:38px;height:20px;text-align:center;font-size:small;color:#ffffff;
}
button.off {
	border:none;background-image:url(/images/map/mapMouseout.png);background-size:38px 20px;width:38px;height:20px;text-align:center;font-size:small;
}
div.map {
	position:absolute;font-color:#ffffff;
}

.cell1 {
	border-bottom:1px solid #ccc;display:table-cell;vertical-align:middle;height:20px;width:25%;font-size:14px;font-weight:bold;
}
.cell2 {
	border-bottom:1px solid #ccc;display:table-cell;vertical-align:middle;height:20px;text-align:left;padding:15px;
}
.cell3 {
	border-bottom:1px solid #ccc;display:table-cell;vertical-align:middle;height:30px;width:25%;
}

.membercell1 {
	display:table-cell;vertical-align:middle;height:20px;width:25%;font-size:14px;font-weight:bold;width:30%;border:none;background:#ffffcc;border-bottom:1px solid #eeeeee;
}
.membercell2 {
 	display:table-cell;vertical-align:middle;height:20px;width:25%;font-size:12px;width:70%;border:none;text-align:left;padding:5px;border-bottom:1px solid #eeeeee;
}

body {
	font-size:10px;
}
.container {
	width:1000px;height:2000px;margin:0 auto;
}
.div1 {
	width:200px;height:700px;background-color:#fbf3f2;float:left;font-size:20px;text-align:left;
}
.div2 {
	margin:0 auto;width:700px;height:1000px;text-align:center;padding-top:20px;float:left;background-color:rgb(255, 255, 255);
}
.div_button {
	width:700px;text-align:center;margin-top:10px;
}
header {
	font-size:25px;font-weight:bold;width:1000px;height:100px;background-color:#ffcf6a;text-align:center;line-height:4.0;clear:right;
}
a {
	text-decoration:none;color:#000000;
}

</style>

<script>
function fn_passcheck(pass) {
	var msg;
	msg = "<span style='color:red'>현재 비밀번호가 일치하지 않습니다.</span>";
	$("#msg_area").html(msg);
	
	var formdata = $("#frm").serialize();
	
	$.ajax({
		type : "post",
		data : formdata,
		url : "passCheck.do",
		
		datatype : "text",
		success : function (data) {
			if (data == "ok") {
				msg = "<span style='color:green'>현재 비밀번호와 일치합니다.</span>";
			} else if (data == "er1") {
				msg = "<span style='color:red'>현재 비밀번호가 일치하지 않습니다.</span>";
			} else {
				msg = "<span style='color:red'>설정오류!</span>";
			}
			$("#msg_area").html(msg);
		},
		error : function() {
			msg="<span style='color:red'>전송오류!</span>";
			$("#msg_area").html(msg);
		}
	});
}

$(function(){
	$("#passModify").click(function(){
		if($("#pass").val() == "") {
			alert("현재 비밀번호를 입력해주세요.");
			$("#pass").focus();
			return false;
		}
		if($("#newPass").val() == "") {
			alert("새 비밀번호를 입력해주세요.");
			$("#newPass").focus();
			return false;
		}
		if($("#newPassChk").val() == "") {
			alert("새 비밀번호 확인을 입력해주세요.");
			$("#newPassChk").focus();
			return false;
		}
		
		if($("#newPass") != $("#newPassChk")) {
			alert("새 비밀번호가 일치하지 않습니다.");
			$("#passChk").focus();
			return false;
		}
		
		
		var formdata = $("#frm").serialize();
		
		$.ajax({
			type : "post",
			url : "memberModifySave.do",
			data : formdata,
			
			datatype : "text",
			success : function(data) {
				if( data == "ok" ) {
					alert("수정 완료");
					location="memberInfo.do";
				} else if( data == "er1" ) {
					alert("암호가 일치하지 않습니다.");
				} else {
					alert("수정 실패");
				}
			},
			error : function() {
				alert("전송오류!")
			}
		});
	});
});
</script>

<body>

<div class="container" style="margin:0 auto;">

<%@include file="/include/top1.jsp" %>

<header>
 맛집 화면
</header>
	
	<div class="div1">
		<%@ include file="/include/mypage_left.jsp" %>
	</div>
	
	<div class="div2">
	
	<form id="frm">
		<input type="hidden" name="userid" id="userid" value="<%=USERID %>">
	<div style="width:90%;
		  			margin-left:30px;
		  			margin-top:30px;
		  			margin-bottom:30px;
		  			text-align:left;
		  			font-weight:bold;
		  			font-size:12px;
		  			padding:10px;
		  			position:relative;">
			<span style="font-size:18px;">비밀번호 변경</span> <br>
	</div>
		
	<div style="position:relative;text-align:left;">
	
	<span style="font-size:15px;font-weight:bold;margin-left:50px;">사이트 이용정보 입력</span>
	
		<div style="display:table;position:relative;width:700px;margin-left:50px;top:10px;border-top:2px solid #000000;">
	 		<div style="display:table-row;text-align:center;">
				<div class="membercell1">아이디</div>
				<div class="membercell2"><%=USERID %></div>
			</div>
			<div style="display:table-row;text-align:center;">
				<div class="membercell1">현재 비밀번호</div>
				<div class="membercell2">
					<input type = "password" name="pass" id="pass" placeholder="비밀번호를 입력하세요." onkeyup="fn_passcheck(this.value)">
					<span id="msg_area" style="font-size:12px;"></span>
				</div>
			</div>
			<div style="display:table-row;text-align:center;">
				<div class="membercell1">새 비밀번호</div>
				<div class="membercell2">
					<input type = "password" name="newPass" id="newPass" placeholder="비밀번호를 입력하세요.">
				</div>
			</div>
			<div style="display:table-row;text-align:center;">
				<div class="membercell1">새 비밀번호 확인</div>
				<div class="membercell2">
					<input type = "password" name="newPassChk" id="newPassChk" placeholder="비밀번호를 입력하세요.">
				</div>
			</div>
		</div>
	</div>
	
	 <div style="text-align:center;margin-top:30px;margin-left:50px;">
        <button type="submit" id="passModify" onclick="return false;">수정</button>
     	<button type="reset">취소</button>
     </div>
	
	</form>
	
	</div>
</div>

</body>
</html>



