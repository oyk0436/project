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
	font-size:25px;font-weight:bold;width:1000px;height:100px;background-color:#ffcf6a;text-align:center;line-height:4.0;clear:right;
}
a {
	text-decoration:none;color:#000000;
}

</style>

<script>

</script>

<%@include file="mapScript1" %>

<body>

<div class="container" style="margin:0 auto;">

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
			<a href = "restaurant.do">지역별 맛집</a> &nbsp;&nbsp;&nbsp;
			<a href = "">제철 맛집</a>
	 	</div>
	 	
	 	<br><br>
	 	
	 	<form name = "frm" method = "post" action = "restaurant.do">
		 	<div style="margin-left:250px;width:500px;">
		 		<select name = "s_field">
		 			<option value="address" <c:if test="${s_field=='address' }">selected</c:if>>지역</option>
		 			<option value="menu" <c:if test="${s_field=='menu' }">selected</c:if>>메뉴</option>
		 		</select>
		 		
		 		<input type = "text" name = "s_text" value = "${vo.s_text }" width="100px" height="30px">
		 		<button type = "submit">검색</button>
		 	</div>
	 	</form>
	 	
	 	<br><br>
		
		<div style="text-align:left;margin-left:30px;">
		*지역명을 클릭해보세요
		</div>
		
		<form id = "frm">
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
		
		<div style="float:left;padding:0px;width:300px;">
			<%@include file="covid1.jsp" %>
		</div>
		<div style="float:left;margin-left:-250px;margin-top:120px;padding:0px;width:300px;" id="regionDetail">
			
		</div>
		
		<div style="width:90%;
		  			margin-left:30px;
		  			margin-top:3px;
		  			text-align:left;
		  			font-weight:bold;
		  			font-size:12px;
		  			height:200px;
		  			border-top:1px solid #000000;
		  			padding:10px;
		  			clear:left;">
			<span style="font-size:18px;color:#ff6666;">${vo.s_text }${vo.regionDetail }</span> <span style="font-size:18px;">추천 맛집</span> <br>
			
			<div style="float:right;">
				<a href = "recommendDetail.do">더보기</a>
			</div>
			
			<div style="display:table-row;text-align:center;">
				<c:forEach var="result1" items = "${list1 }">
					<div style="display:table-cell;width:40%;padding:10px;">
						<a href = "restaurantDetail.do?unq=${result1.unq }">
							<img src = "../images/restaurant/${result1.title }1.jpg" width="250px" height="150px"> <br>
							<span style="font-size:18px;">${result1.title }</span><br>
							메뉴 : ${result1.topmenu } <br>
						</a>
					</div>
				</c:forEach>
			</div>
			
	 	</div>
	 	
	 	<div style="width:90%;
		  			margin-left:30px;
		  			margin-top:70px;
		  			text-align:left;
		  			font-weight:bold;
		  			font-size:12px;
		  			height:200px;
		  			border-top:1px solid #000000;
		  			padding:10px;">
			<span style="font-size:18px;color:#ff6666;">${vo.s_text }${vo.regionDetail }</span> <span style="font-size:18px;">실시간 인기 맛집 </span><br>
			
			<div style="float:right;">
				<a href = "realtimeDetail.do">더보기</a>
			</div>
			
			<div style="display:table-row;text-align:center;">
				<c:forEach var="result2" items = "${list2 }">
					<div style="display:table-cell;width:40%;padding:10px;">
						<a href = "restaurantDetail.do?unq=${result2.unq }">
							<img src = "/images/restaurant/${result2.title }1.jpg" width="250px" height="150px"> <br>
							<span style="font-size:18px;">${result2.title }</span> <br>
							메뉴 : ${result2.topmenu } <br> 
						</a>
					</div>
				</c:forEach>
			</div>
	 	</div>
	 	
	 	<div style="width:90%;
		  			margin-left:30px;
		  			margin-top:70px;
		  			text-align:left;
		  			font-weight:bold;
		  			font-size:12px;
		  			border-top:1px solid #000000;
		  			padding:10px;
		  			position:relative;">
			<span style="font-size:18px;color:#ff6666;">${vo.s_text }${vo.regionDetail }</span> <span style="font-size:18px;">음식점 전체 목록</span> <br>
		</div>
		
		<div>
			<div style="display:table;position:relative;width:800px;margin:0 auto;top:20px;">
		 		<div style="display:table-row;text-align:center;margin-bottom:10px;background:#ffffcc;">
					<div class="cell1" style="width:5%;border:none;">번호</div>
					<div class="cell1" style="width:10%;border:none;"></div>
					<div class="cell1" style="width:15%;border:none;text-align:left;">상호</div>
					<div class="cell1" style="width:15%;border:none;">대표메뉴</div>
					<div class="cell1" style="width:25%;border:none;">지역</div>
				</div>
				
				<c:set var="rownum" value="${vo.rownum }"/>
				
				<c:forEach var = "result3" items = "${list3 }">	
				
				<c:set var="address" value = "${result3.address }"/>
				<% 
				String address = (String) pageContext.getAttribute("address");
				address = address.split(" ")[0] + " " + address.split(" ")[1];
				%>
				<div style="display:table-row;text-align:center;margin-bottom:10px;">
					<div class="cell3" style="width:5%;border:none;">${rownum }</div>
					<div class="cell3" style="width:10%;border:none;padding:5px;">
						<a href = "restaurantDetail.do?unq=${result3.unq }">
							<img src = "/images/restaurant/${result3.title }1.jpg" width="50px" height="50px">
						</a>
					</div>
					<div class="cell1" style="width:15%;border:none;text-align:left;">${result3.title }</div>
					<div class="cell3" style="width:15%;border:none;">${result3.topmenu }</div>
					<div class="cell3" style="width:25%;border:none;"><%=address %></div>
				</div>
				
				<c:set var="rownum" value="${rownum-1 }"/>
				
				</c:forEach>
			</div>
			
	 	</div>
	 	
	 	<div style = "margin-top:5px;text-align:center;margin-top:30px;font-size:15px;padding:20px;">
 			<c:set var="page_sno" value="${vo.page_sno }"/>
 			<%
 			int page_sno = (int)pageContext.getAttribute("page_sno");
 			pageContext.setAttribute("page_sno", page_sno);
 			
 			if (page_sno-1 > 0) {
 			%>
 				<a href = "restaurant.do?page_no=${page_sno-1 }">이전</a>
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
				<a href = "restaurant.do?page_no=${i }">${i }</a>
			</c:forEach>
			<%
			if (page_eno+1 < total_page) {
			%>
				<a href = "restaurant.do?page_no=${vo.page_eno+1 }">다음</a>
			<%
			}
			%>
		</div>
	 	
	</div>
	
</div>

</body>
</html>



