<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>숙박메인</title>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script src="../include/jqueryui"></script>
</head>
<style>
	.vhousesearch{
		width:898px;
		height:85px;
		border:1px solid;
		margin:0 auto;
		background-color:#2c4162;
		color:white;
		font-size:16px;
		font-weight:bold;
	}
	.vhousesearch div{
		margin-right:50px;
	}
	p{
		margin-bottom:2px;
	}
	input{
		height:28px;
	}
	.mainpic{
		border-radius:5px;
		z-index:-1;
	}
	.mainpicback{
		width:100%;
		height:100%;
		position:absolute;
		background: transparent url("images/transbackground.png") no-repeat left bottom;
		background-size: 100% 100%;
		border-radius:5px;
		opacity:0.3;
	}
	.scrollbar button{
	background-color:transparent;
	border:0px;
	z-index: 2;
	}
</style>

<script>

$(function(){
	
	var scrollcnt=1;
	$('.tophotel1').css("display");
	$('.tophotel2').css("display","none");
	$('.tophotel3').css("display","none");
	$('.tophotel4').css("display","none");
	$('.tophotel5').css("display","none");
	var pic=$('.scrollbar').find('a').length;
	
	$('.left').click(function(){
		if(scrollcnt > 1){
			$('.tophotel'+scrollcnt).css("display","none");
			scrollcnt--;
			$('.tophotel'+scrollcnt).css("display","");
		}
	});
	$(".right").click(function(){
		if(scrollcnt < 5){
			$('.tophotel'+scrollcnt).css("display","none");
			scrollcnt++;
			$('.tophotel'+scrollcnt).css("display","");
		}
	});
	$("#picker1").datepicker({ minDate: 0}); 
	$("#picker2").datepicker();
	
	$('#picker1').change(function() {
		var date1=Date.parse($("#picker1").val());
		var date2=Date.parse($("#picker2").val());

		var curDate = $("#picker1").datepicker("getDate"); 
		curDate.setDate( curDate.getDate() + 1 );
		$("#picker2").datepicker("option", "minDate", curDate);
	});
});
function housefind(){
	var keyword=document.getElementById("destination").value;
	var date1;
	var date2;
	var day;
	
	if($("#picker1").val() != "" && $("#picker2").val() != ""){
		date3=Date.parse($("#picker1").val());
		date4=Date.parse($("#picker2").val());
		day=(date4-date3)/(3600*24*1000);
		location.href='/house.do?page_no=1&day='+day+'&chkin='+$("#picker1").val()+'&chkout='+$("#picker1").val()+'&search='+encodeURI(keyword,"UTF-8");
	}else location.href='/house.do?page_no=1&search='+encodeURI(keyword,"UTF-8"); // get 방식에서 한글이 깨져서 전달 되던 것을 encodeURI(keyword,"UTF-8") 로 교쳐서 보냄
}

</script>

<body style="width:100%;">
	<%@include file="../include/top.jsp" %>
	<section style="width:100%;height:100%;">
		<div class="vhousesearch">
			<div style="float:left;margin-left:40px;">
				<p>목적지</p>
				<input type="text" name="destination" id="destination">
			</div>
			<div style="float:left;">
				<p>체크인</p>
	 			<input type="text" name="picker1" id="picker1" value="">
			</div>
	 		<div style="float:left;">
	 			<p>체크아웃</p>
	 			<input type="text" name="picker2" id="picker2" value="">
	 		</div>	
	 		<div style="float:left;margin-top:38px;margin-right:0px;">
	 			<button type="button" style="width:100px;height:35px;" onclick="housefind()">검색</button>
	 		</div> 		
		</div>
		
		<div style="width:898px;height:400px;margin:0 auto;margin-top:40px;position: relative;" class="scrollbar">
		<button class="left" style="position:absolute;top:150px;"><img src="images/left.png"></button>
		<button type="button" onclick="right()" class="right" name="right" id="right" style="position:absolute;top:150px;left:91.6%;"><img src="images/right.png"></button>
		<c:set var="i" value="1"/>
			<c:forEach var="list" items="${list}">
				<c:choose>
					<c:when test="${i eq '1'}">
						<div class="tophotel${i}">
							<div class="mainpicback" onclick="location.href='houseDetail.do?contentid=${list.contentid}&contenttypeid=${list.contenttypeid}'"></div>
					 		<a style="position:absolute;top:15px;left:15px;font-size:22px;font-weight:bold;color:white;">${list.title}</a>
					 		<img src="${list.firstimage}" style="width:898px;height:400px;" class="mainpic">
					 		<c:set var="i" value="${i+1}"/>
				 		</div>
			 		</c:when>
			 		<c:otherwise>
			 			<div class="tophotel${i}" style="display:none;">
							<div class="mainpicback" onclick="location.href='houseDetail.do?contentid=${list.contentid}&contenttypeid=${list.contenttypeid}'"></div>
					 		<a style="position:absolute;top:15px;left:15px;font-size:22px;font-weight:bold;color:white;">${list.title}</a>
					 		<img src="${list.firstimage}" style="width:898px;height:400px;" class="mainpic">
					 		<c:set var="i" value="${i+1}"/>
				 		</div>
			 		</c:otherwise>
		 		</c:choose>
	 		</c:forEach>
	 	</div>
	 	<div style="width:898px;padding-left:40px;margin:0 auto;margin-top:40px;">
	 		<c:forEach var="citylist" items="${citylist}">
	 			<div style="width:47%;margin-top:20px;margin-right:20px;float:left;position:relative;">
	 				
	 				<div class="mainpicback" style="border-radius:3%;" OnClick="location.href ='/travel/house.do?search=${citylist.cityname}&page_no=1'"></div>
	 				
	 				<p style="position:absolute;left:5px;color:white;font-weight:bold;">
	 					${citylist.cityname}<br>${citylist.totalcnt}개
	 				</p>
	 				<img src="${citylist.firstimage}" style="width:100%;height:150px;border-radius:3%;">
	 			</div>
	 		</c:forEach>
	 	</div>
	</section>
</body>
</html>