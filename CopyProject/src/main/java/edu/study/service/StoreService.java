package edu.study.service;

import java.util.List;

import edu.study.vo.StoreVO;
import edu.study.vo.SearchVO;
import edu.study.vo.BasketVO;
import edu.study.vo.Store_qnaVO;
import edu.study.vo.Store_reviewVO;

public interface StoreService {

	List<StoreVO> list(SearchVO vo) throws Exception;
	StoreVO detail(int spidx) throws Exception;
	int update(StoreVO vo) throws Exception;
	int delete(int spidx) throws Exception;
	int insert(StoreVO vo) throws Exception;
	int basketIn(BasketVO vo) throws Exception;
	List<Store_qnaVO> qnaList(int spidx) throws Exception;
	int qna_cnt(int spidx) throws Exception;
	int qnaIn(Store_qnaVO vo) throws Exception;
	Store_qnaVO qna_detail(int sqidx) throws Exception;
	int qna_reply(Store_qnaVO vo) throws Exception;
	int qna_a_del(int sqidx) throws Exception;
	int qna_q_del(int sqidx) throws Exception;
	int qna_modify(Store_qnaVO vo) throws Exception;
	int store_review_insert(Store_reviewVO vo) throws Exception;
	
}
