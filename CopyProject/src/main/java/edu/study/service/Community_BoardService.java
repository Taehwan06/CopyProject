package edu.study.service;

import java.util.List;

import org.springframework.stereotype.Service;

import edu.study.vo.Community_BoardVO;
import edu.study.vo.FollowVO;
import edu.study.vo.MemberVO;
import edu.study.vo.ScrapVO;
import edu.study.vo.SearchVO;

@Service("Community_BoardService")
public interface Community_BoardService {
	List<Community_BoardVO> list(SearchVO vo) throws Exception;
	
	Community_BoardVO detail(int cbidx) throws Exception;
	
	int update(Community_BoardVO vo) throws Exception;
	
	int delete(int cbidx) throws Exception;
	
	int insert(Community_BoardVO vo) throws Exception;
	
	int getBoardlistCnt() throws Exception;

	Community_BoardVO getCommunity_Mainimage() throws Exception;
	
	Integer cbridx() throws Exception;
	
	int viewCount(int cbidx) throws Exception;
	
	List<Community_BoardVO> followlist(List<FollowVO> flist) throws Exception;
	
	int isFollow (FollowVO fvo) throws Exception;
	
	int isScrap (ScrapVO scrap) throws Exception;

	List<Community_BoardVO> scrapList(List<ScrapVO> scrapList) throws Exception;

	List<Community_BoardVO> boardlist() throws Exception;

	List<Community_BoardVO> selectlist(SearchVO vo) throws Exception;

	List<Community_BoardVO> list4(SearchVO vo) throws Exception;
}
