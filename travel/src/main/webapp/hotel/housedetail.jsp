<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>숙소 상세보기</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
 <script src="../include/jqueryui"></script>
 <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=bdadc1cc228e9d3e9687e2342d8d5475"></script>
 <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
</head>
<script>
$(function(){
	
	$('#selectprice').change(function() {
		if($("#selectprice").val()=="방 선택") $("#price1").html("");
		else $("#price1").html("1박/ "+$("#selectprice").val()+ " 원");
	});
	$( "#picker1" ).datepicker({ minDate: 0}); 
	$( "#picker2" ).datepicker();
	
	$('#picker1').change(function() {
		var date1=Date.parse($("#picker1").val());
		var date2=Date.parse($("#picker2").val());
		if(date1>date2){
			alert("체크 아웃의 날짜가 잘못 되었습니다.");
			$("#picker2").val("");
		}
		var curDate = $("#picker1").datepicker("getDate"); 
		curDate.setDate( curDate.getDate() + 1 );
		$("#picker2").datepicker("option", "minDate", curDate);
	});
	$('#picker2').change(function() {
		var date1=Date.parse($("#picker1").val());
		var date2=Date.parse($("#picker2").val());
		alert(date2-date1 +" 날짜 계산");
	});
	
	$('#pnumplus').click(function(){
		var pnumset=parseInt($("#pnum").val());
		$("#pnum").val(pnumset+1);
	});
	$('#pnumminus').click(function(){
		if(parseInt($("#pnum").val())>1){
			var pnumset=parseInt($("#pnum").val());
			$("#pnum").val(pnumset-1);
		}
	});
	
	$('#roomcountplus').click(function(){
		var pnumset=parseInt($("#roomcount").val());
		$("#roomcount").val(pnumset+1);
	});
	$('#roomcountminus').click(function(){
		if(parseInt($("#roomcount").val())>1){
			var pnumset=parseInt($("#roomcount").val());
			$("#roomcount").val(pnumset-1);
		}
	});
	
	$(".people").click(function() {
		  $(this).next(".insidepeople").stop().slideToggle(300);
		  $(this).next(".insideprople").siblings(".insidepeople").slideUp(300); // 1개씩 펼치기
	});
	$("#peoplebtn").click(function(){
		$(".people").next(".insidepeople").stop().slideToggle(300);
		$("#peoplevalue").val("인원: "+$("#pnum").val()+"명  객실: "+$("#roomcount").val()+"개");
	});
	
	
});

</script>
<style>
	

	select{
		width:100px;
		height:35px;
		appearance:none;
	}
	.chk{
		height:87px;
		font-size:20px;
		font-weight:bold;
	}
	.chk input{
		height:30px;
		width:100%;
	}
	.people{
		margin-top:10px;
		position: relative;
	  	height:30px;
	}
	
	.people input{
		width:98.2%;
	  	height:30px;
	  	border:1px solid black;
	  	border-top:0px;
	  	padding:0px;
	}
	.insidepeople{
		width:33%;
		height:150px;
		display: none;
		margin-top:13px;
		overflow: hidden;
		position:absolute;
		background-color:white;
	}
	.insidepeople button{
		border:0px;
		background-color: transparent;
		font-size:26px;
		
	}
	.insidepeople input{
		margin-left:1px;
		border:0px;
		width:25px;;
		font-size:20px;
	}
	#container{
		width:100%;
	}
	input[type="number"]::-webkit-outer-spin-button,
	input[type="number"]::-webkit-inner-spin-button {
	    -webkit-appearance: none;
	}
	@media screen and (-webkit-min-device-pixel-ratio:0){
		.chk{
			height:87px;
		}
		.people input{
			width:99.3%;
		  	height:30px;
		  	border:1px solid black;
		  	border-top:0px;
		  	padding:0px;
		}
	}
	
</style>
<body>
	<section>
		<%@ include file="../include/verticalsearch.jsp" %>
		<div style="width:1180px;margin-left:30px;border:1px solid;float:left;">
			<h3 style="height:10px;margin-top:0px;">${list.title}</h3>
			<div>
				<img src="${list.firstimage}" style="width:500px;height:410px;float:left;border-radius:3% 0% 0% 3%;">
				<c:forEach end="4" var="roomlist" items="${roomlist}" varStatus="status">
					<c:if test="${status.index <4 }">
						<c:choose>
							<c:when test="${status.index == 1}">
								<img src="${roomlist.roomimg1}" style="width:330px;height:200px;float:left;margin-left:10px;margin-bottom:10px;
																		border-radius:0% 3%;">
							</c:when>
							<c:when test="${status.index == 3}">
								<img src="${roomlist.roomimg1}" style="width:330px;height:200px;float:left;margin-left:10px;margin-bottom:10px;
																		border-radius:0% 0% 3%;">
							</c:when>
							<c:otherwise>
								<img src="${roomlist.roomimg1}" style="width:330px;height:200px;float:left;margin-left:10px;margin-bottom:10px;">
							</c:otherwise>
						</c:choose>
					</c:if>
				</c:forEach>
			</div>
			
			<div style="float:left;width:60%;height:350px;border:1px solid;margin-bottom:50px;"><h3>숙소 설명</h3><a id="overview" style="word-break: keep-all;">${list.overview}</a></div>
			
			<div style="float:left;width:37%;height:350px;border:1.5px solid #d0d0d0;margin-left:19px;padding:3px;">
				<h3 id="price1" style="height:20px;"></h3>
				<select id="selectprice">
					<option selected>방 선택</option>
					<c:forEach var="roomlist" items="${roomlist}">
						<option value="${roomlist.roomoffseasonminfee1}">${roomlist.title}</option>
					</c:forEach>
				</select>
				<div class="chk">
					<div style="float:left;width:49%;">
						<p>체크 인</p>
						<input type="text" class="datepicker" id="picker1" style="border:1px solid #ddd;border-top:2px solid #ddd;border-left:2px solid #ddd;" readonly>
					</div>
					<div style="float:left;width:49%;">
						<p>체크 아웃</p>
						<input type="text" class="datepicker" id="picker2" style="border:1px solid #ddd;border-top:2px solid #ddd;border-right:2px solid #ddd;" readonly>
					</div>
				</div>
				
				<div style="position:relative;">
					<div class="people">
						<input type="text" id="peoplevalue"readonly value="인원 및 객실 선택" style="font-size:18px;border:1px solid #ddd;border-bottom:2px solid #ddd;border-left:2px solid #ddd;border-right:2px solid #ddd;">
					</div>
					
					<div class="insidepeople">
						<div>
							인원:&nbsp;
							<button id="pnumminus">-</button>
								<input type="number" value="1" id="pnum">
							<button id="pnumplus">+</button>
						</div>
						<div>
							객실:&nbsp;
							<button id="roomcountminus">-</button>
								<input type="number" value="1" id="roomcount">
							<button id="roomcountplus">+</button>
						</div>
						<button type="button" id="peoplebtn" style="width:100px;">완료</button>
					</div>
					<div style="text-align:center;">
						<button style="margin-top:30px;width:93%;height:45px;background-color:#e8615e;font-size:20px;font-weight:bold;border:0px;border-radius:3%;">예약 하기</button>
					</div>
					<div id="totalprice">
						
					</div>
				</div>
		</div>
		<div style="margin-top:200px;width:100%;">
			<%@include file="../include/kakaomap.jsp" %>
		</div>
	</div>
	
	</section>
</body>
</html>