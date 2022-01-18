package travel.web;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import travel.service.HotelorderVO;
import travel.service.LineReviewVO;
import travel.service.MemberService;
import travel.service.MemberVO;
import travel.service.OrderVO;
import travel.service.ScrapVO;
import travel.service.TravelService;
import travel.service.TravelVO;

@Controller
public class AdminController {
	
	@Resource(name="memberService")
	MemberService memberService;
	@Resource(name="travelService")
	TravelService travelService;
	
	@RequestMapping("memberlist.do")
	public String memberWrite(Model model) throws Exception {
		List<?> list=new ArrayList<>();
		list=memberService.selectMemberlist();

		model.addAttribute("list",list);
		return "admin/userlist";
	}
	

	@RequestMapping("memberoneDelete.do")
	@ResponseBody
	public String memberOut(MemberVO vo, HttpSession session) throws Exception {
		
		String msg = "ok";
		vo=memberService.selectforadmin(vo);
		memberService.insertDelMember(vo);
		int result = memberService.deleteMember(vo);
		
		if (result != 1) {
			msg = "fail";
		}
		
		session.removeAttribute("MEMBER_SESSION_ID");
		
		return msg;
	}
	
	@RequestMapping("orderlist.do")
	public String orderlist(Model model,TravelVO vo)throws Exception{
		List<?> list=new ArrayList<>();
		list=travelService.selectOrderlist(); 
		model.addAttribute("list",list);
		return "admin/orderlist";
	}
	
	@RequestMapping("orderlistDelete.do")
	public String orderlistDelete(OrderVO vo)throws Exception{
		String msg="ok";
		vo=travelService.selectFindOrder(vo);
		travelService.insertXOrderlist(vo);
		
		int result=travelService.deleteOrderlist(vo);
		if (result != 1) {
			msg = "fail";
		}
		
		
		return msg;
	}
	@RequestMapping("memberWriteSave2.do")
	@ResponseBody
	public String memberWriteSave(MemberVO vo) throws Exception {
		
		String msg = "ok";
		String result = memberService.insertMember(vo);
		if( result != null ) {
			
			msg = "save_fail";
		}
		
		return msg;
	}
	
	@RequestMapping("idcheck2.do")
	@ResponseBody
	public String selectMemberIdcheck(String userid) throws Exception {
		String msg = "ok"; 
		String pattern = "^[a-zA-Z]{1}[a-zA-Z0-9_-]{3,11}";
		boolean result = userid.matches(pattern);
		
		if( result == false) {
			msg = "er2";
		} else {
			int count = memberService.selectMemberIdcheck(userid);
			if( count > 0 ) {
				msg = "er1";
			}
		}
		return msg;
	}
	
	@RequestMapping("loginWrite2.do")
	public String loginWrite() throws Exception {
		return "member/loginWrite";
	}
	
	@RequestMapping("loginWriteSub2.do")
	@ResponseBody
	public ModelAndView selectMemberCertify(MemberVO vo, HttpSession session) throws Exception {
		
		ModelAndView mav = new ModelAndView("jsonView");
		
		String msg= "ok";

		vo = memberService.selectMemberCertify(vo);
		
		String userid = vo.getUserid();
		String name = vo.getName();
		String nick = vo.getNick();
		
		if( userid == null || userid.trim().equals("") ) {
			msg = "er1";
		
		} else {   // 사용자의 아이디/암호  정상 입력 시
			session.setAttribute("MEMBER_SESSION_ID", userid); 
			session.setAttribute("MEMBER_SESSION_NAME", name);
			session.setAttribute("MEMBER_SESSION_NICK", nick); 
		}
		
		mav.addObject("msg",msg);
		mav.addObject("name",name);
		
		return mav;
	}
	
	@RequestMapping("logout2.do")
	@ResponseBody
	public String logout(HttpSession session) {
		session.removeAttribute("MEMBER_SESSION_ID");
		return "ok";
	}
	
	@RequestMapping("memberInfo2.do")
	public String memberInfo(MemberVO vo, Model model, HttpSession session) throws Exception{
		
		String userid = (String) session.getAttribute("MEMBER_SESSION_ID");
		vo.setUserid(userid);
		
		vo = memberService.selectMemberInfo(vo);
		
		model.addAttribute("vo",vo);
		
		return "member/memberInfo";
	}
	
