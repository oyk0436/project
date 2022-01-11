package egov.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egov.service.LineReviewVO;
import egov.service.RestaurantVO;
import egov.service.ScrapVO;
import egov.service.TourVO;
import egov.service.TravelVO;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

@Repository("restaurantDAO")
public class RestaurantDAO extends EgovAbstractDAO {

	public List<?> selectRealtimeImg(RestaurantVO vo) {
		return list("restaurantDAO.selectRealtimeImg",vo);
	}

	public RestaurantVO selectRestaurantDetail(RestaurantVO vo) {
		return (RestaurantVO) select("restaurantDAO.selectRestaurantDetail",vo);
	}

	public List<?> selectLineReviewList(LineReviewVO lineReview) {
		return list("restaurantDAO.selectLineReviewList",lineReview);
	}

	public String insertLineReview(LineReviewVO lineReview) {
		System.out.println("====== restaurantDAO ======");
		return (String)insert("restaurantDAO.insertLineReview",lineReview);
	}

	public int selectLineReviewTotal(LineReviewVO lineReview) {
		return (int)select("restaurantDAO.selectLineReviewTotal",lineReview);
	}

	public int selectRestaurantGrade(LineReviewVO lineReview) {
		return (int)select("restaurantDAO.selectRestaurantGrade",lineReview);
	}

	public List<?> selectRestaurantMap(RestaurantVO restaurantMap) {
		return list("restaurantDAO.selectRestaurantMap",restaurantMap);
	}
	
	public List<?> selectTravelMap(TravelVO travelMap) {
		return list("restaurantDAO.selectTravelMap",travelMap);
	}

	public List<?> selectTourMap(TourVO tourMap) {
		return list("restaurantDAO.selectTourMap",tourMap);
	}
	
	public List<?> selectRecommendImg(RestaurantVO vo) {
		return list("restaurantDAO.selectRecommendImg",vo);
	}

	public int updateRestaurantHits(RestaurantVO vo) {
		return update("restaurantDAO.updateRestaurantHits",vo);
	}

	public List<?> selectRecommendDetail(RestaurantVO vo) {
		return list("restaurantDAO.selectRecommendDetail",vo);
	}

	public List<?> selectTotalRestaurantList(RestaurantVO vo) {
		return list("restaurantDAO.selectTotalRestaurantList",vo);
	}

	public int selectRestaurantTotal(RestaurantVO vo) {
		return (int)select("restaurantDAO.selectRestaurantTotal",vo);
	}

	public int selectRecommendTotal(RestaurantVO vo) {
		return (int)select("restaurantDAO.selectRecommendTotal",vo);
	}

	public List<?> selectRealtimeDetail(RestaurantVO vo) {
		return list("restaurantDAO.selectRealtimeDetail",vo);
	}

	public int selectRealtimeTotal(RestaurantVO vo) {
		return (int)select("restaurantDAO.selectRealtimeTotal",vo);
	}

	public int selectScrapCount(ScrapVO scrap) {
		return (int)select("restaurantDAO.selectScrapCount",scrap);
	}

	public String insertScrap(ScrapVO scrap) {
		return (String)insert("restaurantDAO.insertScrap",scrap);
	}

	public int selectScrapDetail(ScrapVO scrap) {
		return (int)select("restaurantDAO.selectScrapDetail",scrap);
	}

	public int updateScrap(ScrapVO scrap) {
		return (int)update("restaurantDAO.updateScrap",scrap);
	}

}
