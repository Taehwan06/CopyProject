package edu.study.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.study.vo.MemberVO;

@Repository // 컴포넌트 하위에 있는 어노테이션, 외부와 연결 할 때 사용하는 어노테이션
public class MemberDAO {

	@Autowired // 타입으로 의존을 주입하는 어노테이션
	private SqlSession sqlSession;

	
	private static final String Namespace = "edu.study.mapper.memberMapper";
	
	public int insert(MemberVO vo) throws Exception{
		return sqlSession.insert(Namespace+".insertMember",vo);
	}
	
	public MemberVO login(MemberVO vo) throws Exception{
		return sqlSession.selectOne(Namespace+".loginMember",vo);
	}
	
	public MemberVO findId(MemberVO vo) throws Exception{
		return sqlSession.selectOne(Namespace+".findIdMember",vo);
	}
	
	public MemberVO findPwd(MemberVO vo) throws Exception{
		return sqlSession.selectOne(Namespace+".findPwdMember",vo);
	}
	
	public int updateTempPwd(MemberVO vo) throws Exception{
		return sqlSession.update(Namespace+".updateTempPwd",vo);
	}
	
	public int insertTempNum(MemberVO vo) throws Exception{
		return sqlSession.update(Namespace+".insertTempNum",vo);
	}
	
	public int deleteTempNum(String id) throws Exception{
		return sqlSession.update(Namespace+".deleteTempNum",id);
	}
	
	public MemberVO idCheckMember(String id) throws Exception{
		return sqlSession.selectOne(Namespace+".idCheckMember",id);
	}
	
	public MemberVO tempNumCheck(MemberVO vo) throws Exception{
		return sqlSession.selectOne(Namespace+".tempNumCheck",vo);
	}
		
}








