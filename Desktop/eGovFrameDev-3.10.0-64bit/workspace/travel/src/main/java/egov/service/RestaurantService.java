package egov.service;

import java.util.List;

public interface RestaurantService {
	
	// 실시간 맛집 목록 이미지
	List<?> selectRealtimeImg(RestaurantVO vo) throws Exception;
	// 추천 맛집 목록 이미지
	List<?> selectRecommendImg(RestaurantVO vo) throws Exception;
	// 음식점 전체 목록
	List<?> selectTotalRestaurantList(RestaurantVO vo) throws Exception;
	// 음식점 전체 목록 총 개수
	int selectRestaurantTotal(RestaurantVO vo) throws Exception;
	
	// 맛집 한줄 리뷰 목록
	List<?> selectLineReviewList(LineReviewVO lineReview) throws Exception;
	// 맛집 한줄 리뷰 삽입
	String insertLineReview(LineReviewVO lineReview) throws Exception;
	// 맛집 한줄 리뷰 총 개수
	int selectLineReviewTotal(LineReviewVO lineReview) throws Exception;
	
	// 추천 맛집 목록 리스트
	List<?> selectRecommendDetail(RestaurantVO vo) throws Exception;
	// 추천 맛집 목록 총 개수
	int selectRecommendTotal(RestaurantVO vo) throws Exception;
	
	// 실시간 인기 맛집 목록 리스트
	List<?> selectRealtimeDetail(RestaurantVO vo) throws Exception;
	// 실시간 인기 맛집 목록 총 개수
	int selectRealtimeTotal(RestaurantVO vo) throws Exception;
	
	// 맛집 상세보기
	RestaurantVO selectRestaurantDetail(RestaurantVO vo) throws Exception;
	// 맛집 평점 출력
	int selectRestaurantGrade(LineReviewVO lineReview) throws Exception;
	// 음식점, 숙소, 관광지 지도 불러오기
	List<?> selectRestaurantMap(RestaurantVO restaurantMap) throws Exception;
	List<?> selectTravelMap(TravelVO travelMap) throws Exception;
	List<?> selectTourMap(TourVO tourMap) throws Exception;
	// 맛집 조회수 업데이트
	int updateRestaurantHits(RestaurantVO vo) throws Exception;
	
	// 스크랩 유무
	int selectScrapCount(ScrapVO scrap) throws Exception;
	// 스크랩 저장
	String insertScrap(ScrapVO scrap) throws Exception;
	// 스크랩 상태 불러오기
	int selectScrapDetail(ScrapVO scrap) throws Exception;
	// 스크랩 수정
	int updateScrap(ScrapVO scrap) throws Exception;
	
}
