<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	.housesearch{
		width:220px;
		height:430px;
		padding-left:15px;
		padding-top:20px;
		background-color:#2c4162;
		color:white;
		float:left;
	}
	.housesearch2{
		width:100%;
		height:400px;
	}
	.housesearch a{
		font-size:28px;
		font-weight:bold;
	}
	.housesearch button{
		width:90%;
		height:45px;
		background-color:#13ce66;
		border:0px;
		border-radius:2px;
		margin-top:20px;
		color:white;
		font-size:22px;
	}
	.chkinout{
		width:86%;
	}
</style>

<div class="housesearch">
 	<div class="housesearch2">
		<a>숙소 검색</a>
		<p>목적지</p>
		<input type="text" name="destination" id="destination" value="${cityname}">
		
		<p>체크인</p>
		<input type="text" class="chkinout" name="checkin" id="checkin">
		
		<p>체크아웃</p>
		<input type="text" class="chkinout" name="checkout" id="checkout">
		
		<p>객실 및 인원</p>
		<input type="text" name="people" id="people">
		<button type="button">검색</button>
 	</div>
</div>