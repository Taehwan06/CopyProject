package edu.study.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.study.vo.Community_ReplyVO;
import edu.study.vo.PagingVO;

@Repository
public class Community_ReplyDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	private static final String Namespace = "edu.study.mapper.Community_replyMapper";
	
	//댓글 조회
	public List<Community_ReplyVO> list(int cbidx) throws Exception {
		
		return sqlSession.selectList(Namespace+".replyList", cbidx);
	}
	
	//댓글 작성
	public int insert(Community_ReplyVO vo) throws Exception {
		
		return sqlSession.insert(Namespace+".replyWrite", vo);
	}
	
	//댓글 수정
	public int update(Community_ReplyVO vo) throws Exception {
		
		return sqlSession.update(Namespace+".replyModify", vo);
	}
	
	//댓글 삭제
	public int delete(int cbridx) throws Exception {
		
		return sqlSession.update(Namespace+".replyDel", cbridx);
	}
	
	//답글 작성
	public int Reinsert(Community_ReplyVO vo) throws Exception {
		
		return sqlSession.insert(Namespace+".Rereply", vo);
	}
	
	//답글 lvl 업데이트
	public int lvlUp(Community_ReplyVO vo) throws Exception {
		
		return sqlSession.update(Namespace+".lvlUp", vo);
	}
	
	//댓글 페이징
	public List<Community_ReplyVO> listPaging(int cbidx, PagingVO  vo) throws Exception {
		
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("cbidx", cbidx);
		paramMap.put("vo", vo);
		
		return sqlSession.selectList(Namespace+ ".listPaging", paramMap);
	}
	
	//댓글 개수
	public int countReplies(int cbidx) throws Exception { 
		
		return sqlSession.selectOne(Namespace + ".countReplies", cbidx); 
	}
	
	//선택 댓글 조회
	public Community_ReplyVO selectReply(int cbridx) throws Exception {
		
		return sqlSession.selectOne(Namespace+ ".selectReply", cbridx);
	}

}
