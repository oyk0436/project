package travel.web;

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
import travel.service.ScrapVO;

@Controller
public class MemberController {
	
	@Resource(name="memberService")
	MemberService memberService;
	
	@RequestMapping(value="test12.do")
	public String test12() {
		return "test/test12";
	}
	
	@RequestMapping(value="memberWrite.do")
	public String memberWrite() throws Exception {
		return "member/memberWrite";
	}
	
	@RequestMapping(value="memberWriteSave.do")
	@ResponseBody
	public String memberWriteSave(MemberVO vo) throws Exception {
		
		String msg = "ok";
		String result = memberService.insertMember(vo);
		if( result != null ) {
			
			msg = "save_fail";
		}
		
		return msg;
	}
	
	@RequestMapping(value="idcheck.do")
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
	
	@RequestMapping("loginWrite.do")
	public String loginWrite() throws Exception {
		return "member/loginWrite";
	}
	
	@RequestMapping("loginWriteSub.do")
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
		
		} else {   // ???????????? ?????????/??????  ?????? ?????? ???
			session.setAttribute("MEMBER_SESSION_ID", userid); 
			session.setAttribute("MEMBER_SESSION_NAME", name);
			session.setAttribute("MEMBER_SESSION_NICK", nick); 
		}
		mav.addObject("msg",msg);
		mav.addObject("name",name);
		System.out.println("aaa"+msg+" "+name);
		System.out.println("aaa"+mav);
		return mav;
	}
	
	@RequestMapping(value="logout.do")
	@ResponseBody
	public String logout(HttpSession session) {
		session.removeAttribute("MEMBER_SESSION_ID");
		return "ok";
	}
	
	@RequestMapping(value="memberInfo.do")
	public String memberInfo(MemberVO vo, Model model, HttpSession session) throws Exception{
		
		String userid = (String) session.getAttribute("MEMBER_SESSION_ID");
		vo.setUserid(userid);
		
		vo = memberService.selectMemberInfo(vo);
		
		model.addAttribute("vo",vo);
		
		return "member/memberInfo";
	}
	
	@RequestMapping(value="memberModify.do")
	public String memberModify(MemberVO vo, HttpSession session, Model model) throws Exception {
		
		String userid = (String) session.getAttribute("MEMBER_SESSION_ID");
		vo.setUserid(userid);
		
		vo = memberService.selectMemberInfo(vo);
		
		model.addAttribute("vo",vo);
		
		return "member/memberModify";
	}
	
	@RequestMapping(value="memberModifySave.do")
	@ResponseBody
	public String updateMemberInfo(MemberVO vo) throws Exception {
		
		String msg = "ok";
		
		int result = memberService.updateMemberInfo(vo);
		
		if (result == 0) {
			msg = "er1";
		}

		return msg;
	}
	
	@RequestMapping(value="passModify.do")
	public String passModify() throws Exception {
		return "member/passModify";
	}
	
	@RequestMapping(value="passCheck.do")
	@ResponseBody
	public String selectMemberCheck(MemberVO vo, HttpSession session) throws Exception {
		
		String msg = "ok";
		
		int count = memberService.selectPassCheck(vo);
	
		if (count == 0) {
			msg = "er1";
		}
	
		return msg;
	}
	
	@RequestMapping(value="passModifySave.do")
	@ResponseBody
	public String passModifySave(MemberVO vo) throws Exception {
		
		String msg = "ok";
		
		int result = memberService.updateMemberPass(vo);
		
		if (result == 0) {
			msg = "fail";
		}
		
		return msg;
	}
	
	@RequestMapping(value="memberDelete.do")
	public String memberOut() throws Exception {
		return "member/memberDelete";
	}
	
	@RequestMapping(value="memberDeleteSave.do")
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
	
	@RequestMapping(value="memberEpilogue.do")
	public String memberEpilogue(LineReviewVO lineReview2, LineReviewVO lineReview3, Model model, HttpSession session) throws Exception {
		
		String userid = (String) session.getAttribute("MEMBER_SESSION_ID");
		
		lineReview2.setUserid(userid);
		lineReview3.setUserid(userid);
		
		// ?????????
		// ?????? ????????? ??????
		int page_no2 = lineReview2.getPage_no2();
		int page_unit2 = lineReview2.getPage_unit2();
		
		// ????????? ????????? ???????????? sql??? ??????????????? ????????? ?????? ??????
		int page_size2 = lineReview2.getPage_size2();
		int s_no2 = (page_no2-1)*page_unit2 + 1;
		int e_no2 = s_no2 + (page_unit2-1);

		// ?????? ?????? ?????? ??? ??????
		int total2 = memberService.selectRlistTotal(lineReview2);	
		// ??? ????????? ?????? ??????
		int total_page2 = (int) Math.ceil((double)total2/page_unit2);	
		// ?????? ???????????? ?????? ????????? ??????
		int rownum2 = total2 - (page_no2-1)*page_unit2;		
		
		int page_sno2 = ((page_no2-1)/ page_unit2) * page_unit2 +1;
		int page_eno2 = page_sno2 + (page_size2-1);
		
		// ?????????
		// ?????? ????????? ??????
		int page_no3 = lineReview3.getPage_no3();
		int page_unit3 = lineReview3.getPage_unit3();
		
		// ????????? ????????? ???????????? sql??? ??????????????? ????????? ?????? ??????
		int page_size3 = lineReview3.getPage_size3();
		int s_no3 = (page_no3-1)*page_unit3 + 1;
		int e_no3 = s_no3 + (page_unit3-1);

		// ?????? ?????? ?????? ??? ??????
		int total3 = memberService.selectTlistTotal(lineReview3);	
		// ??? ????????? ?????? ??????
		int total_page3 = (int) Math.ceil((double)total3/page_unit3);	
		// ?????? ???????????? ?????? ????????? ??????
		int rownum3 = total3 - (page_no3-1)*page_unit3;		
		
		int page_sno3 = ((page_no3-1)/ page_unit3) * page_unit3 +1;
		int page_eno3 = page_sno3 + (page_size3-1);
		
		lineReview2.setS_no2(s_no2);
		lineReview2.setE_no2(e_no2);
		lineReview2.setTotal2(total2);
		lineReview2.setTotal_page2(total_page2);
		lineReview2.setRownum2(rownum2);
		lineReview2.setPage_sno2(page_sno2);
		lineReview2.setPage_eno2(page_eno2);
		
		lineReview3.setS_no3(s_no3);
		lineReview3.setE_no3(e_no3);
		lineReview3.setTotal3(total3);
		lineReview3.setTotal_page3(total_page3);
		lineReview3.setRownum3(rownum3);
		lineReview3.setPage_sno3(page_sno3);
		lineReview3.setPage_eno3(page_eno3);
		
		// ????????? ?????? ?????? ?????????
		List<?> list2 = memberService.selectRestaurantElist(lineReview2);
		// ????????? ?????? ?????? ?????????
		List<?> list3 = memberService.selectTourElist(lineReview3);
		
		model.addAttribute("list2",list2);
		model.addAttribute("list3",list3);
		model.addAttribute("lineReview2",lineReview2);
		model.addAttribute("lineReview3",lineReview3);
		
		return "member/memberEpilogue";
	}
	
	@RequestMapping(value="lineReviewModify.do")
	public String lineReviewModify(LineReviewVO vo, Model model) throws Exception {
		
		vo = memberService.selectLineReviewDetail(vo);
		
		model.addAttribute("vo",vo);
		
		return "member/lineReviewModify";
	}
	
	@RequestMapping(value="lineReviewSave.do")
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
	
	@RequestMapping(value="lineReviewDelete.do")
	public String lineReviewDelete(LineReviewVO vo, Model model) throws Exception {
		
		vo = memberService.selectLineReviewDetail(vo);
		
		model.addAttribute("vo",vo);
		
		return "member/lineReviewDelete";
	}
	
	@RequestMapping(value="lineReviewDeleteSave.do")
	@ResponseBody
	public String lineReviewDeleteSave(LineReviewVO vo) throws Exception {
		
		String msg = "ok";
		
		int result = memberService.deleteLineReview(vo);
		
		if (result == 0) {
			msg = "fail";
		}
		
		return msg;
	}
	
	@RequestMapping(value="memberScrap.do")
	public String memberScrap(ScrapVO scrap2, ScrapVO scrap3, Model model, HotelorderVO hotel, HttpSession session) throws Exception {
		
		// ????????? ??????
		String userid = (String) session.getAttribute("MEMBER_SESSION_ID");
		scrap2.setUserid(userid);
		scrap3.setUserid(userid);
		hotel.setUserid(userid);
		
		// ??????
		// ?????? ????????? ??????
		int page_no1 = hotel.getPage_no1();
		int page_unit1 = hotel.getPage_unit1();
		
		// ????????? ????????? ???????????? sql??? ??????????????? ????????? ?????? ??????
		int page_size1 = hotel.getPage_size1();
		int s_no1 = (page_no1-1)*page_unit1 + 1;
		int e_no1 = s_no1 + (page_unit1-1);

		// ?????? ?????? ?????? ??? ??????
		int total1 = memberService.selectHotelListTotal(hotel);	
		// ??? ????????? ?????? ??????
		int total_page1 = (int) Math.ceil((double)total1/page_unit1);	
		// ?????? ???????????? ?????? ????????? ??????
		int rownum1 = total1 - (page_no1-1)*page_unit1;		
		
		int page_sno1 = ((page_no1-1)/ page_unit1) * page_unit1 +1;
		int page_eno1 = page_sno1 + (page_size1-1);

		// ?????????
		// ?????? ????????? ??????
		int page_no2 = scrap2.getPage_no2();
		int page_unit2 = scrap2.getPage_unit2();
		
		// ????????? ????????? ???????????? sql??? ??????????????? ????????? ?????? ??????
		int page_size2 = scrap2.getPage_size2();
		int s_no2 = (page_no2-1)*page_unit2 + 1;
		int e_no2 = s_no2 + (page_unit2-1);

		// ?????? ?????? ?????? ??? ??????
		int total2 = memberService.selectScrapRlistTotal(scrap2);	
		// ??? ????????? ?????? ??????
		int total_page2 = (int) Math.ceil((double)total2/page_unit2);	
		// ?????? ???????????? ?????? ????????? ??????
		int rownum2 = total2 - (page_no2-1)*page_unit2;		
		
		int page_sno2 = ((page_no2-1)/ page_unit2) * page_unit2 +1;
		int page_eno2 = page_sno2 + (page_size2-1);
		
		// ?????????
		// ?????? ????????? ??????
		int page_no3 = scrap3.getPage_no3();
		int page_unit3 = scrap3.getPage_unit3();
		
		// ????????? ????????? ???????????? sql??? ??????????????? ????????? ?????? ??????
		int page_size3 = scrap3.getPage_size3();
		int s_no3 = (page_no3-1)*page_unit3 + 1;
		int e_no3 = s_no3 + (page_unit3-1);

		// ?????? ?????? ?????? ??? ??????
		int total3 = memberService.selectScrapTlistTotal(scrap3);	
		// ??? ????????? ?????? ??????
		int total_page3 = (int) Math.ceil((double)total2/page_unit3);	
		// ?????? ???????????? ?????? ????????? ??????
		int rownum3 = total3 - (page_no2-1)*page_unit3;		
		
		int page_sno3 = ((page_no3-1)/ page_unit3) * page_unit3 +1;
		int page_eno3 = page_sno3 + (page_size3-1);
		
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
		
		scrap3.setS_no3(s_no3);
		scrap3.setE_no3(e_no3);
		scrap3.setTotal3(total3);
		scrap3.setTotal_page3(total_page3);
		scrap3.setRownum3(rownum3);
		scrap3.setPage_sno3(page_sno3);
		scrap3.setPage_eno3(page_eno3);
		
		List<?> list1 = memberService.selectHotelList(hotel);
		List<?> list2 = memberService.selectScrapRlist(scrap2);
		List<?> list3 = memberService.selectScrapTlist(scrap3);
		
		model.addAttribute("list1",list1);
		model.addAttribute("list2",list2);
		model.addAttribute("list3",list3);
		model.addAttribute("scrap2",scrap2);
		model.addAttribute("scrap3",scrap3);
		model.addAttribute("hotel",hotel);
		
		return "member/memberScrap";
	}
	
	@RequestMapping(value="scrapDelete.do")
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
