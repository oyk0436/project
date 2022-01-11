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

function fn_lineReviewModify(a,b) {
	
	var unq = a;
	var title = b;
	
	if (confirm("'"+title+"' "+"이용 후기 수정을 진행하시겠습니까?")) {
		var url = "lineReviewModify.do?unq="+unq;
		var p_width = 500;
		var p_height = 400;
		var s_width = (window.screen.width/2) - p_width/2;
		var s_height = (window.screen.height/2) - (p_height);
		window.open(url,"popup","width="+p_width+",height="+p_height+",resizable=yes,left="+s_width+",top="+s_height);
	}
}

function fn_lineReviewDelete(a,b) {
	
	var unq = a;
	var title = b;
	
	if (confirm("'"+title+"' "+"이용 후기 삭제를 진행하시겠습니까?")) {
		var url = "lineReviewDelete.do?unq="+unq;
		var p_width = 500;
		var p_height = 400;
		var s_width = (window.screen.width/2) - p_width/2;
		var s_height = (window.screen.height/2) - (p_height);
		window.open(url,"popup","width="+p_width+",height="+p_height+",resizable=yes,left="+s_width+",top="+s_height);
	}
}

</script>

<body>

<div class="container" style="margin:0 auto;">

<%@include file="/include/top1.jsp" %>

<header>
 맛집 화면${lineReview2.unq }
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
			<span style="font-size:18px;">나의 이용 후기</span> <br>
	</div>
		
	<div style="position:relative;text-align:left;">
	
	<span style="font-size:15px;font-weight:bold;margin-left:50px;">숙박 이용 후기</span>
	
		<div style="display:table;position:relative;width:700px;margin-left:50px;top:10px;border-top:2px solid #000000;">
	 		<div style="display:table-row;text-align:center;">
				<div class="membercell1" style="width:5%;">번호</div>
				<div class="membercell1" style="width:20%;">상호명</div>
				<div class="membercell1" style="width:50%;">내용</div>
				<div class="membercell1" style="width:15%;">작성일</div>
				<div class="membercell1" style="width:5%;">수정</div>
				<div class="membercell1" style="width:5%;">삭제</div>
			</div>
		</div>
	</div>
	
	<div style="position:relative;text-align:left;top:30px;">
	
	<span style="font-size:15px;font-weight:bold;margin-left:50px;">음식점 이용 후기</span>
	
		<div style="display:table;position:relative;width:700px;margin-left:50px;top:10px;border-top:2px solid #000000;">
	 		<div style="display:table-row;text-align:center;">
				<div class="membercell1" style="width:5%;">번호</div>
				<div class="membercell1" style="width:20%;">상호명</div>
				<div class="membercell1" style="width:50%;">내용</div>
				<div class="membercell1" style="width:15%;">작성일</div>
				<div class="membercell1" style="width:5%;">수정</div>
				<div class="membercell1" style="width:5%;">삭제</div>
			</div>
			
			<c:set var="rownum2" value="${lineReview2.rownum2 }"/>
			<c:forEach var = "result2" items = "${list2 }">
		
			<div style="display:table-row;text-align:center;">
				<div class="membercell2" style="width:5%;">${rownum2 }</div>
				<div class="membercell2" style="width:20%;">${result2.title }</div>
				<div class="membercell2" style="width:50%;text-align:left;">${result2.content }</div>
				<div class="membercell2" style="width:15%;">${result2.rdate }</div>
				<div class="membercell2" style="width:5%;">
					<a href = "javascript:void(0)" onclick="fn_lineReviewModify('${result2.unq}','${result2.title }')">수정</a>
				</div>
				<div class="membercell2" style="width:5%;">
					<a href = "javascript:void(0)" onclick="fn_lineReviewDelete('${result2.unq}','${result2.title }')">삭제</a>
				</div>
			</div>
			
			<c:set var="rownum2" value="${rownum2-1 }"/>
			</c:forEach>
		
		</div>
	</div>
	
	<div style = "text-align:center;margin-top:50px;margin-left:100px;font-size:12px;">
		<c:set var="page_sno2" value="${lineReview2.page_sno2 }"/>
		<%
		int page_sno2 = (int)pageContext.getAttribute("page_sno2");
		pageContext.setAttribute("page_sno2", page_sno2);
		
		if (page_sno2-1 > 0) {
		%>
			<a href = "memberEpilogue.do?page_no2=${page_sno2-1 }">이전</a>
		<%
		}
		%>

		<c:set var="page_eno2" value="${lineReview2.page_eno2 }"/>
		<c:set var="total_page2" value="${lineReview2.total_page2 }"/>
		<%
		int page_eno2 = (int)pageContext.getAttribute("page_eno2");
		int total_page2 = (int)pageContext.getAttribute("total_page2");
		
		if (page_eno2 > total_page2) {
			page_eno2 = total_page2;
		}
		
		pageContext.setAttribute("page_eno2", page_eno2) ;
			%>
		<c:forEach var="i" begin="${lineReview2.page_sno2 }" end="${page_eno2 }">
			<a href = "memberEpilogue.do?page_no2=${i }">${i }</a>
		</c:forEach>
		<%
		if (page_eno2+1 < total_page2) {
		%>
			<a href = "memberEpilogue.do?page_no2=${lineReview2.page_eno2+1 }">다음</a>
		<%
		}
		%>
	</div>
	
	<div style="position:relative;text-align:left;top:60px;">
	
	<span style="font-size:15px;font-weight:bold;margin-left:50px;">관광지 이용 후기</span>
	
		<div style="display:table;position:relative;width:700px;margin-left:50px;top:10px;border-top:2px solid #000000;">
	 		<div style="display:table-row;text-align:center;">
				<div class="membercell1" style="width:5%;">번호</div>
				<div class="membercell1" style="width:20%;">관광지명</div>
				<div class="membercell1" style="width:50%;">내용</div>
				<div class="membercell1" style="width:15%;">작성일</div>
				<div class="membercell1" style="width:5%;">수정</div>
				<div class="membercell1" style="width:5%;">삭제</div>
			</div>
		</div>
	</div>
	
	
	
	</form>
	
	</div>
</div>

</body>
</html>



