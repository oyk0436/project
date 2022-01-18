package travel.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import travel.service.LineReviewVO;
import travel.service.RestaurantService;
import travel.service.RestaurantVO;
import travel.service.ScrapVO;
import travel.service.TourVO;
import travel.service.TravelVO;



@Service("restaurantService")
public class RestaurantImpl implements RestaurantService {
	
	@Resource(name="restaurantDAO")
	private RestaurantDAO restaurantDAO;

	@Override
	public List<?> selectRealtimeImg(RestaurantVO vo) throws Exception {
		return restaurantDAO.selectRealtimeImg(vo);
	}

	@Override
	public RestaurantVO selectRestaurantDetail(RestaurantVO vo) throws Exception {
		return restaurantDAO.selectRestaurantDetail(vo);
	}

	@Override
	public List<?> selectLineReviewList(LineReviewVO lineReview) throws Exception {
		return restaurantDAO.selectLineReviewList(lineReview);
	}

	@Override
	public String insertLineReview(LineReviewVO lineReview) throws Exception {
		return restaurantDAO.insertLineReview(lineReview);
	}

	@Override
	public int selectLineReviewTotal(LineReviewVO lineReview) throws Exception {
		return restaurantDAO.selectLineReviewTotal(lineReview);
	}

	@Override
	public int selectRestaurantGrade(LineReviewVO lineReview) throws Exception {
		return restaurantDAO.selectRestaurantGrade(lineReview);
	}

	@Override
	public List<?> selectRestaurantMap(RestaurantVO restaurantMap) throws Exception {
		return restaurantDAO.selectRestaurantMap(restaurantMap);
	}
	
	@Override
	public List<?> selectTravelMap(TravelVO travelMap) throws Exception {
		return restaurantDAO.selectTravelMap(travelMap);
	}

	@Override
	public List<?> selectTourMap(TourVO tourMap) throws Exception {
		return restaurantDAO.selectTourMap(tourMap);
	}
	
	@Override
	public List<?> selectRecommendImg(RestaurantVO vo) throws Exception {
		return restaurantDAO.selectRecommendImg(vo);
	}

	@Override
	public int updateRestaurantHits(RestaurantVO vo) throws Exception {
		return restaurantDAO.updateRestaurantHits(vo);
	}

	@Override
	public List<?> selectRecommendDetail(RestaurantVO vo) throws Exception {
		return restaurantDAO.selectRecommendDetail(vo);
	}

	@Override
	public List<?> selectTotalRestaurantList(RestaurantVO vo) throws Exception {
		return restaurantDAO.selectTotalRestaurantList(vo);
	}

	@Override
	public int selectRestaurantTotal(RestaurantVO vo) throws Exception {
		return restaurantDAO.selectRestaurantTotal(vo);
	}

	@Override
	public int selectRecommendTotal(RestaurantVO vo) throws Exception {
		return restaurantDAO.selectRecommendTotal(vo);
	}

	@Override
	public List<?> selectRealtimeDetail(RestaurantVO vo) throws Exception {
		return restaurantDAO.selectRealtimeDetail(vo);
	}

	@Override
	public int selectRealtimeTotal(RestaurantVO vo) throws Exception {
		return restaurantDAO.selectRealtimeTotal(vo);
	}

	@Override
	public int selectScrapCount(ScrapVO scrap) throws Exception {
		return restaurantDAO.selectScrapCount(scrap);
	}

	@Override
	public String insertScrap(ScrapVO scrap) throws Exception {
		return restaurantDAO.insertScrap(scrap);
	}

	@Override
	public int selectScrapDetail(ScrapVO scrap) throws Exception {
		return restaurantDAO.selectScrapDetail(scrap);
	}

	@Override
	public int updateScrap(ScrapVO scrap) throws Exception {
		return restaurantDAO.updateScrap(scrap);
	}

	
}
