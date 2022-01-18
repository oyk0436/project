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
.membercell1 {
	display:table-cell;vertical-align:middle;height:20px;width:25%;font-size:14px;font-weight:bold;width:30%;border:none;background:#ffffcc;border-bottom:1px solid #eeeeee;
}
.membercell2 {
 	display:table-cell;vertical-align:middle;height:20px;width:25%;font-size:12px;width:70%;border:none;padding:5px;border-bottom:1px solid #eeeeee;
}

body {
	font-size:10px;
}

.div1 {
	width:200px;height:700px;background-color:#fbf3f2;float:left;font-size:20px;text-align:left;
}
.div2 {
	margin:0 auto;width:700px;height:1000px;text-align:center;padding-top:20px;float:left;background-color:rgb(255, 255, 255);
}


</style>

<script>
function btn_memberOut(userid) {
	if (confirm("회원 탈퇴 시키겠습니까?")) {
		$.ajax({
			type :"post",
			url  :"memberoneDelete.do",
			data :"userid="+userid, 
			datatype : "text",
			success  : function(data){
				alert("삭제");

			},
			error : function() {   }
			
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
		<div style="position:relative;text-align:left;">
			<div style="display:table;position:relative;width:1000px;margin-left:50px;top:10px;border-top:2px solid #000000;">
		 		<div style="display:table-row;text-align:center;">
					<div class="membercell1" style="width:9%;">유저ID</div>
					<div class="membercell1" style="width:10%;">이름</div>
					<div class="membercell1" style="width:15%;">닉네임</div>
					<div class="membercell1" style="width:15%;">이메일</div>
					<div class="membercell1" style="width:18%;">전화번호</div>
					<div class="membercell1" style="width:18%;">주소</div>
					<div class="membercell1" style="width:15%;">삭제</div>
				</div>
				<c:forEach var="result" items="${list}">
					<div style="display:table-row;text-align:center;">
						<div class="membercell2" style="width:9%;">${result.userid}</div>
						<div class="membercell2" style="width:10%;">${result.name}</div>	
						<div class="membercell2" style="width:15%;"><c:if test="${!empty result.nick}">${result.nick}</c:if></div>
						<div class="membercell2" style="width:12%;"><c:if test="${!empty result.email}">${result.email}</c:if></div>
						<div class="membercell2" style="width:24%;"><c:if test="${!empty result.phone1}">${result.phone1} - ${result.phone2} - ${result.phone3}</c:if></div>
						<div class="membercell2" style="width:22%;"><c:if test="${!empty result.roadaddress}">${result.roadaddress} ${result.jibunaddress} ${result.detailaddress}</c:if></div>
						<div class="membercell2" style="width:8%;"><button type="button" onclick="btn_memberOut('${result.userid}')">삭제</button></div>
					</div>	
				</c:forEach>
			</div>
		</div>
	
	</form>
	
	</div>
</div>

</body>
</html>



