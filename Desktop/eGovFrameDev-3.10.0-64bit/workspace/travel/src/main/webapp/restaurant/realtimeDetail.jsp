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
body {
	font-size:10px;
}
.container {
	width:1000px;height:1000px;margin:0 auto;
}
header {
	font-size:25px;font-weight:bold;width:1000px;height:100px;background-color:#ffcf6a;text-align:center;line-height:4.0;clear:right;
}
.buttonMap {
	border:none;background-image:url(images/map/mapMouseout.png);background-size:38px 20px;width:38px;height:20px;text-align:center;font-size:small;
}
button.on {
	border:none;background-image:url(images/map/mapMouseover.png);background-size:38px 20px;width:38px;height:20px;text-align:center;font-size:small;color:#ffffff;
}
button.off {
	border:none;background-image:url(images/map/mapMouseout.png);background-size:38px 20px;width:38px;height:20px;text-align:center;font-size:small;
}
div.map {
	position:absolute;font-color:#ffffff;
}
.cell1 {
	border-bottom:1px solid #ccc;display:table-cell;vertical-align:middle;height:20px;width:25%;font-size:14px;font-weight:bold;background-color:#cccc99;
}
.cell2 {
	border-bottom:1px solid #ccc;display:table-cell;vertical-align:middle;height:20px;text-align:left;padding:15px;
}
.cell3 {
	border-bottom:1px solid #ccc;display:table-cell;vertical-align:middle;height:30px;width:25%;
}
</style>

<script>

</script>

<%@include file="mapScript2" %>

<body>

<div class="container">
	<%@include file="/include/top1.jsp" %>
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
			<a href = "restaurantMain.do">지역별 맛집</a> &nbsp;&nbsp;&nbsp;
			<a href = "">제철 맛집</a>
	 	</div>
	 	
	 	<br><br>
	 	
	 	<form name = "frm" method = "post" action = "recommendDetail.do">
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
		
		<form id = "frm">
			<div style="width:200px;float:left;margin-left:20px;">
				<img src = "images/map/korea.png" width="200px" height="300px">
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
		
		<div style="float:left;padding:0px;width:300px;">
			<%@include file="covid3.jsp" %>
		</div>
		<div style="float:left;margin-left:-250px;margin-top:120px;padding:0px;width:300px;" id="regionDetail">
			
		</div>
		
		<div style="clear:left;width:90%;text-align:left;margin-left:30px;padding:10px;font-size:20px;border-top:1px solid #000000;font-weight:bold;">
		<span style="font-size:18px;color:#ff6666;">${vo.s_text }${vo.regionDetail }</span> <span style="font-size:18px;">실시간 인기 맛집 리스트</span>
		</div>
		
		<div>
 			
 			<c:set var="number" value="1"/>
 			
 			<c:forEach var="result" items="${list }">
 			
 			<div style="width:35%;height:200px;float:left;margin-left:30px;margin-top:0px;clear:left;">
		 		<img id = "bigImg${number }" 
		 			 src = "images/restaurant/${result.title }1.jpg"
		 			 onerror="this.src='images/error/errorImg.jpg'" 
		 			 style = "width:250px;height:180px;">
		 	</div>
		 	
 			<div style="width:80px;height:50px;float:left;margin-left:-10px;margin-top:0px;">
		 		<a href = "javscrip:;">
		 			<img id = "smallImg1" 
		 				 onmouseover = "document.getElementById('bigImg${number }').src ='images/restaurant/${result.title }1.jpg'"
		 				 onmouseout = "document.getElementById('bigImg${number }').src ='images/restaurant/${result.title }1.jpg'" 
		 				 src = "images/restaurant/${result.title }1.jpg" 
		 				 onerror="this.src='images/error/errorImg.jpg'"
		 				 style = "width:80px;height:50px;">
		 		</a>
		 	</div>
		 	
		 	<div style="width:80px;height:50px;float:left;margin-left:-80px;margin-top:65px;">
		 		<a href = "javscrip:;">
		 			<img id = "smallImg2${number }" 
		 				 onmouseover = "document.getElementById('bigImg${number }').src ='images/restaurant/${result.title }2.jpg'" 
		 				 onmouseout = "document.getElementById('bigImg${number }').src ='images/restaurant/${result.title }1.jpg'"
		 				 src = "images/restaurant/${result.title }2.jpg" 
		 				 onerror="this.src='images/error/errorImg.jpg'"
		 				 style = "width:80px;height:50px;">
		 		</a>
		 	</div>
		 	
		 	<div style="width:80px;height:50px;float:left;margin-left:-80px;margin-top:130px;">
		 		<a href = "javscrip:;">
		 			<img id = "smallImg3${number }" 
		 				 onmouseover = "document.getElementById('bigImg${number }').src ='images/restaurant/${result.title }3.jpg'" 
		 				 onmouseout = "document.getElementById('bigImg${number }').src ='images/restaurant/${result.title }1.jpg'"
		 				 src = "images/restaurant/${result.title }3.jpg" 
		 				 onerror="this.src='images/error/errorImg.jpg'"
		 				 style = "width:80px;height:50px;">
		 		</a>
		 	</div>
			
			<div style="width:300px;height:180px;float:left;margin-left:80px;margin-top:0px;text-align:left;">
 				<p style="font-size:15px;">상호명 : ${result.title } 
 					<a href = "restaurantDetail.do?unq=${result.unq }">
 						<span style="font-size:10px;color:#cc00ff;">*자세히 보기</span>
 					</a>
 				</p> 
 				<p style="font-size:12px;">대표 메뉴 : ${result.topmenu }</p>
 				<p style="font-size:12px;">주소 : ${result.address }</p>
 				<p style="font-size:12px;">전화 : ${result.telephone }</p>
 				<p style="font-size:12px;">조회수 : ${result.hits }</p>
 			</div>
 				 	
 			<c:set var="number" value="${number+1 }"/>
 			
		 	</c:forEach>
 	
 		</div>
	 	
	 	<div style = "margin-top:5px;text-align:center;margin-top:30px;font-size:15px;padding:20px;clear:left;">
 			<c:set var="page_sno" value="${vo.page_sno }"/>
 			<%
 			int page_sno = (int)pageContext.getAttribute("page_sno");
 			pageContext.setAttribute("page_sno", page_sno);
 			
 			if (page_sno-1 > 0) {
 			%>
 				<a href = "realtimeDetail.do?page_no=${page_sno-1 }">이전</a>
 			<%
 			}
 			%>
 
 			<c:set var="page_eno" value="${vo.page_eno }"/>
 			<c:set var="total_page" value="${vo.total_page }"/>
 			<%
 			int page_eno = (int)pageContext.getAttribute("page_eno");
 			int total_page = (int)pageContext.getAttribute("total_page");
 			
			if (page_eno > total_page) {
				page_eno = total_page;
			}
			
			pageContext.setAttribute("page_eno", page_eno) ;
 			%>
			<c:forEach var="i" begin="${vo.page_sno }" end="${page_eno }">
				<a href = "realtimeDetail.do?page_no=${i }">${i }</a>
			</c:forEach>
			<%
			if (page_eno+1 < total_page) {
			%>
				<a href = "realtimeDetail.do?page_no=${vo.page_eno+1 }">다음</a>
			<%
			}
			%>
		</div>
	 	
	</div>
	
</div>

</body>
</html>



