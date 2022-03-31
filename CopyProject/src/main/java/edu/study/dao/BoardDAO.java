package edu.study.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.study.vo.BoardVO;
import edu.study.vo.SearchVO;

@Repository // 컴포넌트 하위에 있는 어노테이션, 외부와 연결 할 때 사용하는 어노테이션
public class BoardDAO {

	@Autowired // 타입으로 의존을 주입하는 어노테이션
	private SqlSession sqlSession;
	
	private static final String Namespace = "edu.study.mapper.boardMapper";
	
	public List<BoardVO> list(SearchVO vo) throws Exception {
		
		return sqlSession.selectList(Namespace+".listBoard",vo);
	}
	
	public BoardVO detail(int bidx) throws Exception{
		return sqlSession.selectOne(Namespace+".detailBoard",bidx);
	}
	
	public int update(BoardVO vo) throws Exception{
		return sqlSession.update(Namespace+".updateBoard",vo);
	}
	
	public int delete(int bidx) throws Exception{
		return sqlSession.delete(Namespace+".deleteBoard",bidx);
	}
	
	public int insert(BoardVO vo) throws Exception{
		return sqlSession.insert(Namespace+".insertBoard",vo);
	}
	
	
}








