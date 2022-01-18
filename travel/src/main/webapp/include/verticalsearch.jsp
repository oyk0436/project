<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>



  


<style>

	.housesearch{
		width:235px;
		height:400px;
		margin-bottom:40px;
		padding-left:15px;
		padding-top:20px;
		background-color:#2c4162;
		color:white;
		float:left;
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
	.housesearch input{
		width:86%;
	}
</style>
<script>
$(function(){
	$( "#picker1" ).datepicker({ minDate: 0}); 
	$( "#picker2" ).datepicker();
	
	$('#picker1').change(function() {
		var date1=Date.parse($("#picker1").val());
		var date2=Date.parse($("#picker2").val());

		var curDate = $("#picker1").datepicker("getDate"); 
		curDate.setDate( curDate.getDate() + 1 );
		$("#picker2").datepicker("option", "minDate", curDate);
	});
});

	function housefind(){
		var keyword=document.getElementById("destination").value;
		var date1;
		var date2;
		var day;
		
		if($("#picker1").val() != "" && $("#picker2").val() != ""){
			date3=Date.parse($("#picker1").val());
			date4=Date.parse($("#picker2").val());
			day=(date4-date3)/(3600*24*1000);
			location.href='/house.do?page_no=1&day='+day+'&chkin='+$("#picker1").val()+'&chkout='+$("#picker1").val()+'&search='+encodeURI(keyword,"UTF-8");
		}else location.href='/house.do?page_no=1&search='+encodeURI(keyword,"UTF-8"); // get 방식에서 한글이 깨져서 전달 되던 것을 encodeURI(keyword,"UTF-8") 로 교쳐서 보냄
	}
	
</script>

 	<div class="housesearch">
		<a>숙소 검색</a>
		<p>목적지</p>
		<input type="text" name="destination" id="destination" value="${search}">
		<p style="font-size:11px;">검색은 시,군,구 까지 검색 됩니다.<br>ex) 제주특별자치도 서귀포시</p>
		
		<p>체크인</p>
		<input type="text" class="chkinout" name="picker1" id="picker1" value="${checkin}">
		
		<p>체크아웃</p>
		<input type="text" class="chkinout" name="picker2" id="picker2" value="${checkout}">
		<input type="hidden" id="day" value="">

		<button type="button" onclick="housefind()">검색</button>
 	</div>
