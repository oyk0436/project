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
	
	<link rel="stylesheet" href="css/admin_layout.css">
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

.cell1 {
	border-bottom:1px solid #ccc;display:table-cell;vertical-align:middle;height:20px;width:25%;font-size:14px;font-weight:bold;
}
.cell2 {
	border-bottom:1px solid #ccc;display:table-cell;vertical-align:middle;height:20px;text-align:left;padding:15px;
}
.cell3 {
	border-bottom:1px solid #ccc;display:table-cell;vertical-align:middle;height:30px;width:25%;
}

.membercell1 {
	display:table-cell;vertical-align:middle;height:20px;width:25%;font-size:14px;font-weight:bold;width:30%;border:none;background:#ffffcc;border-bottom:1px solid #eeeeee;
}
.membercell2 {
 	display:table-cell;vertical-align:middle;height:20px;width:25%;font-size:12px;width:70%;border:none;text-align:left;padding:5px;border-bottom:1px solid #eeeeee;
}

body {
	font-size:10px;
}
.container {
	width:1000px;height:2000px;margin:0 auto;
}
.div1 {
	width:200px;height:200px;background-color:#ffffcc;text-align:center;padding-top:20px;float:left;
}
.div2 {
	margin:0 auto;width:900px;height:1000px;text-align:center;padding-top:20px;float:left;background-color:rgb(255, 255, 255);
}
.div_button {
	width:700px;text-align:center;margin-top:10px;
}
header {
	font-size:25px;font-weight:bold;width:1000px;height:100px;background-color:#ffcf6a;text-align:center;line-height:4.0;clear:right;
}
.table1 {
	width:600px;border:1px solid #ccc;border-collapse:collapse;
}
a {
	text-decoration:none;color:#000000;
}
th {
	padding:5px;border:1px solid #ccc;
}
td {
	padding:5px;border:1px solid #ccc;text-align:center;
}
.td1 {
	text-align:center;padding:5px;
}
</style>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>

function sample4_execDaumPostcode() {
	
    new daum.Postcode({
      
    	oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var roadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 참고 항목 변수

            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if(data.buildingName !== '' && data.apartment === 'Y'){
               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample4_postcode').value = data.zonecode;
            document.getElementById("sample4_roadAddress").value = roadAddr;
            document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
            
            // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
            if(roadAddr !== ''){
                document.getElementById("sample4_extraAddress").value = extraRoadAddr;
            } else {
                document.getElementById("sample4_extraAddress").value = '';
            }

            var guideTextBox = document.getElementById("guide");
            // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
            if(data.autoRoadAddress) {
                var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                guideTextBox.style.display = 'block';

            } else if(data.autoJibunAddress) {
                var expJibunAddr = data.autoJibunAddress;
                guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                guideTextBox.style.display = 'block';
            } else {
                guideTextBox.innerHTML = '';
                guideTextBox.style.display = 'none';
            }
        }
    }).open();
}
</script>

<script>
function fn_idcheck(userid) {
	
	var msg;
	var len = userid.length;
	if( len < 4 || len > 12 ) {
		msg = "<span style='color:red'>아이디는 4자~12자 사이로 입력해주세요.</span>";
		$("#id_chk").val("0");
		$("#msg_area").html(msg);
	} else {
		
		$.ajax({
			type : "post",
			data : "userid="+userid,
			url  : "idcheck.do",
			
			datatype : "text",
			success : function(data) {
				if( data == "ok" ) {
					msg="<span style='color:green'>사용가능한 아이디 입니다.</span>";
				} else if( data == "er1" ) {
					msg="<span style='color:red'>이미 사용중인 아이디 입니다.</span>";
				} else if( data == "er2") {
					msg="<span style='color:red'>형식에 맞지 않습니다.</span>";
				} else {
					msg="<span style='color:red'>전송오류!</span>";
				}
				
				if( data == "ok" ) {
					$("#id_chk").val("1");
				} else {
					$("#id_chk").val("0");
				}
	
				$("#msg_area").html(msg);
			},
			error : function() {
				msg="<span style='color:red'>설정오류!</span>";
				$("#msg_area").html(msg);
			}
		});
	}
}

function fn_nickcheck(nick) {
	
	var msg;
	var len = nick.length;
	if( len < 4 || len > 10 ) {
		msg = "<span style='color:red'>닉네임은 영문,한글,숫자로 4자~10자로 입력해주세요.</span>";
		$("#nick_chk").val("0");
		$("#nic_area").html(msg);
	} else {
		
		$.ajax({
			type : "post",
			data : "nick="+nick,
			url  : "nickcheck.do",
			
			datatype : "text",
			success : function(data) {
				if( data == "ok" ) {
					msg="<span style='color:green'>사용가능한 닉네임입니다.</span>";
				} else if( data == "er1" ) {
					msg="<span style='color:red'>이미 사용 중인 닉네임입니다.</span>";
				} else if( data == "er2") {
					msg="<span style='color:red'>형식에 맞지 않습니다.</span>";
				} else {
					msg="<span style='color:red'>전송오류!</span>";
				}
				
				if( data == "ok" ) {
					$("#nick_chk").val("1");
				} else {
					$("#nick_chk").val("0");
				}
	
				$("#nic_area").html(msg);
			},
			error : function() {
				msg="<span style='color:red'>설정오류!</span>";
				$("#nic_area").html(msg);
			}
		});
	}
}

