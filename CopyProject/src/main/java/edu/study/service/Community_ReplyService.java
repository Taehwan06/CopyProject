package edu.study.service;

import java.util.List;

import org.springframework.stereotype.Service;

import edu.study.vo.Community_ReplyVO;
import edu.study.vo.PagingVO;

@Service("Community_ReplyService")
public interface Community_ReplyService {
	
	//댓글 조회
	List<Community_ReplyVO> list(int cbidx) throws Exception;
	
	//댓글 작성
	int write(Community_ReplyVO vo) throws Exception;
	
	//댓글 수정
	int modify(Community_ReplyVO vo) throws Exception;
	
	//댓글 삭제
	int delete(int cbridx) throws Exception;
	
	//답글 작성
	int Reinsert(Community_ReplyVO vo) throws Exception;
	
	//답글 lvl 업데이트
	int lvlUp(Community_ReplyVO vo) throws Exception;
	
	//댓글 페이징
	List<Community_ReplyVO> getRepliesPaging(int cbidx, PagingVO vo) throws Exception; 
	
	//댓글 카운트
	int countReplies(int cbidx) throws Exception;
	
	//선택 댓글 조회
	Community_ReplyVO selectReply(int cbridx) throws Exception;

}
