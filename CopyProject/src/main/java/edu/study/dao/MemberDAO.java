package edu.study.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.study.vo.FollowVO;
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
		
	public MemberVO refreshMember(MemberVO vo) throws Exception{
		return sqlSession.selectOne(Namespace+".refreshMember",vo);
	}
	
	//회원번호로 정보 가져오기
	public MemberVO inquiryOfUserByMidx(int midx) throws Exception{
		
		return sqlSession.selectOne(Namespace+".userOne", midx);
	}
	
	//회원 리스트 가져오기
	public List<MemberVO> mlist() throws Exception {
		
		return sqlSession.selectList(Namespace+".memberList");
	}
	
	//팔로우 아닌 유저 목록 가져오기
	public List<MemberVO> notfollowlist(List<FollowVO> flist) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("flist", flist);
		return sqlSession.selectList(Namespace+".notfollowList", map);
	}
	
	public MemberVO loginNaverMember(MemberVO vo) throws Exception{
		return sqlSession.selectOne(Namespace+".loginNaverMember",vo);
	}
	
	public int insertNaverMember(MemberVO vo) throws Exception{
		return sqlSession.insert(Namespace+".insertNaverMember",vo);
	}
	
	public MemberVO phoneCheckMember(MemberVO vo) throws Exception{
		return sqlSession.selectOne(Namespace+".phoneCheckMember",vo);
	}
	
}








