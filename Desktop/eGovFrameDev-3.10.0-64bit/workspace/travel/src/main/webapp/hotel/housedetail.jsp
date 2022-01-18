<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>숙소 상세보기</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
 <script src="../include/jqueryui"></script>
 <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=bdadc1cc228e9d3e9687e2342d8d5475"></script> <!-- 카카오 맵 을 불러 오기 위해 사용 -->
 <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script> <!-- 인원 및 객실 을 누르면 나오는 div 애니메이션을 위해 사용 -->
</head>
<script>
$(function(){
	
	$('#selectprice').change(function() {
		var choice=document.getElementById("selectprice").value.split(",");
		$("#roomtype").val(choice[2]);
		$("#price").val(choice[0]);							// chice 0 객실 가격 choice 2 방 타입 choice 1 객실 최대 인원
		var date1=Date.parse($("#chkin").val());
		var date2=Date.parse($("#chkout").val());
		$("#maxcount").val(choice[1]);
		if(($("#people").val()/$("#roommaxcount").val())>choice[1]){
			alert(choice[2]+"의 객실 최대 인원은 "+$("#maxcount").val()+" 명 입니다");
			$("#peoplevalue").val("인원 및 객실 선택");
		}
		
		if(choice[0] == "방 선택"){
			
			$("#price1").html("");
			$("#totalprice").text("");
		}
		else {	
			
			if(choice[0] != "객실 가격 전화문의"){
				$("#price1").html("1박/ "+choice[0]+ " 원");
				if($("#chkin").val() != "" && $("#chkout").val() != ""){
					var day=(date2-date1)/(1000*3600*24);
					$("#totalprice").text(day+"박/ "+ day * choice[0] + " 원");	
				}else $("#totalprice").text(""); 
				
			}else{
				$("#price1").html(choice[0]);
				$("#totalprice").text($("#tel").val());	
			}
		}
	});
	$( "#chkin" ).datepicker({ minDate: 0}); 
	$( "#chkout" ).datepicker();
	
	$('#chkin').change(function() {
		var date1=Date.parse($("#chkin").val());
		var date2=Date.parse($("#chkout").val());
		var day=(date2-date1)/(1000*3600*24);
		$("#day").val(day);
		var curDate = $("#chkin").datepicker("getDate"); 
		curDate.setDate( curDate.getDate() + 1 );
		$("#chkout").datepicker("option", "minDate", curDate);
	});
	$('#chkout').change(function() {
		var date1=Date.parse($("#chkin").val());
		var date2=Date.parse($("#chkout").val());
		var day=(date2-date1)/(1000*3600*24);
		$("#day").val(day);
		if($("#price1").text()!==""){
			var choice=document.getElementById("selectprice").value.split(",");
			$("#totalprice").html(day+"박/ "+day* choice[0] + " 원");
		}
	});
	
	$('#pnumplus').click(function(){
		var pnumset=parseInt($("#people").val());
		$("#people").val(pnumset+1);
	});
	
	$('#pnumminus').click(function(){
		if(parseInt($("#people").val())>1){
			var pnumset=parseInt($("#people").val());
			$("#people").val(pnumset-1);
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
		
		if($("#selectprice").val()!= "방 선택" && $("#selectprice").val() != null){
			if(($("#people").val()/$("#roomcount").val())>$("#maxcount").val()){
				var choice=document.getElementById("selectprice").value.split(",");
				alert(choice[2]+"의 객실 최대 인원은"+$("#maxcount").val()+" 명 입니다");
				$("#peoplevalue").val("인원 및 객실 선택");
			}else
				$("#peoplevalue").val("인원: "+$("#people").val()+"명  객실: "+$("#roomcount").val()+"개");
			
		}else $("#peoplevalue").val("인원: "+$("#people").val()+"명  객실: "+$("#roomcount").val()+"개");
	});
});
function submitCheck() {
		var choice=document.getElementById("selectprice").value.split(",");
	  if($("#selectprice").val()!= "방 선택" && choice[0]!= "객실 가격 전화문의" && $("#chkin").val()!= null && $("#chkout").val()!= null){
	   return true;
	 }else{
		 alert("방 , 체크 인 아웃 시간,인워 객실 중 선택이 안된것이 있습니다")
		 return false; 
	 }
}
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
		margin-top:16px;
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
	#peoplevalue{
		font-size:18px;
		border:1px solid #ddd;
		border-bottom:2px solid #ddd;
		border-left:2px solid #ddd;
		border-right:2px solid #ddd;
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
	.reservation{
		margin-top:30px;
		width:93%;
		height:45px;
		background-color:#e8615e;
		font-size:20px;
		font-weight:bold;
		border:0px;
		border-radius:3%;
	}
	
	input[type="number"]::-webkit-outer-spin-button,
	input[type="number"]::-webkit-inner-spin-button {
	    -webkit-appearance: none;
	}
	@media screen and (-webkit-min-device-pixel-ratio:0){
		.chk{
			height:87px;
		}
		#peoplevalue{
			margin-top:-1px;
			width:98.6%;
		  	height:30px;
		  	border-top:0px;
		  	padding:0px;
		}
	}
	
