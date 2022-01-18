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
	
	<link rel="stylesheet" href="css/admin_layout.css">
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
 	display:table-cell;vertical-align:middle;height:20px;width:25%;font-size:12px;width:70%;border:none;padding:5px;border-bottom:1px solid #eeeeee;
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

function fn_rScrapDelete(a,b) {
	
	var unq = a;
	var title = b;
	var formdata = $("#frm").serialize();
	
	if (confirm("'"+title+"' "+"스크랩을 삭제 하시겠습니까?")) {
		$.ajax({
			type : "post",
			data : formdata,
			url : "scrapDelete.do?unq="+unq,
			dataType : "text",
			success : function(data) {
				if (data == "ok") {
					alert("삭제 완료!");
				} else if (data == "fail") {
					alert("설정 오류!");
				}
			},
			error : function() {
				alert("전송 오류!");
			}
		});
	}
}

</script>

<body>

<div class="container" style="margin:0 auto;">

<%@include file="../include/top.jsp" %>
	
	<div class="div1">
		<%@ include file="/include/admin_left_menu.jsp" %>
	</div>
	
	<div class="div2">
	
	<form id="frm">
		
	<div style="width:90%;
	  			margin-left:30px;
	  			margin-top:30px;
	  			margin-bottom:30px;
	  			text-align:left;
	  			font-weight:bold;
	  			font-size:12px;
	  			padding:10px;
	  			position:relative;">
			<span style="font-size:18px;">예약/스크랩 현황</span> <br>
	</div>
		
	<div style="position:relative;text-align:left;">
		<div style="display:table;position:relative;width:700px;margin-left:50px;top:10px;border-top:2px solid #000000;">
	 		<div style="display:table-row;text-align:center;">
				<div class="membercell1" style="width:9%;">유저ID</div>
				<div class="membercell1" style="width:10%;">이름</div>
				<div class="membercell1" style="width:15%;">닉네임</div>
				<div class="membercell1" style="width:15%;">이메일</div>
				<div class="membercell1" style="width:18%;">전화번호</div>
				<div class="membercell1" style="width:18%;">주소</div>
				<div class="membercell1" style="width:15%;">삭제</div>
			</div>
		</div>
	</div>
	
	
	
	</form>
	
	</div>
</div>

</body>
</html>



