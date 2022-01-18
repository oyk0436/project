<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여행 이슈 등록</title>
	<link rel="stylesheet" href="/css/admin_layout.css">
</head>

<style>
	body{
		width:1800px;
	}
	.cellLineReview1 {
		border:1px solid #ccc;display:table-cell;vertical-align:middle;width:100px;font-size:14px;font-weight:bold;
	}
	.cellLineReview2 {
		border:1px solid #ccc;display:table-cell;vertical-align:middle;text-align:left;font-size:14px;padding:7px;
	}
	.btndiv{
		margin-top:25px;
		float:right;
	}
	.btndiv button{
		width:70px;
		height:40px;
		font-size:15px;
		border:0px;
	}
</style>

<script>

$( function() {

});

</script>

<body>
	<%@ include file="../include/top.jsp" %>
	<div class="div1">
		<%@ include file="../include/admin_left_menu.jsp"%>
	</div>
	
	
	<form name = "frm" method="post" action="insertissue.do">
		
	<div style="display:table;float:left;width:1500px;text-align:center;margin-left:100px;">
		<div style = "font-size:25px;width:170px;font-weight:bold;margin-bottom:50px;">
			 여행 이슈 등록
		</div>
		<div style="display:table-row;text-align:center;">
			<div class="cellLineReview1">글쓴이</div>
			<div class="cellLineReview2">
				관리자
			</div>
		</div>
 		<div style="display:table-row;text-align:center;width:500px;">
			<div class="cellLineReview1">내용</div>
			<div class="cellLineReview2">
				<textarea name = "content" id = "content" style="width:98%;height:500px;" autofocus></textarea>
			</div>
		</div>
 	</div>
 	<div class="btndiv">
	 	<button type="submit" style="font-weight:bold;background-color:#e0f8eb;">저장</button>
	 	<button type="button" onClick="history.go(-1)">취소</button>
 	</div>
 	
 	
 	</form>
 	
 	
 	
	
</body>
</html>