<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<style>
	

	body{
		width:98%;
	}
	.section1{
		width:14%;max-width:235px;float:left;
	}
	.section2{
		width:84%;float:left;margin-left:15px;
	}
	.housesearch{
		width:220px;
		height:430px;
		padding-left:15px;
		padding-top:20px;
		background-color:#2c4162;
		color:white;
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
	.filter{
		margin-top:40px;
		width:100%;
		height:270px;
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
	input[type="text"]{
		width:90%;
	}
	 @media (max-width: 594px){
	 	.section1{
	 		width:100%;
	 	}
	 	.section2{
	 		width:100%;
	 		margin-left:0px;
	 	}
	 }
	 @media (max-width:1564px){
	 	.section1{
	 		width:100%;
	 	}
	 	.section2{
	 		width:100%;
	 		margin-left:20px;
	 	}
	 }
	 }
	
</style>

<body>
	
 	<section class="section1">
 			<div class="housesearch">
 				<div class="housesearch2">
	 				<a>숙소 검색</a>
	 				<p>목적지</p>
	 				<input type="text" name="destination" id="destination">
	 				
	 				<p>체크인</p>
	 				<input type="text" name="checkin" id="checkin">
	 				
	 				<p>체크아웃</p>
	 				<input type="text" name="checkout" id="checkout">
	 				
	 				<p>객실 및 인원</p>
	 				<input type="text" name="people" id="people">
	 				<button type="button">검색</button>
 				</div>
 			</div>
 			<div class="filter">
 			<p class="filterline">필터링:</p>
 			<p>내 예산(1박 기준)</p>
 			
 			<input type="checkbox" value="68600" name="chk1"> &nbsp; ₩0 - ₩68,600 <br>
 			<input type="checkbox" value="137000" name="chk2">	&nbsp; ₩68,600 - ₩137,000 <br>
 			<input type="checkbox" value="205000" name="chk3">	&nbsp; ₩137,000 - ₩205,000<br>
 			<input type="checkbox" value="274000" name="chk4">	&nbsp; ₩205,000 - ₩274,000 <br>
 			<input type="checkbox" value="274000+" name="chk5">	&nbsp; ₩274,000+
 		</div>
 		<div style="width:100%">
 			<img src="/images/mapbtn.png" width="100%">
 		</div>
 		<div style="margin-top:20px;width:100%">
 			
 		</div>
 	</section>
 	
 	<section class="section2">
 		<c:if test="${errmsg eq '정상'}" >
	 			<%
	 					ArrayList<String> imagelist=new ArrayList<>();
	 					ArrayList<String> namelist=new ArrayList<>();
	 					ArrayList<String> contentlist=new ArrayList<>();
	 					ArrayList<String> roomsizelist=new ArrayList<>();
	 					ArrayList<String> chkinoutlist=new ArrayList<>();
	 					ArrayList<String> pricelist=new ArrayList<>();
	 					String test2="";
	 					String chkinout="";
	 			%>
	 				<c:set var="in1" value="${info1}"/>
	 				<c:set var="in2" value="${info2}"/>
	 				<c:set var="in3" value="${info3}"/>
	 				<c:set var="in4" value="${info4}"/>
	 				<c:set var="in5" value="${info5}"/>
	 				<c:set var="in6" value="${info6}"/>
	 				<c:set var="in7" value="${info7}"/>
	 				<c:set var="in8" value="${info8}"/>
	 				<c:set var="in9" value="${info9}"/>
	 				<c:set var="in10" value="${info10}"/>
	 				<c:set var="in11" value="${info11}"/>
	 				<c:set var="in12" value="${info12}"/>
	 				<c:set var="in13" value="${info13}"/>
	 				<c:set var="in14" value="${info14}"/>
	 				<c:set var="in15" value="${info15}"/>
	 				<%	
	 					for(int i=0;i<15;i++){
		 					String link=String.valueOf(pageContext.getAttribute("in"+(i+1)));
		 					test2=link.substring(link.indexOf("§1")+2,link.indexOf("/§1"));
		 					namelist.add(i,test2);
		 					test2=link.substring(link.indexOf("§2")+2,link.indexOf("/§2"));
		 					imagelist.add(i,test2); 					
		 					if(link.indexOf("/§10") != -1){
		 						System.out.println(link);
			 					test2=link.substring(link.indexOf("/§10")+6,link.length()-1);
			 					contentlist.add(i,test2);
		 					}else{
		 						contentlist.add(i,"없음");
		 					}
		 					if(link.indexOf("/§10")!=-1){
			 					test2=link.substring(link.indexOf("§10")+3,link.indexOf("/§10"));
			 					roomsizelist.add(i,test2);
		 					}else{
		 						roomsizelist.add(i,"없음");
		 					}
		 					test2=link.substring(link.indexOf("§8")+2,link.indexOf("/§8"));
		 					chkinout="체크인: "+test2+" ";
		 					test2=link.substring(link.indexOf("§9")+2,link.indexOf("/§9"));
		 					chkinout+="체크아웃: "+test2;
		 					chkinoutlist.add(i,chkinout);
		 					test2=link.substring(link.indexOf("§4")+2,link.indexOf("/§4"));
		 					pricelist.add(i,test2);
	 					}	
	 				%>
	 				
	 				<% for(int i=0;i<15;i++){%>
	 				<div class="hotel" style="width:100%;height:200px;margin-bottom:35px;font-size:15px;color:">
	 					<%if(imagelist.get(i).equals("없음")==true){%><img src="/images/empty_image.jpg" style="width:200px;height:200px;float:left;">
	 					<%}else{%><img src="<%=imagelist.get(i)%>" style="width:200px;height:200px;float:left;"><%}%>
	 					 <div style="float:left;height:100%;width:78%;margin-left:15px;">
	 						<div style="width:100%;height:30px;margin-bottom:10px;">
	 							<a style="font-size:22px;font-weight:bold;"><%=namelist.get(i)%></a>
	 						</div>
	 						<div style="width:50%;height:60px;overflow: hidden;text-overflow: ellipsis;display: -webkit-box;-webkit-line-clamp: 2 ;-webkit-box-orient: vertical;margin-bottom:10px;color: #505050;">
		 						<%if(contentlist.get(i).equals("없음")==false){%>
		 							<%=contentlist.get(i)%>
		 						<%}%>
	 						</div>
	 						<div style="width:70%;height:40px;color: #505050;">
		 						<%if(roomsizelist.get(i).equals("없음")==false){%>
		 						<%=roomsizelist.get(i)%>
		 						<%}%>
	 						</div>
	 						<div style="float:right;width:28%;height:50px;text-align:center;">
	 						<%if(pricelist.get(i).equals("0")==false){%>
	 							<a style="font-size:25px;font-weight:bold;">
	 								<%=pricelist.get(i)%> /박
	 							</a>
	 						<%}else{%>
								<a style="font-size:20px;font-weight:bold;"> 						
	 								객실 가격 전화문의
	 							</a>
	 						<%}%>
	 						</div>
	 						<div style="width:70%;height:40px;color: #505050;"><%=chkinoutlist.get(i)%></div>
	 					</div>
	 				</div>
	 				<%}%>
	 		<div style="width:700px;margin-left:10px; margin-top:10px; text-align:center;">
		  		<c:forEach var="i" begin="1" end="${tcnt}">
		  			<a href="apitest.do?page_no=${i}">${i}</a>
		  		</c:forEach>
		  	</div>
 		</c:if>
 	</section>

 	<footer>
 	
 	</footer>
</body>
</html>