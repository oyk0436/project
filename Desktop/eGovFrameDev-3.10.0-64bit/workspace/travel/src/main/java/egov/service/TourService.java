package egov.service;

import java.util.List;

public interface TourService {
	
	// 추천 관광지 이미지 목록
	List<?> selectRecommendImg(TourVO vo) throws Exception;
	// 실시간 인기 관광지 이미지 목록
	List<?> selectRealtimeImg(TourVO vo) throws Exception;
	
	// 관광지 전체 목록
	List<?> selectTourList(TourVO vo) throws Exception;
	// 관광지 전체 목록 총 개수
	int selectTourTotal(TourVO vo) throws Exception;
	
	// 관광지 상세보기
	TourVO selectTourDetail(TourVO vo) throws Exception;
	// 상세 페이지 조회수 증가
	int updateTourHits(TourVO vo) throws Exception;
	// 관광지 한줄 리뷰 목록
	List<?> selectLineReviewList(LineReviewVO lineReview) throws Exception;
	// 관광지 한줄 리뷰 저장
	String insertLineReview(LineReviewVO vo) throws Exception;
	// 관광지 한줄 리뷰 총 개수
	int selectLineReviewTotal(LineReviewVO vo) throws Exception;
	// 관광지 평점 출력
	int selectTourGrade(LineReviewVO vo) throws Exception;
}
