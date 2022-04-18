package edu.study.controller;

import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import edu.study.service.BoardService;
import edu.study.service.HomeService;
import edu.study.service.ManagementService;
import edu.study.vo.HomeSearchVO;
import edu.study.vo.ManagementMemberVO;
import edu.study.vo.MemberPagingVO;
import edu.study.vo.MemberVO;
import edu.study.vo.StatsVO;

/**
 * Handles requests for the application home page.
 */
@RequestMapping(value="/management")
@Controller
public class ManagementController {
	
	@Autowired
	private BoardService boardService;
	@Autowired
	private HomeService homeService;
	@Autowired
	private ManagementService managementService;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 * @throws Exception 
	 */
	
	@RequestMapping(value = "/management.do", method = RequestMethod.GET)
	public String management(Locale locale, Model model, HttpServletRequest request) throws Exception {
		
		HttpSession session = request.getSession(); 
	    MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");
	   	
		session.setAttribute("nowUri", null);
	    
		if(loginUser == null) {
			return "redirect:/login/login.do";
		}else if(!loginUser.getGrade().equals("A") && !loginUser.getGrade().equals("M")) {
			return "redirect:/";
		}else {
		
			int deleteResult = homeService.deleteSearchList();
			
			List<HomeSearchVO> searchList = homeService.listSearchList();
			
			model.addAttribute("searchList", searchList);
			
			return "management/management";
		}
	}
			
	@RequestMapping(value = "/member_list.do", method = RequestMethod.GET)
	public String member_list(Locale locale, Model model, HttpServletRequest request, MemberPagingVO vo
							, @RequestParam(value="nowPage", required=false)String nowPage
							, @RequestParam(value="cntPerPage", required=false)String cntPerPage) throws Exception {
				
		HttpSession session = request.getSession(); 
	    MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");
	   	
		session.setAttribute("nowUri", null);
	    
		if(loginUser == null) {
			return "redirect:/login/login.do";
		}else if(!loginUser.getGrade().equals("A") && !loginUser.getGrade().equals("M")) {
			return "redirect:/";
		}else {
				
			int deleteResult = homeService.deleteSearchList();
			
			List<HomeSearchVO> searchList = homeService.listSearchList();
			
			model.addAttribute("searchList", searchList);
						
			//페이징처리
			int total = managementService.countMember(vo);
			
			if (nowPage == null && cntPerPage == null) {
				nowPage = "1";
				cntPerPage = "5";
			} else if (nowPage == null) {
				nowPage = "1";
			} else if (cntPerPage == null) { 
				cntPerPage = "5";
			}
			
			MemberPagingVO memberPagingvo = new MemberPagingVO(total, Integer.parseInt(nowPage)  , Integer.parseInt(cntPerPage));
	  	    int start = memberPagingvo.getStart(); 
	  	    int end = memberPagingvo.getEnd();
  	    	memberPagingvo.setSearchType(vo.getSearchType());
  	    	memberPagingvo.setSearchValue(vo.getSearchValue());
  	    	memberPagingvo.setCntPerPage(Integer.parseInt(cntPerPage));
  	    		  	    
	  	    List<MemberVO> memberPagingList = managementService.selectPagingMember(memberPagingvo);
	  	    model.addAttribute("memberPagingList", memberPagingList);
	  	    model.addAttribute("memberPagingvo", memberPagingvo);
	  	    
	  		return "management/member_list";
		}
	}
	
	/*
	 * @RequestMapping(value = "/report_list.do", method = RequestMethod.GET) public
	 * String report_list(Locale locale, Model model, SearchVO vo,
	 * HttpServletRequest request) throws Exception {
	 * 
	 * int deleteResult = homeService.deleteSearchList();
	 * 
	 * List<HomeSearchVO> searchList = homeService.listSearchList();
	 * 
	 * model.addAttribute("searchList", searchList);
	 * 
	 * return "management/report_list"; }
	 */
	
	@RequestMapping(value = "/member_view.do", method = RequestMethod.GET)
	public String member_view(Locale locale, Model model, MemberPagingVO memberPagingvo, HttpServletRequest request) throws Exception {
		
		HttpSession session = request.getSession(); 
	    MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");
	   	
		session.setAttribute("nowUri", null);
	    
		if(loginUser == null) {
			return "redirect:/login/login.do";
		}else if(!loginUser.getGrade().equals("A") && !loginUser.getGrade().equals("M")) {
			return "redirect:/";
		}else {
		
			int deleteResult = homeService.deleteSearchList();
			
			List<HomeSearchVO> searchList = homeService.listSearchList();
			
			model.addAttribute("searchList", searchList);
			
			ManagementMemberVO selectMember = managementService.selectOneMember(memberPagingvo);
			
			model.addAttribute("selectMember", selectMember);
			
			model.addAttribute("memberPagingvo", memberPagingvo);
							
			return "management/member_view";
		}
	}
	
