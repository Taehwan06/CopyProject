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
	public List<Store_qnaVO> qnaList(int spidx) throws Exception {
		// TODO Auto-generated method stub
		return StoreDao.qnaList(spidx);
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

	
	

}
