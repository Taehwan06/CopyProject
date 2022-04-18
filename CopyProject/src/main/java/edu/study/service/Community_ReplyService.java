package edu.study.service;

import java.util.List;

import org.springframework.stereotype.Service;

import edu.study.vo.Community_ReplyVO;

@Service("Community_ReplyService")
public interface Community_ReplyService {
	
	//댓글 조회
	List<Community_ReplyVO> list(int cbidx, int start, int end) throws Exception;
	
	//댓글 작성
	int write(Community_ReplyVO vo) throws Exception;
	
	//댓글 작성시 카운트 1증가
	int countUp(int cbidx) throws Exception;
	
	//댓글 수정
	int modify(Community_ReplyVO vo) throws Exception;
	
	//댓글 삭제
	int delete(int cbridx) throws Exception;
	
	//댓글 삭제시 카운트 1감소
	int countDown(int cbidx) throws Exception;
	
	//답글 작성
	int Reinsert(Community_ReplyVO vo) throws Exception;
	
	//답글 lvl 업데이트
	int lvlUp(Community_ReplyVO vo) throws Exception;
	
	//댓글 카운트
	int count(int cbidx) throws Exception;
}
