package egov.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractDAO;
import egov.service.KakaoPayApprovalVO;
import egov.service.OrderVO;
import egov.service.RestaurantVO;
import egov.service.TravelVO;

@Repository("travelDAO")
public class TravelDAO extends EgovAbstractDAO{

	public TravelVO searchSigungucode(String search)throws Exception {
		// TODO Auto-generated method stub
		return (TravelVO) select("travelDAO.searchSigungucode",search);
	}

	public TravelVO searchAreacode(String search) {
		// TODO Auto-generated method stub
		return (TravelVO) select("travelDAO.searchAreacode",search);
	}

	public int findnextorderid()throws Exception {
		// TODO Auto-generated method stub
		return (int) select("travelDAO.findnextorderid");
	}

	public int inserthotelorder(KakaoPayApprovalVO vo) {
		// TODO Auto-generated method stub
		return (int) insert("travelDAO.inserthotelorder",vo);
	}

	public List<?> selectOrderlist() {
		// TODO Auto-generated method stub
		return list("travelDAO.selectOrderlist");
	}

	public int deleteOrderlist(OrderVO vo) {
		// TODO Auto-generated method stub
		return delete("travelDAO.deleteOrderlist",vo);
	}

	public int insertXOrderlist(OrderVO vo) {
		// TODO Auto-generated method stub
		return (int) insert("travelDAO.insertXOrderlist",vo);
	}

	public OrderVO selectFindOrder(OrderVO vo) {
		// TODO Auto-generated method stub
		return (OrderVO) select("travelDAO.selectFindOrder",vo);
	}
}
