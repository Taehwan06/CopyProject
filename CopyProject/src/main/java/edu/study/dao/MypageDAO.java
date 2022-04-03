package edu.study.dao;

import java.util.List;




import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.study.vo.MemberVO;
import edu.study.vo.SearchVO;
import edu.study.vo.OrderListVO;

@Repository //
public class MypageDAO {

	@Autowired // 
	private SqlSession sqlSession;
	
	private static final String Namespace = "edu.study.mapper.mypageMapper";
	
	
	
	 public List<MemberVO> list(SearchVO vo) throws Exception{ 
		 return sqlSession.selectList(Namespace+".listMember",vo); 
	 }
	 
	
	public MemberVO detail(int midx) throws Exception{
		return sqlSession.selectOne(Namespace+".detailMember",midx);
	}
	
	public int update(MemberVO vo) throws Exception{
		return sqlSession.update(Namespace+".modifyMember",vo);
		
	}
	
	
	public int insert(MemberVO vo) throws Exception{
		return sqlSession.insert(Namespace+".insertMember",vo);
	}
	
	
	public int delete(MemberVO vo) throws Exception{
		return sqlSession.update(Namespace+".deleteMember",vo);
	}

	public List<OrderListVO> orderList(OrderListVO vo) throws Exception{
		return sqlSession.selectList(Namespace+".orderList",vo);
	} 
	
	public List<OrderListVO> orderList2(MemberVO vo) throws Exception{
		return sqlSession.selectList(Namespace+".orderList",vo);
	} 
	 
	
	public int count(OrderListVO vo) throws Exception{ 
		return sqlSession.selectOne(Namespace+".comcount",vo);
	}

	
}








