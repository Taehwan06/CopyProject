package edu.study.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.study.dao.BasketDAO;
import edu.study.vo.BasketVO;
import edu.study.vo.MemberVO;


@Service
public class BasketServiceImpl implements BasketService {

	@Autowired
	private BasketDAO basketDao;

	@Override
	public List<BasketVO> listPayFromBasket(BasketVO vo) throws Exception {
		
		List<BasketVO> list = basketDao.listPayFromBasket(vo);
		
		return list;
	}

	@Override
	public List<BasketVO> listBasket(MemberVO vo) throws Exception {
		
		List<BasketVO> list = basketDao.listBasket(vo);
		
		return list;
	}
	
	

}
