package edu.study.service;

import java.util.List;

import edu.study.vo.BasketVO;
import edu.study.vo.EventVO;
import edu.study.vo.SearchVO;
import edu.study.vo.StorePagingVO;
import edu.study.vo.StoreVO;
import edu.study.vo.Store_qnaVO;
import edu.study.vo.Store_reviewVO;

public interface StoreService {

	List<StoreVO> list(SearchVO vo) throws Exception;
	StoreVO detail(int spidx) throws Exception;
	int update(StoreVO vo) throws Exception;
	int delete(int spidx) throws Exception;
	int insert(StoreVO vo) throws Exception;
	int basketIn(BasketVO vo) throws Exception;
	List<Store_qnaVO> qnaList(int spidx, int start, int end) throws Exception;
	int qna_cnt(int spidx) throws Exception;
	int qnaIn(Store_qnaVO vo) throws Exception;
	Store_qnaVO qna_detail(int sqidx) throws Exception;
	int qna_reply(Store_qnaVO vo) throws Exception;
	int qna_a_del(int sqidx) throws Exception;
	int qna_q_del(int sqidx) throws Exception;
	int qna_modify(Store_qnaVO vo) throws Exception;
	int store_review_insert(Store_reviewVO vo) throws Exception;
	
	List<Store_reviewVO> store_reviewList(int spidx) throws Exception;
	Store_reviewVO store_review_Detail(int sridx) throws Exception;
	StoreVO store_review_cnt(int spidx) throws Exception;
	int store_review_change(StoreVO vo) throws Exception;
	int store_review_del(int sridx) throws Exception;
	int store_review_modify(Store_reviewVO vo) throws Exception;
	int review_count(int spidx) throws Exception;
	List<Store_reviewVO> reviewList(int spidx, int start, int end) throws Exception;
	int islikey(int midx,int spidx) throws Exception;
	int likeIN(int midx,int spidx) throws Exception;
	int likeDEL(int midx,int spidx) throws Exception;
	List<StoreVO> likelist(int midx) throws Exception;
	List<EventVO> eventlist() throws Exception;
	EventVO event_detail(int eidx) throws Exception;
}