	@RequestMapping(value = "/member_modify.do", method = RequestMethod.POST)
	public String member_modify(Locale locale, Model model, MemberPagingVO memberPagingvo, HttpServletRequest request) throws Exception {
		
		HttpSession session = request.getSession(); 
	    MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");
	   	
		session.setAttribute("nowUri", null);
	    
		if(loginUser == null) {
			return "redirect:/login/login.do";
		}else if(!loginUser.getGrade().equals("A") && !loginUser.getGrade().equals("M")) {
			return "redirect:/";
		}else {
		
			int deleteResult = homeService.deleteSearchList();
			
			List<HomeSearchVO> searchList = homeService.listSearchList();
			
			model.addAttribute("searchList", searchList);
			
			ManagementMemberVO selectMember = managementService.selectOneMember(memberPagingvo);
			
			model.addAttribute("selectMember", selectMember);
			
			model.addAttribute("memberPagingvo", memberPagingvo);
					
			return "management/member_modify";
		}
	}
	
	@RequestMapping(value = "/withdrawMember.do", method = RequestMethod.POST)
	public String withdrawMember(Locale locale, Model model, MemberPagingVO vo, HttpServletRequest request) throws Exception {
		
		HttpSession session = request.getSession(); 
	    MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");
	   	
		session.setAttribute("nowUri", null);
	    
		if(loginUser == null) {
			return "redirect:/login/login.do";
		}else if(!loginUser.getGrade().equals("A") && !loginUser.getGrade().equals("M")) {
			return "redirect:/";
		}else {
		
			int deleteResult = homeService.deleteSearchList();
			
			List<HomeSearchVO> searchList = homeService.listSearchList();
			
			model.addAttribute("searchList", searchList);
			
			model.addAttribute("memberPagingvo", vo);
			int result = managementService.withdrawMember(vo);
					
			return "redirect:/management/member_view.do?midx="+vo.getMidx()+"&nowPage="+vo.getNowPage()+"&searchType="+vo.getSearchType()+"&searchValue="+vo.getSearchValue();
		}
	}
	
	@RequestMapping(value = "/restoreMember.do", method = RequestMethod.POST)
	public String restoreMember(Locale locale, Model model, MemberPagingVO vo, HttpServletRequest request) throws Exception {
		
		HttpSession session = request.getSession(); 
	    MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");
	   	
		session.setAttribute("nowUri", null);
	    
		if(loginUser == null) {
			return "redirect:/login/login.do";
		}else if(!loginUser.getGrade().equals("A") && !loginUser.getGrade().equals("M")) {
			return "redirect:/";
		}else {
		
			int deleteResult = homeService.deleteSearchList();
			
			List<HomeSearchVO> searchList = homeService.listSearchList();
			
			model.addAttribute("searchList", searchList);
			
			model.addAttribute("memberPagingvo", vo);
			int result = managementService.restoreMember(vo);
					
			return "redirect:/management/member_view.do?midx="+vo.getMidx()+"&nowPage="+vo.getNowPage()+"&searchType="+vo.getSearchType()+"&searchValue="+vo.getSearchValue();
		}
	}
	
	@RequestMapping(value = "/modifyMember.do", method = RequestMethod.POST)
	public String modifyMember(Locale locale, Model model, ManagementMemberVO Mvo, MemberPagingVO vo, HttpServletRequest request) throws Exception {
		
		HttpSession session = request.getSession(); 
	    MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");
	   	
		session.setAttribute("nowUri", null);
	    
		if(loginUser == null) {
			return "redirect:/login/login.do";
		}else if(!loginUser.getGrade().equals("A") && !loginUser.getGrade().equals("M")) {
			return "redirect:/";
		}else {
		
			int deleteResult = homeService.deleteSearchList();
			
			List<HomeSearchVO> searchList = homeService.listSearchList();
			
			model.addAttribute("searchList", searchList);
			
			model.addAttribute("memberPagingvo", vo);
			
			int result = managementService.modifyMember(Mvo);
			
			return "redirect:/management/member_view.do?midx="+vo.getMidx()+"&nowPage="+vo.getNowPage()+"&searchType="+vo.getSearchType()+"&searchValue="+vo.getSearchValue();
		}
	}
	
