package edu.study.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.study.dao.BasketDAO;
import edu.study.vo.BasketVO;
import edu.study.vo.HomeStoryVO;


@Service
public class BasketServiceImpl implements BasketService {

	@Autowired
	private BasketDAO basketDao;

	@Override
	public List<BasketVO> listBasketFromBasket(BasketVO vo) throws Exception {
		
		List<BasketVO> list = basketDao.listBasketFromBasket(vo);
		
		return list;
	}
	
	

}
