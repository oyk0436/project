<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 화면</title>
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
</head>
<style>
	body{
		width:1895px;
	}
	.mainpic{
		height:100%;
		overflow: hidden;
	}
	.mainpic2{
		width:100%;
		margin-bottom:-5%;
	}
	
	/* 오늘의 여행 */
	.todaychoice{
		height:450px;
		width:1885px;
		background-color:#e3effd;
		padding-top:1px;
	}
	.todaychoice p{
		margin-left:150px;
		font-weight:1000;
		font-size:24px;
	}
	.todaychoice2{
		width:1700px;
		height:340px;
		margin-left:140px;
		overflow-x: hidden;
		overflow-y: hidden;
	}
	.todaychoice3{
		width:1858px;
	}
	.scrollbar img{
		margin-right:20px;
		border-radius:10px;
	}
	#choicebtn{
		border:0px;
		background-color:#e3effd;
		font-size:38px;
	}
	.left{
		margin-left:20px;
		margin-right:5px;
		margin-top:90px;
		float:left;
	}
	.right{
		float:right;
		margin-top:-248px;
		margin-right:20px;
	}
	
	.scrollbar{
		padding-left:10px;
	}

	.img1{
		border-top-left-radius:20px;
		border-top-right-radius:20px;
		width:300px;
		height:228px;
		background-size: cover;
   		background-position: 50% 50%;
    	background-position-x: 50%;
   		background-position-y: 50%;
	}
	.imgname{
		height:52px;
		background-color:white;
		border-bottom-left-radius:20px;
		border-bottom-right-radius:20px;
		width:300px;
		padding-top:20px;
		text-align:center;
		font-size:18px;
	}
	#today{
		float:left;
		width:300px;
		height:300px;
		margin-right:20px;
	}
	
	/*테마 */
	.temapic{
		
		margin-right:50px;	
		float:left;
	}
	/* z-index 는 겹치는 순서를 정하는기 위해 사용 (사진을 -1로 두어 제일 뒤로 배치) */
	.intemapic{
		border-radius:5px;
		z-index:-1;
	}
	
	/*테마 사진 위의 글씨를 잘 보이게 하기 위한 위만 어두운 배경 */
	.temabackground{
		width:290px;
		height:316px;
		position:absolute;
		background: transparent url("../images/transbackground.png") no-repeat left bottom;
		background-size: 100% 100%;
		border-radius:5px;
	}
	@media(max-width:1579px) {
		.todaychoice2{
			width:90%;
		}
	}
	@media(max-width:1547px) {
		.todaychoice2{
			width:1370px;
		}
	}
</style>

<script>

	$(function(){
		
		//오늘의 여행  스크롤 좌우 이동 버튼
		var scrollcnt=1;
		$('.todaypic2').css("display","none");
		$('.todaypic3').css("display","none");
		var pic=Math.ceil($('.scrollbar').find('div').length/15);
		
		$('.left').click(function(){
			if(scrollcnt > 1){
				$('.todaypic'+scrollcnt).css("display","none");
				scrollcnt--;
				$('.todaypic'+scrollcnt).css("display","");
			}
		});
		$('.right').click(function(){
			if(scrollcnt < pic){
				$('.todaypic'+scrollcnt).css("display","none");
				scrollcnt++;
				$('.todaypic'+scrollcnt).css("display","");
			}
		});
	});
</script>

<body>
 	
 	<%@include file="../include/top.jsp" %>
 	<section>
 		<article>
 			<div class="mainpic">
 				<img src="../images/mainpic.png" class="mainpic2">
 			</div>
 			<div class="todaychoice">
 				<p>최고의 호텔</p>
 				<button class="left" id="choicebtn"><img src="../images/left.png"></button>
 				<div class="todaychoice2">
	 				<div class="scrollbar">
	 					<c:forEach var="list" items="${list}" varStatus="status">
	 						<c:choose>
	 							<c:when test="${status.count <6}">
				 					<div class="todaypic1" id="today">
				 						<div class="img1"><img class="img1" onclick='location.href="houseDetail.do?contentid=${list.contentid}&contenttypeid=${list.contenttypeid}"' src="${list.firstimage}"></div>	
				 						<div class="imgname">${list.title}</div>
				 						<input type="hidden" name="contentid" name="contentid" value="${list.contentid}">
				 						<input type="hidden" name="contenttypeid" name="contenttypeid" value="${list.contentid}">
					 				</div>
				 				</c:when>
				 				<c:when test="${status.count <11}">
				 					<div class="todaypic2" id="today">
				 						<div class="img1"><img class="img1" src="${list.firstimage}"></div>	
				 						<div class="imgname">${list.title}</div>
				 						<input type="hidden" name="contentid" name="contentid" value="${list.contentid}">
				 						<input type="hidden" name="contenttypeid" name="contenttypeid" value="${list.contentid}">
					 				</div>
				 				</c:when>
				 				<c:when test="${status.count <16 }">
				 					<div class="todaypic3" id="today">
				 						<div class="img1"><img class="img1" src="${list.firstimage}"></div>	
				 						<div class="imgname">${list.title}</div>
				 						<input type="hidden" name="contentid" name="contentid" value="${list.contentid}">
				 						<input type="hidden" name="contenttypeid" name="contenttypeid" value="${list.contentid}">
					 				</div>
				 				</c:when>
			 				</c:choose>
	 					</c:forEach>
	 				</div>
 				</div>
 				<button class="right" id="choicebtn"><img src="../images/right.png"></button>
 			</div>
 			<div style="width:100%;">
	 			<div style="width:262px;height:250px;border:1px solid;float:left;margin-top:60px;">여행 이슈</div>
	 			
	 			<div style="width:1400px;height:360px;float:left;margin-top:10px;margin-left:150px;">
	 				<p style="margin-top:-2px;font-size:18px;font-weight:bold;">함께 떠나는 힐링 맛집 여행</p>
	 				
	 				<c:forEach var="result1" items = "${rImg}">
		 				<div class="temapic" style="">
		 					<div class="temabackground" onclick="location.href='restaurantDetail.do?unq=${result1.unq}'"></div>
		 					<a style="position:absolute;color:white;font-size:15px;font-weight:bold;margin-left:8px;margin-top:5px;">${result1.title }<br>대표 메뉴 : ${result1.topmenu }</a>
		 					<img src="images/restaurant/${result1.title }1.jpg" width="290px;" height="316px" class="intemapic">
		 			
		 				</div>
		 			
	 				</c:forEach>
	
	 				
	 			</div>
 			</div>
 		</article>
 	</section>
 	
 	
 	
 	<footer>
 	
 	</footer>
 	
</body>
</html>