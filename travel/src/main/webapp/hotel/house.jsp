<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>호텔 목록</title>

<link rel="stylesheet" href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="../include/jqueryui"></script>

<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
</head>

<style>
	

	body{
		width:1480px;
	}
	.section1{
		width:235px;float:left;
	}
	.section2{
		width:1180px;float:left;margin-left:40px;
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
	.page_num{
	 	font-size:26px;
	 	color:black;
	 	text-decoration-line: none;
	 }
	.pricebox{
		float:right;
		width:28%;
		height:70px;
		text-align:center;
		margin-top:-18px;
	}
	.pricebox a,.pricebox p{
		font-size:25px;
		font-weight:bold;
		line-height:0px;
	}
	.insidepeople{
		width:100%;
		height:150px;
		display: none;
		overflow: hidden;
		position:absolute;
		background-color:white;
	}
</style>

<script>
	function onlychk(chk){
	    var obj = document.getElementsByName("chkBox");
	    var price;
	    for(var i=0; i<obj.length; i++){
	        if(obj[i] != chk) obj[i].checked = false;
	   		else price=obj[i].value;
	    }
	    location.href="house.do?price="+price;
	}
	
	$(function(){
		$(".pmap").next(".childmap").stop().slideToggle(1);
		$(".pmap").click(function() {
			  $(this).next(".childmap").stop().slideToggle(100);
			  $(this).next(".childmap").siblings(".childmap").slideUp(100); // 1개씩 펼치기
		});	
	});
	
</script>

<body>
	<%@include file="../include/top.jsp" %> 
 	<section class="section1">
 		<%@ include file="../include/verticalsearch.jsp" %>
 			
 		<div class="pmap"style="width:100%;margin-left:10px;">
 			<img src="/images/mapbtn.png" width="100%">
 		</div>
 		<div class="childmap">
			<%@include file="../include/kakaomapmakerlist.jsp" %>
		</div>
 	</section>

 	<input type="hidden" name="makerareacode" id="makerareacode" value="${areacode}">
 	<input type="hidden" name="makersigungucode" id="makersigungucode" value="${sigungucode}">
 	<section class="section2">
 		<c:choose>
			<c:when test="${!empty searchResult}">
				<h1>'${search}'검색 결과가 없습니다</h1>	
			</c:when>
			<c:otherwise>
				<c:forEach var="result" items="${list}">
 					
	 				<div class="hotel" style="width:100%;height:200px;margin-bottom:50px;font-size:15px;color:" onclick="location.href='houseDetail.do?contentid=${result.contentid}&contenttypeid=${result.contenttypeid}'">
	 					<input type="hidden" value="${result.contentid}">
	 					<input type="hidden" value="${result.contenttypeid}">
	 					<c:choose>
	 						<c:when test="${result.firstimage eq '없음'}">
	 							<c:choose>
	 								<c:when test="${!empty result.roomimg1}">
	 									<img src="${result.roomimg1}" style="width:200px;height:200px;float:left;">
	 								</c:when>
	 								<c:otherwise>
										<img src="/images/empty_image.jpg" style="width:200px;height:200px;float:left;">	 								
	 								</c:otherwise>
	 							</c:choose>
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
	 						<div class="pricebox">
	 							
		 						<c:choose>
		 							<c:when test="${result.minest != '0'}">
		 								<c:if test="${!empty day}">
		 									<p>${day * result.minest} 원</p>
		 								</c:if>
		 								<a style="">
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
	 						
	 						<div style="width:70%;height:40px;color: #505050;">
		 						<c:choose>
		 							<c:when test="${result.chkin eq '저장된 체크 인 아웃 시간이 없음'}">
		 								저장된 체크 인 아웃 시간이 없음		
		 							</c:when>
		 							<c:otherwise>
		 								${result.chkin} ~ ${result.chkout}
		 							</c:otherwise>
		 						</c:choose>
	 						</div>
	 					</div>
	 				</div>
	 			</c:forEach>
	 			<div style="width:100%;margin-left:10px; margin-top:10px;text-align:center;float:left;">
					<c:choose>
						<c:when test="${s_no <= 10 }">
							<button type="button" style="border:0px;background-color: transparent;font-size:26px;font-weight:bold;"> < </button>
						</c:when>
						<c:otherwise>
							<button type="button" style="border:0px;background-color: transparent;font-size:26px;font-weight:bold;" onclick="location.href='house.do?page_no=${s_no-5}&search=${search}'"> < </button>
						</c:otherwise>
					</c:choose>
					
			  		<c:forEach var="i" begin="${s_no}" end="${e_no}">
			  			<c:choose>
			  				<c:when test="${i == page_no}">
			  					<a class="page_num" style="border:0.5px solid;border-radius:10%;" href="house.do?page_no=${i}&search=${search}">${i}</a>
			  				</c:when>
			  				<c:otherwise>
			  					<a class="page_num" href="house.do?page_no=${i}&search=${search}">${i}</a>
			  				</c:otherwise>
			  			</c:choose>
			  		</c:forEach>
			  		
			  		<c:choose>
			  			<c:when test="${e_no+6 > tcnt}">
			  				<button type="button" style="border:0px;background-color: transparent;font-size:26px;font-weight:bold;border-radius:10%;"> > </button>
			  			</c:when>
			  			<c:otherwise>
			  				<button type="button" style="border:0px;background-color: transparent;font-size:26px;font-weight:bold;" onclick="location.href='house.do?page_no=${e_no+6}&search=${search}'"> > </button>
			  			</c:otherwise>
					 </c:choose>
				</div>
			</c:otherwise>
		</c:choose>	
 				
	
 	</section>
</body>
</html>