package edu.study.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.study.dao.Community_ReplyDAO;
import edu.study.vo.Community_ReplyVO;
import edu.study.vo.PagingVO;

@Service
public class Community_ReplyServiceImpl implements Community_ReplyService {
	
	@Autowired
	private Community_ReplyDAO replyDao;
	
	//댓글 조회
	@Override
	public List<Community_ReplyVO> list(int cbidx) throws Exception {
		
		return replyDao.list(cbidx);
	}
	
	//댓글 작성
	@Override
	public int write(Community_ReplyVO vo) throws Exception {
		
		return replyDao.insert(vo);
	}
	
	//댓글 수정
	@Override
	public int modify(Community_ReplyVO vo) throws Exception {
		
		return replyDao.update(vo);
	}
	
	//댓글 삭제
	@Override
	public int delete(int cbridx) throws Exception {
		
		return replyDao.delete(cbridx);
	}
	
	//답글 작성
	@Override
	public int Reinsert(Community_ReplyVO vo) throws Exception {
		
		return replyDao.Reinsert(vo);
	}
	
	//답글 lvl 업데이트
	@Override
	public int lvlUp(Community_ReplyVO vo) throws Exception {
		
		return replyDao.lvlUp(vo);
	}
	
	//댓글 페이징
	@Override
	public List<Community_ReplyVO> getRepliesPaging(int cbidx, PagingVO vo) throws Exception {
		
		return replyDao.listPaging(cbidx, vo);
	}
	
	//댓글 카운트
	@Override
	public int countReplies(int cbidx) throws Exception {
		
		return replyDao.countReplies(cbidx);
	}

	@Override
	public Community_ReplyVO selectReply(int cbridx) throws Exception {
		
		return replyDao.selectReply(cbridx);
	}
	
}
