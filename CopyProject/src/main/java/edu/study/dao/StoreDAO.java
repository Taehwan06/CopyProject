package edu.study.dao;

import java.util.List;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.study.vo.StoreVO;
import edu.study.vo.SearchVO;
import edu.study.vo.BasketVO;

@Repository // 컴포넌트 하위에 있는 어노테이션, 외부와 연결 할 때 사용하는 어노테이션
public class StoreDAO {

	@Autowired // 타입으로 의존을 주입하는 어노테이션
	private SqlSession sqlSession;
	
	private static final String Namespace = "edu.study.mapper.storeMapper";
	
	public List<StoreVO> list(SearchVO vo) throws Exception {
		
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
	
	public int basketIn(StoreVO vo) throws Exception{
		return sqlSession.insert(Namespace+".basketIn",vo);
	}
	
	
}








