package edu.study.service;

import java.util.List;

import edu.study.vo.ManagementMemberVO;
import edu.study.vo.MemberPagingVO;
import edu.study.vo.MemberVO;
import edu.study.vo.StatsVO;

public interface ManagementService {

	List<MemberVO> allMemberList() throws Exception;
	int countMember(MemberPagingVO vo) throws Exception;
	List<MemberVO> selectPagingMember(MemberPagingVO vo) throws Exception;
	ManagementMemberVO selectOneMember(MemberPagingVO vo) throws Exception;
	int withdrawMember(MemberPagingVO vo) throws Exception;
	int restoreMember(MemberPagingVO vo) throws Exception;
	int modifyMember(ManagementMemberVO vo) throws Exception;
	int imgDelMember(ManagementMemberVO vo) throws Exception;
	List<StatsVO> statsMember(MemberPagingVO vo) throws Exception;
	int countStats(MemberPagingVO vo) throws Exception;
	List<StatsVO> selectPagingStats(MemberPagingVO vo) throws Exception;
	List<StatsVO> orderList(MemberPagingVO vo) throws Exception;
		
}