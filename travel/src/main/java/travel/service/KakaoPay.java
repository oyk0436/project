package travel.service;

import java.net.URI;
import java.net.URISyntaxException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.annotation.Resource;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;

@Service
public class KakaoPay {
	@Resource(name="travelService")
	private TravelService travelService;
	
	private static final String HOST = "https://kapi.kakao.com";
    
    private KakaoPayReadyVO kakaoPayReadyVO;
    private KakaoPayApprovalVO kakaoPayApprovalVO;
    
    public String kakaoPayReady(TravelVO vo) throws Exception {
 
        RestTemplate restTemplate = new RestTemplate();
        
        // 서버로 요청할 Header
        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", "KakaoAK " + "89111024f77a2da015169791373ebb54");
        headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
        headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");
        String itemname=vo.getTitle()+" "+vo.getRoomtype()+" "+vo.getRoomcount()+"실 "+vo.getDay()+"박";
        
        int price=Integer.parseInt(vo.getPrice())*Integer.parseInt(vo.getDay())*Integer.parseInt(vo.getRoomcount());
        
        int orderid=travelService.findnextorderid();
        
        // 서버로 요청할 Body
        MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
        params.add("cid", "TC0ONETIME");
        params.add("partner_order_id", (orderid+1)+"");  //가맹점 주문번호
        params.add("partner_user_id", "gorany"); //회원id
        params.add("item_name", itemname);
        params.add("quantity", "1");
        params.add("total_amount", price+""); //상품 총액
        params.add("tax_free_amount", "0");
        params.add("approval_url", "http://221.146.125.212:8091/kakaoPaySuccess.do");
        params.add("cancel_url", "http://221.146.125.212:8091/kakaoPayCancel");
        params.add("fail_url", "http://221.146.125.212:8091/kakaoPaySuccessFail");
 
         HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);
         System.out.println(body);
        try {
            kakaoPayReadyVO = restTemplate.postForObject(new URI(HOST + "/v1/payment/ready"), body, KakaoPayReadyVO.class);
            kakaoPayReadyVO.setOrderid((orderid+1)+"");
            kakaoPayReadyVO.setItemname(itemname);
            kakaoPayReadyVO.setPrice(price+"");
            kakaoPayReadyVO.setUserid("gorany");
            System.out.println(kakaoPayReadyVO.getNext_redirect_pc_url());
            return kakaoPayReadyVO.getNext_redirect_pc_url();
 
        } catch (RestClientException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (URISyntaxException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        
        return "houseMain.do";
        
    }
    
    public KakaoPayApprovalVO kakaoPayInfo(String pg_token) throws Exception {

        
        RestTemplate restTemplate = new RestTemplate();
 
        // 서버로 요청할 Header
        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", "KakaoAK " + "89111024f77a2da015169791373ebb54");
        headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
        headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");
 
        // 서버로 요청할 Body
        MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
        params.add("cid", "TC0ONETIME");
        params.add("tid", kakaoPayReadyVO.getTid());
        params.add("partner_order_id", kakaoPayReadyVO.getOrderid());
        params.add("partner_user_id", "gorany");
        params.add("pg_token", pg_token);
        params.add("total_amount", kakaoPayReadyVO.getPrice());
        
        HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);
        
        try {
            kakaoPayApprovalVO = restTemplate.postForObject(new URI(HOST + "/v1/payment/approve"), body, KakaoPayApprovalVO.class);
     
            
            kakaoPayApprovalVO.setOrderid(kakaoPayReadyVO.getOrderid());
            kakaoPayApprovalVO.setPrice(kakaoPayReadyVO.getPrice());
            kakaoPayApprovalVO.setUserid("gorany");
            
            travelService.inserthotelorder(kakaoPayApprovalVO);
            return kakaoPayApprovalVO;
        
        } catch (RestClientException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (URISyntaxException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        
        return null;
    }
}
