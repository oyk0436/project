<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	
	<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>

<style>
	nav{
		width:100%;
		border-top:1px solid;
		border-color:#e3effd;
		text-align:center;
	}
	nav div{
		width:815px;
		padding-top:20px; 
		height:45px;
		margin:0 auto;
	}
	nav a{
		margin-right:220px;
		font-size:22px;
		text-decoration-line: none;
		color:black;
	}
	header{
		height:80px;
		width:100%;
		background-color:#fff;
	}
	.topdiv{
		float:left;
		border-radius:2%;
		width:430px;height:70px;
	}
	
	.top2header{
		height:75px;
		width:100%;
		margin-left:40px;
		position:relative;
	}
	.category21{
		float:left;
		border-bottom:0px;
		font-size:18px;
		border:2px solid #eef0f2;
		background-color:white;
		border-radius:10%;
	}

	.topdivbutton{
	    position: absolute;
	    width: 50px;
	    height: 40px;
	    top: 29px;
    	right: 310px;
	    border: 0px;
	    border-radius:5%;
	    background-color: #50aaf3;
	    color:white;
	    font-weight:bold;
	    font-size: 18px;
	}
	.logo{
		padding:0px;
		margin-right:25px;
		float:left;
		width:90px;
		height:80px;
	}
	.topheader{
		width:850px;
	}
	.topsearch{
		width:400px;
		height:40px;
		margin-top:-3px;
		background-color:#eef0f2;
		border:0px;float:left;
		border-radius:3%;
	}
	
	@media(max-width:1399px) {
		header{
			width:100%;
		}

	}
	@media(max-width:1000px) {
		header{
			width:100%;
		}
		.top2header{
			width:900px;
		}

	}
	.log{
		position:relative;
		float:right;
		margin-top:-15px;
		margin-right:-180px;
		z-index:3;
		font-size:16px;
	}
	.log a{
		text-decoration-line: none;
		color:black;
		font-size:15px;
	}
</style>

<script>
function fn_logout() {
	if( confirm("정말 로그아웃 하시겠습니까?") ) {
		$.ajax({
			type : "post",
			data : "",
			url  : "logout.do",
			
			datatype : "text",
			success: function(data) {
				if( data == "ok" ) {
					alert("로그아웃 되었습니다.");
					location = "/loginWrite.do";
				} else {
					alert("다시 시도해 주세요.");
				}
			},
			error : function() {
				alert("접속 에러");
			}
		});
	}
}
$(function(){
var categorychoice=1;
document.getElementById("categorybtn1").style.backgroundColor = "#50aaf3";
document.getElementById("categorybtn1").style.color = "white";
$("#categorybtn1").click(function(){
	categorychoice=1;
	document.getElementById("categorybtn1").style.backgroundColor = "#50aaf3";
	document.getElementById("categorybtn1").style.color = "white";
	document.getElementById("categorybtn1").style.fontweight = "bold";
	document.getElementById("categorybtn2").style.backgroundColor = "";
	document.getElementById("categorybtn3").style.backgroundColor = "";
	document.getElementById("categorybtn3").style.color = "";
	document.getElementById("categorybtn2").style.color = "";
});
$("#categorybtn2").click(function(){
	categorychoice=2;
	document.getElementById("categorybtn1").style.backgroundColor = "";
	document.getElementById("categorybtn2").style.backgroundColor = "#50aaf3";
	document.getElementById("categorybtn1").style.color = "";
	document.getElementById("categorybtn3").style.color = "";
	document.getElementById("categorybtn2").style.color = "white";
	document.getElementById("categorybtn2").style.fontweight = "bold";
	document.getElementById("categorybtn3").style.backgroundColor = "";
});
$("#categorybtn3").click(function(){
	categorychoice=3;
	document.getElementById("categorybtn1").style.backgroundColor = "";
	document.getElementById("categorybtn2").style.backgroundColor = "";
	document.getElementById("categorybtn3").style.backgroundColor = "#50aaf3";
	document.getElementById("categorybtn2").style.color = "";
	document.getElementById("categorybtn1").style.color = "";
	document.getElementById("categorybtn3").style.color = "white";
	document.getElementById("categorybtn3").style.fontweight = "bold";
});
$(".topdivbutton").click(function(){
	if(categorychoice==1){
		var keyword=document.getElementById("keyword").value;
		location.href='/house.do?page_no=1&search='+encodeURI(keyword,"UTF-8");
		
	} else if (categorychoice == 2) { // 음식점
		
		var keyword = document.getElementById("keyword").value;
		
		var formdata = $("#frm1").serialize();
		
		$.ajax({
			type : "get",
			url : "restaurantMain.do",
			data : formdata,
			
			datatype : "text",
			success : function(data) {
				location="/restaurantMain.do?s_text="+keyword+"&s_field="+"address";
			},
			error : function() {
				alert("전송오류!")
			}
		});
	} else if (categorychoice == 3) { // 관광지
		
		var keyword = document.getElementById("keyword").value;
		
		var formdata = $("#frm1").serialize();
		
		$.ajax({
			type : "get",
			url : "tourMain.do",
			data : formdata,
			
			datatype : "text",
			success : function(data) {
				location="tourMain.do?s_text="+keyword+"&s_field="+"address";
			},
			error : function() {
				alert("전송오류!")
			}
		});
	}
	
});
});
</script>

<header>
	<form id = "frm1">
 		<div style="margin:0 auto;" class="topheader"  >
				<div style="" class="top2header"> 
 					<img src="../images/logo4.png" class="logo">
 					<div class="topdiv">
 						<button type="button" class="category21" id="categorybtn1">숙박</button>
 						<button type="button" class="category21" id="categorybtn2">맛집</button>
 						<button type="button" class="category21" id="categorybtn3">관광지</button>
 						<input type="text" id="keyword" class="topsearch">
 						<button type="button" class="topdivbutton" >검색</button>
 					</div>
				</div>
			<!-- 로그인이 안되어 있으면 로그인 | 회원 가입 로그인이 되어 있으면 예약내역 | 마이메뉴 -->
			<!-- session 값 추가  -->
			<%
				String USERID   = (String) session.getAttribute("MEMBER_SESSION_ID");
			
			    if( USERID == null || USERID.equals("")) {
		    %>
		    <div class="log">
				<a href="/loginWrite.do">로그인</a> | <a href="/memberWrite.do">회원가입</a> | <a href="/mainpage.do">메인페이지</a>
			</div>
			<%
		    	} else { // 세션 아이디 존재
			%>
	        <div class="log">
				<a href="javascript:fn_logout()">로그아웃</a> | <a href="/memberInfo.do">마이페이지</a> 
			</div>
			<%
		    	}
			%>       
 		</div>
 	</form>
 </header>
<nav style="margin-bottom:20px;">
	<div>
		<a href="http://221.146.125.212:8091/houseMain.do">숙박</a><a href = "restaurantMain.do">맛집</a><a href = "tourMain.do">관광지</a>
	</div>
</nav>