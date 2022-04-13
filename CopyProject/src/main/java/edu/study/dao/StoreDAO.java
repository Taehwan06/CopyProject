package edu.study.dao;


import java.util.List;

import org.apache.ibatis.session.Configuration;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.study.vo.StoreVO;
import edu.study.vo.SearchVO;
import edu.study.vo.BasketVO;
import edu.study.vo.Store_qnaVO;

@Repository // 컴포넌트 하위에 있는 어노테이션, 외부와 연결 할 때 사용하는 어노테이션
public class StoreDAO {

	@Autowired // 타입으로 의존을 주입하는 어노테이션
	private SqlSession sqlSession;
	
	private static final String Namespace = "edu.study.mapper.storeMapper";
	
	public List<StoreVO> list(SearchVO vo) throws Exception {
		Configuration conf=sqlSession.getConfiguration();
		return sqlSession.selectList(Namespace+".listStore",vo);
	}
	
	public StoreVO detail(int spidx) throws Exception{
		return sqlSession.selectOne(Namespace+".detailStore",spidx);
	}
	
	public int update(StoreVO vo) throws Exception{
		return sqlSession.update(Namespace+".updateStore",vo);
	}
	
	public int delete(int spidx) throws Exception{
		return sqlSession.delete(Namespace+".deleteStore",spidx);
	}
	
	public int insert(StoreVO vo) throws Exception{
		return sqlSession.insert(Namespace+".insertStore",vo);
	}
	
	public int basketIn(BasketVO vo) throws Exception{
		return sqlSession.insert(Namespace+".basketIn",vo);
	}
	
	public List<Store_qnaVO> qnaList(int spidx) throws Exception {
		return sqlSession.selectList(Namespace+".listqna",spidx);
	}
	
	public int qnaIn(Store_qnaVO vo) throws Exception {
		return sqlSession.insert(Namespace+".insertqna",vo);
	}
	
	public int qna_cnt(int spidx) throws Exception {
		return sqlSession.selectOne(Namespace+".qna_cnt",spidx);
	}
	public int qna_reply(Store_qnaVO vo) throws Exception {
		return sqlSession.update(Namespace+".qna_reply",vo);
	}
	public int qna_a_del(int sqidx) throws Exception {
		return sqlSession.update(Namespace+".qna_a_del",sqidx);
	}
	public int qna_q_del(int sqidx) throws Exception {
		return sqlSession.update(Namespace+".qna_q_del",sqidx);
	}
	public Store_qnaVO qna_detail(int sqidx) throws Exception {
		return sqlSession.selectOne(Namespace+".qna_detail",sqidx);
	}
	public int qna_modify(Store_qnaVO vo) throws Exception {
		return sqlSession.update(Namespace+".qna_modify",vo);
	}
	
	
}








