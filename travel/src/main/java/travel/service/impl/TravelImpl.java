package travel.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import travel.service.TravelService;

@Service("travelService")
public class TravelImpl implements TravelService{
	
	@Resource(name="travelDAO")
	public TravelDAO travelDAO;
}
