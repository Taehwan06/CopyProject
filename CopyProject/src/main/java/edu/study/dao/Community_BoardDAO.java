package edu.study.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.study.vo.Community_BoardVO;

@Repository
public class Community_BoardDAO {

	@Autowired
	private SqlSession sqlSession;
	
	private static final String Namespace = "edu.study.mapper.Community_boardMapper";
	
	//글 목록 조회
	public List<Community_BoardVO> list() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(Namespace+".Comm_listBoard");
	}
	
	//글 상세 조회
	public Community_BoardVO detail(int cbidx) throws Exception{
	      
	    return sqlSession.selectOne(Namespace+".Comm_detailBoard",cbidx);
	}
	
	//글 수정
	public int update(Community_BoardVO vo) throws Exception{
		
		return sqlSession.update(Namespace+".Comm_updateBoard", vo);
	}
	
	//글 삭제
	public int delete(int cbidx) throws Exception{
		
		return sqlSession.update(Namespace+".Comm_deleteBoard", cbidx);
	}
	
	//글 등록
	public int insert(Community_BoardVO vo) throws Exception{
		
		return sqlSession.insert(Namespace+".Comm_insertBoard", vo);
	}
	
	//글 총 개수
	public int listCnt() throws Exception{
		
		return sqlSession.selectOne(Namespace+".Comm_listcnt");
	}
	
	//커버 이미지
	public Community_BoardVO Community_Mainimage() throws Exception{
		
		return sqlSession.selectOne(Namespace+".Comm_mainImg");
	}
	
	//origincbridx 가져오기
	public Integer cbridx() throws Exception {
		
		return sqlSession.selectOne(Namespace+".cbridx");
	}
	
	//작성 시간 가져오기
	public String writeDate(int cbidx) {
		
		return sqlSession.selectOne(Namespace+".writeday", cbidx);
	}
	
	public Community_BoardVO originReply() {
	
		return sqlSession.selectOne(Namespace+".replyOrigin");
	}
}








