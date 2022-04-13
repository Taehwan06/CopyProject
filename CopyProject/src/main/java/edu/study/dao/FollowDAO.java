package edu.study.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.study.vo.FollowVO;

@Repository
public class FollowDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	private static final String Namespace = "edu.study.mapper.FollowMapper";
	
	//팔로우 하기
	public int follow(FollowVO follow) throws Exception {
		
		return sqlSession.insert(Namespace+".follow", follow);
	}
	
	//언팔로우 하기
	public int unfollow(FollowVO follow) throws Exception {
		
		return sqlSession.delete(Namespace+".unfollow", follow);
	}
	
	//팔로유 유무
	public int isFollow(FollowVO follow) throws Exception {
		
		return sqlSession.delete(Namespace+".isFollow", follow);
	}
	
	//팔로우 리스트 조회
	public List<FollowVO> selectActiveUserList(int activeUser) throws Exception {
		
		return sqlSession.selectList(Namespace+".activeUser", activeUser);
	}
	
	//팔로워 리스트 조회
	public List<FollowVO> selectPassiveUserList(int passiveUser) throws Exception {
		
		return sqlSession.selectList(Namespace+".passiveUser", passiveUser);
	}
	
	public int deleteUserAllFollow(int activeUser) throws Exception {
		
		return sqlSession.delete(Namespace+".deleteUser", activeUser);
	}
}
