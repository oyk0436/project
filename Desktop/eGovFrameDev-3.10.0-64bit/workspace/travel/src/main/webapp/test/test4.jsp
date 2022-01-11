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
</head>

<body>

	<div id="map" style="width:500px;height:400px;"></div>
	
	<script src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=19976d5f7cb975d9b5abd06e23c8e2ad&libraries=clusterer"></script>
	<script>

		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = {
		        center: new kakao.maps.LatLng(33.437479972218945, 126.67779194191777), // 지도의 중심좌표
		        level: 4, // 지도의 확대 레벨
		        mapTypeId : kakao.maps.MapTypeId.ROADMAP // 지도종류
		    }; 
	
		// 지도를 생성한다 
		var map = new kakao.maps.Map(mapContainer, mapOption); 
	
		// 마커 클러스터러를 생성합니다 
	    var clusterer = new kakao.maps.MarkerClusterer({
	        map: map, // 마커들을 클러스터로 관리하고 표시할 지도 객체 
	        averageCenter: true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정 
	        minLevel: 4 // 클러스터 할 최소 지도 레벨 
	    });
		
		// 위도 list 설정
	    var latitudeList = new Array();
		// 데이터 삽입
		<c:forEach var="result" items="${list }">
			latitudeList.push(${result.latitude });
		</c:forEach>
		
		// 경도 list 설정
		var longitudeList = new Array();
		// 데이터 삽입
		<c:forEach var="result" items="${list }">
			longitudeList.push(${result.longitude });
		</c:forEach>
		
		// 상호명 list 설정
		var titleList = new Array();
		// 데이터 삽입
		<c:forEach var="result" items="${list }">
			titleList.push("${result.title }");
		</c:forEach>
		
		// 마커 표시 for문 길이 설정
		var maplength = latitudeList.length-1;
		
		var markers = [];
		
		for (var i = 0; i <= maplength; i++) {
	
			// 마커를 생성합니다
			var marker = new kakao.maps.Marker({
			    position: new kakao.maps.LatLng(latitudeList[i], longitudeList[i]),
			    map: map
			});
		
			// 인포윈도우를 생성하고 지도에 표시합니다
			var infowindow = new kakao.maps.InfoWindow({
			    content : titleList[i]
			});
			
			// 마커가 지도 위에 표시되도록 설정합니다
			markers.push(marker);
			
			kakao.maps.event.addListener (
					marker, 
					'mouseover', 
					makeOverListener(map, marker, infowindow));
			
			kakao.maps.event.addListener (
					marker, 
					'mouseout', 
					makeOutListener(infowindow));
			 kakao.maps.event.addListener(clusterer, 'clusterclick', function(cluster) {
	
			        // 현재 지도 레벨에서 1레벨 확대한 레벨
			        var level = map.getLevel()-1;
	
			        // 지도를 클릭된 클러스터의 마커의 위치를 기준으로 확대합니다
			        map.setLevel(level, {anchor: cluster.getCenter()});
			    });
		}
		
		clusterer.addMarkers(markers);
		
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
	</script>

	
</body>
</html>