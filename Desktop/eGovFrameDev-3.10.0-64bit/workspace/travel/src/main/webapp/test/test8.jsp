<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>다양한 이미지 마커 표시하기</title>
    <style>
#mapwrap{position:relative;overflow:hidden;}
.category, .category *{margin:0;padding:0;color:#000;}   
.category {position:absolute;overflow:hidden;top:10px;left:10px;width:150px;height:50px;z-index:10;border:1px solid black;font-family:'Malgun Gothic','맑은 고딕',sans-serif;font-size:12px;text-align:center;background-color:#fff;}
.category .menu_selected {background:#FF5F4A;color:#fff;border-left:1px solid #915B2F;border-right:1px solid #915B2F;margin:0 -1px;} 
.category li{list-style:none;float:left;width:50px;height:45px;padding-top:5px;cursor:pointer;} 
.category .ico_comm {display:block;margin:0 auto 2px;width:22px;height:26px;background:url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/category.png') no-repeat;} 
.category .ico_restaurant {background-position:-10px 0;}  
.category .ico_travel {background-position:-10px -36px;}   
.category .ico_tour {background-position:-10px -72px;} 
</style>
</head>
<body>
<div id="mapwrap"> 
    <!-- 지도가 표시될 div -->
    <div id="map" style="width:100%;height:500px;"></div>
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
        center: new kakao.maps.LatLng(33.463044662951184, 126.30964687677329), // 지도의 중심좌표 
        level: 3 // 지도의 확대 레벨 
    }; 

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

// 음식점 마커가 표시될 좌표 배열
var restaurantPositions = new Array();
// 음식점 데이터 삽입
<c:forEach var="result1" items="${restaurantMapList }">
	restaurantPositions.push(new kakao.maps.LatLng(${result1.latitude }, ${result1.longitude}));
</c:forEach>
// 숙박 마커가 표시될 좌표 배열
var travelPositions = new Array();
// 숙박 데이터 삽입
<c:forEach var="result2" items="${travelMapList }">
	travelPositions.push(new kakao.maps.LatLng(${result2.latitude }, ${result2.longitude}));
</c:forEach>
// 관광지 마커가 표시될 좌표 배열
var tourPositions = new Array();
// 관광지 데이터 삽입
<c:forEach var="result3" items="${tourMapList }">
	tourPositions.push(new kakao.maps.LatLng(${result3.latitude }, ${result3.longitude}));
</c:forEach>

var markerImageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/category.png';  // 마커이미지의 주소입니다. 스프라이트 이미지 입니다
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
        
        // 생성된 마커를 커피숍 마커 배열에 추가합니다
        restaurantMarkers.push(marker);
    }     
}

// 커피숍 마커들의 지도 표시 여부를 설정하는 함수입니다
function setCRestaurantMarkers(map) {        
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
        setRestaurantMarkers(null);
        setTravelMarkers(map);
        setTourMarkers(null);
        
    } else if (type === 'tour') { // 주차장 카테고리가 클릭됐을 때
     
        // 주차장 카테고리를 선택된 스타일로 변경하고
        restaurantMenu.className = '';
        travelMenu.className = '';
        tourMenu.className = 'menu_selected';
        
        // 주차장 마커들만 지도에 표시하도록 설정합니다
        setRestaurantMarkers(null);
        setTravelMarkers(null);
        setTourMarkers(map);  
    }    
} 
</script>
</body>
</html>