</style>
<body>
<%@include file="../include/top.jsp" %>
<form id="frm" method="post" action="hotelpay.do" onsubmit="return submitCheck();">
	<section style="width:1500px;">
		<input type="hidden" id="contentid" name="contentid" value="${contentid}">
		<input type="hidden" id="contenttypeid" name="contenttypeid" value="${contenttypeid}">
		<input type="hidden" id="title" name="title" value="${list.title}">
		<input type="hidden" id="roomtype" name="roomtype">
		<input type="hidden" id="price" name="price">
		<input type="hidden" id="maxcount" name="maxcount" value="">
		<input type="hidden" id="day" name="day" value="">
		<input type="hidden" value="${list.tel}" id="tel">
		<input type="hidden" id="mapx" name="mapx" value="${list.mapx}">
		<input type="hidden" id="mapy" name="mapy" value="${list.mapy}">
		
		<%@ include file="../include/verticalsearch.jsp" %>
		<div style="width:1180px;margin-left:30px;float:left;">
			<h2 style="height:20px;margin-top:5px;">${list.title}</h2>
			<div style="width:100%;height:415px;margin-bottom:20px;position:relative;">
				<c:set var="imgcount" value="${roomimgcount}"/>
				<c:set var="roomlistlength" value=" ${roomimglist}"/>
				<c:if test="${list.firstimage ne '없음'}">
				
				<c:choose>
					<c:when test="${imgcount eq 0}">
						<img src="${list.firstimage}" style="width:100%;height:410px;margin-left:10px;margin-bottom:10px;
																				border-radius:3% 3% 3% 3%;position:absolute;left:-15px;">
					</c:when>
					<c:otherwise>
						<img src="${list.firstimage}" style="width:42.3%;height:410px;float:left;border-radius:3% 0% 0% 3%;">
						<c:forEach var="roomlist" items="${roomimglist}" varStatus="status">
							<c:if test="${imgcount >= 4}">
								<c:if test="${status.index < 4 }">
									<c:if test="${!empty roomlist}" >
										<c:choose>
											<c:when test="${status.index eq 1}">
												<img src="${roomlist}" style="width:330px;height:200px;float:left;margin-left:10px;margin-bottom:10px;
																						border-radius:0% 3%;">							
											</c:when>
											<c:when test="${status.index == 3}">
												<img src="${roomlist}" style="width:330px;height:200px;float:left;margin-left:10px;margin-bottom:10px;
																						border-radius:0% 0% 3%;">				
											</c:when>
											<c:otherwise>
												<img src="${roomlist}" style="width:330px;height:200px;float:left;margin-left:10px;margin-bottom:10px;">
											</c:otherwise>
										</c:choose>
									</c:if>
								</c:if>
							</c:if>
							
							<c:if test="${imgcount eq 3}">
								<c:choose>
									<c:when test="${status.index == 2}">
										<img src="${roomlist}" style="width:670px;height:200px;float:left;margin-left:10px;margin-bottom:10px;
																				border-radius:0% 0% 3%;">							
									</c:when>
									<c:when test="${status.index == 1}">
										<img src="${roomlist}" style="width:330px;height:200px;float:left;margin-left:10px;margin-bottom:10px;
																				border-radius:0% 3%;">							
									</c:when>
									<c:otherwise>
										<img src="${roomlist}" style="width:330px;height:200px;float:left;margin-left:10px;margin-bottom:10px;">
									</c:otherwise>
								</c:choose>
							</c:if>
							
							<c:if test="${imgcount eq 2}">
								<c:choose>
									<c:when test="${status.index == 1}">
										<img src="${roomlist}" style="width:670px;height:200px;float:left;margin-left:10px;margin-bottom:10px;
																				border-radius:0% 0% 3%;">							
									</c:when>
									<c:otherwise>
										<img src="${roomlist}" style="width:670px;height:200px;float:left;margin-left:10px;margin-bottom:10px;
																				border-radius:0% 3%;">	
									</c:otherwise>
								</c:choose>
							</c:if>
							
							<c:if test="${imgcount eq 1}">
								<img src="${roomlist}" style="width:56.5%;height:410px;float:left;margin-left:10px;margin-bottom:10px;
																				border-radius:0% 0% 3%;">
							</c:if>
							
						</c:forEach>
					</c:otherwise>
				</c:choose>
				</c:if>
			</div>
			
			<div style="float:left;width:60%;height:350px;margin-bottom:50px;">
				<h3>숙소 설명</h3>
				<a id="overview" style="word-break: keep-all;">
					${list.overview}
				</a>
			</div>
			
			<div style="float:left;width:37%;height:350px;border:1.5px solid #d0d0d0;margin-left:19px;padding:3px;">
				<h3 id="price1" style="height:20px;"></h3>
				<select id="selectprice" style="width:160px;">
					<option selected>방 선택</option>
					<c:forEach var="roomlist" items="${roomlist}">
						<option value="${roomlist.roomoffseasonminfee1},${roomlist.roommaxcount},${roomlist.title}">${roomlist.title}</option>
					</c:forEach>
				</select>
				
				<div class="chk">
					<div style="float:left;width:49%;">
						<p>체크 인</p>
						<input type="text" class="datepicker" name="chkin" id="chkin" style="border:1px solid #ddd;border-top:2px solid #ddd;border-left:2px solid #ddd;" readonly>
					</div>
					<div style="float:left;width:49%;">
						<p>체크 아웃</p>
						<input type="text" class="datepicker" name="chkout" id="chkout" style="border:1px solid #ddd;border-top:2px solid #ddd;border-right:2px solid #ddd;" readonly>
					</div>
				</div>
				
				<div style="position:relative;">
					<div class="people">
						<input type="text" id="peoplevalue" readonly value="인원 및 객실 선택">
					</div>
					
					<div class="insidepeople">
						<div>
							인원:&nbsp;
							<button type="button" id="pnumminus">-</button>
								<input type="number" value="1" id="people" name="people">
							<button type="button" id="pnumplus">+</button>
						</div>
						<div>
							객실:&nbsp;
							<button type="button" id="roomcountminus">-</button>
								<input type="number" value="1" id="roomcount" name="roomcount">
							<button type="button" id="roomcountplus">+</button>
						</div>
						<button type="button" id="peoplebtn" style="width:100px;">완료</button>
					</div>
					<div style="text-align:center;">
						<button type="submit" class="reservation" >예약 하기</button>
					</div>
					<div>
						<h3 id="totalprice" style="height:20px;"></h3>
					</div>
				</div>
		</div>
		<div style="margin-top:500px;width:100%;">
			<%@include file="../include/kakaomap.jsp" %>
		</div>
	</div>
	</section>
</form>


</body>
</html>