package travel.web;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import travel.service.LineReviewVO;
import travel.service.MemberVO;
import travel.service.RestaurantVO;
import travel.service.ScrapVO;
import travel.service.TourService;
import travel.service.TourVO;
import travel.service.TravelVO;

@Controller
public class TourController {
	
	@Resource(name="tourService")
	TourService tourService;
	
	@RequestMapping(value="tourMain.do")
	public String tourMaing(TourVO vo, Model model) throws Exception {
		
		// 출력 페이지 번호
		int page_no = vo.getPage_no();
		int page_unit = vo.getPage_unit();

		// 페이지 번호를 이용하여 sql의 시작번호와 끝번호 변수 설정
		int page_size = vo.getPage_size();
		int s_no = (page_no-1)*page_unit + 1;
		int e_no = s_no + (page_unit-1);

		// 맛집 한줄 리뷰 총 개수
		int total = tourService.selectTourTotal(vo);	
		// 총 페이지 번호 설정
		int total_page = (int) Math.ceil((double)total/page_unit);	
		// 출력 페이지의 시작 행번호 설정
		int rownum = total - (page_no-1)*page_unit;		
		
		int page_sno = ((page_no-1)/page_unit) * page_unit +1;
		int page_eno = page_sno + (page_size-1);
		
		vo.setS_no(s_no);
		vo.setE_no(e_no);
		vo.setTotal(total);
		vo.setTotal_page(total_page);
		vo.setRownum(rownum);
		vo.setPage_sno(page_sno);
		vo.setPage_eno(page_eno);
		
		// 추천 관광지 이미지
		List<?> list1 = tourService.selectRecommendImg(vo);
		// 실시간 관광지 이미지
		List<?> list2 = tourService.selectRealtimeImg(vo);
		// 관광지 전체 목록
		List<?> list3 = tourService.selectTourList(vo);
				
		model.addAttribute("list1",list1);
		model.addAttribute("list2",list2);
		model.addAttribute("list3",list3);
		model.addAttribute("vo",vo);
		model.addAttribute("regionDetail", vo.getRegionDetail());
		model.addAttribute("s_field", vo.getS_field());
		model.addAttribute("s_text", vo.getS_text());
		
		return "tour/tourMain";
	}
	
	// 맛집 상세 페이지
	@RequestMapping(value="/tourDetail.do")
	public String restaurantDetail (
		TourVO vo, LineReviewVO lineReview, RestaurantVO restaurantMap, 
		TravelVO travelMap, TourVO tourMap, Model model, 
		MemberVO member, HttpSession session, ScrapVO scrap) throws Exception {
		System.out.println("aaaaaa");
		// 아이디 호출
		String userid = (String) session.getAttribute("MEMBER_SESSION_ID");
		scrap.setUserid(userid);
		// 출력 페이지 번호
		int page_no = lineReview.getPage_no();
		int page_unit = lineReview.getPage_unit();
	
		// 페이지 번호를 이용하여 sql의 시작번호와 끝번호 변수 설정
		int page_size = lineReview.getPage_size();
		int s_no = (page_no-1)*page_unit + 1;
		int e_no = s_no + (page_unit-1);
		// 맛집 한줄 리뷰 총 개수
		int total = tourService.selectLineReviewTotal(lineReview);	
		// 총 페이지 번호 설정
		int total_page = (int) Math.ceil((double)total/page_unit);	
		// 출력 페이지의 시작 행번호 설정
		int rownum = total - (page_no-1)*page_unit;	
		
		int page_sno = ((page_no-1)/ page_unit) * page_unit +1;
		int page_eno = page_sno + (page_size-1);
		// 맛집 평점 세팅
		int grade = tourService.selectTourGrade(lineReview);	
		
		// 스크랩 유무 확인
		int count = tourService.selectScrapCount(scrap);
		scrap.setCount(count);
		int status = 1;
		// 스크랩 상태 확인 (저장이 안되어 있는 경우 status 값이 없으므로 스크랩이 존재 할 경우에만 status를 불러온다.)
		if (count > 0) {
			status = tourService.selectScrapDetail(scrap);
		}
		scrap.setStatus(status);
		model.addAttribute("scrap",scrap);
		// jsp로 전송할 변수 세팅
		lineReview.setS_no(s_no);
		lineReview.setE_no(e_no);
		lineReview.setTotal(total);
		lineReview.setTotal_page(total_page);
		lineReview.setRownum(rownum);
		lineReview.setGrade(grade);
		lineReview.setPage_sno(page_sno);
		lineReview.setPage_eno(page_eno);
		
		// 맛집 상세보기 서비스 실행
		vo = tourService.selectTourDetail(vo);
		// 맛집 조회수 증가
		tourService.updateTourHits(vo);
		// 맛집 한줄 리뷰 목록
		List<?> reviewlist = tourService.selectLineReviewList(lineReview);
		// 맛집 , 숙박, 관광지 지도 리스트
		List<?> restaurantMapList = tourService.selectRestaurantMap(restaurantMap);
		List<?> travelMapList = tourService.selectTravelMap(travelMap);
		List<?> tourMapList = tourService.selectTourMap(tourMap);
		// jsp 전송
		
		System.out.println(vo+"vo");
		model.addAttribute("vo", vo);
		model.addAttribute("lineReview", lineReview);
		model.addAttribute("reviewlist", reviewlist);
		model.addAttribute("restaurantMapList",restaurantMapList);
		model.addAttribute("travelMapList",travelMapList);
		model.addAttribute("tourMapList",tourMapList);
		model.addAttribute("s_field", vo.getS_field());
		model.addAttribute("s_text", vo.getS_text());
		return "tour/tourDetail";
	}
	
	// 관광지 한줄 리뷰 화면
	@RequestMapping(value="/tourLineReview.do")
	public String tourLineReview(TourVO vo, Model model) throws Exception {
		
		// 상세보기 서비스 실행
		vo = tourService.selectTourDetail(vo);
		
		model.addAttribute("vo", vo);
		
		return "tour/tourLineReview";
	}
	
	// 맛집 한줄 리뷰 저장
	@RequestMapping(value="/tourLineReviewSave.do")
	@ResponseBody
	public String lineReviewSave(LineReviewVO lineReview, Model model) throws Exception {
		
		String result = tourService.insertLineReview(lineReview);
		
		String message = "ok";
		if (result != null) {
			message = "error";
		}
		
		return message;
	}
	
	@RequestMapping(value="tscrapSave.do")
	@ResponseBody
	public String scapSave(ScrapVO scrap) throws Exception {
		
		String msg = "ok";
		
		String result = tourService.insertScrap(scrap);
		
		if (result != null) {
			msg = "fail";
		}
		
		return msg;
	}
	
	@RequestMapping(value="tscrapUpdate.do")
	@ResponseBody
	public String scrapUpdate(ScrapVO scrap) throws Exception {
		
		String msg = "ok";
		// 스크랩 취소할 경우 : 0, 스크랩 실행할 경우 : 1
		int status = scrap.getStatus();
		
		int result = tourService.updateScrap(scrap);
		
		if (result != 0) {
			if (status == 0) {
				msg = "cancel";
			} else if (status == 1) {
				msg = "ok";
			}
		}
		
		return msg;
	}
}
