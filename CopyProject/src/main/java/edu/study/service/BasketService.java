package edu.study.service;

import java.util.List;

import edu.study.vo.BasketVO;
import edu.study.vo.MemberVO;
import edu.study.vo.PayInfoVO;

public interface BasketService {

	List<BasketVO> listPayFromBasket(BasketVO vo) throws Exception;
	List<BasketVO> listBasket(MemberVO vo) throws Exception;
	int deleteOneBasket(BasketVO vo) throws Exception;
	int plusCntBasket(BasketVO vo) throws Exception;
	int minusCntBasket(BasketVO vo) throws Exception;
	List<BasketVO> CheckedListBasket(BasketVO vo) throws Exception;
	int deleteListBasket(BasketVO vo) throws Exception;
	int insertOrderList(BasketVO vo) throws Exception;
	BasketVO directPayFromProduct(BasketVO vo) throws Exception;
	int insertPaymentInfo(PayInfoVO vo) throws Exception;
	PayInfoVO payConfirm(PayInfoVO vo) throws Exception;
}
