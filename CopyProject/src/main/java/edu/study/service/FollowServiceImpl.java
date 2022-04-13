package edu.study.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.study.dao.FollowDAO;
import edu.study.vo.FollowVO;

@Service
public class FollowServiceImpl implements FollowService {
	
	@Autowired
	private FollowDAO followDao;
	
	//팔로우 하기
	@Override
	public int follow(FollowVO follow) throws Exception {
		
		return followDao.follow(follow);
	}
	
	//언팔로우 하기
	@Override
	public int unfollow(FollowVO follow) throws Exception {
		
		return followDao.unfollow(follow);
	}
	
	//팔로우 유무
	@Override
	public int isFollow(FollowVO follow) throws Exception {
		
		return followDao.isFollow(follow);
	}
	
	//팔로우 리스트 조회
	@Override
	public List<FollowVO> selectActiveUserList(int activeUser) throws Exception {
		
		return followDao.selectActiveUserList(activeUser);
	}
	
	//팔로워 리스트 조회
	@Override
	public List<FollowVO> selectPassiveUserList(int passiveUser) throws Exception {
		
		return followDao.selectPassiveUserList(passiveUser);
	}
}
