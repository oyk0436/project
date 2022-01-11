<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String region = request.getParameter("region");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<style>
ul li {
	list-style:none;float:left;width:100px;font-size:15px;
}
a {
	text-decoration:none;font-color:#ccc;
}
</style>

<body>

<%
if (region.equals("제주")) {
%>
	<p style="font-size:24px;"><span style="color:#9966ff;"><%=region %></span> 맛집 찾기</p>
	<ul>
		<li><a href="restaurant.do?regionDetail=제주시">제주시</a></li>
		<li><a href="restaurant.do?regionDetail=서귀포시">서귀포시</a></li>
	</ul>
<%
} else {
%>
	<p style="font-size:24px;"><font color="#9966ff"><%=region %></font> 맛집 찾기</p>
	<ul>
		<li><a href="restaurant.do?regionDetail=<%=region %>"><%=region %></a></li>
	</ul>
<%
}
%>

</body>
</html>