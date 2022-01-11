package egov.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egov.service.HotelorderVO;
import egov.service.LineReviewVO;
import egov.service.MemberService;
import egov.service.MemberVO;
import egov.service.ScrapVO;

@Service("memberService")
public class MemberImpl implements MemberService {

	@Resource(name="memberDAO")
	private MemberDAO memberDAO;
	
	@Override
	public String insertMember(MemberVO vo) throws Exception {
		return memberDAO.insertMember(vo);
	}
	
	@Override
	public int selectMemberIdcheck(String userid) throws Exception {
		return memberDAO.selectMemberIdcheck(userid);
	}

	@Override
	public MemberVO selectMemberCertify(MemberVO vo) throws Exception {
		return memberDAO.selectMemberCertify(vo);
	}

	@Override
	public MemberVO selectMemberInfo(MemberVO vo) throws Exception {
		return memberDAO.selectMemberInfo(vo);
	}

	@Override
	public int updateMemberInfo(MemberVO vo) throws Exception {
		return memberDAO.updateMemberInfo(vo);
	}

	@Override
	public int selectPassCheck(MemberVO vo) throws Exception {
		return memberDAO.selectPassCheck(vo);
	}

	@Override
	public int updateMemberPass(MemberVO vo) throws Exception {
		return memberDAO.updateMemberPass(vo);
	}

	@Override
	public int deleteMember(MemberVO vo) throws Exception {
		return memberDAO.deleteMember(vo);
	}

	@Override
	public List<?> selectRestaurantElist(LineReviewVO lineReview2) throws Exception {
		return memberDAO.selectRestaurantElist(lineReview2);
	}

	@Override
	public int selectRlistTotal(LineReviewVO lineReview2) throws Exception {
		return memberDAO.selectRlistTotal(lineReview2);
	}

	@Override
	public LineReviewVO selectLineReviewDetail(LineReviewVO vo) throws Exception {
		return memberDAO.selectLineReviewDetail(vo);
	}

	public int updateLineReviewSave(LineReviewVO vo) throws Exception {
		return memberDAO.updateLineReviewSave(vo);
	}

	@Override
	public int deleteLineReview(LineReviewVO vo) throws Exception {
		return memberDAO.deleteLineReview(vo);
	}

	@Override
	public List<?> selectScrapRlist(ScrapVO scrap2) throws Exception {
		return memberDAO.selectScrapRlist(scrap2);
	}

	@Override
	public int selectScrapRlistTotal(ScrapVO scrap2) throws Exception {
		return memberDAO.selectScrapRlistTotal(scrap2);
	}

	@Override
	public int deleteScrap(ScrapVO scrap) throws Exception {
		return memberDAO.deleteScrap(scrap);
	}

	@Override
	public List<?> selectHotelList(HotelorderVO hotel) throws Exception {
		return memberDAO.selectHotelList(hotel);
	}

	@Override
	public int selectHotelListTotal(HotelorderVO hotel) throws Exception {
		return memberDAO.selectHotelListTotal(hotel);
	}

	
}
