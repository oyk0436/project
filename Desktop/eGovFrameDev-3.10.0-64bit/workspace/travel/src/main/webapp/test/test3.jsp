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
	width:1500px;height:2000px;
}
header {
	font-size:25px;font-weight:bold;width:1000px;height:100px;background-color:#ffcf6a;text-align:center;line-height:4.0;
}
.div1 {
	width:200px;height:2000px;background-color:#ffffcc;text-align:center;padding-top:20px;float:left;
}

.div2 {
	width:800px;height:2000px;text-align:center;padding-top:20px;float:left;background-color:rgb(255, 255, 255);
}

dt {
	float:left;margin-right:20px;font-size:11px;font-weight:bold;
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

</style>

<script>

function btn_lineReview() {
	
	var title = document.getElementById("title").value;
	
	var url = "restaurantLineReview.do?title="+title;
	var p_width = 500;
	var p_height = 400;
	var s_width = (window.screen.width/2) - (p_width/2);
	var s_height = (window.screen.height/2) - (p_height);
	window.open(url,"popup","width="+p_width+",height="+p_height+",resizable=yes,left="+s_width+",top="+s_height);
}

</script>

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
	 				  font-size:30px;">
	 		${vo.title }
	 	</div>
	 	
	 	<div style="width:48%;height:200px;float:left;margin-left:10px;margin-top:20px;">
	 		<c:set var="imgname" value = "${vo.title }"/>
	 		<img src = "/images/restaurant/<% 
				String imgname = (String) pageContext.getAttribute("imgname");
				imgname = imgname + "1";								
				String path ="c:/Users/gram/Desktop/eGovFrameDev-3.10.0-64bit/workspace/mywork1/src/main/webapp/images/restaurant";
				File dir = new File(path);
				File[] names = dir.listFiles();
				
				for (int i = 0; i < names.length; i++) {
					if (names[i].getName().contains(imgname) == true) {
				%>
					<%=names[i].getName()%>
				<%
					}
				}
			%>" style = "width:300px;height:180px;">
	 	</div>
	 	
	 	<div style="display:table;position:relative;width:700px;width:45%;float:left;">
	 		<div style=";display:table-row;text-align:center;">
				<div class="cell1">상호명</div>
				<div class="cell2">${vo.title }</div>
			</div>
			<div style=";display:table-row;text-align:center;">
				<div class="cell1">주소</div>
				<div class="cell2">${vo.address }</div>
			</div>
			<div style=";display:table-row;text-align:center;">
				<div class="cell1">문의전화</div>
				<div class="cell2">${vo.telephone }</div>
			</div>
			<div style=";display:table-row;text-align:center;">
				<div class="cell1">대표 메뉴</div>
				<div class="cell2">${vo.topmenu }</div>
			</div>
			<div style=";display:table-row;text-align:center;">
				<div class="cell1">평점</div>
				<div class="cell2">${vo.grade }</div>
			</div>
	 	</div>
	 	<div style="clear:left;top:20px;"></div>
	 	<div style = "text-align:left;
 				  	  margin-left:30px;
 				 	  margin-top:50px;
 					  font-weight:bold;
 					  font-size:12px;
 					  clear:left;">
 			상세보기
 		</div>
 		
 		<div style="display:table;position:relative;width:700px;left:50px;top:20px;">
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
			<div style=";display:table-row;text-align:center;">
				<div class="cell1">소개</div>
				<div class="cell2">${vo.summary }</div>
			</div>		
 		</div>
		
		<div style = "text-align:left;
 				  	  margin-left:30px;
 				 	  margin-top:100px;
 					  font-weight:bold;
 					  font-size:12px;
 					  ">
 			한줄 리뷰 & 평가
 		</div>
 		
 		<input type = "hidden" id = "title" value="${vo.title }">
 		
 		<div style="float:right;margin-right:60px;">
			<button type = "button" id = "btn_lineReview" onclick = "btn_lineReview()">평가하기</button>
		</div>
 		
 		<div>
 			<div style="display:table;position:relative;width:700px;left:50px;top:20px;">
		 		<div style="display:table-row;text-align:center;margin-bottom:10px;">
					<div class="cell1" style="width:*%;border:none;">한줄 평가</div>
					<div class="cell1" style="width:10%;border:none;">글쓴이</div>
					<div class="cell1" style="width:20%;border:none;">작성일</div>
					<div class="cell1" style="width:10%;border:none;">평점</div>
				</div>
				
				<c:set var="rownum" value="${lineReview.rownum }"/>
				
				<c:forEach var = "result" items = "${list }">		
					<div style=";display:table-row;text-align:center;">
						<div class="cell3" style="width:55%;text-align:left;padding:2px;">${result.content }</div>
						<div class="cell3" style="width:10%;">${result.name }</div>
						<div class="cell3" style="width:15%;">${result.rdate }</div>
						<div class="cell3" style="width:10%;">${result.grade }</div>
					</div>
					
					<c:set var="rownum" value="${rownum-1 }"/>
				</c:forEach>
			</div>
 		</div>
 		
 		<div style = "margin-top:5px;text-align:center;margin-top:50px;">
			<c:forEach var="i" begin="1" end="${lineReview.total_page }">
				<a href = "restaurantDetail.do?page_no=${i }&unq=${vo.unq }&title=${vo.title }">${i }</a>
			</c:forEach>
		</div>
 		
 		<div style = "text-align:left;
 				  	  margin-left:30px;
 				 	  margin-top:50px;
 					  font-weight:bold;
 					  font-size:12px;
 					  position:relative;
 					  ">
 			찾아가는 길
 		</div>
 		
 		
	</div>

</div>

</body>
</html>



