<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://nsp.pay.naver.com/sdk/js/naverpay.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://js.tosspayments.com/v1"></script>
</head>

<style>
	body{
		width:900px;
		margin:auto;
	}
	.information{
		margin-top:30px;
		border:2px solid #dbdbdb;
		padding:20px 20px 50px 20px ;
	}
	.information input{
		border:0;
		width:50px;
		text-align:center;
		outline:none;
	}
	
	.img2{
		display:inline-block; width:90px; height:50px;
	}
	 .pay{
		height:130px;
		width:600px;
		display:inline-block;
	}
	h4{
		color:#b4b4b4;
		line-height:1px;
	}
	.pay{
		padding-top:10px;
	}
	.paybtn{
		width:120px;
		height:50px;
		float:right;
		background-color:#ffeb33;
		border:0px;
		border-radius:2px;
		font-size:18px;
		font-weight:bold;
	}
	
</style>

<script>
	function payment(){
		
	}
</script>
<body>
	<%@ include file="../include/top.jsp" %>
	<form method="post" action="/travel/kakaoPay.do">
	<div class="information">
		<div style="font-size:22px;font-weight:bold;border-bottom:2px solid #808080;padding:10px;">
			예약자 정보
		</div>
		<div style="margin-right:15px;margin-top:30px;">
			<a >이름 :   홍길동</a>
			
		</div>
		<div style="margin-top:30px;">
			<a >휴대폰:   010-1234-5678</a>
			
		</div>
	</div>
	<div class="information" style="height:250px;">
		<input type="hidden" name="day" id="day" value="${list.day}">
		
		<h1>상품 정보</h1>
		<input type="text" class="h3" name="title" id="title" style="width:300px;text-align:left;"value="${list.title}" readonly>
		<input type="text" class="h4" name="roomtype" id="roomtype" style="width:200px;text-align:left;" value="${list.roomtype}" readonly>
		<p>객실 가격: <input type="text" class="h4" name="price" id="price" value="${list.price}" readonly>원</p>
		<p>
			인원: <input type="text" class="h4" name="people" id="people" value="${list.people}" readonly> 명
			객실: <input type="text" class="h4" name="roomcount" id="roomcount" value="${list.roomcount}" readonly> 개
		</p>
		<p>${list.chkin} ~ ${list.chkout} | ${list.day}일</p>
		
	</div>
	<div class="information">
	
		<h2>결제 수단 선택</h2>
		<p>은행 점검시간인 23:30~00:30 까지 이용 불가한 계좌이체 결제수단이 포함되어 있습니다.</p>
		<div  class="pay">

			<h2> 현제 결제는 카카오페이만 됩니다</h2>
		
			
		

		</div>
	</div>
	
	<div class="information" style="text-align:right;border:0px;">
		
		<a style="font-size:22px;font-weight:bold;margin-right:40px;">${list.day} /박 객실 ${list.roomcount} 개 ${list.price*list.day*list.roomcount} 원</a>
		<button type="submit" class="paybtn" onclick="payment()" style="">결제 하기</button>
	</div>
	</form>
</body>
</html>