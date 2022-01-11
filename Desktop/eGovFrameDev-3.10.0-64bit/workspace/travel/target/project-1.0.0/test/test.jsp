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
	
	<!-- <link rel="stylesheet" href="/css/admin_layout.css"> -->
	<link rel="stylesheet" href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
	
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
		 
</head>

<style>
body {
	font-size:10px;
}
.container {
	width:1200px;height:1000px;
}
.div1 {
	width:200px;height:1000px;background-color:#ffffcc;text-align:center;padding-top:20px;float:left;
}

.div2 {
	width:700px;height:1000px;text-align:center;padding-top:20px;float:left;background-color:rgb(255, 255, 255);
}

dt {
	float:left;margin-right:20px;font-size:11px;font-weight:bold;
}

.cell1 {
	border-bottom:1px solid #ccc;display:table-cell;vertical-align:middle;height:30px;width:100px;font-size:14px;font-weight:bold;
}
.cell2 {
	border-bottom:1px solid #ccc;display:table-cell;vertical-align:middle;height:30px;text-align:left;padding:15px;
}

</style>

<body>

<div class="container">

<header>
 맛집 화면
</header>

<div class = "div1">

</div>

	<div class = "div2">
		
		<div style="width:90%;
		  			margin-left:30px;
		  			margin-top:3px;
		  			text-align:left;
		  			font-weight:bold;
		  			font-size:12px;">
			<a href = "">지역별 맛집</a> &nbsp;&nbsp;&nbsp;
			<a href = "">제철 맛집</a>
	 	</div>
	 	
	 	<div style = "text-align:left;
	 				  margin-left:100px;
	 				  margin-top:20px;
	 				  font-weight:bold;
	 				  font-size:25px;">
	 		title
	 	</div>
	 	
	 	<div style="width:45%;height:200px;float:left;margin-left:40px;margin-top:20px;">
	 		<img src = "/images/restaurant/고이정1.jpg" style = "width:280px;height:180px;">
	 	</div>
	 	
	 	<div style="width:45%;height:200px;float:left;text-align:left;margin-top:20px;">
	 		<ul style="list-style:none;text-align:left;font-size:13px;">
		 		<li>
		 			<dl>
		 				<dt style="font-size:15px;">상호명  </dt>
		 				<dd>${vo.title }</dd>
		 			</dl>
		 		</li>
		 		<li>
		 			<dl>
		 				<dt style="font-size:15px;">주소  </dt>
		 				<dd>${vo.address }</dd>
		 			</dl>
		 		</li>
		 		<li>
		 			<dl>
		 				<dt style="font-size:15px;">문의 전화</dt>
		 				<dd>${vo.telephone }</dd>
		 			</dl>
		 		</li>
		 		<li>
		 			<dl>
		 				<dt style="font-size:15px;">대표 메뉴  </dt>
		 				<dd>${vo.topmenu }</dd>
		 			</dl>
		 		</li>
		 		<li>
		 			<dl>
		 				<dt style="font-size:15px;">평점  </dt>
		 				<dd>1</dd>
		 			</dl>
		 		</li>
	 		</ul>
	 	</div>
	 	<div style="clear:left;top:20px;"></div>
	 	<div style = "text-align:left;
 				  	  margin-left:30px;
 				 	  margin-top:50px;
 					  font-weight:bold;
 					  font-size:12px;
 					  clear:left;">
 			상세보기1
 		</div>
 		
 		<div style="display:table;position:relative;width:600px;left:50px;top:30px;">
	 		<div style=";display:table-row;text-align:center;">
				<div class="cell1">영업 시간</div>
				<div class="cell2">${vo.availiabletime }</div>
			</div>
			<div style=";display:table-row;text-align:center;">
				<div class="cell1">휴무</div>
				<div class="cell2">${vo.closed }</div>
			</div>
			<div style=";display:table-row;text-align:center;">
				<div class="cell1">메뉴</div>
				<div class="cell2">${vo.menu }</div>
			</div>
			<div style=";display:table-row;text-align:center;">
				<div class="cell1">배달/포장</div>
				<div class="cell2">${vo.packaging }</div>
			</div>
			<div style=";display:table-row;text-align:center;">
				<div class="cell1">놀이방</div>
				<div class="cell2">${vo.child }</div>
			</div>
			<div style=";display:table-row;text-align:center;">
				<div class="cell1">금연석</div>
				<div class="cell2">${vo.smoking }</div>
			</div>
			<div style=";display:table-row;text-align:center;">
				<div class="cell1">주차</div>
				<div class="cell2">${vo.parking }</div>
			</div>
			<div style=";display:table-row;text-align:center;">
				<div class="cell1">기타시설</div>
				<div class="cell2">${vo.information }</div>
			</div>	
 		</div>
		
		<div style = "text-align:left;
 				  	  margin-left:30px;
 				 	  margin-top:100px;
 					  font-weight:bold;
 					  font-size:12px;
 					  clear:left;">
 			리뷰&평가
 		</div>
 		
 		
 		
 		<div style = "text-align:left;
 				  	  margin-left:30px;
 				 	  margin-top:20px;
 					  font-weight:bold;
 					  font-size:12px;
 					  clear:left;">
 			찾아가는 길
 		</div>
 		
 		<div style="display:table;position:relative;width:600px;left:50px;top:30px;">
			<div style = "display:table-row; text-align:center;">
				<div style="display:table-cell;vertical-align:middle;border:1px solid #ccc;height:30px;width:15%;background:#a7affa;">신규 확진자수</div>
				
				<div style="display:table-cell;vertical-align:middle;border:1px solid #ccc;border-left:none;height:30px;background:#a7affa;">기준 일시</div>
			</div>
 		</div>
	</div>

</div>

</body>
</html>



