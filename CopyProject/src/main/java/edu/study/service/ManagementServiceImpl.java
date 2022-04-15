package edu.study.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.study.dao.ManagementDAO;
import edu.study.vo.ManagementMemberVO;
import edu.study.vo.MemberPagingVO;
import edu.study.vo.MemberVO;
import edu.study.vo.StatsVO;


@Service
public class ManagementServiceImpl implements ManagementService {

	@Autowired
	private ManagementDAO managementDao;

	@Override
	public List<MemberVO> allMemberList() throws Exception {
		
		return managementDao.allMemberList();
	}

	@Override
	public int countMember(MemberPagingVO vo) throws Exception {

		return managementDao.countMember(vo);
	}

	@Override
	public List<MemberVO> selectPagingMember(MemberPagingVO vo) throws Exception {
		
		return managementDao.selectPagingMember(vo);
	}

	@Override
	public ManagementMemberVO selectOneMember(MemberPagingVO vo) throws Exception {
		
		return managementDao.selectOneMember(vo);
	}

	@Override
	public int withdrawMember(MemberPagingVO vo) throws Exception {
		
		return managementDao.withdrawMember(vo);
	}

	@Override
	public int restoreMember(MemberPagingVO vo) throws Exception {
		
		return managementDao.restoreMember(vo);
	}

	@Override
	public int modifyMember(ManagementMemberVO vo) throws Exception {
		
		return managementDao.modifyMember(vo);
	}

	@Override
	public int imgDelMember(ManagementMemberVO vo) throws Exception {
		
		return managementDao.imgDelMember(vo);
	}

	@Override
	public List<StatsVO> statsMember(MemberPagingVO vo) throws Exception {
		
		return managementDao.statsMember(vo);
	}

	@Override
	public int countStats(MemberPagingVO vo) throws Exception {
		
		return managementDao.countStats(vo);
	}

	@Override
	public List<StatsVO> selectPagingStats(MemberPagingVO vo) throws Exception {
		
		return managementDao.selectPagingStats(vo);
	}

	@Override
	public List<StatsVO> orderList(MemberPagingVO vo) throws Exception {
		
		return managementDao.orderList(vo);
	}

}
