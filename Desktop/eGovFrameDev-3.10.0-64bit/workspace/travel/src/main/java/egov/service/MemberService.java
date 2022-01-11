package egov.service;

import java.util.List;

public interface MemberService {
	
	// 회원 등록
	String insertMember(MemberVO vo) throws Exception;	
	// 중복아이디 체크
	int selectMemberIdcheck(String userid) throws Exception;	
	// 아이디, 패스어드 확인
	MemberVO selectMemberCertify(MemberVO vo) throws Exception;	
	// 회원 정보
	MemberVO selectMemberInfo(MemberVO vo) throws Exception;	
	// 회원 개인정보 수정
	int updateMemberInfo(MemberVO vo) throws Exception;	
	// 비밀번호 확인
	int selectPassCheck(MemberVO vo) throws Exception;
	// 비밀번호 수정
	int updateMemberPass(MemberVO vo) throws Exception;	
	// 회원 탈퇴
	int deleteMember(MemberVO vo) throws Exception;
	
	// 숙박 이용 후기 리스트
	List<?> selectRestaurantElist(LineReviewVO lineReview2) throws Exception;
	// 숙박 이용 후기 총 개수
	int selectRlistTotal(LineReviewVO lineReview2) throws Exception;
	// 이용 후기 수정 목록
	LineReviewVO selectLineReviewDetail(LineReviewVO vo) throws Exception;
	// 이용 후기 수정
	int updateLineReviewSave(LineReviewVO vo) throws Exception;
	// 이용 후기 삭제
	int deleteLineReview(LineReviewVO vo) throws Exception;
	
	// 숙박 관심 목록 리스트
	List<?> selectScrapRlist(ScrapVO scrap2) throws Exception;
	// 숙박 관심 목록 총 개수
	int selectScrapRlistTotal(ScrapVO scrap2) throws Exception;
	// 관심 삭제
	int deleteScrap(ScrapVO scrap) throws Exception;
	// 호텔 예약 현황
	List<?> selectHotelList(HotelorderVO hotel) throws Exception;
	// 호텔 예약 목록 총 개수
	int selectHotelListTotal(HotelorderVO hotel) throws Exception;
	
}
