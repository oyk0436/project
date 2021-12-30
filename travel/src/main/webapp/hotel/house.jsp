<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<style>
	

	body{
		width:98%;
	}
	.section1{
		width:14%;max-width:235px;float:left;
	}
	.section2{
		width:84%;float:left;margin-left:15px;
	}
	
	.filter{
		margin-top:40px;
		width:100%;
		height:270px;
		float:left;
	}
	.filterline{
		border-bottom:1px solid;
		border-color:#808080;
		width:100%;
		padding-bottom:10px;
	}
	.filter input{
		margin-top:10px;
	}
	
	 @media (max-width: 594px){
	 	.section1{
	 		width:100%;
	 	}
	 	.section2{
	 		width:100%;
	 		margin-left:0px;
	 	}
	 }
	 @media (max-width:1564px){
	 	.section1{
	 		width:100%;
	 	}
	 	.section2{
	 		width:100%;
	 		margin-left:20px;
	 	}
	 }
	 }
	
</style>

<body>
	
 	<section class="section1">
 			<%@ include file="../include/verticalsearch.jsp" %>
 			<div class="filter">
 			<p class="filterline">필터링:</p>
 			<p>내 예산(1박 기준)</p>
 			
 			<input type="checkbox" value="68600" name="chk1"> &nbsp; ₩0 - ₩68,600 <br>
 			<input type="checkbox" value="137000" name="chk2">	&nbsp; ₩68,600 - ₩137,000 <br>
 			<input type="checkbox" value="205000" name="chk3">	&nbsp; ₩137,000 - ₩205,000<br>
 			<input type="checkbox" value="274000" name="chk4">	&nbsp; ₩205,000 - ₩274,000 <br>
 			<input type="checkbox" value="274000+" name="chk5">	&nbsp; ₩274,000+
 		</div>
 		<div style="width:100%">
 			<img src="/images/mapbtn.png" width="100%">
 		</div>
 		<div style="margin-top:20px;width:100%">
 			
 		</div>
 	</section>
 	
 	<section class="section2">
 		
 				<c:forEach var="result" items="${list}">
 					
	 				<div class="hotel" style="width:100%;height:200px;margin-bottom:35px;font-size:15px;color:" onclick="location.htrf=''">
	 					<input type="hidden" value="${result.contentid}">
	 					<input type="hidden" value="${result.contenttypeid}">
	 					<c:choose>
	 						<c:when test="${result.firstimage eq '없음'}">
	 							<img src="/images/empty_image.jpg" style="width:200px;height:200px;float:left;">	
	 						</c:when>
	 						<c:otherwise>
	 							<img src="${result.firstimage}" style="width:200px;height:200px;float:left;">
	 						</c:otherwise>
	 					
	 					</c:choose>
	 					
	 					 <div style="float:left;height:100%;width:78%;margin-left:15px;">
	 						<div style="width:100%;height:30px;margin-bottom:10px;">
	 							<a style="font-size:22px;font-weight:bold;">${result.title}</a>
	 						</div>
	 						<div style="width:50%;height:60px;overflow: hidden;text-overflow: ellipsis;display: -webkit-box;-webkit-line-clamp: 2 ;-webkit-box-orient: vertical;margin-bottom:10px;color: #505050;">
		 							${result.place}
	 						</div>
	 						<div style="width:70%;height:40px;color: #505050;">
		 						${result.roomtype}
	 						</div>
	 						<div style="float:right;width:28%;height:50px;text-align:center;">
	 						<c:choose>
	 							<c:when test="${result.minest != '0'}">
	 								<a style="font-size:25px;font-weight:bold;">
	 									${result.minest} /박
	 								</a>	
	 							</c:when>
	 							<c:otherwise>
	 								<a style="font-size:20px;font-weight:bold;"> 						
	 									객실 가격 전화문의
	 								</a>
	 							</c:otherwise>
	 						</c:choose>
	 						</div>
	 						<div style="width:70%;height:40px;color: #505050;">${result.chkin} ~ ${result.chkout}</div>
	 					</div>
	 				</div>
	 		</c:forEach>
	 		<div style="width:700px;margin-left:10px; margin-top:10px; text-align:center;">
		  		<c:forEach var="i" begin="1" end="${tcnt}">
		  			<a href="apitest.do?page_no=${i}">${i}</a>
		  		</c:forEach>
		  	</div>

 	</section>

 	<footer>
 	
 	</footer>
</body>
</html>