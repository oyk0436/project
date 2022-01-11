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
$( function() {
	
	var jeju = document.getElementById("jeju").value;
	
	$("#jeju").click(function(){
		$.ajax({
			type: "post",
			url : "/project/regionDetail.jsp?region1="+jeju,
			dataType : "html",
			success : function(data) {
				$("#regionDetail").html(data);		
			},
			error : function(data) {
				alert("오류발생");
			}	
		});
	});
});
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
	 	
	 	<br><br>
	 	
	 	<div>
	 		<select>
	 			<option value="">지역</option>
	 			<option value="">메뉴</option>
	 		</select>
	 		
	 		<input type = "text" width="100px" height="30px;">
	 		<button type = "button">검색</button>
	 	</div>
	 	
	 	<br><br>
		
		<div style="text-align:left;margin-left:30px;">
		*지역명을 클릭해보세요
		</div>
		
		<form name = "frm" id = "frm" action="regionDetail.jsp">
			<div style="width:200px;float:left;margin-left:20px;">
				<img src = "/images/map/korea.png" width="200px" height="300px">
				<div class="map" style="margin-left:50px;margin-top:-270px;"><button type ="button" id="region1" value="서울" class = "off" onmouseover="this.className='on'" onmouseout="this.className='off'">서울</button></div>
				<div class="map" style="margin-left:60px;margin-top:-240px;"><button type ="button" id="region1" value="경기" class = "off" onmouseover="this.className='on'" onmouseout="this.className='off'">경기</button></div>
				<div class="map" style="margin-left:100px;margin-top:-265px;"><button type ="button" id="region1" value="강원" class = "off" onmouseover="this.className='on'" onmouseout="this.className='off'">강원</button></div>
				<div class="map" style="margin-left:80px;margin-top:-215px;"><button type ="button" id="region1" value="충북" class = "off" onmouseover="this.className='on'" onmouseout="this.className='off'">충북</button></div>
				<div class="map" style="margin-left:40px;margin-top:-190px;"><button type ="button" id="region1" value="충남" class = "off" onmouseover="this.className='on'" onmouseout="this.className='off'">충남</button></div>
				<div class="map" style="margin-left:55px;margin-top:-150px;"><button type ="button" id="region1" value="전북" class = "off" onmouseover="this.className='on'" onmouseout="this.className='off'">전북</button></div>
				<div class="map" style="margin-left:40px;margin-top:-115px;"><button type ="button" id="region1" value="전남" class = "off" onmouseover="this.className='on'" onmouseout="this.className='off'">전남</button></div>
				<div class="map" style="margin-left:120px;margin-top:-180px;"><button type ="button" id="region1" value="경북" class = "off" onmouseover="this.className='on'" onmouseout="this.className='off'">경북</button></div>
				<div class="map" style="margin-left:100px;margin-top:-120px;"><button type ="button" id="region1" value="경남" class = "off" onmouseover="this.className='on'" onmouseout="this.className='off'">경남</button></div>
				<div class="map" style="margin-left:40px;margin-top:-50px;"><button type ="button" id="jeju" value="제주"  class = "off" onmouseover="this.className='on'" onmouseout="this.className='off'">제주</button></div>
			</div>
		</form>
		
		<div style="float:left;padding:10px;width:300px;" id="regionDetail">
		 
		</div>
		
		<div style="clear:left;text-align:left;margin-left:30px;padding:30px;font-size:25px;">
		추천 맛집 리스트 ${vo.title }
		</div>
		
		<div>
 			<c:forEach var="result" items="${list }">
 			
 			<div style="width:35%;height:200px;float:left;margin-left:30px;margin-top:20px;clear:left;">
		 		<c:set var="imgname" value = "${result.title }"/>
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
				%>" style = "width:250px;height:180px;">
		 	</div>
		 	
 			<div style="width:80px;height:50px;float:left;margin-left:15px;margin-top:20px;">
		 		<c:set var="imgname" value = "${result.title }"/>
		 		<img src = "/images/restaurant/<% 
					String imgname1 = (String) pageContext.getAttribute("imgname");
					imgname1 = imgname1 + "1";								
					String path1 ="c:/Users/gram/Desktop/eGovFrameDev-3.10.0-64bit/workspace/mywork1/src/main/webapp/images/restaurant";
					File dir1 = new File(path1);
					File[] names1 = dir1.listFiles();
					
					for (int i = 0; i < names1.length; i++) {
						if (names1[i].getName().contains(imgname1) == true) {
					%>
						<%=names1[i].getName()%>
					<%
						}
					}
				%>" style = "width:80px;height:50px;">
		 	</div>
		 	
		 	<div style="width:80px;height:50px;float:left;margin-left:-80px;margin-top:85px;">
		 		<c:set var="imgname" value = "${result.title }"/>
		 		<img src = "/images/restaurant/<% 
					String imgname2 = (String) pageContext.getAttribute("imgname");
					imgname2 = imgname2 + "2";								
					String path2 ="c:/Users/gram/Desktop/eGovFrameDev-3.10.0-64bit/workspace/mywork1/src/main/webapp/images/restaurant";
					File dir2 = new File(path2);
					File[] names2 = dir2.listFiles();
					
					for (int i = 0; i < names2.length; i++) {
						if (names2[i].getName().contains(imgname2) == true) {
					%>
						<%=names2[i].getName()%>
					<%
						}
					}
				%>" style = "width:80px;height:50px;">
		 	</div>
		 	
		 	<div style="width:80px;height:50px;float:left;margin-left:-80px;margin-top:150px;">
		 		<c:set var="imgname" value = "${result.title }"/>
		 		<img src = "/images/restaurant/<% 
					String imgname3 = (String) pageContext.getAttribute("imgname");
					imgname3 = imgname3 + "3";								
					String path3 ="c:/Users/gram/Desktop/eGovFrameDev-3.10.0-64bit/workspace/mywork1/src/main/webapp/images/restaurant";
					File dir3 = new File(path3);
					File[] names3 = dir3.listFiles();
					
					for (int i = 0; i < names3.length; i++) {
						if (names3[i].getName().contains(imgname3) == true) {
					%>
						<%=names3[i].getName()%>
					<%
						}
					}
				%>" style = "width:80px;height:50px;">
		 	</div>
		 	
		 	</c:forEach>
 		
 		</div>
	 	
	</div>
	
</div>

</body>
</html>



