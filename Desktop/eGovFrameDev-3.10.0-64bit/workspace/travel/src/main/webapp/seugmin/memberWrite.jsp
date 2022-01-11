<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/member.css">

<title>회원가입화면</title>

<link rel="stylesheet" href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
<script>

function fn_idcheck(userid) {
	
	var msg;
	var len = userid.length;
	if (len < 4 || len > 12) {
		msg = "<font color='red'> 아이디는 4자~12자 사이로 입력해주세요.</font>";
		$("#msg_area").html(msg);
	} else {
		
		$.ajax({
			type : "post",
			data : "userid="+userid,
			url  : "idcheck.do",
			
			datatype : "text",
			success : function(data) {
				if(data == "ok") {
					msg="<font color='green'>사용 가능한 아이디입니다.</font>";
				} else if(data == "er1") {
					msg="<font color='red'>이미 사용 중인 아이디입니다.</font>"; 
				} else if( data == "er2") { 
					msg="<font color='red'>형식에 맞지 않습니다.</font>";
				} else {
					msg="<font color='red'>전송 오류!</font>";
				}
				if( data == "ok") {
					$("#id_chk").val("1");
				}
				$("#msg_area").html(msg);
			},
			error : function() {
				msg="<font color='red'>설정오류!</font>";
				$("#msg_area").html(msg);
			}
		});
	}
	 
	
}

    $(function() {
    	$("#birth").datepicker({
    	 dateFormat : "yy/mm/dd",
    	 changeMonth: true,
    	    changeYear: true,
    	    nextText: '다음 달',
    	    prevText: '이전 달',
    	        dayNames: ['월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일'],
    	        dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'],
    	        monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
    	        monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']
    	 });
    
    $("btn_zipcode").click(function(){
    	var w = 500;
    	var h = 100;
    	var url = "post1.do";
    	window.open(url,'zipcode','width='+w+",height="+h);
    });
    
    $("#btn_submit").click(function() {
    	var userid = $("#userid").val();
    	var pass = $("#pass").val();
    	var name = $("#name").val();
    
    	userid = $.trim(userid); // 변수 공백 제거
    	
    	if(userid == "") { 		// 오류 체크(공백에 대한 여부)
    		alert("아이디를 입력해주세요.");
    		$("#userid").focus();
    		return false;
    	}
    	
    	if(pass == "") {
    		alert("암호를 입력해주세요.");  
    		$("#pass").focus();
    		return false;
    	}
		
		if($("#pass").val() != $("#pass_chk").val()) {
			alert("암호가 일치하지 않습니다.");
			$("#pass").focus();
			return false;
		}
    	 if(name == "") {
    		alert("이름을 입력해주세요.");
    		$("#name").focus();
    		return false;
    	}
  
    	var formData = $("#frm").serialize();  
    	
    	$.ajax({
    		/*전송 전 세팅*/
    	    type:"POST",
    		data:formData,
    		url:"memberWriteSave.do",
    		dataType:"text", 	// 리턴 타입
    		
    		/*전송 후 세팅*/
    		success: function(result) {
    			if(result == "ok") {
    				alert("저장완료");
    				location="loginWrite.do";
    			} else {
    				alert("저장실패");
    			}
    		},
    		error: function() { // 장애발생
    			alert("오류발생");
    		} 
    	
    	});
    	
    	
    });
    
    
} );
  </script>

</head>

<style>

</style>



<body>

<table>
	<tr>
		<th width="25%">홈</th>
		<th width="25%"><a href="/boardList.do">게시판</a></th>
		<th width="25%"><a href="/memberWrite.do">회원가입</a></th>
		<th width="25%"><a href="/loginWrite.do">로그인</a></th>
	</tr>
</table>

<form name="frm" id="frm">
	<input type="hidden" name="idchk" id="idchk" value="0">
	
		<div class="mem_wrap">
		<div class="mem_title">
	회원가입
	</div>
	<table class="mem_tbl">
		<caption class="mem_cap">사이트 이용정보 입력</caption>
		<tr>
			<th>아이디</th>
			<td>
		<span class="mem_str">영문,숫자,특수문자(_,)로 이루어진 4자~12자로 가능합니다.<br></span>
			<input  type="text" 
					name="userid" 
					id="userid"
					class="inputBox" 
					placeholder="아이디입력"
					onkeyup="fn_idcheck(this.value)"
					autofocus maxlength="12">
					
				<span id="msg_area" style="font-size:12px";>아이디를 입력해주세요.</span>
		</td>
	</tr>
		 <tr>
	         <th>비밀번호</th>
	         <td><input type="password" name="pass" id="pass" class="inputBox" placeholder="암호 입력"></td>
	         </tr>
		 <tr>
		 <tr>
	          <th>비밀번호 확인</th>
	          <td><input type="password" name="pass_chk" id="pass_chk" class="inputBox"></td>
	          </tr>
          
			<th>이름</th>
			<td>
			<input type="text" name="name" id="name">
			</td>
	</tr>
		<tr>
			<th>성별</th>
			<td>
			<input type="checkbox" name="gender" value="M" class="inputBox">남
			<input type="checkbox" name="gender" value="F" class="inputBox">여
			</td>
		</tr>
		<tr>
			<th>생년월일</th>
			<td>
			<input type="text" name="birth" id="birth" class="birth" >
			</td>
		</tr>
		<tr>
			<th>연락처</th>
			<td>
			<input type="text" name="phone" id="phone"> (예:010-1234-5678)
			</td>
		</tr>
		<tr>
			<th>주소</th>
			<td>
			<input type="text" name="zipcode" id="zipcode"> 
			<button type="button" id="btn_zipcode">우편번호찾기</button> 
			<br>
			<input type="text" name="address" id="address">
			</td> 
		</tr>
	</table>
<div class="mem_div_btn">
	<button type="submit" class="mem_btn1" id="btn_submit" onclick="return false;">회원가입</button>
	<button type="reset" class="mem_btn2">취소</button>
</div>
</form>

</body>
</html>