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

body {
	font-size:10px;
}
.container {
	width:1000px;height:2000px;margin:0 auto;
}
.div1 {
	width:200px;height:200px;background-color:#ffffcc;text-align:center;padding-top:20px;float:left;
}
.div2 {
	margin:0 auto;width:900px;height:1000px;text-align:center;padding-top:20px;float:left;background-color:rgb(255, 255, 255);
}
.div_button {
	width:700px;text-align:center;margin-top:10px;
}
header {
	font-size:25px;font-weight:bold;width:1000px;height:100px;background-color:#ffcf6a;text-align:center;line-height:4.0;
}
.table1 {
	width:600px;border:1px solid #ccc;border-collapse:collapse;
}
a {
	text-decoration:none;color:#000000;
}
th {
	padding:5px;border:1px solid #ccc;
}
td {
	padding:5px;border:1px solid #ccc;text-align:center;
}
.td1 {
	text-align:center;padding:5px;
}
</style>

<%@include file="/restaurant/mapScript1" %>

<body>

<div class="container" style="margin:0 auto;">

<header>
 맛집 화면
</header>

	<div class = "div2">
		
		<div style="width:90%;
		  			margin-left:30px;
		  			margin-top:3px;
		  			text-align:left;
		  			font-weight:bold;
		  			font-size:12px;">
			<a href = "restaurant.do">지역별 맛집</a> &nbsp;&nbsp;&nbsp;
			<a href = "">제철 맛집</a>
	 	</div>
	 	
	 	<br><br>
	 	
	 	<form name = "frm" method = "post">
		 	<div style="margin-left:250px;width:500px;">
		 		<select name = "s_field">
		 			<option value="address" <c:if test="${s_field=='address' }">selected</c:if>>지역</option>
		 			<option value="menu" <c:if test="${s_field=='menu' }">selected</c:if>>메뉴</option>
		 		</select>
		 		
		 		<input type = "text" name = "s_text" width="100px" height="30px">
		 		<button type = "submit">검색</button>
		 	</div>
	 	</form>
	 	
	 	<br><br>
		
		<div style="text-align:left;margin-left:30px;">
		*지역명을 클릭해보세요
		</div>
		
		<form name = "frm" id = "frm">
			<div style="width:200px;float:left;margin-left:20px;">
				<img src = "/images/map/korea.png" width="200px" height="300px">
				<div class="map" style="margin-left:50px;margin-top:-270px;"><button type ="button" id="seoul" value="서울" class = "off" onmouseover="this.className='on'" onmouseout="this.className='off'">서울</button></div>
				<div class="map" style="margin-left:60px;margin-top:-240px;"><button type ="button" id="gyeonggi" value="경기" class = "off" onmouseover="this.className='on'" onmouseout="this.className='off'">경기</button></div>
				<div class="map" style="margin-left:100px;margin-top:-265px;"><button type ="button" id="gangwon" value="강원" class = "off" onmouseover="this.className='on'" onmouseout="this.className='off'">강원</button></div>
				<div class="map" style="margin-left:80px;margin-top:-215px;"><button type ="button" id="chungbuk" value="충복" class = "off" onmouseover="this.className='on'" onmouseout="this.className='off'">충북</button></div>
				<div class="map" style="margin-left:40px;margin-top:-190px;"><button type ="button" id="chungnam" value="충남" class = "off" onmouseover="this.className='on'" onmouseout="this.className='off'">충남</button></div>
				<div class="map" style="margin-left:55px;margin-top:-150px;"><button type ="button" id="jeongbuk" value="전북" class = "off" onmouseover="this.className='on'" onmouseout="this.className='off'">전북</button></div>
				<div class="map" style="margin-left:40px;margin-top:-115px;"><button type ="button" id="jeonnam" value="전남" class = "off" onmouseover="this.className='on'" onmouseout="this.className='off'">전남</button></div>
				<div class="map" style="margin-left:120px;margin-top:-180px;"><button type ="button" id="gyeongbuk" value="경북" class = "off" onmouseover="this.className='on'" onmouseout="this.className='off'">경북</button></div>
				<div class="map" style="margin-left:100px;margin-top:-120px;"><button type ="button" id="gyeongnam" value="경남" class = "off" onmouseover="this.className='on'" onmouseout="this.className='off'">경남</button></div>
				<div class="map" style="margin-left:40px;margin-top:-50px;"><button type ="button" name = "jeju" id="jeju" value="제주"  class = "off" onmouseover="this.className='on'" onmouseout="this.className='off'">제주</button></div>
			</div>
		</form>
		<div style="float:left;padding:0px;width:300px;" id="regionDetail">
			
		</div>
		
	 	
	</div>
	
</div>

</body>
</html>



