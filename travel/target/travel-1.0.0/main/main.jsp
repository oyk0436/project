<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 화면</title>
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
</head>
<style>
	body{
	width:auto;
	}
	
	header{
		height:80px;
		width:100%;
		background-color:#fff;
	}
	.logo{
		padding:0px;
		margin-right:15px;
		float:left;
	}
	.topsearch{
		width:530px;
		height:40px;
		background-color:#eef0f2;
		border:0px;float:left;
		margin-top:13px;
	}
	
	
	nav{
		border-top:1px solid;
		border-color:#e3effd;
	}
	nav div{
		width:55%;
		margin-left:500px;
		padding-top:20px; 
		text-align:center;
		height:45px;
	}
	nav a{
		margin-right:220px;
		font-size:22px;
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
		width:100%;
		background-color:#e3effd;
		padding-top:1px;
	}
	.todaychoice p{
		margin-left:150px;
		font-weight:1000;
		font-size:24px;
	}
	.todaychoice2{
		width:90%;
		height:340px;
		margin-left:140px;
		overflow-x: hidden;
		overflow-y: hidden;
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
		background-image: url("../images/today1.jpg");
		height:228px;
		background-size: cover;
   		background-position: 50% 50%;
    	background-position-x: 50%;
   		background-position-y: 50%;
	}
	.img2{
		border-top-left-radius:20px;
		border-top-right-radius:20px;
		width:300px;
		background-image: url("../images/today2.jpg");
		height:228px;
		background-size: cover;
   		background-position: 50% 50%;
    	background-position-x: 50%;
   		background-position-y: 50%;
	}
	.img3{
		border-top-left-radius:20px;
		border-top-right-radius:20px;
		width:300px;
		background-image: url("../images/today3.jpg");
		height:228px;
		background-size: cover;
   		background-position: 50% 50%;
    	background-position-x: 50%;
   		background-position-y: 50%;
	}
	.img4{
		border-top-left-radius:20px;
		border-top-right-radius:20px;
		width:300px;
		background-image: url("../images/today4.jpg");
		height:228px;
		background-size: cover;
   		background-position: 50% 50%;
    	background-position-x: 50%;
   		background-position-y: 50%;
	}
	.img5{
		border-top-left-radius:20px;
		border-top-right-radius:20px;
		width:300px;
		background-image: url("../images/today5.jpg");
		height:228px;
		background-size: cover;
   		background-position: 50% 50%;
    	background-position-x: 50%;
   		background-position-y: 50%;
	}
	.img6{
		border-top-left-radius:20px;
		border-top-right-radius:20px;
		width:300px;
		background-image: url("../images/today6.jpg");
		height:228px;
		background-size: cover;
   		background-position: 50% 50%;
    	background-position-x: 50%;
   		background-position-y: 50%;
	}
	.img7{
		border-top-left-radius:20px;
		border-top-right-radius:20px;
		width:300px;
		background-image: url("../images/today7.jpg");
		height:228px;
		background-size: cover;
   		background-position: 50% 50%;
    	background-position-x: 50%;
   		background-position-y: 50%;
	}
	.img8{
		border-top-left-radius:20px;
		border-top-right-radius:20px;
		width:300px;
		background-image: url("../images/today8.jpg");
		height:228px;
		background-size: cover;
   		background-position: 50% 50%;
    	background-position-x: 50%;
   		background-position-y: 50%;
	}
	.img9{
		border-top-left-radius:20px;
		border-top-right-radius:20px;
		width:300px;
		background-image: url("../images/today9.jpg");
		height:228px;
		background-size: cover;
   		background-position: 50% 50%;
    	background-position-x: 50%;
   		background-position-y: 50%;
	}
	.img10{
		border-top-left-radius:20px;
		border-top-right-radius:20px;
		width:300px;
		background-image: url("../images/today10.jpg");
		height:228px;
		background-size: cover;
   		background-position: 50% 50%;
    	background-position-x: 50%;
   		background-position-y: 50%;
	}
	.img11{
		border-top-left-radius:20px;
		border-top-right-radius:20px;
		width:300px;
		background-image: url("../images/today11.jpg");
		height:228px;
		background-size: cover;
   		background-position: 50% 50%;
    	background-position-x: 50%;
   		background-position-y: 50%;
	}
	.img12{
		border-top-left-radius:20px;
		border-top-right-radius:20px;
		width:300px;
		background-image: url("../images/today12.jpg");
		height:228px;
		background-size: cover;
   		background-position: 50% 50%;
    	background-position-x: 50%;
   		background-position-y: 50%;
	}
	.img13{
		border-top-left-radius:20px;
		border-top-right-radius:20px;
		width:300px;
		background-image: url("../images/today13.jpg");
		height:228px;
		background-size: cover;
   		background-position: 50% 50%;
    	background-position-x: 50%;
   		background-position-y: 50%;
	}
	.img14{
		border-top-left-radius:20px;
		border-top-right-radius:20px;
		width:300px;
		background-image: url("../images/today14.jpg");
		height:228px;
		background-size: cover;
   		background-position: 50% 50%;
    	background-position-x: 50%;
   		background-position-y: 50%;
	}
	.img15{
		border-top-left-radius:20px;
		border-top-right-radius:20px;
		width:300px;
		background-image: url("../images/today15.jpg");
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
		
		margin-right:100px;	
		float:left;
	}
	/* z-index 는 겹치는 순서를 정하는기 위해 사용 (사진을 -1로 두어 제일 뒤로 배치) */
	.intemapic{
		border-radius:5px;
		z-index:-1;
	}
	
	/*테마 사진 위의 글씨를 잘 보이게 하기 위한 위만 어두운 배경 */
	.temabackground{
		width:260px;
		height:316px;
		position:absolute;
		background: transparent url("../images/transbackground.png") no-repeat left bottom;
		background-size: 100% 100%;
		border-radius:5px;
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
		//////////////////////////////
		
	});
