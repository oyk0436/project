package egov.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egov.service.LineReviewVO;
import egov.service.TourVO;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

@Repository("tourDAO")
public class TourDAO extends EgovAbstractDAO {

	public List<?> selectRecommendImg(TourVO vo) {
		return list("tourDAO.selectRecommendImg",vo);
	}

	public List<?> selectTourList(TourVO vo) {
		return list("tourDAO.selectTourList",vo);
	}

	public int selectTourTotal(TourVO vo) {
		return (int)select("tourDAO.selectTourTotal",vo);
	}

	public List<?> selectRealtimeImg(TourVO vo) {
		return list("tourDAO.selectRealtimeImg",vo);
	}

	public TourVO selectTourDetail(TourVO vo) {
		return (TourVO)select("tourDAO.selectTourDetail",vo);
	}

	public int updateTourHits(TourVO vo) {
		return (int)update("tourDAO.updateTourHits",vo);
	}

	public List<?> selectLineReviewList(LineReviewVO lineReview) {
		return list("tourDAO.selectLineReviewList",lineReview);
	}

	public String insertLineReview(LineReviewVO lineReview) {
		return (String)insert("tourDAO.insertLineReview",lineReview);
	}

	public int selectLineReviewTotal(LineReviewVO lineReview) {
		return (int)select("tourDAO.selectLineReviewTotal",lineReview);
	}

	public int selectTourGrade(LineReviewVO lineReview) {
		return (int)select("tourDAO.selectTourGrade",lineReview);
	}

}
