package edu.study.service;

import java.util.List;

import edu.study.vo.Community_BoardVO;
import edu.study.vo.FollowVO;
import edu.study.vo.MemberVO;
import edu.study.vo.MyContentVO;
import edu.study.vo.MyFollowVO;
import edu.study.vo.MyQnaVO;
import edu.study.vo.SearchVO;
import edu.study.vo.Store_reviewVO;
import edu.study.vo.OrderListVO;

public interface MypageService { 

	List<MemberVO> list(SearchVO vo) throws Exception;
	MemberVO detail(int midx) throws Exception;
	MemberVO checkPwd(MemberVO vo) throws Exception;
	List<OrderListVO> orderList(OrderListVO vo) throws Exception;
	List<OrderListVO> orderList2(MemberVO vo) throws Exception;
	List<OrderListVO> delState(OrderListVO vo) throws Exception;
	List<Community_BoardVO> viewStory(Community_BoardVO vo) throws Exception;
	List<OrderListVO> detailOrder(OrderListVO vo) throws Exception;
	List<MyContentVO> mycomment(MyContentVO vo) throws Exception;
	List<MyQnaVO> myquestion(MyQnaVO vo) throws Exception;
	List<Store_reviewVO> myreview(Store_reviewVO vo) throws Exception;
	List<MyFollowVO> myFollower(MyFollowVO vo) throws Exception;
	List<MyFollowVO> myFollowing(MyFollowVO vo) throws Exception;
	List<Community_BoardVO> pagingStory(Community_BoardVO vo) throws Exception;
	
	int update(MemberVO vo) throws Exception;
	int updatePwd(MemberVO vo) throws Exception;
	int updateAddr(MemberVO vo) throws Exception;
	int delete(MemberVO vo) throws Exception;
	int insert(MemberVO vo) throws Exception;
	int count(OrderListVO vo) throws Exception;
	int ReviewCount(Store_reviewVO vo) throws Exception;
	int following_cnt(FollowVO vo) throws Exception;
	int follower_cnt(FollowVO vo) throws Exception;
	int stroyCnt(int midx) throws Exception;
	int likeCnt(int midx) throws Exception;
	int allstoryCnt(int midx) throws Exception;
		
	
	
	 
}
