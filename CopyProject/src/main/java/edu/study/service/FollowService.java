package edu.study.service;

import java.util.List;

import org.springframework.stereotype.Service;

import edu.study.vo.FollowVO;

@Service("FollowService")
public interface FollowService {
	
	//팔로우 하기
	int follow(FollowVO follow) throws Exception;
	
	//언팔로우 하기
	int unfollow(FollowVO follow) throws Exception;
	
	//팔로우 유무
	int isFollow(FollowVO follow) throws Exception;
	
	//팔로우 리스트 조회
	List<FollowVO> selectActiveUserList(int activeUser) throws Exception;
	
	//팔로워 리스트 조회
	List<FollowVO> selectPassiveUserList(int passiveUser) throws Exception;
	
}
