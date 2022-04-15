package edu.study.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.study.vo.ManagementMemberVO;
import edu.study.vo.MemberPagingVO;
import edu.study.vo.MemberVO;
import edu.study.vo.StatsVO;

@Repository // 컴포넌트 하위에 있는 어노테이션, 외부와 연결 할 때 사용하는 어노테이션
public class ManagementDAO {

	@Autowired // 타입으로 의존을 주입하는 어노테이션
	private SqlSession sqlSession;

	
	private static final String Namespace = "edu.study.mapper.managementMapper";
	
	public List<MemberVO> allMemberList() throws Exception{
		return sqlSession.selectList(Namespace+".allMemberList");
	}
	
	public int countMember(MemberPagingVO vo) throws Exception{
		return sqlSession.selectOne(Namespace+".countMember", vo);
	}
	
	public List<MemberVO> selectPagingMember(MemberPagingVO vo) throws Exception{
		return sqlSession.selectList(Namespace+".selectPagingMember", vo);
	}
	
	public ManagementMemberVO selectOneMember(MemberPagingVO vo) throws Exception{
		return sqlSession.selectOne(Namespace+".selectOneMember", vo);
	}
	
	public int withdrawMember(MemberPagingVO vo) throws Exception{
		return sqlSession.update(Namespace+".withdrawMember", vo);
	}
	
	public int restoreMember(MemberPagingVO vo) throws Exception{
		return sqlSession.update(Namespace+".restoreMember", vo);
	}
	
	public int modifyMember(ManagementMemberVO vo) throws Exception{
		return sqlSession.update(Namespace+".modifyMember", vo);
	}
	
	public int imgDelMember(ManagementMemberVO vo) throws Exception{
		return sqlSession.update(Namespace+".imgDelMember", vo);
	}
	
	public List<StatsVO> statsMember(MemberPagingVO vo) throws Exception{
		return sqlSession.selectList(Namespace+".statsMember", vo);
	}
	
	public int countStats(MemberPagingVO vo) throws Exception{
		return sqlSession.selectOne(Namespace+".countStats", vo);
	}
	
	public List<StatsVO> selectPagingStats(MemberPagingVO vo) throws Exception{
		return sqlSession.selectList(Namespace+".selectPagingStats", vo);
	}
	
	public List<StatsVO> orderList(MemberPagingVO vo) throws Exception{
		return sqlSession.selectList(Namespace+".orderList", vo);
	}
	
}







