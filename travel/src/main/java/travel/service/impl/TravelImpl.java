package travel.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import travel.service.KakaoPayApprovalVO;
import travel.service.OrderVO;
import travel.service.RestaurantVO;
import travel.service.TravelService;
import travel.service.TravelVO;

@Service("travelService")
public class TravelImpl implements TravelService{
	
	@Resource(name="travelDAO")
	TravelDAO travelDAO;

	@Override
	public TravelVO searchSigungucode(String search) throws Exception {
		// TODO Auto-generated method stub
		return travelDAO.searchSigungucode(search);
	}

	@Override
	public TravelVO searchAreacode(String search) throws Exception {
		// TODO Auto-generated method stub
		return travelDAO.searchAreacode(search);
	}

	@Override
	public int findnextorderid() throws Exception {
		// TODO Auto-generated method stub
		return travelDAO.findnextorderid();
	}

	@Override
	public int inserthotelorder(KakaoPayApprovalVO vo) throws Exception {
		// TODO Auto-generated method stub
		return travelDAO.inserthotelorder(vo);
	}

	@Override
	public List<?> selectOrderlist() throws Exception {
		// TODO Auto-generated method stub
		return travelDAO.selectOrderlist();
	}

	@Override
	public int deleteOrderlist(OrderVO vo) throws Exception {
		// TODO Auto-generated method stub
		return travelDAO.deleteOrderlist(vo);
	}
	
	@Override
	public int insertXOrderlist(OrderVO vo) throws Exception {
		// TODO Auto-generated method stub
		return travelDAO.insertXOrderlist(vo);
	}

	@Override
	public OrderVO selectFindOrder(OrderVO vo) throws Exception {
		// TODO Auto-generated method stub
		return travelDAO.selectFindOrder(vo);
	}
}
