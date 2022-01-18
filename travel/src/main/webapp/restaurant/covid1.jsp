<%@page import="java.io.FileReader"%>
<%@page import="java.util.Calendar"%>
<%@page import="org.w3c.dom.Node"%>
<%@page import="org.w3c.dom.Element"%>
<%@page import="org.w3c.dom.Document"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="javax.xml.parsers.DocumentBuilder"%>
<%@page import="javax.xml.parsers.DocumentBuilderFactory"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.net.HttpURLConnection"%>
<%@page import="java.net.URL"%>
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
String area = request.getParameter("area");

String areaFullName = "";
if (area == null) {
	area = "합계";
}
// value 값 name 변환
if (area.equals("합계")) {areaFullName = "전국";}
else if (area.equals("서울")) {areaFullName = "서울특별시";}
else if (area.equals("부산")) {areaFullName = "부산광역시";}
else if (area.equals("대구")) {areaFullName = "대구광역시";}
else if (area.equals("인천")) {areaFullName = "인천광역시";}
else if (area.equals("광주")) {areaFullName = "광주광역시";}
else if (area.equals("대전")) {areaFullName = "대전광역시";}
else if (area.equals("울산")) {areaFullName = "울산광역시";}
else if (area.equals("세종")) {areaFullName = "세종특별자치시";}
else if (area.equals("경기")) {areaFullName = "경기도";}
else if (area.equals("강원")) {areaFullName = "강원도";}
else if (area.equals("충북")) {areaFullName = "충청북도";}
else if (area.equals("충남")) {areaFullName = "충청남도";}
else if (area.equals("전북")) {areaFullName = "전라북도";}
else if (area.equals("전남")) {areaFullName = "전라남도";}
else if (area.equals("경북")) {areaFullName = "경상북도";}
else if (area.equals("경남")) {areaFullName = "경상남도";}
else if (area.equals("제주")) {areaFullName = "제주특별자치도";}
%>
<!-- Calendar -->
<%
Calendar cal = Calendar.getInstance();
int year = cal.get(Calendar.YEAR);
int month = cal.get(Calendar.MONTH) + 1;
int date = cal.get(Calendar.DATE);

String searchDate = "";
/* ?월 1일 날짜*/
if ((date-1) == 0) {
	cal.add(Calendar.DATE, -1);
	year = cal.get(Calendar.YEAR);
	month = cal.get(Calendar.MONTH);
	date = cal.get(Calendar.DATE);
	
	searchDate = year + "" + ((month<10)?"0":"") + month + "" + ((date<10)?"0":"") + (date-1);
/* 1일 제외 날짜*/
} else {
	searchDate = year + "" + ((month<10)?"0":"") + month + "" + ((date<10)?"0":"") + (date-1);
}
%>

<!-- open api 가져오기 -->
<%
StringBuilder urlBuilder = new StringBuilder("http://openapi.data.go.kr/openapi/service/rest/Covid19/getCovid19SidoInfStateJson"); /*URL*/

urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=uKM3DAZbCcRKcuz6scnlJffhUStaapGCx%2BnDK9%2BQ0jMyXK0Qt%2Fh7nkNzPf2Aeo4nuhUrvtbDb0F%2FZJTmgurYDg%3D%3D"); /*Service Key*/
urlBuilder.append("&" + URLEncoder.encode("ServiceKey","UTF-8") + "=" + URLEncoder.encode("uKM3DAZbCcRKcuz6scnlJffhUStaapGCx%2BnDK9%2BQ0jMyXK0Qt%2Fh7nkNzPf2Aeo4nuhUrvtbDb0F%2FZJTmgurYDg%3D%3D", "UTF-8")); /*공공데이터포털에서 받은 인증키*/
urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*한 페이지 결과 수*/
urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("10", "UTF-8")); /*페이지 번호*/
urlBuilder.append("&" + URLEncoder.encode("startCreateDt","UTF-8") + "=" + URLEncoder.encode(searchDate, "UTF-8")); /*검색할 생성일 시작범위*/
urlBuilder.append("&" + URLEncoder.encode("endCreateDt","UTF-8") + "=" + URLEncoder.encode(searchDate, "UTF-8")); /*검색할 생성일 종료범위*/

Node gubun = null; // 지역
Node incDec = null; // 신규 확진자 
Node defCnt = null; // 누적 확진자
Node stdDay = null; // 기준 일시
Node overFlowCnt = null; // 해외 유입수
Node localOccCnt = null; // 지역 발생수

