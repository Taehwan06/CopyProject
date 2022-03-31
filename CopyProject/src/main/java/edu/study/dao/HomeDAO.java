package edu.study.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.study.vo.HomeSearchVO;
import edu.study.vo.HomeStoreVO;
import edu.study.vo.HomeStoryVO;

@Repository // 컴포넌트 하위에 있는 어노테이션, 외부와 연결 할 때 사용하는 어노테이션
public class HomeDAO {

	@Autowired // 타입으로 의존을 주입하는 어노테이션
	private SqlSession sqlSession;

	
	private static final String Namespace = "edu.study.mapper.homeMapper";
	
	public List<HomeStoryVO> searchStory(HomeSearchVO vo) throws Exception{
		return sqlSession.selectList(Namespace+".searchStory",vo);
	}
	
	public List<HomeStoreVO> searchStore(HomeSearchVO vo) throws Exception{
		return sqlSession.selectList(Namespace+".searchStore",vo);
	}
	
	public List<HomeSearchVO> listSearchList() throws Exception{
		return sqlSession.selectList(Namespace+".listSearchList");
	}
	
	public int insertSearchList(HomeSearchVO vo) throws Exception{
		return sqlSession.insert(Namespace+".insertSearchList",vo);
	}
	
	public int deleteSearchList() throws Exception{
		return sqlSession.update(Namespace+".deleteSearchList");
	}
	
	
	
}








