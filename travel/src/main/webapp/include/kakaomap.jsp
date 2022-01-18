<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <link rel="stylesheet" type="text/css" href="../css/kakaomap.css">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
 <script src="../include/jqueryui"></script>
</head>
<body>
<div id="container">
	<div id="mapbtn">
		<button type="button" class="mapbtn1" onclick="setOverlayMapTypeId('roadmap')">일반맵</button>
        <button type="button" class="mapbtn2" onclick="setOverlayMapTypeId('skyview')">스카이뷰</button>
        <button type="button" class="mapbtn3" onclick="setOverlayMapTypeId('hybrid')">하이브리드</button>
    </div>
    <div id="mapWrapper">
        <div id="map" style="width:100%;height:100%"></div> <!-- 지도를 표시할 div 입니다 -->
        <div id="roadviewControl" onclick="setRoadviewRoad()"></div>
        
    </div>
    <div id="rvWrapper">
        <div id="roadview" style="width:100%;height:100%"></div> <!-- 로드뷰를 표시할 div 입니다 -->
        <div id="close" title="로드뷰닫기" onclick="closeRoadview()"><span class="img"></span></div>
    </div>
</div>

<%@ include file="kakaomapScript" %>
</body>
</html>