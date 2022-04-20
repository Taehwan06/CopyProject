package edu.study.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import edu.study.service.FollowService;
import edu.study.service.MemberService;
import edu.study.vo.FollowVO;
import edu.study.vo.MemberVO;

/**
 * Handles requests for the application home page.
 */
@RequestMapping(value="/follow")
@Controller
public class FollowController {
	
	@Autowired
	private FollowService followService;
	
	@Autowired
	private MemberService memberService;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 * @return 
	 * @throws Exception 
	 */
	
	//팔로우 요청
	@RequestMapping(value="/followC", method = RequestMethod.POST)
	@ResponseBody
	public String followC(int fmidx, HttpServletRequest req, Model model) throws Exception {
		
		String nowUri = req.getRequestURI();
	      
        HttpSession session = req.getSession();
        session.setAttribute("nowUri", nowUri);
		
		Object object = session.getAttribute("loginUser");
		MemberVO activeUser = (MemberVO)object;
		MemberVO passiveUser = memberService.inquiryOfUserByMidx(fmidx);
		
		FollowVO follow = new FollowVO();
		follow.setMidx(activeUser.getMidx());
		follow.setFmidx(passiveUser.getMidx());
		
		followService.follow(follow);
		
        return "FollowOK";
	}
	
	//언팔로우 요청
	@RequestMapping(value="/unfollowC", method = RequestMethod.POST)
	@ResponseBody
	public String unfollowC(int fmidx, HttpSession session, Model model) throws Exception {
		
		Object object = session.getAttribute("loginUser");
		MemberVO activeUser = (MemberVO)object;
		MemberVO passiveUser = memberService.inquiryOfUserByMidx(fmidx);
		
		FollowVO follow = new FollowVO();
		follow.setMidx(activeUser.getMidx());
		follow.setFmidx(passiveUser.getMidx());
		
		followService.unfollow(follow);
		
		return "UnFollowOK";
	}
	
	//언팔로우 요청
	@RequestMapping(value="/unfollow", method = RequestMethod.POST)
	@ResponseBody
	public String unfollow(int midx, HttpSession session, Model model) throws Exception {
		
		Object object = session.getAttribute("loginUser");
		MemberVO activeUser = (MemberVO)object;
		MemberVO passiveUser = memberService.inquiryOfUserByMidx(midx);
		
		FollowVO follow = new FollowVO();
		follow.setMidx(activeUser.getMidx());
		follow.setFmidx(passiveUser.getMidx());
		
		followService.unfollow(follow);
		
		return "UnFollowOK";
	}
}