$(function(){
	$("#btn_save").click(function() {
		if($("#userid").val() == "") {
			alert("아이디를 입력해주세요.");
			$("#userid").focus();
			return false;
		}
		
		if( $("#id_chk").val() == "0" ) {
			alert("정상 상태의 id가 아닙니다.");
			$("#userid").focus();
			return false;
		}

		if($("#pass").val() == "") {
			alert("암호를 입력해주세요.");
			$("#pass").focus();
			return false;
		}
		if($("#pass").val() != $("#passCheck").val()) {
			alert("암호가 일치하지 않습니다.");
			$("#pass").focus();
			return false;
		}
		
		var formdata = $("#frm").serialize();
		
		$.ajax({
			type : "post",
			url : "memberWriteSave.do",
			data : formdata,
			
			datatype : "text",
			success : function(data) {
				if( data == "ok" ) {
					alert("등록 완료");
					location="loginWrite.do";
				}
			},
			error : function() {
				alert("전송오류!")
			}
		});
	});
});
</script>

<body>

<div class="container" style="margin:0 auto;">

<%@include file="/include/top1.jsp" %>

<header>
 맛집 화면
</header>
	
	<form id="frm">
		<input type="hidden" name="id_chk" id="id_chk" value="0">
		<input type="hidden" name="nic_chk" id="nic_chk" value="0">
	<div style="width:90%;
		  			margin-left:30px;
		  			margin-top:30px;
		  			margin-bottom:30px;
		  			text-align:left;
		  			font-weight:bold;
		  			font-size:12px;
		  			padding:10px;
		  			position:relative;">
			<span style="font-size:18px;">회원가입</span> <br>
	</div>
		
	<div>
	
	<span style="font-size:15px;font-weight:bold;margin-left:50px;">사이트 이용정보 입력</span>
	
		<div style="display:table;position:relative;width:900px;margin:0 auto;top:10px;border-top:2px solid #000000;">
	 		<div style="display:table-row;text-align:center;">
				<div class="membercell1">아이디</div>
				<div class="membercell2">
					<span>영문,숫자,특수문자(_,-)로 이루어진 4자~12자로 가능합니다.</span><br>
					<input type = "text" name="userid" id="userid" placeholder="아이디를 입력하세요." onkeyup="fn_idcheck(this.value)" autofocus maxlength="12">
					<span id="msg_area" style="font-size:12px"></span>
				</div>
			</div>
			<div style="display:table-row;text-align:center;">
				<div class="membercell1">비밀번호</div>
				<div class="membercell2">
					<input type = "password" name="pass" id="pass" placeholder="비밀번호를 입력하세요.">
				</div>
			</div>
			<div style="display:table-row;text-align:center;">
				<div class="membercell1">비밀번호 확인</div>
				<div class="membercell2">
					<input type = "password" name="passCheck" id="passCheck">
				</div>
			</div>
		</div>
	</div>
	
	<div style="position:relative;top:30px;">

	
	<span style="font-size:15px;font-weight:bold;margin-left:50px;">개인정보입력</span>
		
		<div style="display:table;position:relative;width:900px;margin:0 auto;top:10px;border-top:2px solid #000000;">
	 		<div style="display:table-row;text-align:center;">
				<div class="membercell1">이름</div>
				<div class="membercell2">
					<input type = "text" name="name" id="name" style="width:80px;">
				</div>
			</div>
			<div style="display:table-row;text-align:center;">
				<div class="membercell1">닉네임</div>
				<div class="membercell2">
					<span class="mem_str">공백없이 한글, 영문 숫자만 입력 가능 (한글2자, 영문4자 이상) <br>
                        				    닉네임을 바꾸시면 앞으로 60일 이내에는 변경할 수 없습니다.</span> <br>
					<input type = "text" name="nick" id="nick" onkeyup="fn_nickcheck(this.value)" style="width:100px;">
					<span id="nic_area" style="font-size:12px"></span>
				</div>
			</div>
			</div>
			<div style="display:table-row;text-align:center;">
				<div class="membercell1">성별</div>
				<div class="membercell2">
					<input type="radio" name="gender" value="M"> 남 
                   	<input type="radio" name="gender" value="F"> 여
				</div>
			<div style="display:table-row;text-align:center;">
				<div class="membercell1">E-mail</div>
				<div class="membercell2">
					<input type = "text" name="email" id="email" style="width:250px;">
				</div>
			</div>
			<div style="display:table-row;text-align:center;">
				<div class="membercell1">휴대폰 번호</div>
				<div class="membercell2">
					<input type = "text" name="phone" id="phone">
				</div>
			</div>
			<div style="display:table-row;text-align:center;">
				<div class="membercell1">주소</div>
				<div class="membercell2">
					<input type="text" style="width:120px;" id="sample4_postcode" class="inputBox" placeholder="우편번호">
					<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
					<input type="text" style="width:120px;" id="sample4_roadAddress" placeholder="도로명주소"><br>
					<input type="text" style="width:120px;" id="sample4_jibunAddress" placeholder="지번주소"><br>
					<span id="guide" style="color:#999;display:none"></span>
					<input type="text" style="width:120px;" id="sample4_detailAddress" placeholder="상세주소">
				</div>
			</div>
		</div>
	</div>
	
	 <div style="text-align:center;margin-top:70px;">
         <button type="submit" id="btn_save" onclick="return false;">회원가입</button>
         <button type="reset">취소</button>
     </div>
	
	</form>
</div>

</body>
</html>