URL url = new URL(urlBuilder.toString());
HttpURLConnection conn = (HttpURLConnection) url.openConnection();

conn.setRequestMethod("GET"); // get 방식

conn.setRequestProperty("Content-type", "application/json");


BufferedReader rd;
if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
    rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
} else {
    rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
}

StringBuilder sb = new StringBuilder();
String inputline;

while ((inputline = rd.readLine()) != null) {
    sb.append(inputline);
}
rd.close();
conn.disconnect();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>코로나 현황</title>
</head>

<style>
body {
	font-size:12px;color:;font-family:'맑은 고딕';
}
div.header {
	display:table;position:relative;width:570px;height:30px;left:50px;top:30px;border:0px solid #ccc;margin-top:-30px;
}
div.row1 {
	display:table-row; text-align:right;
}


div.body1 {
	display:table;position:relative;width:570px;left:50px;top:30px;
}
div.cell1_1 {
	display:table-cell;vertical-align:middle;border:1px solid #ccc;height:30px;width:15%;background:#a7affa;
}
div.cell1_2 {
	display:table-cell;vertical-align:middle;border:1px solid #ccc;border-left:none;height:30px;width:15%;background:#a7affa;
}
div.cell1_3 {
	display:table-cell;vertical-align:middle;border:1px solid #ccc;border-left:none;height:30px;background:#a7affa;
}
div.cell5_1 {
	display:table-cell;vertical-align:middle;border:1px solid #ccc;height:30px;width:15%;
}
div.cell5_2 {
	display:table-cell;vertical-align:middle;border:1px solid #ccc;border-left:none;height:30px;width:15%;
}
div.cell5_3 {
	display:table-cell;vertical-align:middle;border:1px solid #ccc;border-left:none;height:30px;
}


div.body2 {
	display:table;position:relative;width:600px;height:30px;left:50px;top:40px;
}
div.cell2_1 {
	display:table-cell;vertical-align:middle;border:1px solid #ccc;height:30px;width:24%;background:#a7affa;
}
div.cell2_2 {
	display:table-cell;vertical-align:middle;border:1px solid #ccc;border-left:none;height:30px;width:24%;background:#a7affa;
}
div.cell2_3 {
	display:table-cell;vertical-align:middle;border:1px solid #ccc;border-left:none;height:30px;background:#a7affa;
}
div.cell6_1 {
	display:table-cell;vertical-align:middle;border:1px solid #ccc;height:30px;width:24%;
}
div.cell6_2 {
	display:table-cell;vertical-align:middle;border:1px solid #ccc;border-left:none;height:30px;width:24%;
}
div.cell6_3 {
	display:table-cell;vertical-align:middle;border:1px solid #ccc;border-left:none;height:30px;
}


div.body3 {
	display:table;position:relative;width:600px;height:50px;left:50px;top:40px;
}
div.footer {
	display:table;position:relative;width:600px;height:30px;left:50px;top:50px;
}
div.cell3_1 {
	display:table-cell;vertical-align:middle;height:30px;text-align:left;padding-left:7px;
}

a {
	text-decoration:none;
}
</style>

<script>
	// 거리두기 단계별 상세보기 팝업창 함수
	function fn_popup() {
		var url = "http://ncov.mohw.go.kr/socdisBoardList.do?brdId=6&brdGubun=64&dataGubun=641"; // 단계별 실행방안 url
		var p_width = window.screen.width/2;
		var p_height = window.screen.height/2;
		var s_width = (window.screen.width/2) - (p_width/2);
		var s_height = (window.screen.height/2) - (p_height/2);
		window.open(url,"detailStep","width="+p_width+",height="+p_height+",resizable=yes,scrollbars=yes,left="+s_width+",top="+s_height);
	}
	
	function fn_area(n) {
		location = "restaurantMain.do?area="+ encodeURI(n , "UTF-8"); // get 방식 한글깨짐 방지
	}
</script>

