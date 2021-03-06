package travel.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import travel.service.HotelorderVO;
import travel.service.LineReviewVO;
import travel.service.MemberVO;
import travel.service.ScrapVO;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

@Repository("memberDAO")
public class MemberDAO extends EgovAbstractDAO {

	public String insertMember(MemberVO vo) {
		return (String)insert("memberDAO.insertMember",vo);
	}

	public int selectMemberIdcheck(String userid) {
		return (int)select("memberDAO.selectMemberIdcheck",userid);
	}

	public MemberVO selectMemberCertify(MemberVO vo) {
		return (MemberVO)select("memberDAO.selectMemberCertify",vo);
	}

	public MemberVO selectMemberInfo(MemberVO vo) {
		return (MemberVO)select("memberDAO.selectMemberInfo",vo);
	}

	public int updateMemberInfo(MemberVO vo) {
		return update("memberDAO.updateMemberInfo",vo);
	}

	public int selectPassCheck(MemberVO vo) {
		return (int)select("memberDAO.selectPassCheck",vo);
	}

	public int updateMemberPass(MemberVO vo) {
		return update("memberDAO.updateMemberPass",vo);
	}

	public int deleteMember(MemberVO vo) {
		return delete("memberDAO.deleteMember",vo);
	}

	public List<?> selectRestaurantElist(LineReviewVO lineReview2) {
		return list("memberDAO.selectRestaurantElist",lineReview2);
	}

	public int selectRlistTotal(LineReviewVO lineReview2) {
		return (int)select("memberDAO.selectRlistTotal",lineReview2);
	}

	public LineReviewVO selectLineReviewDetail(LineReviewVO vo) {
		return (LineReviewVO)select("memberDAO.selectLineReviewDetail",vo);
	}

	public int updateLineReviewSave(LineReviewVO vo) {
		return update("memberDAO.updateLineReviewSave",vo);
	}

	public int deleteLineReview(LineReviewVO vo) {
		return delete("memberDAO.deleteLineReview",vo);
	}

	public List<?> selectScrapRlist(ScrapVO scrap2) {
		return list("memberDAO.selectScrapRlist",scrap2);
	}

	public int selectScrapRlistTotal(ScrapVO scrap2) {
		return (int)select("memberDAO.selectScrapRlistTotal",scrap2);
	}

	public int deleteScrap(ScrapVO scrap) {
		return (int)delete("memberDAO.deleteScrap",scrap);
	}

	public List<?> selectHotelList(HotelorderVO hotel) {
		return list("memberDAO.selectHotelList",hotel);
	}

	public int selectHotelListTotal(HotelorderVO hotel) {
		return (int)select("memberDAO.selectHotelListTotal",hotel);
	}

	public List<?> selectTourElist(LineReviewVO lineReview3) {
		return list("memberDAO.selectTourElist",lineReview3);
	}

	public int selectTlistTotal(LineReviewVO lineReview3) {
		return (int)select("memberDAO.selectTlistTotal",lineReview3);
	}

	public List<?> selectScrapTlist(ScrapVO scrap3) {
		return list("memberDAO.selectScrapTlist",scrap3);
	}

	public int selectScrapTlistTotal(ScrapVO scrap3) {
		return (int)select("memberDAO.selectScrapTlistTotal",scrap3);
	}

	public List<?> selectMemberlist() {
		// TODO Auto-generated method stub
		return list("memberDAO.selectMemberlist");
	}

	public String insertDelMember(MemberVO vo) {
		// TODO Auto-generated method stub
		return (String) insert("memberDAO.insertDelMember",vo);
	}

	public MemberVO selectforadmin(MemberVO vo) {
		// TODO Auto-generated method stub
		return (MemberVO) select("memberDAO.selectforadmin",vo);
	}

}