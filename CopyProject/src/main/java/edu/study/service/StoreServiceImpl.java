package edu.study.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.study.dao.StoreDAO;
import edu.study.vo.StoreVO;
import edu.study.vo.Store_qnaVO;
import edu.study.vo.Store_reviewVO;
import edu.study.vo.BasketVO;
import edu.study.vo.SearchVO;
import edu.study.vo.StorePagingVO;


@Service
public class StoreServiceImpl implements StoreService {

	@Autowired
	private StoreDAO StoreDao;
	
	@Override
	public List<StoreVO> list(SearchVO vo) throws Exception {
		
		List<StoreVO> list = StoreDao.list(vo);
		
		return list;
	}

	@Override
	public StoreVO detail(int spidx) throws Exception {
		
		return StoreDao.detail(spidx);
	}

	@Override
	public int update(StoreVO vo) throws Exception {
		return StoreDao.update(vo);
	}

	@Override
	public int delete(int spidx) throws Exception {
		return StoreDao.delete(spidx);
	}

	@Override
	public int insert(StoreVO vo) throws Exception {
		return StoreDao.insert(vo);
	}

	@Override
	public int basketIn(BasketVO vo) throws Exception {
		// TODO Auto-generated method stub
		return StoreDao.basketIn(vo);
	}

	@Override
	public List<Store_qnaVO> qnaList(int spidx, int start, int end) throws Exception {
		// TODO Auto-generated method stub
		return StoreDao.qnaList(spidx, start, end);
	}

	@Override
	public int qnaIn(Store_qnaVO vo) throws Exception {
		// TODO Auto-generated method stub
		return StoreDao.qnaIn(vo);
	}

	@Override
	public int qna_cnt(int spidx) throws Exception {
		// TODO Auto-generated method stub
		return StoreDao.qna_cnt(spidx);
	}

	@Override
	public int qna_reply(Store_qnaVO vo) throws Exception {
		// TODO Auto-generated method stub
		return StoreDao.qna_reply(vo);
	}

	@Override
	public int qna_a_del(int sqidx) throws Exception {
		// TODO Auto-generated method stub
		return StoreDao.qna_a_del(sqidx);
	}
	@Override
	public int qna_q_del(int sqidx) throws Exception {
		// TODO Auto-generated method stub
		return StoreDao.qna_q_del(sqidx);
	}

	@Override
	public Store_qnaVO qna_detail(int sqidx) throws Exception {
		// TODO Auto-generated method stub
		return StoreDao.qna_detail(sqidx);
	}

	@Override
	public int qna_modify(Store_qnaVO vo) throws Exception {
		// TODO Auto-generated method stub
		return StoreDao.qna_modify(vo);
	}

	@Override
	public int store_review_insert(Store_reviewVO vo) throws Exception {
		// TODO Auto-generated method stub
		return StoreDao.store_review_insert(vo);
	}

	@Override
	public StoreVO store_review_cnt(int spidx) throws Exception {
		// TODO Auto-generated method stub
		return StoreDao.store_review_cnt(spidx);
	}

	@Override
	public int store_review_change(StoreVO vo) throws Exception {
		// TODO Auto-generated method stub
		return StoreDao.store_review_change(vo);
	}

	@Override
	public List<Store_reviewVO> store_reviewList(int spidx) throws Exception {
		// TODO Auto-generated method stub
		return StoreDao.store_reviewList(spidx);
	}

	@Override
	public int store_review_del(int sridx) throws Exception {
		// TODO Auto-generated method stub
		return StoreDao.store_review_del(sridx);
	}

	@Override
	public Store_reviewVO store_review_Detail(int sridx) throws Exception {
		// TODO Auto-generated method stub
		return StoreDao.store_review_Detail(sridx);
	}

	@Override
	public int store_review_modify(Store_reviewVO vo) throws Exception {
		// TODO Auto-generated method stub
		return StoreDao.store_review_modify(vo);
	}

	@Override
	public int review_count(int spidx) throws Exception {
		// TODO Auto-generated method stub
		return StoreDao.review_count(spidx);
	}

	@Override
	public List<Store_reviewVO> reviewList(int spidx, int start, int end) throws Exception {
		// TODO Auto-generated method stub
		return StoreDao.reviewList(spidx, start, end);
	}

	@Override
	public int islikey(int midx, int spidx) throws Exception {
		// TODO Auto-generated method stub
		return StoreDao.islikey(midx, spidx);
	}

	@Override
	public int likeIN(int midx, int spidx) throws Exception {
		// TODO Auto-generated method stub
		return StoreDao.likeIN(midx, spidx);
	}

	@Override
	public int likeDEL(int midx, int spidx) throws Exception {
		// TODO Auto-generated method stub
		return StoreDao.likeDEL(midx, spidx);
	}

	@Override
	public List<StoreVO> likelist(int midx) throws Exception {
		// TODO Auto-generated method stub
		return StoreDao.likelist(midx);
	}

	
	

}
