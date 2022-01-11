<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

<style>
.ul1 li{
    font-size:10px;
	color:#555;
    list-style:none;
    float:left;
    border-left:1px solid #ccc;
    padding-left:10px;
    padding-right:10px;
}
.ul2{
    float:right;
    padding-top:7px;
    margin-top:-8px;
}
.ul2 li{
    font-size:10px;
	color:#555;
    list-style:none;
    float:left;
    border-left:1px solid #ccc;
    padding-left:10px;
    padding-right:10px;
}
</style>

<script>
function fn_logout() {
	if( confirm("정말 로그아웃 하시겠습니까?") ) {
		$.ajax({
			type : "post",
			data : "",
			url  : "logout.do",
			
			datatype : "text",
			success: function(data) {
				if( data == "ok" ) {
					alert("로그아웃 되었습니다.");
					location = "/restaurant/loginWrite.do";
				} else {
					alert("다시 시도해 주세요.");
				}
			},
			error : function() {
				alert("접속 에러");
			}
		});
	}
}
</script>

<%
String USERID   = (String) session.getAttribute("MEMBER_SESSION_ID");
String USERNAME = (String) session.getAttribute("MEMBER_SESSION_NAME");
String USERNICK  = (String) session.getAttribute("MEMBER_SESSION_NICK");
%>  
    
    <ul class="ul1">
        <li><a href="restaurant.do">HOME</a></li>
        <li><a href="#">숙박</a></li>
        <li><a href="#">음식점</a></li>
        <li><a href="#">관광지</a></li>
    </ul>
    <ul class="ul2">
    
    <%
    if( USERID == null || USERID.equals("")) {
    %>
    
        <li><a href="/restaurant/memberWrite.do">회원가입</a></li>
        <li style="font-weight:bold"><a href="/restaurant/loginWrite.do">로그인</a></li>
	<%
    } else { // 세션 아이디 존재
	%>
        <li style="font-weight:bold"><a href="javascript:fn_logout()">로그아웃</a></li>
		<li><a href="/restaurant/memberInfo.do">마이페이지</a></li>
	<%
    }
	%>       
        <li><a href="/nboardList.do">공지사항</a></li>
    </ul>
    
    
    
    
    
    
    