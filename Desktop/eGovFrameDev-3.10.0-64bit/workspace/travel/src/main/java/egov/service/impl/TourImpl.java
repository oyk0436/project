package egov.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egov.service.LineReviewVO;
import egov.service.TourService;
import egov.service.TourVO;

@Service("tourService")
public class TourImpl implements TourService {

	@Resource(name="tourDAO")
	private TourDAO tourDAO;

	@Override
	public List<?> selectRecommendImg(TourVO vo) throws Exception {
		return tourDAO.selectRecommendImg(vo);
	}

	@Override
	public List<?> selectTourList(TourVO vo) throws Exception {
		return tourDAO.selectTourList(vo);
	}

	@Override
	public int selectTourTotal(TourVO vo) throws Exception {
		return tourDAO.selectTourTotal(vo);
	}

	@Override
	public List<?> selectRealtimeImg(TourVO vo) throws Exception {
		return tourDAO.selectRealtimeImg(vo);
	}

	@Override
	public TourVO selectTourDetail(TourVO vo) throws Exception {
		return tourDAO.selectTourDetail(vo);
	}

	@Override
	public int updateTourHits(TourVO vo) throws Exception {
		return tourDAO.updateTourHits(vo);
	}

	@Override
	public List<?> selectLineReviewList(LineReviewVO lineReview) throws Exception {
		return tourDAO.selectLineReviewList(lineReview);
	}

	@Override
	public String insertLineReview(LineReviewVO lineReview) throws Exception {
		return tourDAO.insertLineReview(lineReview);
	}

	@Override
	public int selectLineReviewTotal(LineReviewVO lineReview) throws Exception {
		return tourDAO.selectLineReviewTotal(lineReview);
	}

	@Override
	public int selectTourGrade(LineReviewVO lineReview) throws Exception {
		return tourDAO.selectTourGrade(lineReview);
	}
}
