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
	width:200px;height:700px;float:left;font-size:20px;text-align:left;
}
.div2 {
	margin:0 auto;width:700px;height:1000px;text-align:center;float:left;background-color:rgb(255, 255, 255);
}
.div_button {
	width:700px;text-align:center;margin-top:10px;
}
a {
	text-decoration:none;color:#000000;
}

</style>

<script>

function btn_memberOut() {
	
	if (confirm("회원 탈퇴를 진행하시겠습니까?")) {
		var url = "memberDelete.do";
		var p_width = 500;
		var p_height = 200;
		var s_width = (window.screen.width/2) - p_width/2;
		var s_height = (window.screen.height/2) - (p_height);
		window.open(url,"popup","width="+p_width+",height="+p_height+",resizable=yes,left="+s_width+",top="+s_height);
	}
}

</script>

<body>

<%@include file="/include/top.jsp" %>

<div class="container" style="margin:0 auto;">

	<div class="div1">
		<%@ include file="/include/mypage_left.jsp" %>
	</div>
	
	<div class="div2">
	
	<form id="frm">
		<input type="hidden" name="id_chk" id="id_chk" value="0">
	<div style="width:90%;
		  			margin-left:30px;
		  			margin-top:30px;
		  			margin-bottom:30px;
		  			text-align:left;
		  			font-weight:bold;
		  			font-size:12px;
		  			padding:10px;
		  			position:relative;">
			<span style="font-size:18px;">회원 정보</span> <br>
	</div>
		
	<div style="position:relative;text-align:left;">
	
	<span style="font-size:15px;font-weight:bold;margin-left:50px;">사이트 이용정보 입력</span>
	
		<div style="display:table;position:relative;width:700px;margin-left:50px;top:10px;border-top:2px solid #000000;">
	 		<div style="display:table-row;text-align:center;">
				<div class="membercell1">아이디</div>
				<div class="membercell2">${vo.userid }</div>
			</div>
			<div style="display:table-row;text-align:center;">
				<div class="membercell1">비밀번호</div>
				<div class="membercell2">
					
					<button type="button" onclick="location='passModify.do'">비밀번호 변경</button>
				</div>
			</div>
		</div>
	</div>
	
	<div style="position:relative;text-align:left;top:30px;">
	
	<span style="font-size:15px;font-weight:bold;margin-left:50px;">개인정보 입력</span>
	
		<div style="display:table;position:relative;width:700px;margin-left:50px;top:10px;border-top:2px solid #000000;">
	 		<div style="display:table-row;text-align:center;">
				<div class="membercell1">이름</div>
				<div class="membercell2">${vo.name }</div>
			</div>
			<div style="display:table-row;text-align:center;">
				<div class="membercell1">닉네임</div>
				<div class="membercell2">${vo.nick }</div>
			</div>
			<div style="display:table-row;text-align:center;">
				<div class="membercell1">생년월일</div>
				<div class="membercell2">${vo.year }년 ${vo.month }월 ${vo.day }일</div>
			</div>
			<div style="display:table-row;text-align:center;">
				<div class="membercell1">E-mail</div>
				<div class="membercell2">${vo.email }</div>
			</div>
			<div style="display:table-row;text-align:center;">
				<div class="membercell1">성별</div>
				<div class="membercell2">
					<c:if test="${vo.gender=='M'}">남성</c:if>
					<c:if test="${vo.gender=='F'}">어성</c:if>
				</div>
			</div>
			<div style="display:table-row;text-align:center;">
				<div class="membercell1">휴대폰 번호</div>
				<div class="membercell2">${vo.phone1 } - ${vo.phone2 } - ${vo.phone3 }</div>
			</div>
			<div style="display:table-row;text-align:center;">
				<div class="membercell1">주소</div>
				<div class="membercell2" style="lineheight:2.5;">
					우편번호 : ${vo.postcode }<br>
					도로명 주소 : ${vo.roadaddress }<br>
					지번 주소 : ${vo.jibunaddress }<br>
					상세주소 : ${vo.detailaddress }
				</div>
			</div>
		</div>
	</div>
	
	 <div style="text-align:center;margin-top:60px;margin-left:50px;">
         <button type="button" onclick="location='memberModify.do'">개인정보 수정</button> 
         <button type="button" id="memberOut" onclick="btn_memberOut()">회원 탈퇴</button>
     </div>
	
	</form>
	
	</div>
</div>

</body>
</html>



