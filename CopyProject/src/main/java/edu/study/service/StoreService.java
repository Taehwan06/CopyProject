package edu.study.service;

import java.util.List;


import edu.study.vo.StoreVO;
import edu.study.vo.SearchVO;
import edu.study.vo.BasketVO;

public interface StoreService {

	List<StoreVO> list(SearchVO vo) throws Exception;
	StoreVO detail(int spidx) throws Exception;
	int update(StoreVO vo) throws Exception;
	int delete(int spidx) throws Exception;
	int insert(StoreVO vo) throws Exception;
	int basketIn(StoreVO vo) throws Exception;
	
}
