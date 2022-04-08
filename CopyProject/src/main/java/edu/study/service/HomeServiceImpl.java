package edu.study.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.study.dao.HomeDAO;
import edu.study.vo.HomeSearchVO;
import edu.study.vo.HomeStoreVO;
import edu.study.vo.HomeStoryVO;


@Service
public class HomeServiceImpl implements HomeService {

	@Autowired
	private HomeDAO homeDao;

	@Override
	public List<HomeStoryVO> searchStory(HomeSearchVO vo) throws Exception {
		
		List<HomeStoryVO> list = homeDao.searchStory(vo);
		
		return list;
	
	}

	@Override
	public List<HomeStoreVO> searchStore(HomeSearchVO vo) throws Exception {
		
		List<HomeStoreVO> list = homeDao.searchStore(vo);
		
		return list;
	}

	@Override
	public List<HomeSearchVO> listSearchList() throws Exception {
		
		List<HomeSearchVO> list = homeDao.listSearchList();
		
		return list;
	}

	@Override
	public int insertSearchList(HomeSearchVO vo) throws Exception {
		
		int result = homeDao.insertSearchList(vo);
		
		return result;
	}

	@Override
	public int deleteSearchList() throws Exception {
		
		int result = homeDao.deleteSearchList();
		
		return result;
	}

	@Override
	public HomeStoreVO recentViewStore(HomeStoreVO vo) throws Exception {

		HomeStoreVO list = homeDao.recentViewStore(vo);
		
		return list;
	}

	
	
}