<body>
<div style="width:400px;height:300px;margin-top:-50px;">
	<!-- header -->
	<div class = "header">		
		<div class = "row1">			
			<div style = "display:table-cell;font-size:20px;font-weight:bold;padding:7px;">
				<span style="font-size:24px;color:purple;"><%=areaFullName %> COVID-19</span> 확진자 현황
			</div>		
			<div style = "display:table-cell;padding-right:7px;">
				<select name = "area" onchange = "fn_area(this.value)">
					<option value = "합계" <%if(area.equals("합계")) {out.print("selected");} %>>전국</option>
					<option value = "서울" <%if(area.equals("서울")) {out.print("selected");} %>>서울특별시</option>
					<option value = "부산" <%if(area.equals("부산")) {out.print("selected");} %>>부산광역시</option>
					<option value = "대구" <%if(area.equals("대구")) {out.print("selected");} %>>대구광역시</option>
					<option value = "인천" <%if(area.equals("인천")) {out.print("selected");} %>>인천광역시</option>
					<option value = "광주" <%if(area.equals("광주")) {out.print("selected");} %>>광주광역시</option>
					<option value = "대전" <%if(area.equals("대전")) {out.print("selected");} %>>대전광역시</option>
					<option value = "세종" <%if(area.equals("세종")) {out.print("selected");} %>>세종특별자치시</option>
					<option value = "경기" <%if(area.equals("경기")) {out.print("selected");} %>>경기도</option>
					<option value = "강원" <%if(area.equals("강원")) {out.print("selected");} %>>강원도</option>
					<option value = "충북" <%if(area.equals("충북")) {out.print("selected");} %>>충청북도</option>
					<option value = "충남" <%if(area.equals("충남")) {out.print("selected");} %>>충청남도</option>
					<option value = "전북" <%if(area.equals("전북")) {out.print("selected");} %>>전라북도</option>
					<option value = "전남" <%if(area.equals("전남")) {out.print("selected");} %>>전라남도</option>
					<option value = "경북" <%if(area.equals("경북")) {out.print("selected");} %>>경상북도</option>
					<option value = "경남" <%if(area.equals("경남")) {out.print("selected");} %>>경상남도</option>
					<option value = "제주" <%if(area.equals("제주")) {out.print("selected");} %>>제주특별자치도</option>
				</select>
			</div>
		</div>
	</div>	
	
	<!-- body1 -->
	<div class = "body1">
		<div style = "display:table-row; text-align:center;">
			<div class = "cell1_1">신규 확진자수</div>
			<div class = "cell1_2">지역 발생수</div>
			<div class = "cell1_2">해외 유입수</div>
			<div class = "cell1_2">누적 확진자수(전국)</div>
			<div class = "cell1_3">기준 일시</div>
		</div>
		
		<%
		// open api 값 불러오기
		try {				
			DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
			DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
			
			FileOutputStream output = new FileOutputStream("./Corna1.csv");
			output.write(sb.toString().getBytes());
			output.close();
			
			Document doc = dBuilder.parse("./Corna1.csv");
			doc.getDocumentElement().normalize();
			
			for (int i = 0; i <= 18; i ++) {
		    	Element body = (Element) doc.getElementsByTagName("body").item(0);
		    	Element items = (Element) doc.getElementsByTagName("items").item(0);
		    	Element item = (Element) doc.getElementsByTagName("item").item(i);		    	
		    	
		    	gubun = item.getElementsByTagName("gubun").item(0); // 지역
		    	incDec = item.getElementsByTagName("incDec").item(0); // 신규 확진자수
		    	localOccCnt = item.getElementsByTagName("localOccCnt").item(0); // 지역 발생수
		    	overFlowCnt = item.getElementsByTagName("overFlowCnt").item(0); // 해외 유입수
		    	defCnt = item.getElementsByTagName("defCnt").item(0); // 누적 확진자수
		    	stdDay = item.getElementsByTagName("stdDay").item(0); // 기준일시
		    	
		    	if (gubun.getChildNodes().item(0).getNodeValue().equals(area)) {
		    		
				 %>
		
				<div style = "display:table-row; text-align:center;">
					<div class = "cell5_1"><font color = "red"><%=incDec.getChildNodes().item(0).getNodeValue() %></font> 명</div>
					<div class = "cell5_2"><font color = "red"><%=localOccCnt.getChildNodes().item(0).getNodeValue() %></font> 명</div>
					<div class = "cell5_2"><font color = "blue"><%=overFlowCnt.getChildNodes().item(0).getNodeValue() %></font> 명</div>
					<div class = "cell5_2"><%=defCnt.getChildNodes().item(0).getNodeValue() %> 명</div>
					<div class = "cell5_3"><%=stdDay.getChildNodes().item(0).getNodeValue() %></div>
				</div>
				<%   	
		    	}
		    }
		} catch (Exception e) { 
			e.printStackTrace();
		}
		%>
	</div>
	
</div>
</body>
</html>