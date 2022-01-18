package travel.service;

import java.util.List;

public interface TravelService {
	TravelVO searchSigungucode(String search)throws Exception;
	TravelVO searchAreacode(String search)throws Exception;
	int findnextorderid()throws Exception;
	int inserthotelorder(KakaoPayApprovalVO vo)throws Exception;
	List<?> selectOrderlist()throws Exception;
	int deleteOrderlist(OrderVO vo)throws Exception;
	int insertXOrderlist(OrderVO vo)throws Exception;
	OrderVO selectFindOrder(OrderVO vo)throws Exception;
}
