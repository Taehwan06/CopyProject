package edu.study.service;

import edu.study.vo.MemberVO;

public interface MemberService {
	
	int insert(MemberVO vo) throws Exception;
	MemberVO login(MemberVO vo) throws Exception;
	MemberVO findId(MemberVO vo) throws Exception;
	MemberVO findPwd(MemberVO vo) throws Exception;
	int updateTempPwd(MemberVO vo) throws Exception;
	int insertTempNum(MemberVO vo) throws Exception;
	int deleteTempNum(String id) throws Exception;
	MemberVO idCheckMember(String id) throws Exception;
	MemberVO tempNumCheck(MemberVO vo) throws Exception;
}
