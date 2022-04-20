package edu.study.service;

import java.util.List;

import org.springframework.stereotype.Service;

import edu.study.vo.ScrapVO;

@Service("Scrapservice")
public interface ScrapService {
	
	//스크랩 1증가
	int scrapUp(int cbidx) throws Exception;
	
	//스크랩 1감소
	int scrapDown(int cbidx) throws Exception;
	
	//스크랩 하기
	int scrapOn(ScrapVO svo) throws Exception;
	
	//스크랩 취소
	int scrapOff(ScrapVO svo) throws Exception;

	List<ScrapVO> selectActiveUserList(int midx) throws Exception;
}
