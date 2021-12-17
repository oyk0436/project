<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	
	img{
		display:inline-block; width:30px; height:30px;
	}
	 .pay{
		height:130px;
		width:600px;
		border:1px solid;
		display:inline-block;
	}
	

	
	
</style>

<script>

	function fn_naverpay(){
	    var oPay = Naver.Pay.create({
	          "mode" : "production", // development or production
	          "clientId": "u86j4ripEt8LRfPGzQ8" // clientId
	    });
	
	    //직접 만드신 네이버페이 결제버튼에 click Event를 할당하세요
	    var elNaverPayBtn = document.getElementById("naverPayBtn");
	
	    elNaverPayBtn.addEventListener("click", function() {
	        oPay.open({
	          "merchantUserKey": "test",
	          "merchantPayKey": "1111",
	          "productName": "입력",
	          "totalPayAmount": "10000",
	          "taxScopeAmount": "10000",
	          "taxExScopeAmount": "0",
	          "returnUrl": "사용자 결제 완료 후 결제 결과를 받을 URL"
	        });
	    });
	    
	}
	
    function fn_kakaopay(){
    	var url="https://mockup-pg-web.kakao.com/v1/03bd53b83bb2841568ea3428a0e04663f03df98261f26af046d7d55a3642b885/info";
		var w=window.screen.width/2-250;
		var h=window.screen.height/2-250;
		
		window.open(url,"popup","width =620,height=330,left="+w+",top="+h);
    }
    
    function fn_morepay(){
	      var tossPayments = TossPayments('test_ck_OEP59LybZ8Bdv6A1JxkV6GYo7pRe')
	
	      tossPayments.requestPayment('카드', {
	        amount: 25000,
	        orderId: '5FJYaxYyYfuUmIDbih1pJ',
	        orderName: '토스 티셔츠 외 2건',
	        customerName: '김토스',
	        successUrl: 'https://test.com/success',
	        failUrl: 'https://test.com/fail',
	      })
    }
</script>

<body>
	<div class="information">
		<div style="font-size:22px;font-weight:bold;border-bottom:2px solid #808080;padding:10px;">
			예약자 정보
		</div>
		<div>
			<p>이름</p>
			<input type="text" name="uname" id="uname" style="width:300px;height:30px;">
		</div>
		<div>
			<p>휴대폰</p>
			<input type="text" name="phone" id="phone" style="width:300px;height:30px;">
		</div>
	</div>
	<div class="information" style="height:250px;">
	
		<h1>상품 정보</h1>
		#상품 데이터 불러 오는 곳#
	</div>
	
	<div class="information">
	
		<h2>결제 수단 선택</h2>
		<p>은행 점검시간인 23:30~00:30 까지 이용 불가한 계좌이체 결제수단이 포함되어 있습니다.</p>
		<div  class="pay">

			<input type="checkbox" name="naverpay" id="cardpay" >
			<img src="/images/naverpay.png"  class="img2">
		
			<input type="checkbox" name="kakaopay" id="cardpay" >
			<img src="/images/kakaopay.png"  class="img2">
			
		
			
			<input type="checkbox" name="card" id="cardpay" ><a>간편 카드 결제</a>
		</div>
	</div>
	
	<div class="information" style="text-align:right;border:0px;">
		
		<a style="font-size:22px;font-weight:bold;margin-right:40px;">#임시 4박 11,111원#</a>
		<button type="button" style="width:120px;height:50px;float:right;background-color:#dbdbdb;border:0px;border-radius:2px;font-size:18px;font-weight:bold;">결제 하기</button>
	</div>
</body>
</html>