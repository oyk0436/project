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
function btn_orderOut(unq) {
	
	if (confirm("주문을 삭제 시키겠습니까?")) {
		$.ajax({
			type :"post",
			url  :"orderlistDelete.do",
			data :"unq="+unq, 
			datatype : "text",
			success  : function(data){
				alert("삭제");
				location.reload();
			},
			error : function() {   }
		});
	}
}
</script>

<body>

<%@include file="../include/top.jsp" %>
<div class="container" style="margin:0 auto;">

	
	<div class="div1">
		<%@ include file="/include/admin_left_menu.jsp" %>
	</div>
	
	<div class="div2">
	
	<form id="frm">
		<div style="position:relative;text-align:left;">
			<div style="display:table;position:relative;width:1000px;margin-left:50px;top:10px;border-top:2px solid #000000;">
		 		<div style="display:table-row;text-align:center;">
					<div class="membercell1" style="width:9%;">주문번호</div>
					<div class="membercell1" style="width:27%;">상품명</div>
					<div class="membercell1" style="width:15%;">가격</div>
					<div class="membercell1" style="width:15%;">유저ID</div>
					<div class="membercell1" style="width:18%;">주문날짜</div>
					<div class="membercell1" style="width:15%;">삭제</div>
				</div>
				<c:forEach var="result" items="${list}">
					<div style="display:table-row;text-align:center;">
						<div class="membercell2" style="width:9%;">${result.unq}</div>
						<div class="membercell2" style="width:27%;">${result.itemname}</div>	
						<div class="membercell2" style="width:15%;">${result.price}</div>
						<div class="membercell2" style="width:15%;">${result.userid}</div>
						<div class="membercell2" style="width:18%;">${result.odate}</div>
						<div class="membercell2" style="width:15%;"><button type="button" onclick="btn_orderOut('${result.unq}')">삭제</button></div>
					</div>	
				</c:forEach>
			</div>
		</div>
	
	</form>
	
	</div>
</div>

</body>
</html>