	@RequestMapping("memberModify2.do")
	public String memberModify(MemberVO vo, HttpSession session, Model model) throws Exception {
		
		String userid = (String) session.getAttribute("MEMBER_SESSION_ID");
		vo.setUserid(userid);
		
		vo = memberService.selectMemberInfo(vo);
		
		model.addAttribute("vo",vo);
		
		return "member/memberModify";
	}
	
	@RequestMapping("memberModifySave2.do")
	@ResponseBody
	public String updateMemberInfo(MemberVO vo) throws Exception {
		
		String msg = "ok";
		
		int result = memberService.updateMemberInfo(vo);
		
		if (result == 0) {
			msg = "er1";
		}

		return msg;
	}
	
	@RequestMapping("passModify2.do")
	public String passModify() throws Exception {
		return "member/passModify";
	}
	
	@RequestMapping(value="passCheck2.do")
	@ResponseBody
	public String selectMemberCheck(MemberVO vo, HttpSession session) throws Exception {
		
		String msg = "ok";
		
		int count = memberService.selectPassCheck(vo);
	
		if (count == 0) {
			msg = "er1";
		}
	
		return msg;
	}
	
	@RequestMapping("passModifySave2.do")
	@ResponseBody
	public String passModifySave(MemberVO vo) throws Exception {
		
		String msg = "ok";
		
		int result = memberService.updateMemberPass(vo);
		
		if (result == 0) {
			msg = "fail";
		}
		
		return msg;
	}
	
	@RequestMapping("memberDelete2.do")
	public String memberOut() throws Exception {
		return "member/memberDelete";
	}
	
	@RequestMapping("memberDeleteSave2.do")
	@ResponseBody
	public String memberOutSave(MemberVO vo, HttpSession session) throws Exception {
		
		String msg = "ok";
		
		int result = memberService.deleteMember(vo);
		
		if (result != 1) {
			msg = "fail";
		}
		
		session.removeAttribute("MEMBER_SESSION_ID");
		
		return msg;
	}
	
	@RequestMapping("memberEpilogue2.do")
	public String memberEpilogue(LineReviewVO lineReview2, Model model, HttpSession session) throws Exception {
		
		String userid = (String) session.getAttribute("MEMBER_SESSION_ID");
		
		lineReview2.setUserid(userid);
		
		// 출력 페이지 번호
		int page_no2 = lineReview2.getPage_no2();
		int page_unit2 = lineReview2.getPage_unit2();
		
		// 페이지 번호를 이용하여 sql의 시작번호와 끝번호 변수 설정
		int page_size2 = lineReview2.getPage_size2();
		int s_no2 = (page_no2-1)*page_unit2 + 1;
		int e_no2 = s_no2 + (page_unit2-1);

		// 맛집 한줄 리뷰 총 개수
		int total2 = memberService.selectRlistTotal(lineReview2);	
		// 총 페이지 번호 설정
		int total_page2 = (int) Math.ceil((double)total2/page_unit2);	
		// 출력 페이지의 시작 행번호 설정
		int rownum2 = total2 - (page_no2-1)*page_unit2;		
		
		int page_sno2 = ((page_no2-1)/ page_unit2) * page_unit2 +1;
		int page_eno2 = page_sno2 + (page_size2-1);
		
		lineReview2.setS_no2(s_no2);
		lineReview2.setE_no2(e_no2);
		lineReview2.setTotal2(total2);
		lineReview2.setTotal_page2(total_page2);
		lineReview2.setRownum2(rownum2);
		lineReview2.setPage_sno2(page_sno2);
		lineReview2.setPage_eno2(page_eno2);
		
		// 음식점 이용 후기 리스트
		List<?> list2 = memberService.selectRestaurantElist(lineReview2);
		
		model.addAttribute("list2",list2);
		model.addAttribute("lineReview2",lineReview2);
		
		return "member/memberEpilogue";
	}
	
	@RequestMapping("lineReviewModify2.do")
	public String lineReviewModify(LineReviewVO vo, Model model) throws Exception {
		
		vo = memberService.selectLineReviewDetail(vo);
		
		model.addAttribute("vo",vo);
		
		return "member/lineReviewModify";
	}
	
	@RequestMapping("lineReviewSave2.do")
	@ResponseBody
	public String lineReviewSave(LineReviewVO vo) throws Exception {
		
		String msg = "ok";
			
		int result = memberService.updateLineReviewSave(vo);
		
		if (result == 0) {
			msg = "fail";
		}
		System.out.println(result + "====" + msg + "---------");
		return msg;
	}
	