	@RequestMapping(value = "/imgDelMember.do", method = RequestMethod.POST)
	public String imgDelMember(Locale locale, Model model, ManagementMemberVO Mvo, MemberPagingVO vo, HttpServletRequest request) throws Exception {
		
		HttpSession session = request.getSession(); 
	    MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");
	   	
		session.setAttribute("nowUri", null);
	    
		if(loginUser == null) {
			return "redirect:/login/login.do";
		}else if(!loginUser.getGrade().equals("A") && !loginUser.getGrade().equals("M")) {
			return "redirect:/";
		}else {
		
			int deleteResult = homeService.deleteSearchList();
			
			List<HomeSearchVO> searchList = homeService.listSearchList();
			
			model.addAttribute("searchList", searchList);
			
			model.addAttribute("memberPagingvo", vo);
			
			int result = managementService.imgDelMember(Mvo);
			
			return "redirect:/management/member_view.do?midx="+vo.getMidx()+"&nowPage="+vo.getNowPage()+"&searchType="+vo.getSearchType()+"&searchValue="+vo.getSearchValue();
		}
	}
	
	@RequestMapping(value = "/stats.do", method = RequestMethod.GET)
	public String stats(Locale locale, Model model, MemberPagingVO vo 
						, HttpServletRequest request, StatsVO statsvo 
						, @RequestParam(value="nowPage", required=false)String nowPage
						, @RequestParam(value="cntPerPage", required=false)String cntPerPage) throws Exception {
		
		HttpSession session = request.getSession(); 
	    MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");
	   	
		session.setAttribute("nowUri", null);
	    
		if(loginUser == null) {
			return "redirect:/login/login.do";
		}else if(!loginUser.getGrade().equals("A") && !loginUser.getGrade().equals("M")) {
			return "redirect:/";
		}else {
		
			int deleteResult = homeService.deleteSearchList();
			
			List<HomeSearchVO> searchList = homeService.listSearchList();
			
			model.addAttribute("searchList", searchList);
			
			
			
			
			//페이징처리
			int total = managementService.countStats(vo);
			
			if (nowPage == null && cntPerPage == null) {
				nowPage = "1";
				cntPerPage = "5";
			} else if (nowPage == null) {
				nowPage = "1";
			} else if (cntPerPage == null) { 
				cntPerPage = "5";
			}
			
			MemberPagingVO memberPagingvo = new MemberPagingVO(total, Integer.parseInt(nowPage)  , Integer.parseInt(cntPerPage));
	  	    int start = memberPagingvo.getStart(); 
	  	    int end = memberPagingvo.getEnd();
  	    	memberPagingvo.setSearchType(vo.getSearchType());
  	    	memberPagingvo.setSearchValue(vo.getSearchValue());
  	    	memberPagingvo.setPeriod(vo.getPeriod());
  	    	memberPagingvo.setCntPerPage(Integer.parseInt(cntPerPage));
	  	    
  	    	List<StatsVO> statsList = managementService.selectPagingStats(memberPagingvo);
	  	    model.addAttribute("statsList", statsList);
	  	    model.addAttribute("memberPagingvo", memberPagingvo);
			
			return "management/stats";
		}
	}
	
	
	@RequestMapping(value = "/stats_view.do", method = RequestMethod.GET)
	public String stats_view(Locale locale, Model model, MemberPagingVO vo, HttpServletRequest request) throws Exception {
		
		HttpSession session = request.getSession(); 
	    MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");
	   	
		session.setAttribute("nowUri", null);
	    
		if(loginUser == null) {
			return "redirect:/login/login.do";
		}else if(!loginUser.getGrade().equals("A") && !loginUser.getGrade().equals("M")) {
			return "redirect:/";
		}else {
		
			int deleteResult = homeService.deleteSearchList();
			
			List<HomeSearchVO> searchList = homeService.listSearchList();
			
			model.addAttribute("searchList", searchList);
			
			model.addAttribute("memberPagingvo", vo);
			
			ManagementMemberVO mvo = managementService.selectOneMember(vo);
			model.addAttribute("mvo", mvo);
			
			List<StatsVO> orderList = managementService.orderList(vo);
			model.addAttribute("orderList", orderList);
			
			return "management/stats_view";
		}
	}
	
	
}
