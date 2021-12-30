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
import travel.service.TravelVO;

@Controller
public class TravelController {
	
	@Resource(name="travelService")
	private TravelService travelService;
	
	@RequestMapping("house.do")
	public String apitest(Model model,TravelVO vo) throws Exception{
		String servicekey="cInuNrwcPd9DJp5JWYGRKBSqEVUa6Q%2FJRkrPp7sY4MNHX3Dh7vS4AKh8i5Qh2SMuLNCG0FMpTZLjto1MPSt6Yw%3D%3D";
		
		ArrayList<TravelVO> list=new ArrayList<>();
		String areacode=vo.getAreacode();
		String cityname=vo.getCityname();
		
		if(areacode==null || areacode.trim().equals("")) areacode="39";
		if(cityname==null || cityname.trim().equals("")) cityname="제주";
		
		model.addAttribute("cityname",cityname);
		
		StringBuilder urlBuilder = new StringBuilder("http://api.visitkorea.or.kr/openapi/service/rest/KorService/searchStay"); /*URL  ( 조회 기능 별로 다른 URL이 필요 )*/ 
        urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "="+servicekey); /*Service Key*/
        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("15", "UTF-8")); /*한 페이지 결과수*/
        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*현재 페이지 번호*/
        urlBuilder.append("&" + URLEncoder.encode("MobileOS","UTF-8") + "=" + URLEncoder.encode("ETC", "UTF-8")); /*IOS (아이폰), AND (안드로이드), WIN (원도우폰), ETC*/
        urlBuilder.append("&" + URLEncoder.encode("MobileApp","UTF-8") + "=" + URLEncoder.encode("AppTest", "UTF-8")); /*서비스명=어플명*/
        urlBuilder.append("&" + URLEncoder.encode("listYN","UTF-8") + "=" + URLEncoder.encode("N", "UTF-8"));
        urlBuilder.append("&" + URLEncoder.encode("areaCode","UTF-8") + "=" + URLEncoder.encode(areacode, "UTF-8")); /*지역코드, 시군구코드*/
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
		
		int total=Integer.parseInt(text.substring(text.indexOf("<totalCount>")+12,text.indexOf("</totalCount>")));
        int total_page=(int)Math.ceil((double)total/15);
 
        
		
		/* 숙박 정보 조회 */
		urlBuilder = new StringBuilder("http://api.visitkorea.or.kr/openapi/service/rest/KorService/searchStay"); /*URL  ( 조회 기능 별로 다른 URL이 필요 )*/ 
        urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "="+servicekey); /*Service Key*/
        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("15", "UTF-8")); /*한 페이지 결과수*/
        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*현재 페이지 번호*/
        urlBuilder.append("&" + URLEncoder.encode("MobileOS","UTF-8") + "=" + URLEncoder.encode("ETC", "UTF-8")); /*IOS (아이폰), AND (안드로이드), WIN (원도우폰), ETC*/
        urlBuilder.append("&" + URLEncoder.encode("MobileApp","UTF-8") + "=" + URLEncoder.encode("AppTest", "UTF-8")); /*서비스명=어플명*/
        urlBuilder.append("&" + URLEncoder.encode("areaCode","UTF-8") + "=" + URLEncoder.encode(areacode, "UTF-8")); /*지역코드, 시군구코드*/
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
       	
       	for(int i=0;i<end;i++) {
       		vo=new TravelVO();
       		
       		
       		int j=array[i].indexOf("<title>")+7;
       		int k=array[i].indexOf("</title>");
       		vo.setTitle(array[i].substring(j,k));
       		
       		j=array[i].indexOf("<firstimage>")+12;
       		k=array[i].indexOf("</firstimage>");
       		vo.setFirstimage(array[i].substring(j,k));	
       		
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
       		
	        vo.setMinest(minest);  /*호텔 방 최소 가격 */

	        
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
	        vo.setChkin(chkin);						/* 체크인 시간*/
	        
	        
	        d1=value.indexOf("<checkouttime>")+14;
	        d2=value.indexOf("</checkouttime>");
	        String chkout=value.substring(d1,d2);
	        vo.setChkout(chkout);
	        
	        if(value.indexOf("<roomtype>") !=-1) {			/*방 등급 (스위트룸 , 일반룸 ,마스터룸 )*/
		        d1=value.indexOf("<roomtype>")+10;
		        d2=value.indexOf("</roomtype>");
		        String roomtype=value.substring(d1,d2);
	       		vo.setRoomtype(roomtype);
	        }
	        
	        if(value.indexOf("<barbecue>") !=-1) {
		        d1=value.indexOf("<barbecue>")+10;
		        d2=value.indexOf("</barbecue>");
		        int barbecue=Integer.parseInt(value.substring(d1,d2));
	       		if(barbecue==1) vo.setPlace(vo.getPlace()+"바베큐");
	        }
       		
	        
	        if(value.indexOf("<beauty>") !=-1) {
	       		d1=value.indexOf("<beauty>")+8;
		        d2=value.indexOf("</beauty>");
		        int beauty=Integer.parseInt(value.substring(d1,d2));
	       		if(beauty==1) vo.setPlace(vo.getPlace()+" 뷰티시설");
	        }
       		
       		if(value.indexOf("<bicycle>") !=-1) {
	       		d1=value.indexOf("<bicycle>")+9;
		        d2=value.indexOf("</bicycle>");
		        int bicycle=Integer.parseInt(value.substring(d1,d2));
	       		if(bicycle==1) vo.setPlace(vo.getPlace()+" 자전거대여");
       		}
       		
       		if(value.indexOf("<campfire>") !=-1) {
	       		d1=value.indexOf("<campfire>")+10;
		        d2=value.indexOf("</campfire>");
		        int campfire=Integer.parseInt(value.substring(d1,d2));
	       		if(campfire==1) vo.setPlace(vo.getPlace()+" 캠프파이어");
       		}
       		
       		if(value.indexOf("<fitness>") !=-1) {
	       		d1=value.indexOf("<fitness>")+9;
		        d2=value.indexOf("</fitness>");
		        int fitness=Integer.parseInt(value.substring(d1,d2));
	       		if(fitness==1) vo.setPlace(vo.getPlace()+" 피트니스 ");
       		}

       		if(value.indexOf("<foodplace>") !=-1) {			/* 식당 시설*/
	       		d1=value.indexOf("<foodplace>")+11;
		        d2=value.indexOf("</foodplace>");
		        String foodplace=value.substring(d1,d2);
		        if(!foodplace.equals("없음")) {
		        	if(foodplace.length()>1) vo.setPlace(vo.getPlace()+foodplace);
		        }
       		}
       		
       		if(value.indexOf("<karaoke>") !=-1) {
	       		d1=value.indexOf("<karaoke>")+9;
		        d2=value.indexOf("</karaoke>");
		        int karaoke=Integer.parseInt(value.substring(d1,d2));
	       		if(karaoke==1) vo.setPlace(vo.getPlace()+" 노래방");
       		}
       		
       		if(value.indexOf("<pickup>") !=-1) {			/* 픽업 서비스*/
	       		d1=value.indexOf("<pickup>")+8;
		        d2=value.indexOf("</pickup>");
		        String pickup=value.substring(d1,d2);
		        if(!pickup.equals("불가능")) {
		        	if(pickup.length()>1) vo.setPlace(vo.getPlace()+" "+pickup);
		        }
       		}
       		
       		if(value.indexOf("<sauna>") !=-1) {
	       		d1=value.indexOf("<sauna>")+7;
		        d2=value.indexOf("</sauna>");
		        int sauna=Integer.parseInt(value.substring(d1,d2));
	       		if(sauna==1) vo.setPlace(vo.getPlace()+" 사우나");
       		}
       		
       		if(value.indexOf("<seminar>") !=-1) {
	       		d1=value.indexOf("<seminar>")+9;
		        d2=value.indexOf("</seminar>");
		        int seminar=Integer.parseInt(value.substring(d1,d2));
	       		if(seminar==1) vo.setPlace(vo.getPlace()+" 세미나실");
       		}
       		
       		if(value.indexOf("<sports>") !=-1) {
	       		d1=value.indexOf("<sports>")+8;
		        d2=value.indexOf("</sports>");
		        int sports=Integer.parseInt(value.substring(d1,d2));
	       		if(sports==1) vo.setPlace(vo.getPlace()+" 스포츠시설");
       		}
       		
       		if(value.indexOf("<subfacility>") !=-1) {		/*부대 시설 (매점,*/
	       		d1=value.indexOf("<subfacility>")+13;
		        d2=value.indexOf("</subfacility>");
		        String subfacility=value.substring(d1,d2);
	       		if(subfacility.length()>1) vo.setPlace(vo.getPlace()+" "+subfacility);
       		}
       		vo.setCityname(cityname);
       		vo.setContentid(contentid);
       		vo.setContenttypeid(contenttypeid);
       		list.add(vo);
       	}

       	model.addAttribute("tcnt",total_page);
       	
       	model.addAttribute("list",list);
       	  
		return "hotel/house";
	}
	
	@RequestMapping("juso.do")
	public String Joso(Model model) throws Exception{
		String currentPage ="1";
		String countPerPage = "1";
		String confmKey = "devU01TX0FVVEgyMDIxMTIyMDEwNDgyMzExMjA0ODg=";
		String keyword = "성동구";
		// API 호출 URL 정보 설정
		String apiUrl = "https://www.juso.go.kr/addrlink/addrLinkApi.do?"+
		"currentPage="+currentPage+
		"&countPerPage="+countPerPage+
		"&keyword="+URLEncoder.encode(keyword,"UTF-8")+
		"&confmKey="+confmKey;
		URL url = new URL(apiUrl); 
		BufferedReader br = new BufferedReader(
		new InputStreamReader(
		url.openStream(),"UTF-8"));
		StringBuffer sb = new StringBuffer();
		String tempStr = null;
		while(true){
		tempStr = br.readLine();
		if(tempStr == null) break;
		sb.append(tempStr); // 응답결과 XML 저장
		}
		br.close();
		System.out.println(sb.toString());
		String addr=sb.toString();
		if(addr.substring(addr.indexOf("<errorMessage>")+4,addr.indexOf("</errorMessage>")).equals("정상")) {
			String si=addr.substring(addr.indexOf("<siNm><![CDATA[")+15,addr.indexOf("]]></siNm>"));
			String sgg=addr.substring(addr.indexOf("<sggNm><![CDATA[")+16,addr.indexOf("]]></sggNm>"));
			 
			System.out.println(si);
			System.out.println(sgg);
			
			String servicekey="cInuNrwcPd9DJp5JWYGRKBSqEVUa6Q%2FJRkrPp7sY4MNHX3Dh7vS4AKh8i5Qh2SMuLNCG0FMpTZLjto1MPSt6Yw%3D%3D";
			StringBuilder urlBuilder = new StringBuilder("http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaCode"); /*URL  ( 조회 기능 별로 다른 URL이 필요 )*/ 
		    urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "="+servicekey); /*Service Key*/
		    urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("1000", "UTF-8")); /*한 페이지 결과수*/
	        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*현재 페이지 번호*/
	        urlBuilder.append("&" + URLEncoder.encode("MobileOS","UTF-8") + "=" + URLEncoder.encode("ETC", "UTF-8")); /*IOS (아이폰), AND (안드로이드), WIN (원도우폰), ETC*/
	        urlBuilder.append("&" + URLEncoder.encode("MobileApp","UTF-8") + "=" + URLEncoder.encode("AppTest", "UTF-8")); /*서비스명=어플명*/
	        url = new URL(urlBuilder.toString());
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("GET");
	        conn.setRequestProperty("Content-type", "application/json");
	        BufferedReader rd;
	        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
	            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	        } else {
	            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
	        }
	        StringBuilder sb2 = new StringBuilder();
	        String line;
	        while ((line = rd.readLine()) != null) {
	            sb2.append(line);
	        }
	        rd.close();
	        conn.disconnect();
	        
	        System.out.println(sb2.toString());
	        model.addAttribute("errmsg","정상");
		}else {
			String errmsg=addr.substring(addr.indexOf("<errorMessage>")+4,addr.indexOf("</errorMessage>"));
			model.addAttribute("errmsg",errmsg);
		}
		return "";
	}
	
	@RequestMapping("houseMain.do")
	public String housemain(Model model)throws Exception {
		ArrayList<TravelVO> list=new ArrayList<>();
		String[] areacode={"1","2","3","4","5","6","7","8","31","32","33","34","35","36","37","38","39"};
		
		/*P2znyWDmYOGFRFpOsMxanaS%2BYaMN8zk0hqU02D1%2BdFfHoLuYuq7Zi78NUGo4m3hNz6SF28AIq1XbGeQfW0iDFQ%3D%3D
		 * cInuNrwcPd9DJp5JWYGRKBSqEVUa6Q%2FJRkrPp7sY4MNHX3Dh7vS4AKh8i5Qh2SMuLNCG0FMpTZLjto1MPSt6Yw%3D%3D*/
		String servicekey="P2znyWDmYOGFRFpOsMxanaS%2BYaMN8zk0hqU02D1%2BdFfHoLuYuq7Zi78NUGo4m3hNz6SF28AIq1XbGeQfW0iDFQ%3D%3D";
		
		StringBuilder urlBuilder = new StringBuilder("http://api.visitkorea.or.kr/openapi/service/rest/KorService/searchStay"); /*URL  ( 조회 기능 별로 다른 URL이 필요 )*/ 
        urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "="+servicekey); /*Service Key*/
        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("100", "UTF-8")); /*한 페이지 결과수*/
        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*현재 페이지 번호*/
        urlBuilder.append("&" + URLEncoder.encode("MobileOS","UTF-8") + "=" + URLEncoder.encode("ETC", "UTF-8")); /*IOS (아이폰), AND (안드로이드), WIN (원도우폰), ETC*/
        urlBuilder.append("&" + URLEncoder.encode("MobileApp","UTF-8") + "=" + URLEncoder.encode("AppTest", "UTF-8")); /*서비스명=어플명*/
        urlBuilder.append("&" + URLEncoder.encode("arrange","UTF-8") + "=" + URLEncoder.encode("B", "UTF-8"));
        
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
        
        String[] array=text.split("</item>");
        int imagecount=0;
        int i=0;
        
        while(imagecount<5) {
        	TravelVO vo=new TravelVO();
        	if(array[i].indexOf("<firstimage>") != -1) {
		        	String firstimage=array[i].substring(array[i].indexOf("<firstimage>")+12,array[i].indexOf("</firstimage"));
		        	String title=array[i].substring(array[i].indexOf("<title>")+7,array[i].indexOf("</title>"));
		        	String contentid=array[i].substring(array[i].indexOf("<contentid>")+11,array[i].indexOf("</contentid>"));
		        	String contenttypeid=array[i].substring(array[i].indexOf("<contenttypeid>")+15,array[i].indexOf("</contenttypeid>"));
		        	vo.setContentid(contentid);
		        	vo.setContenttypeid(contenttypeid);
		        	vo.setFirstimage(firstimage);
		        	vo.setTitle(title);
		
		        	list.add(vo);
		        	imagecount++;
        	}
        	i++;
        }
        
		model.addAttribute("list",list);
		
		ArrayList<TravelVO> citylist=new ArrayList<>();
		for(i=0;i<areacode.length;i++) {
			TravelVO vo=new TravelVO();
			urlBuilder = new StringBuilder("http://api.visitkorea.or.kr/openapi/service/rest/KorService/searchStay"); /*URL  ( 조회 기능 별로 다른 URL이 필요 )*/ 
	        urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "="+servicekey); /*Service Key*/
	        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("15", "UTF-8")); /*한 페이지 결과수*/
	        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*현재 페이지 번호*/
	        urlBuilder.append("&" + URLEncoder.encode("MobileOS","UTF-8") + "=" + URLEncoder.encode("ETC", "UTF-8")); /*IOS (아이폰), AND (안드로이드), WIN (원도우폰), ETC*/
	        urlBuilder.append("&" + URLEncoder.encode("MobileApp","UTF-8") + "=" + URLEncoder.encode("AppTest", "UTF-8")); /*서비스명=어플명*/
	        urlBuilder.append("&" + URLEncoder.encode("listYN","UTF-8") + "=" + URLEncoder.encode("N", "UTF-8")); 
	        urlBuilder.append("&" + URLEncoder.encode("areaCode","UTF-8") + "=" + URLEncoder.encode(areacode[i], "UTF-8")); 
	        
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
	        
	        String city=sb.toString();
	        String cityname="";
	        String totalcnt;
	        String firstimage="";
	        if(areacode[i]=="1") { cityname="서울"; firstimage="../images/cityimage/seoul.jpg"; }
	        else if(areacode[i]=="2") { cityname="인천"; firstimage="../images/cityimage/inchun.jpg";}
	        else if(areacode[i]=="3") {cityname="대전"; firstimage="../images/cityimage/Daejeon.jpg";}
	        else if(areacode[i]=="4") {cityname="대구"; firstimage="../images/cityimage/Daegu.jpg";}
	        else if(areacode[i]=="5") {cityname="광주"; firstimage="../images/cityimage/Gwangju.jpg";}
	        else if(areacode[i]=="6") {cityname="부산"; firstimage="../images/cityimage/Busan.jpg";}
	        else if(areacode[i]=="7") {cityname="울산"; firstimage="../images/cityimage/Ulsan.jpg";}
	        else if(areacode[i]=="8") {cityname="세종특별자치시"; firstimage="../images/cityimage/Sejong.jpg";}
	        else if(areacode[i]=="31") {cityname="경기도"; firstimage="../images/cityimage/Gyeonggido.jpg";}
	        else if(areacode[i]=="32") {cityname="강원도"; firstimage="../images/cityimage/Gangwondo.jpg";}
	        else if(areacode[i]=="33") {cityname="충청북도"; firstimage="../images/cityimage/Chungcheongbukdo.jpg";}
	        else if(areacode[i]=="34") {cityname="충청남도"; firstimage="../images/cityimage/Chungcheongnamdo.jpg";}
	        else if(areacode[i]=="35") {cityname="경상북도"; firstimage="../images/cityimage/Gyeongsangbukdo.jpg";}
	        else if(areacode[i]=="36") {cityname="경상남도"; firstimage="../images/cityimage/Gyeongsangnamdo.jpg";}
	        else if(areacode[i]=="37") {cityname="전라북도"; firstimage="../images/cityimage/Jeollabukdo.jpg";}
	        else if(areacode[i]=="38") {cityname="전라남도"; firstimage="../images/cityimage/Jeollanamdo.jpg";}
	        else if(areacode[i]=="39") {cityname="제주도"; firstimage="../images/cityimage/jeju.jpg";}
	        
	        totalcnt=city.substring(city.indexOf("<totalCnt>")+10,city.indexOf("</totalCnt>"));
	        vo.setTotalcnt(totalcnt);
	        vo.setFirstimage(firstimage);
	        vo.setCityname(cityname);
	        vo.setAreacode(areacode[i]);
	        
	        
	        citylist.add(vo);
		}
		
		model.addAttribute("citylist",citylist);
		
		
		return "hotel/housemain";
	}
	
	@RequestMapping("houseDetail.do")
	public String housedetail(Model model,TravelVO vo)throws Exception{
		
		/*P2znyWDmYOGFRFpOsMxanaS%2BYaMN8zk0hqU02D1%2BdFfHoLuYuq7Zi78NUGo4m3hNz6SF28AIq1XbGeQfW0iDFQ%3D%3D
		 * cInuNrwcPd9DJp5JWYGRKBSqEVUa6Q%2FJRkrPp7sY4MNHX3Dh7vS4AKh8i5Qh2SMuLNCG0FMpTZLjto1MPSt6Yw%3D%3D*/
		String servicekey="P2znyWDmYOGFRFpOsMxanaS%2BYaMN8zk0hqU02D1%2BdFfHoLuYuq7Zi78NUGo4m3hNz6SF28AIq1XbGeQfW0iDFQ%3D%3D";
		String info;
		String contentid=vo.getContentid();
		String contenttypeid=vo.getContenttypeid();
		ArrayList<TravelVO> list=new ArrayList<>();
		ArrayList<TravelVO> roomlist=new ArrayList<>();
		TravelVO vo2=new TravelVO();
		
		
		/*소개정보 조회 가져올것 체크인 , 아웃 */
		StringBuilder urlBuilder = new StringBuilder("http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailIntro"); /*URL  ( 조회 기능 별로 다른 URL이 필요 )*/ 
        urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "="+servicekey); /*Service Key*/
        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("100", "UTF-8")); /*한 페이지 결과수*/
        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*현재 페이지 번호*/
        urlBuilder.append("&" + URLEncoder.encode("MobileOS","UTF-8") + "=" + URLEncoder.encode("ETC", "UTF-8")); /*IOS (아이폰), AND (안드로이드), WIN (원도우폰), ETC*/
        urlBuilder.append("&" + URLEncoder.encode("MobileApp","UTF-8") + "=" + URLEncoder.encode("AppTest", "UTF-8")); /*서비스명=어플명*/
        urlBuilder.append("&" + URLEncoder.encode("contentId","UTF-8") + "=" + URLEncoder.encode(contentid, "UTF-8")); /*컨텐츠아이디*/
        urlBuilder.append("&" + URLEncoder.encode("contentTypeId","UTF-8") + "=" + URLEncoder.encode(contenttypeid, "UTF-8")); /*컨텐츠타입아이디*/
        
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
		
		info=sb.toString();
		
		vo.setChkin(info.substring(info.indexOf("<checkintime>")+13,info.indexOf("</checkintime>")));
		vo.setChkout(info.substring(info.indexOf("<checkouttime>")+14,info.indexOf("</checkouttime>")));
		
		
		/*공통정보조회*/
		urlBuilder = new StringBuilder("http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon"); /*URL  ( 조회 기능 별로 다른 URL이 필요 )*/ 
        urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "="+servicekey); /*Service Key*/
        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("100", "UTF-8")); /*한 페이지 결과수*/
        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*현재 페이지 번호*/
        urlBuilder.append("&" + URLEncoder.encode("MobileOS","UTF-8") + "=" + URLEncoder.encode("ETC", "UTF-8")); /*IOS (아이폰), AND (안드로이드), WIN (원도우폰), ETC*/
        urlBuilder.append("&" + URLEncoder.encode("MobileApp","UTF-8") + "=" + URLEncoder.encode("AppTest", "UTF-8")); /*서비스명=어플명*/
        urlBuilder.append("&" + URLEncoder.encode("contentId","UTF-8") + "=" + URLEncoder.encode(contentid, "UTF-8")); /*컨텐츠아이디*/
        urlBuilder.append("&" + URLEncoder.encode("contentTypeId","UTF-8") + "=" + URLEncoder.encode(contenttypeid, "UTF-8")); /*컨텐츠타입아이디*/
        urlBuilder.append("&" + URLEncoder.encode("defaultYN","UTF-8") + "=" + URLEncoder.encode("Y", "UTF-8"));
        urlBuilder.append("&" + URLEncoder.encode("firstImageYN","UTF-8") + "=" + URLEncoder.encode("Y", "UTF-8"));
        urlBuilder.append("&" + URLEncoder.encode("overviewYN","UTF-8") + "=" + URLEncoder.encode("Y", "UTF-8"));
       
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
		
        info=sb.toString();
        
        String firstimage=info.substring(info.indexOf("<firstimage>")+12,info.indexOf("</firstimage>"));
        if(firstimage != null && !firstimage.trim().equals("")) vo.setFirstimage(firstimage);
        else vo.setFirstimage("없음");
        
        String title=info.substring(info.indexOf("<title>")+7,info.indexOf("</title>"));
        if(title!= null && !title.trim().equals("")) vo.setTitle(title);
        
        String overview=info.substring(info.indexOf("<overview>")+10,info.indexOf("</overview>"));
        overview=overview.replace("&amp;nbsp;", " ");
        overview=overview.replace(". ", ".<br>");
        overview=overview.replace("&lt;br&gt;","\n" );
        
        if(overview != null && !overview.trim().equals("")) vo.setOverview(overview);
		
		
		/*반복정보조회*/
		urlBuilder = new StringBuilder("http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailInfo"); /*URL  ( 조회 기능 별로 다른 URL이 필요 )*/ 
        urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "="+servicekey); /*Service Key*/
        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("100", "UTF-8")); /*한 페이지 결과수*/
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
		
        info=sb.toString();
        
        String[] inforoom=info.split("</item>");	
        
        for(int i=0;i<inforoom.length-1;i++) {
        	vo2=new TravelVO();
        	if(inforoom[i].indexOf("<roomtitle>")!= -1) {
	        	String roomtitle=inforoom[i].substring(inforoom[i].indexOf("<roomtitle>")+11,inforoom[i].indexOf("</roomtitle>"));
	        	vo2.setTitle(roomtitle);
        	}
        	
        	if(inforoom[i].indexOf("<roommaxcount>")!= -1) {
	        	String roommaxcount=inforoom[i].substring(inforoom[i].indexOf("<roommaxcount>")+14,inforoom[i].indexOf("</roommaxcount>"));
	        	vo2.setRoommaxcount(roommaxcount);
        	}
        	
        	if(inforoom[i].indexOf("<roomimg1>")!= -1) {
	        	String roomimg=inforoom[i].substring(inforoom[i].indexOf("<roomimg1>")+10,inforoom[i].indexOf("</roomimg1>"));
	        	if(roomimg != null && !roomimg.trim().equals("")) vo2.setRoomimg1(roomimg);
        	}
        	
        	if(inforoom[i].indexOf("<roomimg1alt>")!= -1) {
	        	String roomimgalt=inforoom[i].substring(inforoom[i].indexOf("<roomimg1alt>")+13,inforoom[i].indexOf("</roomimg1alt>"));
	        	if(roomimgalt != null && !roomimgalt.trim().equals("")) vo2.setRoomimg1alt(roomimgalt);
        	}
        	
        	if(inforoom[i].indexOf("<roomoffseasonminfee1>")!= -1) {
	        	String offmin1=inforoom[i].substring(inforoom[i].indexOf("<roomoffseasonminfee1>")+22,inforoom[i].indexOf("</roomoffseasonminfee1>"));
	        	if(offmin1.equals("0")) vo2.setRoomoffseasonminfee1("객실 가격 전화문의"); 
	        	else vo2.setRoomoffseasonminfee1(offmin1);
        	}
        	
        	if(inforoom[i].indexOf("<roomoffseasonminfee2>")!= -1) {
	        	String offmin2=inforoom[i].substring(inforoom[i].indexOf("<roomoffseasonminfee2>")+22,inforoom[i].indexOf("</roomoffseasonminfee2>"));
	        	if(offmin2.equals("0")) vo2.setRoomoffseasonminfee2("객실 가격 전화문의");
	        	else vo2.setRoomoffseasonminfee2(offmin2);
        	}
        	
        	if(inforoom[i].indexOf("<roompeakseasonminfee1>")!= -1) {
	        	String peekmin1=inforoom[i].substring(inforoom[i].indexOf("<roompeakseasonminfee1>")+23,inforoom[i].indexOf("</roompeakseasonminfee1>"));
	        	if(peekmin1.equals("0")) vo2.setRoompeakseasonminfee1("객실 가격 전화문의");
	        	else vo2.setRoompeakseasonminfee1(peekmin1);
        	}
        	
        	if(inforoom[i].indexOf("<roompeakseasonminfee2>")!= -1) {
	        	String peekmin2=inforoom[i].substring(inforoom[i].indexOf("<roompeakseasonminfee2>")+23,inforoom[i].indexOf("</roompeakseasonminfee2>"));
	        	if(peekmin2.equals("0")) vo2.setRoompeakseasonminfee2("객실 가격 전화문의");
	        	else vo2.setRoompeakseasonminfee2(peekmin2);
        	}
        	
        	roomlist.add(vo2);
        }
        
        model.addAttribute("list",vo);
        model.addAttribute("roomlist",roomlist);
        
		return "hotel/housedetail";
	}
}
