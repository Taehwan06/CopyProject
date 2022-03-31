package edu.study.service;

import java.util.List;




import edu.study.vo.MemberVO;
import edu.study.vo.SearchVO;
import edu.study.vo.OrderListVO;

public interface MypageService {

	List<MemberVO> list(SearchVO vo) throws Exception;
	MemberVO detail(int midx) throws Exception;
	List<OrderListVO> orderList(OrderListVO vo) throws Exception;
	int update(MemberVO vo) throws Exception;
	int delete(MemberVO vo) throws Exception;
	int insert(MemberVO vo) throws Exception;
	
}
