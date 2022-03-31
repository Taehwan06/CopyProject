package edu.study.service;

import java.util.List;

import edu.study.vo.HomeSearchVO;
import edu.study.vo.HomeStoreVO;
import edu.study.vo.HomeStoryVO;

public interface HomeService {
	
	List<HomeStoryVO> searchStory(HomeSearchVO vo) throws Exception;
	List<HomeStoreVO> searchStore(HomeSearchVO vo) throws Exception;
	List<HomeSearchVO> listSearchList() throws Exception;
	int insertSearchList(HomeSearchVO vo) throws Exception;
	int deleteSearchList() throws Exception;
}
