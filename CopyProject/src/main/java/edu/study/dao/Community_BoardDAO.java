package edu.study.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.study.vo.Community_BoardVO;
import edu.study.vo.SearchVO;

@Repository
public class Community_BoardDAO {

	@Autowired
	private SqlSession sqlSession;
	
	private static final String Namespace = "edu.study.mapper.Community_boardMapper";
	
	public List<Community_BoardVO> list(SearchVO vo) throws Exception {
		
		return sqlSession.selectList(Namespace+".Comm_listBoard", vo);
	}

	public Community_BoardVO detail(int cbidx) throws Exception{
	      
	    return sqlSession.selectOne(Namespace+".Comm_detailBoard",cbidx);
	}
	
	public int update(Community_BoardVO vo) throws Exception{
		
		return sqlSession.update(Namespace+".Comm_updateBoard", vo);
	}
	
	public int delete(int cbidx) throws Exception{
		
		return sqlSession.delete(Namespace+".Comm_deleteBoard", cbidx);
	}
	
	public int insert(Community_BoardVO vo) throws Exception{
		
		return sqlSession.insert(Namespace+".Comm_insertBoard", vo);
	}
	
	public int listCnt(SearchVO vo) throws Exception{
		
		return sqlSession.selectOne(Namespace+".Comm_listcnt", vo);
	}
	public Community_BoardVO Community_Mainimage() throws Exception{
		
		return sqlSession.selectOne(Namespace+".Comm_mainImg");
	}
}








