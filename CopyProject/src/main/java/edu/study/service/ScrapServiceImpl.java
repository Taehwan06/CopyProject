package edu.study.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.study.dao.ScarpDAO;
import edu.study.vo.ScrapVO;

@Service
public class ScrapServiceImpl implements ScrapService {
	
	@Autowired
	private ScarpDAO scrapDao;
	
	//스크랩 1증가
	@Override
	public int scrapUp(int cbidx) throws Exception {
		
		return scrapDao.scrapUp(cbidx);
	}
	
	//스크랩 1감소
	@Override
	public int scrapDown(int cbidx) throws Exception {
		
		return scrapDao.scrapDown(cbidx);
	}
	
	//스크랩 하기
	@Override
	public int scrapOn(ScrapVO svo) throws Exception {
		
		return scrapDao.scrapOn(svo);
	}
	
	//스크랩 취소
	@Override
	public int scrapOff(ScrapVO svo) throws Exception {
		
		return scrapDao.scrapOff(svo);
	}

	@Override
	public List<ScrapVO> selectActiveUserList(int midx) throws Exception {
		
		return scrapDao.selectActiveUserList(midx);
	}
}