</script>

<body>
 	<header >
 		<div align="center">
				<div style="height:75px;width:60%;margin-left:40px;">
 					<img src="../images/logo.jpg" class="logo">
 					<input type="text" name="mainsearch" class="topsearch">
				</div>
				
				<!-- 로그인이 안되어 있으면 로그인 | 회원 가입 로그인이 되어 있으면 예약내역 | 마이메뉴 -->
				<div style="float:right;margin-top:-20px;">
					<a href="login.jsp">로그인</a>| <a href="regist.jsp">회원가입</a> 
				</div>
 		</div>
 	</header>
 	
 	<nav>
 		<div>
 			<a>숙박</a><a>테마</a><a>맛집</a>
 		</div>
 	</nav>
 	
 	<section>
 		<article>
 			<div class="mainpic">
 				<img src="../images/mainpic.png" class="mainpic2">
 			</div>
 			<div class="todaychoice">
 				<p>오늘의 여행</p>
 				<button class="left" id="choicebtn"><img src="../images/left.png"></button>
 				<div class="todaychoice2">
	 				<div class="scrollbar">
	 					<div class="todaypic1" id="today">
	 						<div class="img1"></div>	
	 						<div class="imgname">부산 동래읍성지</div>
		 				</div>
		 				
		 				<div class="todaypic1" id="today">
	 						<div class="img2"></div>	
	 						<div class="imgname">울산 강동화암 주상철리</div>
		 				</div>
		 				
		 				<div class="todaypic1" id="today">
	 						<div class="img3"></div>	
	 						<div class="imgname">부산 거가대교 홍보 전시관</div>
		 				</div>
		 				<div class="todaypic1" id="today">
	 						<div class="img4"></div>	
	 						<div class="imgname">완주 소양고택</div>
		 				</div>
		 				<div class="todaypic1" id="today">
	 						<div class="img5"></div>	
	 						<div class="imgname">제주 용암해안도로</div>
		 				</div>
		 				<div class="todaypic2" id="today">
	 						<div class="img6"></div>	
	 						<div class="imgname">천안 뚜쥬루과자점 돌가마점</div>
		 				</div>
						<div class="todaypic2" id="today">
	 						<div class="img7"></div>	
	 						<div class="imgname">익산 미륵사지</div>
		 				</div>
		 				<div class="todaypic2" id="today">
	 						<div class="img8"></div>	
	 						<div class="imgname">대전 한옥 카페 예이제</div>
		 				</div>
		 				<div class="todaypic2" id="today">
	 						<div class="img9"></div>	
	 						<div class="imgname">안동 하회 마을</div>
		 				</div>
		 				<div class="todaypic2" id="today" >
	 						<div class="img10"></div>	
	 						<div class="imgname">부상 웨이브온커피</div>
		 				</div>
		 				<div class="todaypic3" id="today">
	 						<div class="img11"></div>	
	 						<div class="imgname">전주 경기전</div>
		 				</div>
		 				<div class="todaypic3" id="today">
	 						<div class="img12"></div>	
	 						<div class="imgname">서울 문화역 서울 284</div>
		 				</div>
		 				<div class="todaypic3" id="today">
	 						<div class="img13"></div>	
	 						<div class="imgname">대구 이월드</div>
		 				</div>
		 				<div class="todaypic3" id="today">
	 						<div class="img14"></div>	
	 						<div class="imgname">여주 신륵사</div>
		 				</div>
		 				<div class="todaypic3" id="today">
	 						<div class="img15"></div>	
	 						<div class="imgname">인천 쥬라기 카라반</div>
		 				</div>
	 				</div>	
 				</div>
 				<button class="right" id="choicebtn"><img src="../images/right.png"></button>
 			</div>
 			<div style="width:20%;height:250px;border:1px solid;float:left;margin-top:60px;">여행 이슈</div>
 			
 			<div style="width:79%;height:360px;float:left;margin-top:10px;">
 				<p style="margin-top:-2px;margin-left:50px;font-size:18px;font-weight:bold;">함께 떠나는 힐링 테마 여행</p>
 				
 				<div class="temapic" style="margin-left:50px;">
 					<div class="temabackground"></div>
 					<a style="position:absolute;color:white;font-size:15px;font-weight:bold;margin-left:8px;margin-top:5px;">멋 따라 맛 따라!<br>온종일 대구 남구 구석구석</a>
 					<img src="../images/tema1.png" class="intemapic">
 				</div>
 				<div class="temapic">
 					<div class="temabackground"></div>
 					<a style="position:absolute;color:white;font-size:15px;font-weight:bold;margin-left:8px;margin-top:5px;">제주 안의 새로움을 찾는 여행!<br>사진으로 만나는 중문의 재발견</a>
 					<img src="../images/tema2.png" class="intemapic">
 				</div>
 				<div class="temapic">
 					<div class="temabackground"></div>
 					<a style="position:absolute;color:white;font-size:15px;font-weight:bold;margin-left:8px;margin-top:5px;">가상과 현실의 오가는 야외 방탈출<br>리얼월드 메트로 어드벤처 서울!</a>
 					<img src="../images/tema3.png" class="intemapic">
 				</div>
 				<div class="temapic">
 					<div class="temabackground"></div>
 					<a style="position:absolute;color:white;font-size:15px;font-weight:bold;margin-left:8px;margin-top:5px;">별빛 가득한 시골 마을에 안긴<br>고즈넉한 한옥 영천 귀애고택</a>
 					<img src="../images/tema4.png" class="intemapic">
 				</div>
 				
 			</div>
 		</article>
 	</section>
 	
 	
 	
 	<footer>
 	
 	</footer>
 	
</body>
</html>