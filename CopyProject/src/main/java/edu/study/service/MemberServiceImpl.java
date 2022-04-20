package edu.study.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.study.dao.MemberDAO;
import edu.study.vo.FollowVO;
import edu.study.vo.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDAO memberDao;
	
	@Override
	public int insert(MemberVO vo) throws Exception {
		return memberDao.insert(vo);
	}

	@Override
	public MemberVO login(MemberVO vo) throws Exception {
		return memberDao.login(vo);
	}

	@Override
	public MemberVO findId(MemberVO vo) throws Exception {
		return memberDao.findId(vo);
	}

	@Override
	public MemberVO findPwd(MemberVO vo) throws Exception {
		return memberDao.findPwd(vo);
	}

	@Override
	public int updateTempPwd(MemberVO vo) throws Exception {
		return memberDao.updateTempPwd(vo);
	}

	@Override
	public int insertTempNum(MemberVO vo) throws Exception {
		return memberDao.insertTempNum(vo);
	}

	@Override
	public int deleteTempNum(String id) throws Exception {
		return memberDao.deleteTempNum(id);
	}

	@Override
	public MemberVO idCheckMember(String id) throws Exception {
		return memberDao.idCheckMember(id);
	}

	@Override
	public MemberVO tempNumCheck(MemberVO vo) throws Exception {
		return memberDao.tempNumCheck(vo);
	}

	@Override
	public MemberVO refreshMember(MemberVO vo) throws Exception {
		return memberDao.refreshMember(vo);
	}
	
	//회원번호로 정보 가져오기
	@Override
	public MemberVO inquiryOfUserByMidx(int midx) throws Exception {
		
		return memberDao.inquiryOfUserByMidx(midx);
	}
	
	//회원 리스트 가져오기
	@Override
	public List<MemberVO> mlist() throws Exception {
		
		return memberDao.mlist();
	}

	@Override
	public List<MemberVO> notfollowlist(List<FollowVO> flist) throws Exception {
		
		return memberDao.notfollowlist(flist);
	}

	@Override
	public MemberVO loginNaverMember(MemberVO vo) throws Exception {
		
		return memberDao.loginNaverMember(vo);
	}

	@Override
	public int insertNaverMember(MemberVO vo) throws Exception {
		
		return memberDao.insertNaverMember(vo);
	}


}
