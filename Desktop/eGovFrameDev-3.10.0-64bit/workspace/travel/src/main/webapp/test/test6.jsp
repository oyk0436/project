<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
.buttonMap {
	border:none;background-image:url(/images/map/mapMouseout.png);background-size:38px 20px;width:38px;height:20px;text-align:center;font-size:small;
}
button.on {
	border:none;background-image:url(/images/map/mapMouseover.png);background-size:38px 20px;width:38px;height:20px;text-align:center;font-size:small;color:#ffffff;
}
button.off {
	border:none;background-image:url(/images/map/mapMouseout.png);background-size:38px 20px;width:38px;height:20px;text-align:center;font-size:small;
}
div.map {
	position:absolute;font-color:#ffffff;
}
</style>

<script>
$( function() {
	
	var jeju = document.getElementById("jeju").value;
	
	$("#jeju").click(function(){
		$.ajax({
			type: "post",
			url : "/restaurant/regionDetail1.jsp?region="+jeju,
			dataType : "html",
			success : function(data) {
				$("#regionDetail").html(data);		
			},
			error : function(data) {
				alert("오류발생");
			}	
		});
	});
});
</script>

<body>
<form name = "frm" id = "frm" action="regionDetail.jsp">
	<div style="width:400px;float:left;">
		<img src = "images/map/korea.png" width="200px" height="300px">
		<div class="map" style="margin-left:50px;margin-top:-270px;"><button type ="button" id="region1" value="서울" class = "off" onmouseover="this.className='on'" onmouseout="this.className='off'">서울</button></div>
		<div class="map" style="margin-left:60px;margin-top:-240px;"><button type ="button" id="region1" value="경기" class = "off" onmouseover="this.className='on'" onmouseout="this.className='off'">경기</button></div>
		<div class="map" style="margin-left:100px;margin-top:-265px;"><button type ="button" id="region1" value="강원" class = "off" onmouseover="this.className='on'" onmouseout="this.className='off'">강원</button></div>
		<div class="map" style="margin-left:80px;margin-top:-215px;"><button type ="button" id="region1" value="충북" class = "off" onmouseover="this.className='on'" onmouseout="this.className='off'">충북</button></div>
		<div class="map" style="margin-left:40px;margin-top:-190px;"><button type ="button" id="region1" value="충남" class = "off" onmouseover="this.className='on'" onmouseout="this.className='off'">충남</button></div>
		<div class="map" style="margin-left:55px;margin-top:-150px;"><button type ="button" id="region1" value="전북" class = "off" onmouseover="this.className='on'" onmouseout="this.className='off'">전북</button></div>
		<div class="map" style="margin-left:40px;margin-top:-115px;"><button type ="button" id="region1" value="전남" class = "off" onmouseover="this.className='on'" onmouseout="this.className='off'">전남</button></div>
		<div class="map" style="margin-left:120px;margin-top:-180px;"><button type ="button" id="region1" value="경북" class = "off" onmouseover="this.className='on'" onmouseout="this.className='off'">경북</button></div>
		<div class="map" style="margin-left:100px;margin-top:-120px;"><button type ="button" id="region1" value="경남" class = "off" onmouseover="this.className='on'" onmouseout="this.className='off'">경남</button></div>
		<div class="map" style="margin-left:40px;margin-top:-50px;"><button type ="button" id="jeju"value="제주"  class = "off" onmouseover="this.className='on'" onmouseout="this.className='off'">제주</button></div>
	</div>
</form>
<div style="float:left;padding:20px;" id="regionDetail">
 
</div>

</body>
</html>