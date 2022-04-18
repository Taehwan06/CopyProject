package edu.study.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.study.vo.Community_ReplyVO;

@Repository
public class Community_ReplyDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	private static final String Namespace = "edu.study.mapper.Community_replyMapper";
	
	//댓글 조회
	public List<Community_ReplyVO> list(int cbidx, int start, int end) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("cbidx", cbidx);
		map.put("start", start);
		map.put("end", end);
		
		return sqlSession.selectList(Namespace+".replyList", map);
	}
	
	//댓글 작성
	public int insert(Community_ReplyVO vo) throws Exception {
		
		return sqlSession.insert(Namespace+".replyWrite", vo);
	}
	
	//댓글 작성시 카운트 1증가
	public int countUp(int cbidx) throws Exception {
		
		return sqlSession.update(Namespace+".countUp", cbidx);
	}
	
	//댓글 수정
	public int update(Community_ReplyVO vo) throws Exception {
		
		return sqlSession.update(Namespace+".replyModify", vo);
	}
	
	//댓글 삭제
	public int delete(int cbridx) throws Exception {
		
		return sqlSession.update(Namespace+".replyDel", cbridx);
		
	}
	
	//댓글 삭제시 카운트 1감소
	public int countDown(int cbidx) throws Exception {
		
		return sqlSession.update(Namespace+".countDown", cbidx);
	}
	
	//답글 작성
	public int Reinsert(Community_ReplyVO vo) throws Exception {
		
		return sqlSession.insert(Namespace+".Rereply", vo);
	}
	
	//답글 lvl 업데이트
	public int lvlUp(Community_ReplyVO vo) throws Exception {
		
		return sqlSession.update(Namespace+".lvlUp", vo);
	}
	
	//댓글 개수
	public int count(int cbidx) throws Exception { 
		
		return sqlSession.selectOne(Namespace + ".countReplies", cbidx); 
	}
}
