package travel.web;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import travel.service.TravelService;

@Controller
public class TravelController {
	
	@Resource(name="travelService")
	private TravelService travelService;
	
	@RequestMapping("hotel.do")
	public String apitest(Model model) throws Exception{
		String servicekey="cInuNrwcPd9DJp5JWYGRKBSqEVUa6Q%2FJRkrPp7sY4MNHX3Dh7vS4AKh8i5Qh2SMuLNCG0FMpTZLjto1MPSt6Yw%3D%3D";
		
		StringBuilder urlBuilder = new StringBuilder("http://api.visitkorea.or.kr/openapi/service/rest/KorService/searchStay"); /*URL  ( 조회 기능 별로 다른 URL이 필요 )*/ 
        urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "="+servicekey); /*Service Key*/
        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("15", "UTF-8")); /*한 페이지 결과수*/
        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*현재 페이지 번호*/
        urlBuilder.append("&" + URLEncoder.encode("MobileOS","UTF-8") + "=" + URLEncoder.encode("ETC", "UTF-8")); /*IOS (아이폰), AND (안드로이드), WIN (원도우폰), ETC*/
        urlBuilder.append("&" + URLEncoder.encode("MobileApp","UTF-8") + "=" + URLEncoder.encode("AppTest", "UTF-8")); /*서비스명=어플명*/
        urlBuilder.append("&" + URLEncoder.encode("listYN","UTF-8") + "=" + URLEncoder.encode("N", "UTF-8"));
        urlBuilder.append("&" + URLEncoder.encode("areaCode","UTF-8") + "=" + URLEncoder.encode("39", "UTF-8")); /*지역코드, 시군구코드*/
        URL url = new URL(urlBuilder.toString());
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/json");
        BufferedReader rd;
        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = rd.readLine()) != null) {
            sb.append(line);
        }
        rd.close();
        conn.disconnect();
        
		String text=sb.toString();
		
        int count=(int)Math.ceil(Double.parseDouble(text.substring(text.indexOf("<totalCount>")+12,text.indexOf("</totalCount>")))/15);
 
        
		
		/* 숙박 정보 조회 */
		urlBuilder = new StringBuilder("http://api.visitkorea.or.kr/openapi/service/rest/KorService/searchStay"); /*URL  ( 조회 기능 별로 다른 URL이 필요 )*/ 
        urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "="+servicekey); /*Service Key*/
        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("15", "UTF-8")); /*한 페이지 결과수*/
        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*현재 페이지 번호*/
        urlBuilder.append("&" + URLEncoder.encode("MobileOS","UTF-8") + "=" + URLEncoder.encode("ETC", "UTF-8")); /*IOS (아이폰), AND (안드로이드), WIN (원도우폰), ETC*/
        urlBuilder.append("&" + URLEncoder.encode("MobileApp","UTF-8") + "=" + URLEncoder.encode("AppTest", "UTF-8")); /*서비스명=어플명*/
        urlBuilder.append("&" + URLEncoder.encode("areaCode","UTF-8") + "=" + URLEncoder.encode("39", "UTF-8")); /*지역코드, 시군구코드*/
        url = new URL(urlBuilder.toString());
        conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/json");
     
        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }
        sb = new StringBuilder();

        while ((line = rd.readLine()) != null) {
            sb.append(line);
        }
        rd.close();
        conn.disconnect();
        
        String value=sb.toString();	/*sb에 api에서 출력된 값이 저장되는데 .tostring()으로 string 방식으로 전환 하고 value에 값 저장 */
       	String[] array=value.split("</item>");	/* value를 </item> 으로 호텔 리스트 이던 것을 호텔 하나 하나 분리 */
        int end=array.length-1;	/* 가져온 숙박 자료의 개수*/
        
        
        /* ArrayList.add 를 할때 null 값인 것을 넣으려면 오류가 생기기 때문에 숙박 자료의 총 개수에 맞게 null 공간 없음으로 바꾸기*/
        for(int i=0;i<end;i++) { 
       		if(array[i].indexOf("<title>") == -1)  array[i] += "<title>없음</title>"; 	/* title 호텔 이름 */
       		if(array[i].indexOf("<firstimage>") == -1) array[i] += "<firstimage>없음</firstimage>"; 	/* firstimage 대표 이미지 */
       		if(array[i].indexOf("<contentid>") == -1)  array[i] += "<contentid>없음</contentid>"; 		/*다른 기능 (반복 조회 기능,공통 정보 조회 기능)에서 특정 호텔을 찾아 쓰기 위한 unq 같은 것 contentid */
       		if(array[i].indexOf("<contenttypeid>") == -1)  array[i] += "<contenttypeid>없음</contenttypeid>"; /*위화 마찬 가지로 조금 더 크게 관광,숙박 이런 대분류 를 구분하기 위한것 */
       	}
       	
        /* 출력된 호텔의 총 개수 (end)를 이용하여 필요한 데이터만 꺼내서 다시 arraylist에 넣는 곳 */
       	for(int i=0;i<end;i++) {
       		ArrayList<String> info=new ArrayList<>();
       		
       		int j=array[i].indexOf("<title>")+7;
       		int k=array[i].indexOf("</title>");
       		info.add("§1"+array[i].substring(j,k)+"/§1");	/*<title>제주 호텔</title> 이런 식으로 저장 되어 있는 것을 제주 호텔만 꺼내고 html에서 어떤 부분이 호텔이름인지 구분하기 위해 §1 특수 문자와 번호를 매겨 사용*/
       		
       		j=array[i].indexOf("<firstimage>")+12;
       		k=array[i].indexOf("</firstimage>");
       		info.add("§2"+array[i].substring(j,k)+"/§2");	
       		
       		j=array[i].indexOf("<contentid>")+11;
       		k=array[i].indexOf("</contentid>");
       		String contentid=array[i].substring(j,k);      /* contentid , contenttypeid 이 두 가지는 html 에서 안 쓰이고 밑의 다른 정보 조회 기능에서 쓰여서 따로 객체만 저장 하고 arraylist에 추가 하지 않음 */
       		
       		j=array[i].indexOf("<contenttypeid>")+15;
       		k=array[i].indexOf("</contenttypeid>");
       		String contenttypeid=array[i].substring(j,k);
       		
       		/*반복 정보 조회( 숙박contentid를 넣어서 조회 하면 숙박업소의 방의 종류와 가격 같은 정보를 출력 */
       		urlBuilder = new StringBuilder("http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailInfo"); /*URL  ( 조회 기능 별로 다른 URL이 필요 )*/ 
	        urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "="+servicekey); /*Service Key*/
	        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("100", "UTF-8")); /*한 페이지 결과수*/
	        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*현재 페이지 번호*/
	        urlBuilder.append("&" + URLEncoder.encode("MobileOS","UTF-8") + "=" + URLEncoder.encode("ETC", "UTF-8")); /*IOS (아이폰), AND (안드로이드), WIN (원도우폰), ETC*/
	        urlBuilder.append("&" + URLEncoder.encode("MobileApp","UTF-8") + "=" + URLEncoder.encode("AppTest", "UTF-8")); /*서비스명=어플명*/
	        urlBuilder.append("&" + URLEncoder.encode("contentId","UTF-8") + "=" + URLEncoder.encode(contentid, "UTF-8")); /*컨텐츠아이디*/
	        urlBuilder.append("&" + URLEncoder.encode("contentTypeId","UTF-8") + "=" + URLEncoder.encode(contenttypeid, "UTF-8")); /*컨텐츠타입아이디*/
	        /*추가로 더 출력 하고 싶은 것이 있으면 
	         *  urlBuilder.append("&" + URLEncoder.encode("출력하고 싶은 객체 이름","UTF-8") + "=" + URLEncoder.encode(출력 하고 싶은 객체의  입력값 (contentid,페이지,한 페이지 결과수,지역번호), "UTF-8"));  */
	        
	        url = new URL(urlBuilder.toString());
	        conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("GET");
	        conn.setRequestProperty("Content-type", "application/json");
	
	        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
	            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	        } else {
	            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
	        }
	        sb = new StringBuilder();
	
	        while ((line = rd.readLine()) != null) {
	            sb.append(line);
	        }
	        rd.close();
	        conn.disconnect();
	        
	        value=sb.toString();  
	     
	        String[] diinfo=value.split("</item>");
	        
	        int end2=diinfo.length-1;
	        
	        int minest=0;
	        
	        /*성수기 비성수기 주중 주말 가격 중 최소 가격을 뽑아서 html에 쓰기 위해 구하는 과정 */
	        for(int di=0;di<end2;di++) {
	        	int d1=diinfo[di].indexOf("<roomoffseasonminfee1>")+22;
	        	int d2=diinfo[di].indexOf("</roomoffseasonminfee1>");
	        	int d3=diinfo[di].indexOf("<roomoffseasonminfee2>")+22;
	        	int d4=diinfo[di].indexOf("</roomoffseasonminfee2>");
	        	int min1=Integer.parseInt(diinfo[di].substring(d1,d2));
	        	int min2=Integer.parseInt(diinfo[di].substring(d3,d4));
	        	
	        	
	        	if(di==0) {
	        		minest=min1;
	        		if(min2<minest) minest=min2;
	        	}else {
	        		if(min1<minest) minest=min1;
	        		if(min2<minest) minest=min2;
	        	}
	        }
       		
	        info.add("§4"+minest+"/§4");    /*호텔 방 최소 가격 */

	        
	        /*소개 정보 조회  ( 숙박 업소의 시설등이 출력)*/
	        urlBuilder = new StringBuilder("http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailIntro"); /*URL*/
	        urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "="+servicekey); /*Service Key*/
	        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("15", "UTF-8")); /*한 페이지 결과수*/
	        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*현재 페이지 번호*/
	        urlBuilder.append("&" + URLEncoder.encode("MobileOS","UTF-8") + "=" + URLEncoder.encode("ETC", "UTF-8")); /*IOS (아이폰), AND (안드로이드), WIN (원도우폰), ETC*/
	        urlBuilder.append("&" + URLEncoder.encode("MobileApp","UTF-8") + "=" + URLEncoder.encode("AppTest", "UTF-8")); /*서비스명=어플명*/
	        urlBuilder.append("&" + URLEncoder.encode("contentId","UTF-8") + "=" + URLEncoder.encode(contentid, "UTF-8")); /*컨텐츠아이디*/
	        urlBuilder.append("&" + URLEncoder.encode("contentTypeId","UTF-8") + "=" + URLEncoder.encode(contenttypeid, "UTF-8")); /*컨텐츠타입아이디*/
	        url = new URL(urlBuilder.toString());
	        conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("GET");
	        conn.setRequestProperty("Content-type", "application/json");
	
	        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
	            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	        } else {
	            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
	        }
	        sb = new StringBuilder();
	
	        while ((line = rd.readLine()) != null) {
	            sb.append(line);
	        }
	        rd.close();
	        conn.disconnect();
       		
	        value=sb.toString();
	        
	        int d1=value.indexOf("<checkintime>")+13;   
	        int d2=value.indexOf("</checkintime>");
	        String chkin=value.substring(d1,d2);
	        info.add("§8"+chkin+"/§8");						/* 체크인 시간*/
	        
	        
	        d1=value.indexOf("<checkouttime>")+14;
	        d2=value.indexOf("</checkouttime>");
	        String chkout=value.substring(d1,d2);
	        info.add("§9"+chkout+"/§9");					/* 체크 아웃 시간*/
	        
	        if(value.indexOf("<roomtype>") !=-1) {			/*방 등급 (스위트룸 , 일반룸 ,마스터룸 )*/
		        d1=value.indexOf("<roomtype>")+10;
		        d2=value.indexOf("</roomtype>");
		        String roomtype=value.substring(d1,d2);
	       		if(roomtype.length()>1) info.add("§10"+roomtype+"/§10");
	        }
	        
	        if(value.indexOf("<barbecue>") !=-1) {
		        d1=value.indexOf("<barbecue>")+10;
		        d2=value.indexOf("</barbecue>");
		        int barbecue=Integer.parseInt(value.substring(d1,d2));
	       		if(barbecue==1) info.add("바베큐");
	        }
       		
	        
	        if(value.indexOf("<beauty>") !=-1) {
	       		d1=value.indexOf("<beauty>")+8;
		        d2=value.indexOf("</beauty>");
		        int beauty=Integer.parseInt(value.substring(d1,d2));
	       		if(beauty==1) info.add("뷰티시설");
	        }
       		
       		if(value.indexOf("<bicycle>") !=-1) {
	       		d1=value.indexOf("<bicycle>")+9;
		        d2=value.indexOf("</bicycle>");
		        int bicycle=Integer.parseInt(value.substring(d1,d2));
	       		if(bicycle==1) info.add("자전거대여");
       		}
       		
       		if(value.indexOf("<campfire>") !=-1) {
	       		d1=value.indexOf("<campfire>")+10;
		        d2=value.indexOf("</campfire>");
		        int campfire=Integer.parseInt(value.substring(d1,d2));
	       		if(campfire==1) info.add("캠프파이어");
       		}
       		
       		if(value.indexOf("<fitness>") !=-1) {
	       		d1=value.indexOf("<fitness>")+9;
		        d2=value.indexOf("</fitness>");
		        int fitness=Integer.parseInt(value.substring(d1,d2));
	       		if(fitness==1) info.add("피트니스");
       		}

       		if(value.indexOf("<foodplace>") !=-1) {			/* 식당 시설*/
	       		d1=value.indexOf("<foodplace>")+11;
		        d2=value.indexOf("</foodplace>");
		        String foodplace=value.substring(d1,d2);
	       		if(foodplace.length()>1) info.add(foodplace);
       		}
       		
       		if(value.indexOf("<karaoke>") !=-1) {
	       		d1=value.indexOf("<karaoke>")+9;
		        d2=value.indexOf("</karaoke>");
		        int karaoke=Integer.parseInt(value.substring(d1,d2));
	       		if(karaoke==1) info.add("노래방");
       		}
       		
       		if(value.indexOf("<pickup>") !=-1) {			/* 픽업 서비스*/
	       		d1=value.indexOf("<pickup>")+8;
		        d2=value.indexOf("</pickup>");
		        String pickup=value.substring(d1,d2);
	       		if(pickup.length()>1) info.add(pickup);
       		}
       		
       		if(value.indexOf("<sauna>") !=-1) {
	       		d1=value.indexOf("<sauna>")+7;
		        d2=value.indexOf("</sauna>");
		        int sauna=Integer.parseInt(value.substring(d1,d2));
	       		if(sauna==1) info.add("사우나");
       		}
       		
       		if(value.indexOf("<seminar>") !=-1) {
	       		d1=value.indexOf("<seminar>")+9;
		        d2=value.indexOf("</seminar>");
		        int seminar=Integer.parseInt(value.substring(d1,d2));
	       		if(seminar==1) info.add("세미나실");
       		}
       		
       		if(value.indexOf("<sports>") !=-1) {
	       		d1=value.indexOf("<sports>")+8;
		        d2=value.indexOf("</sports>");
		        int sports=Integer.parseInt(value.substring(d1,d2));
	       		if(sports==1) info.add("스포츠시설");
       		}
       		
       		if(value.indexOf("<subfacility>") !=-1) {		/*부대 시설 (매점,*/
	       		d1=value.indexOf("<subfacility>")+13;
		        d2=value.indexOf("</subfacility>");
		        String subfacility=value.substring(d1,d2);
	       		if(subfacility.length()>1) info.add(subfacility);
       		}
       		
       		model.addAttribute("info"+(i+1),info);	
       	}

	    System.out.println(count);
       	model.addAttribute("tcnt",count);
       	  
		return "hotel/house";
	}
	
}