	@RequestMapping("lineReviewDelete2.do")
	public String lineReviewDelete(LineReviewVO vo, Model model) throws Exception {
		
		vo = memberService.selectLineReviewDetail(vo);
		
		model.addAttribute("vo",vo);
		
		return "member/lineReviewDelete";
	}
	
	@RequestMapping("lineReviewDeleteSave2.do")
	@ResponseBody
	public String lineReviewDeleteSave(LineReviewVO vo) throws Exception {
		
		String msg = "ok";
		
		int result = memberService.deleteLineReview(vo);
		
		if (result == 0) {
			msg = "fail";
		}
		
		return msg;
	}
	
	@RequestMapping("memberScrap2.do")
	public String memberScrap(ScrapVO scrap2, Model model, HotelorderVO hotel, HttpSession session) throws Exception {
		
		// 아이디 호출
		String userid = (String) session.getAttribute("MEMBER_SESSION_ID");
		scrap2.setUserid(userid);
		hotel.setUserid(userid);
		
		// 숙박
		// 출력 페이지 번호
		int page_no1 = hotel.getPage_no1();
		int page_unit1 = hotel.getPage_unit1();
		
		// 페이지 번호를 이용하여 sql의 시작번호와 끝번호 변수 설정
		int page_size1 = hotel.getPage_size1();
		int s_no1 = (page_no1-1)*page_unit1 + 1;
		int e_no1 = s_no1 + (page_unit1-1);

		// 맛집 한줄 리뷰 총 개수
		int total1 = memberService.selectHotelListTotal(hotel);	
		// 총 페이지 번호 설정
		int total_page1 = (int) Math.ceil((double)total1/page_unit1);	
		// 출력 페이지의 시작 행번호 설정
		int rownum1 = total1 - (page_no1-1)*page_unit1;		
		
		int page_sno1 = ((page_no1-1)/ page_unit1) * page_unit1 +1;
		int page_eno1 = page_sno1 + (page_size1-1);

		// 음식점
		// 출력 페이지 번호
		int page_no2 = scrap2.getPage_no2();
		int page_unit2 = scrap2.getPage_unit2();
		
		// 페이지 번호를 이용하여 sql의 시작번호와 끝번호 변수 설정
		int page_size2 = scrap2.getPage_size2();
		int s_no2 = (page_no2-1)*page_unit2 + 1;
		int e_no2 = s_no2 + (page_unit2-1);

		// 맛집 한줄 리뷰 총 개수
		int total2 = memberService.selectScrapRlistTotal(scrap2);	
		// 총 페이지 번호 설정
		int total_page2 = (int) Math.ceil((double)total2/page_unit2);	
		// 출력 페이지의 시작 행번호 설정
		int rownum2 = total2 - (page_no2-1)*page_unit2;		
		
		int page_sno2 = ((page_no2-1)/ page_unit2) * page_unit2 +1;
		int page_eno2 = page_sno2 + (page_size2-1);
		
		hotel.setS_no1(s_no1);
		hotel.setE_no1(e_no1);
		hotel.setTotal1(total1);
		hotel.setTotal_page1(total_page1);
		hotel.setRownum1(rownum1);
		hotel.setPage_sno1(page_sno1);
		hotel.setPage_eno1(page_eno1);
		
		scrap2.setS_no2(s_no2);
		scrap2.setE_no2(e_no2);
		scrap2.setTotal2(total2);
		scrap2.setTotal_page2(total_page2);
		scrap2.setRownum2(rownum2);
		scrap2.setPage_sno2(page_sno2);
		scrap2.setPage_eno2(page_eno2);
		
		List<?> list1 = memberService.selectHotelList(hotel);
		List<?> list2 = memberService.selectScrapRlist(scrap2);
		
		model.addAttribute("list1",list1);
		model.addAttribute("list2",list2);
		model.addAttribute("scrap2",scrap2);
		model.addAttribute("hotel",hotel);
		
		return "member/memberScrap";
	}
	
	@RequestMapping("scrapDelete2.do")
	@ResponseBody
	public String scrapDelete(ScrapVO scrap) throws Exception {
		
		String msg = "ok";
		
		int result = memberService.deleteScrap(scrap);
		
		if (result == 0) {
			msg = "fail";
		}
		
		return msg;
	}
	
}





