<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	
	
	<link rel="stylesheet" href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
	
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
		 
</head>

<style>
body {
	font-size:10px;
}
.container {
	width:1000px;height:1000px;margin:0 auto;
}

.div1 {
	width:200px;height:2000px;background-color:#ffffcc;text-align:center;padding-top:20px;float:left;
}

.div2 {
	width:800px;height:2000px;text-align:center;padding-top:20px;float:left;background-color:rgb(255, 255, 255);
}

.cell1 {
	border-bottom:1px solid #ccc;display:table-cell;vertical-align:middle;height:20px;width:25%;font-size:14px;font-weight:bold;
}
.cell2 {
	border-bottom:1px solid #ccc;display:table-cell;vertical-align:middle;height:20px;text-align:left;padding:13px;
}
.cell3 {
	border-bottom:1px solid #ccc;display:table-cell;vertical-align:middle;height:30px;width:25%;
}

#mapwrap{position:relative;overflow:hidden;}
.category, .category *{margin:0;padding:0;color:#000;}   
.category {position:absolute;overflow:hidden;top:20px;left:30px;width:150px;height:50px;z-index:10;border:1px solid black;font-family:'Malgun Gothic','맑은 고딕',sans-serif;font-size:12px;text-align:center;background-color:#fff;}
.category .menu_selected {background:#FF5F4A;color:#fff;border-left:1px solid #915B2F;border-right:1px solid #915B2F;margin:0 -1px;} 
.category li{list-style:none;float:left;width:50px;height:45px;padding-top:5px;cursor:pointer;} 
.category .ico_comm {display:block;margin:0 auto 2px;width:22px;height:26px;background:url('images/map/mapIcon.png') no-repeat;} 
.category .ico_restaurant {background-position:-10px 0;}  
.category .ico_travel {background-position:-10px -36px;}   
.category .ico_tour {background-position:-10px -72px;} 

</style>

<body>

<%@include file="/include/top.jsp" %>

<div class="container" style="margin:0 auto;">
	
	<div class = "div2">
		
		<form name = "frm" id = "frm">

	 	<div style = "text-align:left;
	 				  margin-left:80px;
	 				  margin-top:20px;
	 				  font-weight:bold;
	 				  font-size:30px;">
	 		${vo.title }
	 	</div>
	 	
	 	<div style="width:48%;height:200px;float:left;margin-left:10px;margin-top:20px;">
	 		<img id = "bigImg" 
	 			 src = "images/restaurant/${vo.title }1.jpg" 
	 			 onerror="this.src='images/error/errorImg.jpg'"
	 			 style = "width:300px;height:180px;">
	 	</div>
	 	
	 	<div style="display:table;position:relative;width:700px;width:45%;float:left;">
	 		<div style=";display:table-row;text-align:center;">
				<div class="cell1">상호명</div>
				<div class="cell2">${vo.title }</div>
			</div>
			<div style=";display:table-row;text-align:center;">
				<div class="cell1">주소</div>
				<div class="cell2">${vo.address }</div>
			</div>
			<div style=";display:table-row;text-align:center;">
				<div class="cell1">문의전화</div>
				<div class="cell2">${vo.telephone }</div>
			</div>
			<div style=";display:table-row;text-align:center;">
				<div class="cell1">대표 메뉴</div>
				<div class="cell2">${vo.topmenu }</div>
			</div>
			<div style=";display:table-row;text-align:center;">
				<div class="cell1">평점</div>
				<div class="cell2">${lineReview.grade }점</div>
			</div>
			<div style=";display:table-row;text-align:center;">
				<div class="cell1">스크랩</div>
				<div class="cell2">
					<button type = "button" id = "scrap" onclick="fn_scrap()">
						<img id = "scrapOn" src = "images/icon/scrapOn.png" style="width:20px;height:20px;border:none;"> 
						<img id = "scrapOff" src = "images/icon/scrapOff.png" style="width:20px;height:20px;border:none;">
					</button>
					<span id="scrap_area"></span>
				</div>
			</div>
	 	</div>
	 	
	 	<input type = "hidden" name = "userid" id = "userid" value = "<%=USERID %>">
	 	<input type = "hidden" name = "count" id = "count" value = "${scrap.count }">
	 	<input type = "hidden" name = "title" id = "title" value = "${vo.title }">
	 	<input type = "hidden" name = "topmenu" id = "topmenu" value = "${vo.topmenu }">
	 	<input type = "hidden" name = "grade" id = "grade" value = "${lineReview.grade }">
	 	<input type = "hidden" name = "address" id = "address" value = "${vo.address }">
	 	<input type = "hidden" name = "category" id = "cateogry" value = "restaurant">
	 	<!--  상태 변환 시켜 전달  0(스크랩 X) -> 1(스크랩 O), 1(스크랩 O) -> 0(스크랩 X)-->
	 	<c:set var = "status" value = "${scrap.status }"/>
	 	<% 
	 	int status = (int) pageContext.getAttribute("status");
	 	if (status == 1) {
	 		status = 0;
	 	} else if (status == 0) {
	 		status = 1;
	 	}
	 	%>
	 	<input type = "hidden" name = "status" id = "status" value = "<%=status %>">
	 	<script>
		
	 	var status = document.getElementById("status").value;
	 	var count = document.getElementById("count").value;
	 	var userid = document.getElementById("userid").value;
	 	
		$(document).ready(function() {
			if (count == 0) {
		        $("#scrapOff").show();
		        $("#scrapOn").hide();
			} else if (count == 1 && status == 1) {
				$("#scrapOff").show();
				$("#scrapOn").hide();
			} else if (count == 1 && status == 0) {
				$("#scrapOff").hide();
		        $("#scrapOn").show();
			}
			
	        //scrapOff를 클릭했을 때 scrapOn을 보여줌
			$("#scrapOff").click(function(){			
				if (userid == null || userid.equals("")) {
					if (confirm("로그인 후 이용가능합니다. 로그인 페이지로 이동 하시겠습니까?")) {
						location = "loginWrite.do";
					}
				} else {
					$("#scrapOff").hide();
			        $("#scrapOn").show();
				}
			});
				
	        //scrapOn을 클릭했을 때 scrapOff를 보여줌
			$("#scrapOn").click(function(){			
				if (userid == null || userid.equals("")) {
					if (confirm("로그인 후 이용가능합니다. 로그인 페이지로 이동 하시겠습니까?")) {
						location = "loginWrite.do";
					}
				} else {
					$("#scrapOff").show();
			        $("#scrapOn").confirm();
				}
			});
	        
	        
		});
	 	
	 	
	 	function fn_scrap() {
			<%
			if (USERID == null || USERID.equals("")) {
			%>
				if (confirm("로그인 후 이용가능합니다. 로그인 페이지로 이동 하시겠습니까?")) {
					location = "loginWrite.do";
				}
			<%
			} else {
			%>
				var count = 1;
				var formdata = $("#frm").serialize();
				var count = document.getElementById("count").value;
				var status = document.getElementById("status").value;
				
				if (count == 0 ) {
					$.ajax({
						type : "post",
						data : formdata,
						url : "scrapSave.do",
						
						dataType : "text",
						success : function(data) {
							alert("스크랩 되었습니다.");
							location.reload();
						},
						error : function() {
							alert ("전송 오류!");
						}
					});
				} else if (count > 0) {
					$.ajax({
						type : "post",
						data : formdata,
						url : "scrapUpdate.do",
						
						dataType : "text",
						success : function(data) {
							if (data == "ok") {
								alert("스크랩 되었습니다.");
								location.reload();
							} else if (data == "cancel") {
								alert("스크랩 취소 되었습니다.");
								location.reload();
							}
						},
						error : function() {
							alert ("전송 오류!");
						}
					});
				}
			<%
			}
			%>
		}
		
		</script>
	 	
	 	
	 	
	 	<div style="width:200px;float:left;margin-left:-5px;margin-top:-65px;">
	 		<a href = "javscrip:;">
	 			<img id = "smallImg1" 
	 				 onmouseover = "document.getElementById('bigImg').src ='images/restaurant/${vo.title }1.jpg'"
	 				 onmouseout = "document.getElementById('bigImg}').src ='images/restaurant/${vo.title }1.jpg'" 
	 				 src = "images/restaurant/${vo.title }1.jpg"
	 				 onerror="this.src='images/error/errorImg.jpg'" 
	 				 style = "width:90px;height:60px;">
	 		</a>
	 	</div>
	 	<div style="width:200px;float:left;margin-left:100px;margin-top:-65px;">
	 		<a href = "javscrip:;">
	 			<img id = "smallImg2" 
	 				 onmouseover = "document.getElementById('bigImg').src ='images/restaurant/${vo.title }2.jpg'" 
	 				 onmouseout = "document.getElementById('bigImg').src ='images/restaurant/${vo.title }1.jpg'"
	 				 src = "images/restaurant/${vo.title }2.jpg" 
	 				 onerror="this.src='images/error/errorImg.jpg'"
	 				 style = "width:90px;height:60px;">
	 		</a>
	 	</div>
	 	<div style="width:200px;float:left;margin-left:205px;margin-top:-65px;">
	 		<a href = "javscrip:;">
	 			<img id = "smallImg3" 
	 				 onmouseover = "document.getElementById('bigImg').src ='images/restaurant/${vo.title }3.jpg'" 
	 				 onmouseout = "document.getElementById('bigImg').src ='images/restaurant/${vo.title }1.jpg'"
	 				 src = "images/restaurant/${vo.title }3.jpg" 
	 				 onerror="this.src='images/error/errorImg.jpg'"
	 				 style = "width:90px;height:60px;">
	 		</a>
	 	</div>
	 	
	 	<div style="clear:left;top:20px;"></div>
	 	<div style = "text-align:left;
 				  	  margin-left:30px;
 				 	  margin-top:50px;
 					  font-weight:bold;
 					  font-size:12px;
 					  clear:left;">
 			상세보기
 		</div>
 		
 		<div style="display:table;position:relative;width:700px;left:50px;top:20px;">
	 		<div style=";display:table-row;text-align:center;">
				<div class="cell1">영업 시간</div>
				<div class="cell2">${vo.availiabletime }</div>
			</div>
			<div style=";display:table-row;text-align:center;">
				<div class="cell1">휴무</div>
				<div class="cell2">${vo.closed }</div>
			</div>
			<div style=";display:table-row;text-align:center;">
				<div class="cell1">메뉴</div>
				<div class="cell2">${vo.menu }</div>
			</div>
			<div style=";display:table-row;text-align:center;">
				<div class="cell1">배달/포장</div>
				<div class="cell2">${vo.packaging }</div>
			</div>
			<div style=";display:table-row;text-align:center;">
				<div class="cell1">놀이방</div>
				<div class="cell2">${vo.child }</div>
			</div>
			<div style=";display:table-row;text-align:center;">
				<div class="cell1">금연석</div>
				<div class="cell2">${vo.smoking }</div>
			</div>
			<div style=";display:table-row;text-align:center;">
				<div class="cell1">주차</div>
				<div class="cell2">${vo.parking }</div>
			</div>
			<div style=";display:table-row;text-align:center;">
				<div class="cell1">기타시설</div>
				<div class="cell2">${vo.information }</div>
			</div>
			<div style=";display:table-row;text-align:center;">
				<div class="cell1">소개</div>
				<div class="cell2">${vo.summary }</div>
			</div>		
 		</div>
		
		<div style = "text-align:left;
 				  	  margin-left:30px;
 				 	  margin-top:100px;
 					  font-weight:bold;
 					  font-size:12px;
 					  ">
 			한줄 리뷰 & 평가
 		</div>
 		
 		<input type = "hidden" name = "unq" id = "unq" value = "${vo.unq }">
 		<input type = "hidden" name = "s_no" id = "s_no" value = "${lineReview.s_no }">
 		<input type = "hidden" name = "e_no" id = "e_no" value = "${lineReview.e_no }">
 		
 		<div style="float:right;margin-right:60px;">
			<button type = "button" id = "btn_lineReview" onclick = "fn_lineReview()">평가하기</button>
		</div>
	 	
 		<script>

		function fn_lineReview() {
			<%
			if (USERID == null || USERID.equals("")) {
			%>
				if (confirm("로그인 후 이용가능합니다. 로그인 페이지로 이동 하시겠습니까?")) {
					location = "loginWrite.do";
				}
			<%
			} else {
			%>
			var unq = document.getElementById("unq").value;
			
			var url = "restaurantLineReview.do?unq="+unq;
			var p_width = 500;
			var p_height = 400;
			var s_width = window.screen.width/2 - p_width/2;
			var s_height = (window.screen.height/2) - (p_height);
			window.open(url,"popup","width="+p_width+",height="+p_height+",resizable=yes,left="+s_width+",top="+s_height);
			<%
			}
			%>
		}
		
		</script>
		
 		
 		
 		<div>
 			<div style="display:table;position:relative;width:700px;left:50px;top:20px;">
		 		<div style="display:table-row;text-align:center;margin-bottom:10px;">
					<div class="cell1" style="width:55%;border:none;margin-left:20px;">한줄 평가</div>
					<div class="cell1" style="width:10%;border:none;">글쓴이</div>
					<div class="cell1" style="width:15%;border:none;">작성일</div>
					<div class="cell1" style="width:10%;border:none;">평점</div>
				</div>
				
				<c:set var="rownum" value="${lineReview.rownum }"/>
				<c:forEach var = "result" items = "${reviewlist }">		
				
				<div style=";display:table-row;text-align:center;">
					<div class="cell3" style="width:55%;text-align:left;padding:2px;">${result.content }</div>
					<div class="cell3" style="width:10%;">${result.name }</div>
					<div class="cell3" style="width:15%;">${result.rdate }</div>
					<div class="cell3" style="width:10%;">${result.grade }</div>
				</div>
					
				<c:set var="rownum" value="${rownum-1 }"/>
				</c:forEach>
			</div>
 		</div>
 		
 		<div style = "text-align:center;margin-top:50px;">
 			<c:set var="page_sno" value="${lineReview.page_sno }"/>
 			<%
 			int page_sno = (int)pageContext.getAttribute("page_sno");
 			pageContext.setAttribute("page_sno", page_sno);
 			
 			if (page_sno-1 > 0) {
 			%>
 				<a href = "restaurantDetail.do?page_no=${page_sno-1 }&unq=${vo.unq }">이전</a>
 			<%
 			}
 			%>
 
 			<c:set var="page_eno" value="${lineReview.page_eno }"/>
 			<c:set var="total_page" value="${lineReview.total_page }"/>
 			<%
 			int page_eno = (int)pageContext.getAttribute("page_eno");
 			int total_page = (int)pageContext.getAttribute("total_page");
 			
			if (page_eno > total_page) {
				page_eno = total_page;
			}
			
			pageContext.setAttribute("page_eno", page_eno) ;
 			%>
			<c:forEach var="i" begin="${lineReview.page_sno }" end="${page_eno }">
				<a href = "restaurantDetail.do?page_no=${i }&unq=${vo.unq }"><span style="font-size:14px">${i }</span></a>
			</c:forEach>
			<%
			if (page_eno+1 < total_page) {
			%>
				<a href = "restaurantDetail.do?page_no=${lineReview.page_eno+1 }&unq=${vo.unq }">다음</a>
			<%
			}
			%>
		</div>
		
 		</form>
 		
 		<div style = "text-align:left;
 				  	  margin-left:30px;
 				 	  margin-top:50px;
 					  font-weight:bold;
 					  font-size:12px;
 					  position:relative;
 					  ">
 			찾아가는 길
 		</div>
	
		<div id="mapwrap"> 
		    <!-- 지도가 표시될 div -->
		    <div id="map" style="width:100%px;height:400px;margin-left:30px;margin-top:20px;"></div>
		    <!-- 지도 위에 표시될 마커 카테고리 -->
		    <div class="category">
		        <ul>
		            <li id="restaurantMenu" onclick="changeMarker('restaurant')">
		                <span class="ico_comm ico_restaurant"></span>
		                음식점
		            </li>
		            <li id="travelMenu" onclick="changeMarker('travel')">
		                <span class="ico_comm ico_travel"></span>
		                숙박
		            </li>
		            <li id="tourMenu" onclick="changeMarker('tour')">
		                <span class="ico_comm ico_tour"></span>
		                관광지
		            </li>
		        </ul>
		    </div>
		</div>

		<script src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=19976d5f7cb975d9b5abd06e23c8e2ad&libraries=clusterer"></script>
		<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
		    mapOption = { 
		        center: new kakao.maps.LatLng(${vo.latitude }, ${vo.longitude }), // 지도의 중심좌표 
		        level: 3 // 지도의 확대 레벨 
		    }; 
		
		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		
		//음식점 마커가 표시될 좌표 배열
		var restaurantPositions = new Array();
		
		// 음식점 데이터 삽입
		<c:forEach var="restaurant" items="${restaurantMapList }">
			restaurantPositions.push(new kakao.maps.LatLng(${restaurant.latitude }, ${restaurant.longitude} ));
		</c:forEach>
		
		var restaurantTitle = new Array();
		<c:forEach var="title1" items="${restaurantMapList }">
			restaurantTitle.push("${title1.title }");
		</c:forEach>
		
		// 숙박 마커가 표시될 좌표 배열
		var travelPositions = new Array();
		// 숙박 데이터 삽입
		<c:forEach var="travel" items="${travelMapList }">
			travelPositions.push(new kakao.maps.LatLng(${travel.latitude }, ${travel.longitude} ));
		</c:forEach>
		
		var travelTitle = new Array();
		<c:forEach var="title2" items="${travelMapList }">
			travelTitle.push("${title2.title }");
		</c:forEach>
		
		// 관광지 마커가 표시될 좌표 배열
		var tourPositions = new Array();
		// 관광지 데이터 삽입
		<c:forEach var="tour" items="${tourMapList }">
			tourPositions.push(new kakao.maps.LatLng(${tour.latitude }, ${tour.longitude} ));
		</c:forEach>    
		
		var tourTitle = new Array();
		<c:forEach var="title3" items="${tourMapList }">
			tourTitle.push("${title3.title }");
		</c:forEach>
		
		var markerImageSrc = 'images/map/mapIcon.png';  // 마커이미지의 주소입니다. 스프라이트 이미지 입니다
		    restaurantMarkers = [], // 커피숍 마커 객체를 가지고 있을 배열입니다
		    travelMarkers = [], // 편의점 마커 객체를 가지고 있을 배열입니다
		    tourMarkers = []; // 주차장 마커 객체를 가지고 있을 배열입니다
		
		    
		createRestaurantMarkers(); // 커피숍 마커를 생성하고 커피숍 마커 배열에 추가합니다
		createTravelMarkers(); // 편의점 마커를 생성하고 편의점 마커 배열에 추가합니다
		createTourMarkers(); // 주차장 마커를 생성하고 주차장 마커 배열에 추가합니다
		
		changeMarker('restaurant'); // 지도에 커피숍 마커가 보이도록 설정합니다    
		
		// 마커이미지의 주소와, 크기, 옵션으로 마커 이미지를 생성하여 리턴하는 함수입니다
		function createMarkerImage(src, size, options) {
		    var markerImage = new kakao.maps.MarkerImage(src, size, options);
		    return markerImage;            
		}
		
		// 좌표와 마커이미지를 받아 마커를 생성하여 리턴하는 함수입니다
		function createMarker(position, image) {
		    var marker = new kakao.maps.Marker({
		        position: position,
		        image: image
		    });
		    
		    return marker;  
		}   
		   
		// 커피숍 마커를 생성하고 커피숍 마커 배열에 추가하는 함수입니다
		function createRestaurantMarkers() {
		    
		    for (var i = 0; i < restaurantPositions.length; i++) {  
		        
		        var imageSize = new kakao.maps.Size(22, 26),
		            imageOptions = {  
		                spriteOrigin: new kakao.maps.Point(10, 0),    
		                spriteSize: new kakao.maps.Size(36, 98)  
		            };     
		        
		        // 마커이미지와 마커를 생성합니다
		        var markerImage = createMarkerImage(markerImageSrc, imageSize, imageOptions),    
		            marker = createMarker(restaurantPositions[i], markerImage);  
		        
		        // 마커에 표시할 인포윈도우를 생성합니다 
		        var infowindow = new kakao.maps.InfoWindow({
		            content: restaurantTitle[i] // 인포윈도우에 표시할 내용
		        });
		        
		        kakao.maps.event.addListener (
						marker, 
						'mouseover', 
						makeOverListener(map, marker, infowindow));
				
				kakao.maps.event.addListener (
						marker, 
						'mouseout', 
						makeOutListener(infowindow));
				
		        // 생성된 마커를 커피숍 마커 배열에 추가합니다
		        restaurantMarkers.push(marker);
		    }     
		}
		
		// 커피숍 마커들의 지도 표시 여부를 설정하는 함수입니다
		function setRestaurantMarkers(map) {        
		    for (var i = 0; i < restaurantMarkers.length; i++) {  
		    	restaurantMarkers[i].setMap(map);
		    }        
		}
		
		// 편의점 마커를 생성하고 편의점 마커 배열에 추가하는 함수입니다
		function createTravelMarkers() {
		    for (var i = 0; i < travelPositions.length; i++) {
		        
		        var imageSize = new kakao.maps.Size(22, 26),
		            imageOptions = {   
		                spriteOrigin: new kakao.maps.Point(10, 36),    
		                spriteSize: new kakao.maps.Size(36, 98)  
		            };       
		     
		        // 마커이미지와 마커를 생성합니다
		        var markerImage = createMarkerImage(markerImageSrc, imageSize, imageOptions),    
		            marker = createMarker(travelPositions[i], markerImage);  
		        
		    	// 마커에 표시할 인포윈도우를 생성합니다 
		        var infowindow = new kakao.maps.InfoWindow({
		            content: travelTitle[i] // 인포윈도우에 표시할 내용
		        });
		        
		        kakao.maps.event.addListener (
						marker, 
						'mouseover', 
						makeOverListener(map, marker, infowindow));
				
				kakao.maps.event.addListener (
						marker, 
						'mouseout', 
						makeOutListener(infowindow));
		        
		        // 생성된 마커를 편의점 마커 배열에 추가합니다
		        travelMarkers.push(marker);
		    }        
		}
		
		// 편의점 마커들의 지도 표시 여부를 설정하는 함수입니다
		function setTravelMarkers(map) {        
		    for (var i = 0; i < travelMarkers.length; i++) {  
		    	travelMarkers[i].setMap(map);
		    }        
		}
		
		// 주차장 마커를 생성하고 주차장 마커 배열에 추가하는 함수입니다
		function createTourMarkers() {
		    for (var i = 0; i < tourPositions.length; i++) {
		        
		        var imageSize = new kakao.maps.Size(22, 26),
		            imageOptions = {   
		                spriteOrigin: new kakao.maps.Point(10, 72),    
		                spriteSize: new kakao.maps.Size(36, 98)  
		            };       
		     
		        // 마커이미지와 마커를 생성합니다
		        var markerImage = createMarkerImage(markerImageSrc, imageSize, imageOptions),    
		            marker = createMarker(tourPositions[i], markerImage);  
				
		     	// 마커에 표시할 인포윈도우를 생성합니다 
		        var infowindow = new kakao.maps.InfoWindow({
		            content: tourTitle[i] // 인포윈도우에 표시할 내용
		        });
		        
		        kakao.maps.event.addListener (
						marker, 
						'mouseover', 
						makeOverListener(map, marker, infowindow));
				
				kakao.maps.event.addListener (
						marker, 
						'mouseout', 
						makeOutListener(infowindow));
		        
		        // 생성된 마커를 주차장 마커 배열에 추가합니다
		        tourMarkers.push(marker);        
		    }                
		}
		
		// 주차장 마커들의 지도 표시 여부를 설정하는 함수입니다
		function setTourMarkers(map) {        
		    for (var i = 0; i < tourMarkers.length; i++) {  
		    	tourMarkers[i].setMap(map);
		    }        
		}
		
		function makeOverListener(map, marker, infowindow) {
		    return function() {
		        infowindow.open(map, marker);
		    };
		}
		
		// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
		function makeOutListener(infowindow) {
		    return function() {
		        infowindow.close();
		    };
		}
		
		// 카테고리를 클릭했을 때 type에 따라 카테고리의 스타일과 지도에 표시되는 마커를 변경합니다
		function changeMarker(type){
		    
		    var restaurantMenu = document.getElementById('restaurantMenu');
		    var travelMenu = document.getElementById('travelMenu');
		    var tourMenu = document.getElementById('tourMenu');
		    
		    // 커피숍 카테고리가 클릭됐을 때
		    if (type === 'restaurant') {
		    
		        // 커피숍 카테고리를 선택된 스타일로 변경하고
		        restaurantMenu.className = 'menu_selected';
		        
		        // 편의점과 주차장 카테고리는 선택되지 않은 스타일로 바꿉니다
		        travelMenu.className = '';
		        tourMenu.className = '';
		        
		        // 커피숍 마커들만 지도에 표시하도록 설정합니다
		        setRestaurantMarkers(map);
		        setTravelMarkers(null);
		        setTourMarkers(null);
		        
		    } else if (type === 'travel') { // 편의점 카테고리가 클릭됐을 때
		    
		        // 편의점 카테고리를 선택된 스타일로 변경하고
		        restaurantMenu.className = '';
		        travelMenu.className = 'menu_selected';
		        tourMenu.className = '';
		        
		        // 편의점 마커들만 지도에 표시하도록 설정합니다
		        setRestaurantMarkers(map);
		        setTravelMarkers(map);
		        setTourMarkers(null);
		        
		    } else if (type === 'tour') { // 주차장 카테고리가 클릭됐을 때
		     
		        // 주차장 카테고리를 선택된 스타일로 변경하고
		        restaurantMenu.className = '';
		        travelMenu.className = '';
		        tourMenu.className = 'menu_selected';
		        
		        // 주차장 마커들만 지도에 표시하도록 설정합니다
		        setRestaurantMarkers(map);
		        setTravelMarkers(null);
		        setTourMarkers(map);  
		    }    
		} 
		</script>
		
 		
	</div>

</div>

</body>
</html>



