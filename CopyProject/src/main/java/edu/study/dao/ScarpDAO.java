package edu.study.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.study.vo.ScrapVO;

@Repository
public class ScarpDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	private static final String Namespace = "edu.study.mapper.ScrapMapper";
	
	//스크랩 하기
	public int scrapOn(ScrapVO svo) throws Exception {
		
		return sqlSession.insert(Namespace+".scrapOn", svo);
	}
	
	//스크랩 취소
	public int scrapOff(ScrapVO svo) throws Exception {
		
		return sqlSession.delete(Namespace+".scrapOff", svo);
	}
	
	//스크랩 1증가
	public int scrapUp(int cbidx) throws Exception {
		
		return sqlSession.update(Namespace+".scrapUp", cbidx);
	}
	
	//스크랩 1감소
	public int scrapDown(int cbidx) throws Exception {
		
		return sqlSession.update(Namespace+".scrapDown", cbidx);
	}
	
	//스크랩 리스트
	public List<ScrapVO> selectActiveUserList(int midx) throws Exception {
		
		return sqlSession.selectList(Namespace+".scrapList", midx);
	}
}
