package edu.study.service;

import java.util.List;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.study.dao.MypageDAO;
import edu.study.vo.BasketVO;
import edu.study.vo.Community_BoardVO;
import edu.study.vo.FollowVO;
import edu.study.vo.MemberVO;
import edu.study.vo.MyContentVO;
import edu.study.vo.MyFollowVO;
import edu.study.vo.MyQnaVO;
import edu.study.vo.SearchVO;
import edu.study.vo.Store_reviewVO;
import edu.study.vo.OrderListVO;

@Service
public class MypageServiceImpl implements MypageService {

	@Autowired 
	private MypageDAO mypageDao;

	 
	 @Override
	 public List<MemberVO> list(SearchVO vo) throws Exception {
	 List<MemberVO> list = mypageDao.list(vo);
	 return list; 
	 }

	@Override
	public MemberVO detail(int midx) throws Exception {
		return mypageDao.detail(midx);
	}
	
	@Override
	public MemberVO checkPwd(MemberVO vo) throws Exception{
		return mypageDao.checkPwd(vo);
	}

	@Override
	public int update(MemberVO vo) throws Exception {
		int result = mypageDao.update(vo);
		return result;
	}
	
	@Override
	public int updatePwd(MemberVO vo) throws Exception {
		int result =  mypageDao.updatePwd(vo);
		return result;
	}

	@Override
	public int updateAddr(MemberVO vo) throws Exception {
		int result =  mypageDao.updateAddr(vo);
		return result;
	}

	@Override
	public int delete(MemberVO vo) throws Exception {
		int result = mypageDao.delete(vo);
		return result;
	}

	@Override
	public int insert(MemberVO vo) throws Exception {
		return mypageDao.insert(vo);
	}

	@Override
	public List<OrderListVO> orderList(OrderListVO vo) throws Exception {
		List<OrderListVO> result = mypageDao.orderList(vo); 
		return result;	
	}
	
	public List<OrderListVO> orderList2(MemberVO vo) throws Exception {
		List<OrderListVO> list = mypageDao.orderList2(vo);
		return list;
	}
	
	@Override
	public int count(OrderListVO vo) throws Exception{
		int result = mypageDao.count(vo);
		return result;
	}
	
	@Override
	public List<OrderListVO> delState(OrderListVO vo) throws Exception {
		List<OrderListVO> result = mypageDao.delState(vo); 
		return result;
	}

	@Override
	public List<Community_BoardVO> viewStory(Community_BoardVO vo) throws Exception {
		List<Community_BoardVO> result = mypageDao.viewStory(vo); 
		return result;
	}


	@Override
	public List<OrderListVO> detailOrder(OrderListVO vo) throws Exception {
		List<OrderListVO> result = mypageDao.detailOrder(vo); 
		return result;
	}


	@Override
	public List<MyContentVO> mycomment(MyContentVO vo) throws Exception {
		List<MyContentVO> result = mypageDao.mycomment(vo); 
		return result;
	}


	@Override
	public List<MyQnaVO> myquestion(MyQnaVO vo) throws Exception {
		List<MyQnaVO> result = mypageDao.myquestion(vo); 
		return result;
	}


	@Override
	public int ReviewCount(Store_reviewVO vo) throws Exception {
		int result = mypageDao.ReviewCount(vo);
		return result;
	}


	@Override
	public List<Store_reviewVO> myreview(Store_reviewVO vo) throws Exception {
		List<Store_reviewVO> result = mypageDao.myreview(vo); 
		return result;
	}

	@Override
	public int following_cnt(FollowVO vo) throws Exception {
		int result = mypageDao.following_cnt(vo);
		return result;
	}

	@Override
	public int follower_cnt(FollowVO vo) throws Exception {
		int result = mypageDao.follower_cnt(vo);
		return result;
	}

	@Override
	public List<MyFollowVO> myFollower(MyFollowVO vo) throws Exception {
		List<MyFollowVO> result = mypageDao.myFollower(vo); 
		return result;
	}

	@Override
	public List<MyFollowVO> myFollowing(MyFollowVO vo) throws Exception {
		List<MyFollowVO> result = mypageDao.myFollowing(vo); 
		return result;
	}

	
	

	
	
	
	
	
	

}
