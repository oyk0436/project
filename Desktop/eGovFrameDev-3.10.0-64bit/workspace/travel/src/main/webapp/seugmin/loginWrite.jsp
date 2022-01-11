<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 화면</title>

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script>
$(function(){
	
	$("#btn_save").click(function(){
		if($("#userid").val() == "") {
			alert("아이디를 입력해주세요.");
			$("#userid").foucs();
			return false;
		}
		if($("#pass").val() == "") {
			alert("암호를 입력해주세요.");
			$("#pass").foucs();
			return false;
		}
		
		var form_data = $("#frm").serialize(); // form에 대한 인식
		$.ajax({
			/*전송 전 세팅*/
    		type:"POST",
    		url:"loginWriteSub.do",
    		data:form_data,
    		
    		datatype: "text",
    		success: function(data) {
    			if(data == "ok") {
    				alert($("#userid").val() + "님 로그인 되었습니다.");
    			
    				location= "loginWrite.do";
    				
    			} else if  (data == "er1") {
    				alert("잘못된 정보입니다.");
    			} else {
    				alert("로그인 실패!");
    			}
    		},
    		error: function() { // 장애발생
    			alert("전송오류!");
    		}
			
		});
		
	});
	
});
</script>

</head>
<style>
body {
	font-size:9pt;
	font-col:#333333;
	font-family:맑은 고딕;
}
a{
 text-decoration:none;

}
table {
	width:600px;
	board-collapse:collapse;
}
th, td {
	boarder: 1px solid #cccccc;
	padding:3px;
	line-height:2.0;
}
caption {
	font-size:15pt;
	font-weight:bold;
	margin-top:10px;
	padding-bottom:5px;
}
.div_button {
	width:600px;
	text-align:center;
	margin-top:5px;
}
</style>
<body>
<form name="frm" id="frm">
<table>
	<caption>로그인</caption>
	<tr>
		<th><lable for="userid">아이디</lable></th>
		<td>
		<input type="text" name="userid" id="userid" placeholder="아이디입력">
		</td>
	</tr>
	<tr>
		<th><lable for="pass">암호</lable></th>
		<td>
		<input type="password" name="pass" id="pass">
		</td>
	</tr>
</table>

<div class="div_button">
	<button type="button" id="btn_save" >로그인</button>
	<button type="reset">취소</button>
</div>	
</form>

</body>
</html>