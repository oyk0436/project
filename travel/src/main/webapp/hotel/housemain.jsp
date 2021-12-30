<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
</head>
<style>
	.vhousesearch div{
		margin-right:20px;
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
		background: transparent url("../images/transbackground.png") no-repeat left bottom;
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
	$('.right').click(function(){
		if(scrollcnt < 5){
			$('.tophotel'+scrollcnt).css("display","none");
			scrollcnt++;
			
			$('.tophotel'+scrollcnt).css("display","");
		}
	});
});
</script>

<body style="width:100%;">
	<section style="width:100%;height:100%;">
		<div style="width:898px;height:85px;border:1px solid;
			margin:0 auto;background-color:#2c4162;color:white;font-size:16px;font-weight:bold;" class="vhousesearch">
			<div style="float:left;margin-left:10px;">
				<p>목적지</p>
				<input type="text" name="destination" id="destination">
			</div>
			<div style="float:left;">
				<p>체크인</p>
	 			<input type="text" name="checkin" id="checkin">
			</div>
	 		<div style="float:left;">
	 			<p>체크아웃</p>
	 			<input type="text" name="checkout" id="checkout">
	 		</div>	
	 		<div style="margin-top:-2px;margin-right:0px;">
	 			<p>객실 및 인원</p>
	 			<input type="text" name="people" id="people">
	 			<button type="button" style="width:100px;height:35px;">검색</button>
	 		</div> 		
		</div>
		
		<div style="width:898px;height:400px;margin:0 auto;margin-top:40px;position: relative;" class="scrollbar">
		<button class="left" style="position:absolute;top:150px;"><img src="../images/left.png"></button>
		<button class="right" style="position:absolute;top:150px;left:91.6%;"><img src="../images/right.png"></button>
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
							<div class="mainpicback"></div>
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
	 				
	 				<div class="mainpicback" style="border-radius:3%;" OnClick="location.href ='/house.do?areacode=${citylist.areacode}&cityname=${citylist.cityname}'"></div>
	 				
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