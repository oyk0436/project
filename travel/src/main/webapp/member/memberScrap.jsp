<%@page import="java.util.Calendar"%>
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
	width:200px;height:700px;float:left;font-size:20px;text-align:left;
}
.div2 {
	margin:0 auto;width:700px;height:1000px;text-align:center;float:left;background-color:rgb(255, 255, 255);
}
.div_button {
	width:700px;text-align:center;margin-top:10px;
}
a {
	text-decoration:none;color:#000000;
}

</style>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>

function execDaumPostcode() {
	
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
            document.getElementById('postcode').value = data.zonecode;
            document.getElementById("roadAddress").value = roadAddr;
            document.getElementById("jibunAddress").value = data.jibunAddress;
            
            // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
            if(roadAddr !== ''){
                document.getElementById("extraAddress").value = extraRoadAddr;
            } else {
                document.getElementById("extraAddress").value = '';
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
$(function(){
	$("#infoModify").click(function(){
		if($("#pass").val() == "") {
			alert("암호를 입력해주세요.");
			$("#pass").focus();
			return false;
		}
		
		var formdata = $("#frm").serialize();
		
		$.ajax({
			type : "post",
			url : "memberModifySave.do",
			data : formdata,
			
			datatype : "text",
			success : function(data) {
				if( data == "ok" ) {
					alert("수정 완료");
					location="memberInfo.do";
				} else if( data == "er1" ) {
					alert("암호가 일치하지 않습니다.");
				} else {
					alert("수정 실패");
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

<%@include file="/include/top.jsp" %>

<div class="container" style="margin:0 auto;">

	<div class="div1">
		<%@ include file="/include/mypage_left.jsp" %>
	</div>
	
	<div class="div2">
	
	<form id="frm">
		<input type="hidden" name="userid" id="userid" value="<%=USERID %>">
	<div style="width:90%;
		  			margin-left:30px;
		  			margin-top:30px;
		  			margin-bottom:30px;
		  			text-align:left;
		  			font-weight:bold;
		  			font-size:12px;
		  			padding:10px;
		  			position:relative;">
			<span style="font-size:18px;">회원 정보 수정</span> <br>
	</div>
		
	<div style="position:relative;text-align:left;">
	
	<span style="font-size:15px;font-weight:bold;margin-left:50px;">사이트 이용정보 입력</span>
	
		<div style="display:table;position:relative;width:700px;margin-left:50px;top:10px;border-top:2px solid #000000;">
	 		<div style="display:table-row;text-align:center;">
				<div class="membercell1">아이디</div>
				<div class="membercell2">${vo.userid }</div>
			</div>
			<div style="display:table-row;text-align:center;">
				<div class="membercell1">비밀번호</div>
				<div class="membercell2">
					<input type = "password" name="pass" id="pass" placeholder="비밀번호를 입력하세요.">
					<button type="button" onclick="location='passModify.do'">비밀번호 변경</button>
				</div>
			</div>
		</div>
	</div>
	
	<div style="position:relative;text-align:left;top:30px;">
	
	<span style="font-size:15px;font-weight:bold;margin-left:50px;">개인정보 입력</span>
	
		<div style="display:table;position:relative;width:700px;margin-left:50px;top:10px;border-top:2px solid #000000;">
	 		<div style="display:table-row;text-align:center;">
				<div class="membercell1">이름</div>
				<div class="membercell2">
					<input type = "text" name="name" id="name" style="width:80px;" value="${vo.name }">
				</div>
			</div>
			<div style="display:table-row;text-align:center;">
				<div class="membercell1">닉네임</div>
				<div class="membercell2">
					<span class="mem_str">공백없이 한글, 영문 숫자만 입력 가능 (한글2자, 영문4자 이상) <br>
                        				    닉네임을 바꾸시면 앞으로 60일 이내에는 변경할 수 없습니다.</span> <br>
					<input type = "text" name="nick" id="nick" style="width:100px;" value="${vo.nick }">
				</div>
			</div>
			<div style="display:table-row;text-align:center;">
				
				<c:set var="myear" value = "${vo.year }"/>
				<c:set var="mmonth" value = "${vo.month }"/>
				<c:set var="mday" value = "${vo.day }"/>
				
				<div class="membercell1">생년월일</div>
				<div class="membercell2">
					<select name="year" id = "year" onchange = "fn_lastday()">
					<%
					Calendar cal = Calendar.getInstance();
					int year = cal.get(Calendar.YEAR);
					int month = cal.get(Calendar.MONTH) + 1;
					int date = cal.get(Calendar.DATE);
					
					int myear = (int) pageContext.getAttribute("myear");
					int mmonth = (int) pageContext.getAttribute("mmonth");
					int mday = (int) pageContext.getAttribute("mday");
					
					for (int y = (year-80); y <= (year-1); y++) {
					%>
						<option value="<%=y %>" <%if(y == myear) {out.print("selected");} %>><%=y %>년</option>
					<%
					}
					%>
					</select>
					<select name="month" id = "month" onchange = "fn_lastday()">
					<%
					for (int m = 1; m <= 12; m++) {
					%>
						<option value="<%=m %>" <%if(m == mmonth) {out.print("selected");} %>><%=m %>월</option>
					<%
					}
					%>
					</select>
					<select name="day" id = "day" onchange = "fn_lastday()">
					<%
					for (int d = 1; d <= 31; d++) {
					%>
						<option value="<%=d %>" <%if(d == mday) {out.print("selected");} %>><%=d %>일</option>
					<%
					}
					%>
					</select>
				</div>
			</div>
			<div style="display:table-row;text-align:center;">
				<div class="membercell1">E-mail</div>
				<div class="membercell2">
					<input type = "text" name="email" id="email" style="width:250px;" value="${vo.email }">
				</div>
			</div>
			<div style="display:table-row;text-align:center;">
				<div class="membercell1">성별</div>
				<div class="membercell2">
					<input type="radio" name="gender" value="M" <c:if test="${vo.gender=='M'}">checked</c:if>> 남 
                   	<input type="radio" name="gender" value="F" <c:if test="${vo.gender=='F'}">checked</c:if>> 여
				</div>
			</div>
			<div style="display:table-row;text-align:center;">
				<c:set var="phone1" value = "${vo.phone1 }"/>
				<% 
				int phone1 = (int) pageContext.getAttribute("phone1");
				String phone = String.valueOf(phone1);
				%>
				<div class="membercell1">휴대폰 번호</div>
				<div class="membercell2">
					<select name = "phone1" id="phone1">
						<option value = "010" <%if(phone == "010") {out.print("selected");} %>>010</option>
						<option value = "011" <%if(phone == "011") {out.print("selected");} %>>011</option>
						<option value = "016" <%if(phone == "016") {out.print("selected");} %>>016</option>
						<option value = "017" <%if(phone == "017") {out.print("selected");} %>>017</option>
						<option value = "018" <%if(phone == "018") {out.print("selected");} %>>018</option>
						<option value = "019" <%if(phone == "019") {out.print("selected");} %>>019</option>
					</select> -	
					<input type="text" name = "phone2" id="phone2" class="input1" value = "${vo.phone2 }" style = "width:55px;"> -
					<input type="text" name = "phone3" id="phone3" class="input1" value = "${vo.phone3 }" style = "width:55px;">
				</div>
			</div>
			<div style="display:table-row;text-align:center;">
				<div class="membercell1">주소</div>
				<div class="membercell2">
					<input type="text" style="width:120px;" name = "postcode" id="postcode" value = "${vo.postcode }" class="inputBox" placeholder="우편번호">
					<input type="button" onclick="execDaumPostcode()" value="우편번호 찾기"><br>
					도로명 주소 : <input type="text" style="width:250px;" name = "roadaddress" id="roadaddress" value = "${vo.roadaddress }" placeholder="도로명주소"><br>
					지번 주소 : <input type="text" style="width:250px;" name = "jibunaddress" id="jibunaddress" value = "${vo.jibunaddress }" placeholder="지번주소"><br>
					<span id="guide" style="color:#999;display:none"></span>
					상세 주소 : <input type="text" style="width:250px;" name = "detailaddress" id="detailaddress" value = "${vo.detailaddress }" placeholder="상세주소를 입력해주세요.">
				</div>
			</div>
		</div>
	</div>
	
	 <div style="text-align:center;margin-top:60px;margin-left:50px;">
        <button type="submit" id="infoModify" onclick="return false;">수정</button>
     	<button type="reset">취소</button>
     </div>
	
	</form>
	
	</div>
</div>

</body>
</html>


