package edu.study.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import edu.study.service.BasketService;
import edu.study.service.HomeService;
import edu.study.service.MemberService;
import edu.study.service.MypageService;
import edu.study.service.StoreService;
import edu.study.vo.BasketVO;
import edu.study.vo.Community_BoardVO;
import edu.study.vo.FollowVO;
import edu.study.vo.HomeSearchVO;
import edu.study.vo.MemberVO;
import edu.study.vo.MyContentVO;
import edu.study.vo.MyFollowVO;
import edu.study.vo.MyQnaVO;
import edu.study.vo.OrderListVO;
import edu.study.vo.PagingVO;
import edu.study.vo.PayInfoVO;
import edu.study.vo.SearchVO;
import edu.study.vo.StoreVO;
import edu.study.vo.Store_reviewVO;

/**
 * Handles requests for the application home page.
 */  
@RequestMapping(value="/mypage")
@Controller
public class MypageController { 
	
	@Autowired 
	private MypageService mypageService;
	@Autowired
	private HomeService homeService;
	@Autowired
	private BasketService basketService;
	@Autowired
	private MemberService memberService;
	@Autowired
	private StoreService storeService;
	 
	/**
	 * Simply selects the home view to render by returning its name.
	 * @throws Exception 
	 */
	@RequestMapping(value = "/mypage.do", method = RequestMethod.GET)
	public String mypage(Locale locale, Model model,OrderListVO vo, HttpServletRequest request, Community_BoardVO list, FollowVO follow, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession(); 
	    MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");
	    
	    response.setHeader("Cache-Control","no-store");
	    
	    String nowUri = request.getRequestURI();
		
		session.setAttribute("nowUri", nowUri);
	    
		if(loginUser == null) {
	         return "redirect:/login/login.do";
	      }else {
	    	  
			int deleteResult = homeService.deleteSearchList();
			
			List<HomeSearchVO> searchList = homeService.listSearchList();
			
			model.addAttribute("searchList", searchList);
			
	    	vo.setMidx(loginUser.getMidx());
		    vo.setProgress("결제완료");
			int count = mypageService.count(vo);
			model.addAttribute("count1", count);  	    	    
	    	  
	    	vo.setMidx(loginUser.getMidx());
	    	vo.setProgress("배송중");
	    	count = mypageService.count(vo);
			model.addAttribute("count3", count);  
			
			vo.setMidx(loginUser.getMidx());
	    	vo.setProgress("배송완료");
			count = mypageService.count(vo);
			model.addAttribute("count4", count);  
	    	  
	    	MemberVO result = mypageService.detail(loginUser.getMidx());
	  		model.addAttribute("vo", result);
	  		
	  		int Midx = loginUser.getMidx();
			list.setMidx(Midx);
	  		
	  		List<Community_BoardVO> Storylist = mypageService.viewStory(list);
	  		model.addAttribute("Storylist", Storylist);
	  		
	  		follow.setMidx(Midx);
	  		int following = mypageService.following_cnt(follow);
	  		model.addAttribute("following", following);
	  		
	  		int fmidx = loginUser.getMidx();
	  		follow.setFmidx(fmidx);
	  		
	  		int follower = mypageService.follower_cnt(follow);
	  		model.addAttribute("follower", follower);
	  		
	  		int stroyCnt = mypageService.stroyCnt(Midx);
	  		model.addAttribute("stroyCnt", stroyCnt);
	  		
	  		int likeCnt = mypageService.likeCnt(Midx);
	  		model.addAttribute("likeCnt", likeCnt);
	  		
	  		
	  		
	        return "mypage/mypage";
	      }  
	}
	
	@RequestMapping(value = "/member_modify.do", method = RequestMethod.GET)
	public String member_modify(Locale locale, Model model, HttpServletRequest request,HttpServletResponse response) throws Exception {

		response.setHeader("Cache-Control","no-store");
		HttpSession session = request.getSession(); 
		MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");

	    if(loginUser == null) {
	         return "redirect:/login/login.do";
	    }else {

			int deleteResult = homeService.deleteSearchList();
			
			List<HomeSearchVO> searchList = homeService.listSearchList();
			
			model.addAttribute("searchList", searchList);
			
			MemberVO result = mypageService.detail(loginUser.getMidx());
			model.addAttribute("vo", result);
			
			return "mypage/member_modify"; 
	    }
	}
	
	@RequestMapping(value = "/member_modify.do", method = RequestMethod.POST)
	public String member_modifyOk(Locale locale, Model model,MemberVO vo, HttpServletRequest request) throws Exception {

		HttpSession session = request.getSession(); 
		MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");

	    if(loginUser == null) {
	         return "redirect:/login/login.do";
	    }else {
		
			int deleteResult = homeService.deleteSearchList();
			
			List<HomeSearchVO> searchList = homeService.listSearchList();
			
			model.addAttribute("searchList", searchList);
			       
		    int result = mypageService.update(vo);
		    loginUser = memberService.refreshMember(vo);
		      
		    session.setAttribute("loginUser", loginUser);
		
		    return "redirect:/mypage/mypage.do";
	    }
	}
	
	@RequestMapping(value = "/member_delete.do", method = RequestMethod.GET)
	public String member_delete(Locale locale, Model model, HttpServletRequest request) throws Exception {

		HttpSession session = request.getSession(); 
		MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");

	    if(loginUser == null) {
	         return "redirect:/login/login.do";
	    }else {

			int deleteResult = homeService.deleteSearchList();
			List<HomeSearchVO> searchList = homeService.listSearchList();
			model.addAttribute("searchList", searchList);
			
		    int midx = loginUser.getMidx();
			MemberVO result = mypageService.detail(midx);
			
			
			return "mypage/member_delete"; 
	    }
	}
	
	@RequestMapping(value = "/member_delete.do", method = RequestMethod.POST)
	public String member_deleteOk(Locale locale, Model model, MemberVO vo, HttpServletRequest request) throws Exception {

		HttpSession session = request.getSession(); 
		MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");

	    if(loginUser == null) {
	         return "redirect:/login/login.do";
	    }else {
		
			int deleteResult = homeService.deleteSearchList();
			List<HomeSearchVO> searchList = homeService.listSearchList();
			model.addAttribute("searchList", searchList);
			
		    int Midx = loginUser.getMidx();
		    
			vo.setMidx(Midx);
			int result = mypageService.delete(vo);	
			
			session.setAttribute("loginUser", null);
			return "home";
	    }
	}
	
	@RequestMapping(value = "/addr_modify.do", method = RequestMethod.GET)
	public String addr_modify(Locale locale, Model model, HttpServletRequest request) throws Exception {

		HttpSession session = request.getSession(); 
		MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");

	    if(loginUser == null) {
	         return "redirect:/login/login.do";
	    }else {

			int deleteResult = homeService.deleteSearchList();
			List<HomeSearchVO> searchList = homeService.listSearchList();
			model.addAttribute("searchList", searchList);
			
			model.addAttribute("loginUser", loginUser);
			
			
			return "mypage/addr_modify"; 
	    }
	}
	
	@RequestMapping(value = "/addr_modify.do", method = RequestMethod.POST)
	public String addr_modifyOK(Locale locale, Model model, MemberVO vo, HttpServletRequest request) throws Exception {

		HttpSession session = request.getSession(); 
		MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");

	    if(loginUser == null) {
	         return "redirect:/login/login.do";
	    }else {

			int deleteResult = homeService.deleteSearchList();
			List<HomeSearchVO> searchList = homeService.listSearchList();
			model.addAttribute("searchList", searchList);
				
			vo.getMidx();
			int result = mypageService.updateAddr(vo);
			
			loginUser = memberService.refreshMember(vo);
		      
		    session.setAttribute("loginUser", loginUser);
			
		    return "redirect:/mypage/mypage.do";
	    }
	}
	
	
	@RequestMapping(value = "/order_list.do", method = RequestMethod.GET)
	public String order_list(Locale locale, Model model,OrderListVO vo, HttpServletRequest request, HttpServletResponse response) throws Exception {


		response.setHeader("Cache-Control","no-store");
		HttpSession session = request.getSession(); 
		MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");

		String nowUri = request.getRequestURI();
			
		session.setAttribute("nowUri", nowUri);

	    if(loginUser == null) {
	         return "redirect:/login/login.do";
	    }else {
		
			int deleteResult = homeService.deleteSearchList();
			
			List<HomeSearchVO> searchList = homeService.listSearchList();
			
			model.addAttribute("searchList", searchList);
				
			if(loginUser == null) {
		        return "redirect:/login/login.do";
			}else {
				
			    List<OrderListVO> orderList2 = mypageService.orderList2(loginUser);
				model.addAttribute("orderList2", orderList2);
				
				vo.setMidx(loginUser.getMidx());
			    vo.setProgress("결제완료");
				int count = mypageService.count(vo);
				model.addAttribute("count1", count);
				
				vo.setMidx(loginUser.getMidx());
				vo.setProgress("배송준비중");
				count = mypageService.count(vo);
				model.addAttribute("count2", count);
				
				vo.setMidx(loginUser.getMidx());
				vo.setProgress("배송중");
				count = mypageService.count(vo);
				model.addAttribute("count3", count);
				
				vo.setMidx(loginUser.getMidx());
				vo.setProgress("배송완료"); 
				count = mypageService.count(vo);
				model.addAttribute("count4", count);
				
		  	
		        return "mypage/order_list";
			}  
	    }
		
	}
	
	@RequestMapping(value = "/state", method = RequestMethod.GET)
	
	public String state(Locale locale, Model model,OrderListVO vo, HttpServletRequest request) throws Exception {

		HttpSession session = request.getSession(); 
		MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");

	    if(loginUser == null) {
	         return "redirect:/login/login.do";
	    }else {
		
			int deleteResult = homeService.deleteSearchList();
			
			List<HomeSearchVO> searchList = homeService.listSearchList();
			
			model.addAttribute("searchList", searchList);
					
			if(loginUser == null) {
				return "redirect:/login/login.do";
			}else {
			    String progress = request.getParameter("progress");
				
				vo.setProgress(progress);
				vo.setMidx(loginUser.getMidx());
			   
			   	List<OrderListVO> delState = mypageService.delState(vo);
				model.addAttribute("orderList2", delState);
				
				
			    vo.setProgress("결제완료");
				int count = mypageService.count(vo);
				model.addAttribute("count1", count);
				
				vo.setMidx(loginUser.getMidx());
				vo.setProgress("배송준비중");
				count = mypageService.count(vo);
				model.addAttribute("count2", count);
				
				vo.setMidx(loginUser.getMidx());
				vo.setProgress("배송중");
				count = mypageService.count(vo);
				model.addAttribute("count3", count);
				
				vo.setMidx(loginUser.getMidx());
				vo.setProgress("배송완료"); 
				count = mypageService.count(vo);
				model.addAttribute("count4", count);
				
		  	
		        return "mypage/order_list";
			       
		   }  
		
	    }
	}
	
	
	@RequestMapping(value = "/mypage_allStory.do", method = RequestMethod.GET)
	public String mypage_allStory(Locale locale, Model model, SearchVO vo, HttpServletRequest request ,Community_BoardVO list, FollowVO follow,int nowPage) throws Exception {

		HttpSession session = request.getSession(); 
		MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");

	    if(loginUser == null) {
	         return "redirect:/login/login.do";
	    }else {
		
			int deleteResult = homeService.deleteSearchList();
			List<HomeSearchVO> searchList = homeService.listSearchList();
			model.addAttribute("searchList", searchList);
			    	  
	    	MemberVO result = mypageService.detail(loginUser.getMidx());
	  		model.addAttribute("vo", result);
	  		
	  		int Midx = loginUser.getMidx();
			list.setMidx(Midx);
	  		
			//페이징
			int total = mypageService.allstoryCnt(Midx);
			PagingVO pvo = new PagingVO(total, nowPage, 6);
			int start = pvo.getStart();
			int end = pvo.getEnd();
			list.setStart(start);
			list.setEnd(end);
			
			
	  		List<Community_BoardVO> Storylist = mypageService.pagingStory(list);
	  		model.addAttribute("Storylist", Storylist);
	  		model.addAttribute("pvo", pvo);
	  		
	  		//숫자처리
	  		
	  		follow.setMidx(Midx);
	  		int following = mypageService.following_cnt(follow);
	  		model.addAttribute("following", following);
	  		
	  		int fmidx = loginUser.getMidx();
	  		follow.setFmidx(fmidx);
	  		
	  		int follower = mypageService.follower_cnt(follow);
	  		model.addAttribute("follower", follower);
	  		
	  		int stroyCnt = mypageService.stroyCnt(Midx);
	  		model.addAttribute("stroyCnt", stroyCnt);
	  		
	  		int likeCnt = mypageService.likeCnt(Midx);
	  		model.addAttribute("likeCnt", likeCnt);
	  		
	  		
	  		return "mypage/mypage_allStory";
		      
	    }
	}
	
	@RequestMapping(value = "/Member_page.do", method = RequestMethod.GET)
	public String Member_page(Locale locale, Model model, SearchVO vo, HttpServletRequest request ,Community_BoardVO list, FollowVO follow, int midx) throws Exception {

		HttpSession session = request.getSession(); 
		MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");

	    if(loginUser == null) {
	         return "redirect:/login/login.do";
	    }else {
			int deleteResult = homeService.deleteSearchList();
			List<HomeSearchVO> searchList = homeService.listSearchList();
			model.addAttribute("searchList", searchList);
			
			//멤버정보
	    	MemberVO result = mypageService.detail(midx);
	  		model.addAttribute("vo", result);
	  		
			//멤버가 작성한 글 
	  		list.setMidx(midx);
	  		List<Community_BoardVO> Storylist = mypageService.viewStory(list);
	  		model.addAttribute("Storylist", Storylist);
	  		
	  		//멤버의 팔로잉 수
	  		follow.setMidx(midx);
	  		int following = mypageService.following_cnt(follow);
	  		model.addAttribute("following", following);
	  		
	  		//멤버의 팔로워 수
	  		int fmidx = midx;
	  		follow.setFmidx(fmidx);
	  		
	  		int follower = mypageService.follower_cnt(follow);
	  		model.addAttribute("follower", follower);
	  		
	  		//팔로우체크
			FollowVO fvo = new FollowVO();
			
			fvo.setMidx(loginUser.getMidx());
			fvo.setFmidx(midx); 

			int isFollow = mypageService.isFollow(fvo);

			model.addAttribute("isFollow", isFollow);
			
			//로그인유저의 midx
			int login_midx = loginUser.getMidx();
			model.addAttribute("login_midx", login_midx);
	  		
	  		return "mypage/Member_page";
		      
	    }
	}
	
	@RequestMapping(value="/followC", method = RequestMethod.POST)
	@ResponseBody
	public String followC(int fmidx, HttpServletRequest req, Model model) throws Exception {
		
		String nowUri = req.getRequestURI();
	      
        HttpSession session = req.getSession();
        session.setAttribute("nowUri", nowUri);
        
		//MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");
		
		Object object = session.getAttribute("loginUser");
		MemberVO activeUser = (MemberVO)object;
		MemberVO passiveUser = memberService.inquiryOfUserByMidx(fmidx);
		
		FollowVO follow = new FollowVO();
		follow.setMidx(activeUser.getMidx());
		follow.setFmidx(passiveUser.getMidx());
		
		mypageService.follow(follow);
		
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
			
			mypageService.unfollow(follow);
			
			return "UnFollowOK";
		}
	
	
	

	@RequestMapping(value = "/my_comment.do", method = RequestMethod.GET)
	public String my_comment(Locale locale, Model model, SearchVO vo, HttpServletRequest request ,MyContentVO list, FollowVO follow) throws Exception {

		HttpSession session = request.getSession(); 
		MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");

	    if(loginUser == null) {
	         return "redirect:/login/login.do";
	    }else {
		
			int deleteResult = homeService.deleteSearchList();
			List<HomeSearchVO> searchList = homeService.listSearchList();
			model.addAttribute("searchList", searchList);
			    	  
	    	MemberVO result = mypageService.detail(loginUser.getMidx());
	  		model.addAttribute("vo", result);
	  		
	  		int Midx = loginUser.getMidx();
			list.setMidx(Midx);
	  		
	  		List<MyContentVO> Commentlist = mypageService.mycomment(list);
	  		model.addAttribute("Commentlist", Commentlist);
	  		
	  		follow.setMidx(Midx);
	  		int following = mypageService.following_cnt(follow);
	  		model.addAttribute("following", following);
	  		
	  		int fmidx = loginUser.getMidx();
	  		follow.setFmidx(fmidx);
	  		
	  		int follower = mypageService.follower_cnt(follow);
	  		model.addAttribute("follower", follower);
	  		
	  		int stroyCnt = mypageService.stroyCnt(Midx);
	  		model.addAttribute("stroyCnt", stroyCnt);
	  		
	  		int likeCnt = mypageService.likeCnt(Midx);
	  		model.addAttribute("likeCnt", likeCnt);
	  		
	  		return "mypage/my_comment";
		      
	    }
	}
	

	@RequestMapping(value = "/my_QnA.do", method = RequestMethod.GET)
	public String my_QnA(Locale locale, Model model, SearchVO vo, HttpServletRequest request ,MyQnaVO list, FollowVO follow) throws Exception {

		HttpSession session = request.getSession(); 
		MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");

	    if(loginUser == null) {
	         return "redirect:/login/login.do";
	    }else {
		
			int deleteResult = homeService.deleteSearchList();
			List<HomeSearchVO> searchList = homeService.listSearchList();
			model.addAttribute("searchList", searchList);
			    	  
	    	MemberVO result = mypageService.detail(loginUser.getMidx());
	  		model.addAttribute("vo", result);
	  		
	  		int Midx = loginUser.getMidx();
			list.setMidx(Midx);
	  		
	  		List<MyQnaVO> QnAlist = mypageService.myquestion(list);
	  		model.addAttribute("QnAlist", QnAlist);
	  		
	  		follow.setMidx(Midx);
	  		int following = mypageService.following_cnt(follow);
	  		model.addAttribute("following", following);
	  		
	  		int fmidx = loginUser.getMidx();
	  		follow.setFmidx(fmidx);
	  		
	  		int follower = mypageService.follower_cnt(follow);
	  		model.addAttribute("follower", follower);
	  		
	  		int stroyCnt = mypageService.stroyCnt(Midx);
	  		model.addAttribute("stroyCnt", stroyCnt);
	  		
	  		int likeCnt = mypageService.likeCnt(Midx);
	  		model.addAttribute("likeCnt", likeCnt);
	  		
	  		return "mypage/my_QnA";
		      
	    }
	}
	
	@RequestMapping(value = "/my_review.do", method = RequestMethod.GET)
	public String my_review(Locale locale, Model model, SearchVO vo, HttpServletRequest request, Store_reviewVO cnt, FollowVO follow) throws Exception {

		HttpSession session = request.getSession(); 
		MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");

	    if(loginUser == null) {
	         return "redirect:/login/login.do";
	    }else {
		
			int deleteResult = homeService.deleteSearchList();
			List<HomeSearchVO> searchList = homeService.listSearchList();
			model.addAttribute("searchList", searchList);
			    	  
	    	MemberVO result = mypageService.detail(loginUser.getMidx());
	  		model.addAttribute("vo", result);
	  		
	  		int Midx = loginUser.getMidx();
	  		cnt.setMidx(Midx);
	  		
	  		int review_cnt =  mypageService.ReviewCount(cnt);
	  		model.addAttribute("review_cnt", review_cnt);
	  		
	  		List<Store_reviewVO> Reviewlist = mypageService.myreview(cnt);
	  		model.addAttribute("Reviewlist", Reviewlist);
	  		
	  		follow.setMidx(Midx);
	  		int following = mypageService.following_cnt(follow);
	  		model.addAttribute("following", following);
	  		
	  		int fmidx = loginUser.getMidx();
	  		follow.setFmidx(fmidx);
	  		
	  		int follower = mypageService.follower_cnt(follow);
	  		model.addAttribute("follower", follower);
	  		
	  		int stroyCnt = mypageService.stroyCnt(Midx);
	  		model.addAttribute("stroyCnt", stroyCnt);
	  		
	  		int likeCnt = mypageService.likeCnt(Midx);
	  		model.addAttribute("likeCnt", likeCnt);
	  		
	  		
	  		return "mypage/my_review";
		      
	    }
	}
	
	@RequestMapping(value = "/myFollowing.do", method = RequestMethod.GET)
	public String myFollowing(Locale locale, Model model, SearchVO vo, HttpServletRequest request, MyFollowVO follow) throws Exception {

		HttpSession session = request.getSession(); 
		MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");

	    if(loginUser == null) {
	         return "redirect:/login/login.do";
	    }else {
			int deleteResult = homeService.deleteSearchList();
			List<HomeSearchVO> searchList = homeService.listSearchList();
			model.addAttribute("searchList", searchList);
			
			int fmidx = loginUser.getMidx();
			follow.setFmidx(fmidx);
			List<MyFollowVO> followList = mypageService.myFollower(follow);
			model.addAttribute("followList", followList);
			
			
			int Midx = loginUser.getMidx();
			follow.setMidx(Midx);
			List<MyFollowVO> followingList = mypageService.myFollowing(follow);
			model.addAttribute("followingList", followingList);
		
				
			return "mypage/myFollowing";
	    }
	}
	
	
	
	
	
	
	@RequestMapping(value = "/detailOrder.do", method = RequestMethod.GET)
	public String detailOrder(Locale locale, Model model, SearchVO vo, HttpServletRequest request, OrderListVO orderlist, HttpServletResponse response) throws Exception {
		
		response.setHeader("Cache-Control","no-store");
		
		HttpSession session = request.getSession(); 
		MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");

	    if(loginUser == null) {
	         return "redirect:/login/login.do";
	    }else {
		
			int deleteResult = homeService.deleteSearchList();
			List<HomeSearchVO> searchList = homeService.listSearchList();
			model.addAttribute("searchList", searchList);
			
			int midx = loginUser.getMidx();
			orderlist.setMidx(midx);

			
			List<OrderListVO> detailOrder = mypageService.detailOrder(orderlist);
			model.addAttribute("detailOrder", detailOrder);
			
			//MemberVO result = mypageService.detail(midx); 
			//model.addAttribute("vo", result);
	  	
	  		return "mypage/detailOrder";
		      
	    }
	}
	
	
	
	
	@RequestMapping(value = "/payment.do", method = RequestMethod.GET)
	public String payment(Locale locale, Model model, SearchVO vo, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		response.setHeader("Cache-Control","no-store");
		HttpSession session = request.getSession(); 
		MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");

	    if(loginUser == null) {
	         return "redirect:/login/login.do";
	    }else {
		
			int deleteResult = homeService.deleteSearchList();
			
			List<HomeSearchVO> searchList = homeService.listSearchList();
			
			model.addAttribute("searchList", searchList);
				
			return "mypage/payment";
	    }
	}
	
	@RequestMapping(value = "/order_success.do", method = RequestMethod.GET)
	public String order_success(Locale locale, Model model, SearchVO vo, HttpServletRequest request) throws Exception {

		HttpSession session = request.getSession(); 
		MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");

	    if(loginUser == null) {
	         return "redirect:/login/login.do";
	    }else {
	
			int deleteResult = homeService.deleteSearchList();
			
			List<HomeSearchVO> searchList = homeService.listSearchList();
			
			model.addAttribute("searchList", searchList);
				
			return "mypage/order_success";
	    }
	}
	
	@RequestMapping(value = "/order_fail.do", method = RequestMethod.GET)
	public String order_fail(Locale locale, Model model, SearchVO vo, HttpServletRequest request) throws Exception {

		HttpSession session = request.getSession(); 
		MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");

	    if(loginUser == null) {
	         return "redirect:/login/login.do";
	    }else {
		
			int deleteResult = homeService.deleteSearchList();
			
			List<HomeSearchVO> searchList = homeService.listSearchList();
			
			model.addAttribute("searchList", searchList);
				
			return "mypage/order_fail";
	    }
	}
	
	@RequestMapping(value = "/basket.do", method = RequestMethod.GET)
	public String basket(Locale locale, Model model, SearchVO vo, HttpServletRequest request, HttpServletResponse response) throws Exception {

		response.setHeader("Cache-Control","no-store");
		
		HttpSession session = request.getSession(); 
		MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");

		String nowUri = request.getRequestURI();
			
		session.setAttribute("nowUri", nowUri);

	    if(loginUser == null) {
	         return "redirect:/login/login.do";
	    }else {
		
			int deleteResult = homeService.deleteSearchList();
			
			List<HomeSearchVO> searchList = homeService.listSearchList();
			
			model.addAttribute("searchList", searchList);
				
			List<BasketVO> basketListAll = basketService.listBasket(loginUser);
			
			model.addAttribute("basketListAll", basketListAll);
			
			return "mypage/basket";
			
	    }
	}
	
	
	@RequestMapping(value = "/password_check.do", method = RequestMethod.GET)
	public String password_check(Locale locale, Model model, SearchVO vo, HttpServletRequest request) throws Exception {

		HttpSession session = request.getSession(); 
		MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");

	    if(loginUser == null) {
	         return "redirect:/login/login.do";
	    }else {
		
			int deleteResult = homeService.deleteSearchList();
			
			List<HomeSearchVO> searchList = homeService.listSearchList();
			
			model.addAttribute("searchList", searchList);
				
			return "mypage/password_check";
	    }
	}
	

	@RequestMapping(value = "/password_check.do", method = RequestMethod.POST)
	public String password_checkOK(Locale locale, Model model,String pass, HttpServletRequest request) throws Exception {

		HttpSession session = request.getSession(); 
		MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");

	    if(loginUser == null) {
	         return "redirect:/login/login.do";
	    }else {
		
			int deleteResult = homeService.deleteSearchList();
			
			List<HomeSearchVO> searchList = homeService.listSearchList();
			
			model.addAttribute("searchList", searchList);
					
		    model.addAttribute("loginUser", loginUser);
		    
			int Midx = loginUser.getMidx();
			
			MemberVO vo = new MemberVO();
			vo.setMidx(Midx);
			vo.setPass(pass);
			
			MemberVO checkPass = mypageService.checkPwd(vo);
		    
		    if(checkPass == null) {
		    	 return "mypage/password_check_fail";
		    }else {
		    	return "mypage/password_modify";
		    }
	    }
	}
	
	
	@RequestMapping(value = "/password_modify.do", method = RequestMethod.GET)
	public String password_modify(Locale locale, Model model, SearchVO vo, HttpServletRequest request) throws Exception {

		HttpSession session = request.getSession(); 
		MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");

	    if(loginUser == null) {
	         return "redirect:/login/login.do";
	    }else {
		
			int deleteResult = homeService.deleteSearchList();
			
			List<HomeSearchVO> searchList = homeService.listSearchList();
			
			model.addAttribute("searchList", searchList);
			
		    model.addAttribute("loginUser", loginUser);
				
			return "mypage/password_modify";
	    }
	}
	
	@RequestMapping(value = "/password_modify.do", method = RequestMethod.POST)
	public String password_modifyOK(Locale locale, Model model, MemberVO vo, HttpServletRequest request) throws Exception {

		HttpSession session = request.getSession(); 
		MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");

	    if(loginUser == null) {
	         return "redirect:/login/login.do";
	    }else {
		
			int deleteResult = homeService.deleteSearchList();
			List<HomeSearchVO> searchList = homeService.listSearchList();
			model.addAttribute("searchList", searchList);
			
		    vo.getMidx();
		  	int result = mypageService.updatePwd(vo);
				
			session.setAttribute("loginUser", null);
	
			return "redirect:"+request.getContextPath()+"/login/login.do";
	    }
	}
	
	
	@RequestMapping(value = "/review_list.do", method = RequestMethod.GET)
	public String review_list(Locale locale, Model model, SearchVO vo, HttpServletRequest request) throws Exception {

		HttpSession session = request.getSession(); 
		MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");

	    if(loginUser == null) {
	         return "redirect:/login/login.do";
	    }else {
		
			int deleteResult = homeService.deleteSearchList();
			
			List<HomeSearchVO> searchList = homeService.listSearchList();
			
			model.addAttribute("searchList", searchList);
				
			return "mypage/review_list";
	    }
	}
		
	
	//리뷰삭제
		@RequestMapping(value = "/mypage_review_del.do", method = RequestMethod.POST)
		public @ResponseBody String mypage_review_delOK(HttpServletRequest request, Locale locale, Model model,int spidx, int sridx, int midx) throws Exception {
			
			int deleteResult = homeService.deleteSearchList();
			
			List<HomeSearchVO> searchList = homeService.listSearchList();
			
			model.addAttribute("searchList", searchList);
			
			HttpSession session = request.getSession();
			MemberVO member = (MemberVO)session.getAttribute("loginUser");
			
			int result=0;
			if(member==null) {return "redirect:/login/login.do";}
			if(member.getMidx() == midx) {
				result = storeService.store_review_del(sridx);
			}
			
			//상품 별점 및 리뷰갯수 갱신
			StoreVO svo = new StoreVO();
			svo = storeService.store_review_cnt(spidx);
			svo.setSpidx(spidx);
			double score = svo.getScore()/svo.getReview_cnt();
			
			score = Math.round(score * 10) / 10.0;

			svo.setScore(score);
			storeService.store_review_change(svo);
			//--
			
			
			return result+"";
		}
		
	
	
	@RequestMapping(value = "/review_insert.do", method = RequestMethod.GET)
	public String review_insert(Locale locale, Model model, SearchVO vo, HttpServletRequest request) throws Exception {

		HttpSession session = request.getSession(); 
		MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");

	    if(loginUser == null) {
	         return "redirect:/login/login.do";
	    }else {
		
			int deleteResult = homeService.deleteSearchList();
			
			List<HomeSearchVO> searchList = homeService.listSearchList();
			
			model.addAttribute("searchList", searchList);
				
			return "mypage/review_insert";
	    }
	}
	
	@RequestMapping(value = "/delivery.do", method = RequestMethod.GET)
	public String delivery(Locale locale, Model model, SearchVO vo, HttpServletRequest request) throws Exception {

		HttpSession session = request.getSession(); 
		MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");

	    if(loginUser == null) {
	         return "redirect:/login/login.do";
	    }else {
		
			int deleteResult = homeService.deleteSearchList();
			
			List<HomeSearchVO> searchList = homeService.listSearchList();
			
			model.addAttribute("searchList", searchList);
				
			return "mypage/delivery";
	    }
	}
	
	@RequestMapping(value = "/address_list.do", method = RequestMethod.GET)
	public String address_list(Locale locale, Model model, SearchVO vo, HttpServletRequest request) throws Exception {

		HttpSession session = request.getSession(); 
		MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");

	    if(loginUser == null) {
	         return "redirect:/login/login.do";
	    }else {
		
			int deleteResult = homeService.deleteSearchList();
			
			List<HomeSearchVO> searchList = homeService.listSearchList();
			
			model.addAttribute("searchList", searchList);
				
			return "mypage/address_list";
	    }
	}
	
	@RequestMapping(value = "/address_insert.do", method = RequestMethod.GET)
	public String address_insert(Locale locale, Model model, SearchVO vo, HttpServletRequest request) throws Exception {

		HttpSession session = request.getSession(); 
		MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");

	    if(loginUser == null) {
	         return "redirect:/login/login.do";
	    }else {
		
			int deleteResult = homeService.deleteSearchList();
			
			List<HomeSearchVO> searchList = homeService.listSearchList();
			
			model.addAttribute("searchList", searchList);
				
			return "mypage/address_insert";
	    }
	}
	
	@RequestMapping(value = "/address_modify.do", method = RequestMethod.GET)
	public String address_modify(Locale locale, Model model, SearchVO vo, HttpServletRequest request) throws Exception {

		HttpSession session = request.getSession(); 
		MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");

	    if(loginUser == null) {
	         return "redirect:/login/login.do";
	    }else {
		
			int deleteResult = homeService.deleteSearchList();
			
			List<HomeSearchVO> searchList = homeService.listSearchList();
			
			model.addAttribute("searchList", searchList);
				
			return "mypage/address_modify";
	    }
	}
	
	@RequestMapping(value = "/payment.do", method = RequestMethod.POST)
	public String payment(Locale locale, Model model, BasketVO vo, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		response.setHeader("Cache-Control","no-store");
		
		HttpSession session = request.getSession();
		MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");
		
	    if(loginUser == null) {
	         return "redirect:/login/login.do";
	    }else {
		
			String sbidxStr = vo.getSbidxStr();
			String[] sbidxArray = sbidxStr.split(",");
			vo.setSbidxArray(sbidxArray);
			
			session.setAttribute("BasketVO", vo);
			
			List<BasketVO> basketList = basketService.listPayFromBasket(vo);
			
			LocalDateTime now = LocalDateTime.now(); 
			String ordernumber = now.format(DateTimeFormatter.ofPattern("YYMMddHHmmss"));
			
			int midx = loginUser.getMidx();
			String midxStr = Integer.toString(midx);
			if(midx < 10) {
				ordernumber += "000" + midxStr;
			}else if(midx < 100 && midx > 9) {
				ordernumber += "00" + midxStr;
			}else if(midx < 1000 && midx > 99) {
				ordernumber += "0" + midxStr;
			}else {
				ordernumber += midxStr;
			}
			
			int paidAmount = 0;
			
			for(int i = 0; i < basketList.size(); i++) {
			   
			   int price = basketList.get(i).getPrice();
			   int cnt = basketList.get(i).getCnt();
			   
			   paidAmount += (price * cnt);
			}
			
			PayInfoVO payInfovo = new PayInfoVO();
			payInfovo.setMidx(loginUser.getMidx());
			payInfovo.setAmount(Integer.toString(paidAmount));
			payInfovo.setPaynumber(ordernumber);
			
			model.addAttribute("payInfovo", payInfovo);
			
			int insertPaymentResult = basketService.insertPaymentInfo(payInfovo);
			
			if(insertPaymentResult > 0) {
				model.addAttribute("basketList", basketList);
				
				return "mypage/payment";
			}else {
				payInfovo.setErrorMsg("비정상적인 접근 error01"); // 주문 목록 불러오기 실패
				model.addAttribute("payInfovo", payInfovo);
				
				return "mypage/order_fail";
			}
	    }
	}
	
	
	@RequestMapping(value = "/deleteOneBasket", method = RequestMethod.POST)
	@ResponseBody
	public String deleteOneBasket(Locale locale, Model model, BasketVO vo, HttpServletRequest request) throws Exception {
		
		String sbidxStr = request.getParameter("sbidx");
		int sbidx = Integer.parseInt(sbidxStr);
		
		vo.setSbidx(sbidx);
		
		int result = basketService.deleteOneBasket(vo);
		
		if(result > 0) {
			return "success";
		}else {
			return "fail";
		}
	}
	
	@RequestMapping(value = "/minusCntBasket", method = RequestMethod.POST)
	@ResponseBody
	public String minusCntBasket(Locale locale, Model model, BasketVO vo, HttpServletRequest request) throws Exception {
		
		String sbidxStr = request.getParameter("sbidx");
		int sbidx = Integer.parseInt(sbidxStr);
		
		vo.setSbidx(sbidx);
		
		int result = basketService.minusCntBasket(vo);
		
		if(result > 0) {
			return "success";
		}else {
			return "fail";
		}
	}
	
	@RequestMapping(value = "/plusCntBasket", method = RequestMethod.POST)
	@ResponseBody
	public String plusCntBasket(Locale locale, Model model, BasketVO vo, HttpServletRequest request) throws Exception {
		
		String sbidxStr = request.getParameter("sbidx");
		int sbidx = Integer.parseInt(sbidxStr);
		
		vo.setSbidx(sbidx);
		
		int result = basketService.plusCntBasket(vo);
		
		if(result > 0) {
			return "success";
		}else {
			return "fail";
		}
	}
	
	@RequestMapping(value = "/CheckedListBasket", method = RequestMethod.POST)
	@ResponseBody
	public String CheckedListBasket(Locale locale, Model model, BasketVO vo, HttpServletRequest request) throws Exception {
		
		String checkedSbidx = request.getParameter("checkedSbidx");
		String[] sbidxArray = checkedSbidx.split(",");
		vo.setSbidxArray(sbidxArray);
		
		List<BasketVO> CheckedList = basketService.CheckedListBasket(vo);
		
		model.addAttribute("CheckedList", CheckedList);
		
		if(CheckedList.size() > 0) {
			return "success";
		}else {
			return "fail";
		}
	}
	
	/*
	 * @RequestMapping(value = "/deleteListBasket", method = RequestMethod.POST)
	 * 
	 * @ResponseBody public String deleteListBasket(Locale locale, Model model,
	 * BasketVO vo, HttpServletRequest request) throws Exception {
	 * 
	 * String sbidxStr = request.getParameter("sbidxStr"); String[] sbidxArray =
	 * sbidxStr.split(","); vo.setSbidxArray(sbidxArray);
	 * 
	 * int result = basketService.deleteListBasket(vo);
	 * 
	 * if(result > 0) { return "success"; }else { return "fail"; } }
	 */
	
	/*
	 * @RequestMapping(value = "/insertOrderList", method = RequestMethod.POST)
	 * 
	 * @ResponseBody public String insertOrderList(Locale locale, Model model,
	 * BasketVO vo, HttpServletRequest request) throws Exception {
	 * 
	 * String ordernumber = request.getParameter("ordernumber");
	 * vo.setOrdernumber(ordernumber); vo.setPaynumber(ordernumber);
	 * 
	 * String sbidxStr = request.getParameter("sbidxStr"); String[] sbidxArray =
	 * sbidxStr.split(",");
	 * 
	 * int size = sbidxArray.length; int totalResult = 0;
	 * 
	 * for(int i=0; i<size; i++) { vo.setSbidx(Integer.parseInt(sbidxArray[i])); int
	 * result = basketService.insertOrderList(vo); totalResult += result; }
	 * 
	 * if(totalResult == size) { return "success"; }else { return "fail"; } }
	 */
	
	@RequestMapping(value = "/directPayment.do", method = RequestMethod.GET)
	public String directPayment(Locale locale, Model model, BasketVO vo, HttpServletRequest request) throws Exception {

		HttpSession session = request.getSession(); 
		MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");

	    if(loginUser == null) {
	         return "redirect:/login/login.do";
	    }else {
		
			int midx = Integer.parseInt(request.getParameter("midx"));
			int spidx = Integer.parseInt(request.getParameter("spidx"));
			int cnt = Integer.parseInt(request.getParameter("cnt"));
			
			if(midx != loginUser.getMidx()) {
				return "redirect:/login/login.do";
			}
			
			vo.setSpidx(spidx);
			BasketVO directvo = basketService.directPayFromProduct(vo);
			directvo.setCnt(cnt);
			directvo.setMidx(loginUser.getMidx());
			directvo.setPrice(directvo.getSale_price());
				
			LocalDateTime now = LocalDateTime.now(); 
			String ordernumber = now.format(DateTimeFormatter.ofPattern("YYMMddHHmmss"));
			
			String midxStr = Integer.toString(midx);
			if(midx < 10) {
				ordernumber += "000" + midxStr;
			}else if(midx < 100 && midx > 9) {
				ordernumber += "00" + midxStr;
			}else if(midx < 1000 && midx > 99) {
				ordernumber += "0" + midxStr;
			}else {
				ordernumber += midxStr;
			}
			
			int paidAmount = (directvo.getPrice() * directvo.getCnt());
			
			PayInfoVO payInfovo = new PayInfoVO();
			payInfovo.setMidx(loginUser.getMidx());
			payInfovo.setAmount(Integer.toString(paidAmount));
			payInfovo.setPaynumber(ordernumber);
			
			model.addAttribute("payInfovo", payInfovo);
			
			int insertPaymentResult = basketService.insertPaymentInfo(payInfovo);
			
			if(insertPaymentResult > 0) {
				List<BasketVO> basketList = new ArrayList<BasketVO>();
				basketList.add(directvo);
				model.addAttribute("basketList", basketList);
				
				return "mypage/payment";
			}else {
				payInfovo.setErrorMsg("비정상적인 접근 error01"); // 주문 목록 불러오기 실패
				model.addAttribute("payInfovo", payInfovo);
				
				return "mypage/order_fail";
			}
	    }
	}
	
	@RequestMapping(value = "/fileUpload", method = RequestMethod.POST)
	@ResponseBody
	public String fileUpload(Locale locale, Model model, HttpServletRequest request, @RequestParam("imgFile") MultipartFile imgFile) throws Exception {
		
		//String savePath = "C://Users//lth-m//git//TeamProject2022//HomeFriends//src//main//webapp//resources//image";  // 파일이 저장될 프로젝트 안의 폴더 경로
		String savePath = request.getServletContext().getRealPath("/resources/image");  // 파일이 저장될 프로젝트 안의 폴더 경로
		//String savePath ="C://Users//MYCOM//git//TeamProject2022//HomeFriends//src//main//webapp//resources//image";
		String savePath2 ="C://Users//MYCOM//git//TeamProject2022//HomeFriends//src//main//webapp//resources//image";
		
	    String originalFilename = imgFile.getOriginalFilename(); // fileName.jpg
	    String onlyFileName = originalFilename.substring(0, originalFilename.indexOf(".")); // fileName
	    String extension = originalFilename.substring(originalFilename.indexOf(".")); // .jpg
	     
	    String rename = onlyFileName + "_" + getCurrentDayTime() + extension; // fileName_20150721-14-07-50.jpg
	    String fullPath = savePath + "//" + rename;
	    
	    String extension3 = extension.trim();
	    String extension2 = extension3.toLowerCase();
	    
	    if(!extension2.equals(".png") && !extension2.equals(".jfif") && !extension2.equals(".bmp") && !extension2.equals(".rle")
	    		 && !extension2.equals(".dib") && !extension2.equals(".jpg") && !extension2.equals(".gif") && !extension2.equals(".tif")
	    		 && !extension2.equals(".tiff") && !extension2.equals(".raw") && !extension2.equals(".webp")) {
	    	return "fail1";
	    }else if (!imgFile.isEmpty()) {
	    	String result = "";
	        try {
	            byte[] bytes = imgFile.getBytes();
	            BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(new File(fullPath)));
	            stream.write(bytes);
	            stream.close();
	           	
	            result = originalFilename+","+rename;
	        } catch (Exception e) {
	        	result = "fail2";
	        }
	        
	        return result;
	    } else {
	    	return "fail3";
	    }
	}
	
	public String getCurrentDayTime(){
	    long time = System.currentTimeMillis();
	    SimpleDateFormat dayTime = new SimpleDateFormat("yyyyMMddHHmmss", Locale.KOREA);
	    return dayTime.format(new Date(time));
	}
	
	@RequestMapping(value = "/payConfirm", method = RequestMethod.POST)
	public String payConfirm(Locale locale, Model model, PayInfoVO payInfovo, HttpServletRequest request) throws Exception {
		
		HttpSession session = request.getSession();
		MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");
		
		model.addAttribute("payInfovo", payInfovo);
		
		if(payInfovo.getErrorMsg() == null || payInfovo.getErrorMsg().equals("")) {
			
			payInfovo.setMidx(loginUser.getMidx());
//			payInfovo.setPaynumber(payInfovo.getMerchantUid());
			payInfovo.setAmount(payInfovo.getPaidAmount());
			
			PayInfoVO checkvo = basketService.payConfirm(payInfovo);
			
			if(checkvo != null) {
				
				// insertOrderList
				String ordernumber = payInfovo.getMerchantUid();
					
				BasketVO basketvo = (BasketVO)session.getAttribute("BasketVO");
				
				basketvo.setOrdernumber(ordernumber);
				basketvo.setPaynumber(ordernumber);
				
				String[] sbidxArray = basketvo.getSbidxArray();
				
				int size = sbidxArray.length;
				int totalResult = 0;
				
				for(int i=0; i<size; i++) {
					basketvo.setSbidx(Integer.parseInt(sbidxArray[i]));
					int result = basketService.insertOrderList(basketvo);
					totalResult += result;
				}
				
				if(totalResult != size) {
					payInfovo.setErrorMsg("비정상적인 접근 error02"); // 주문 내역에 추가 실패
					model.addAttribute("payInfovo", payInfovo);
					
					return "mypage/order_fail";
				}				
				
				// deleteBasketList
				int result = basketService.deleteListBasket(basketvo);
				
				if(result < 1) {
					payInfovo.setErrorMsg("비정상적인 접근 error03"); // 장바구니 목록에서 삭제 실패
					model.addAttribute("payInfovo", payInfovo);
					
					return "mypage/order_fail";
				}				
				
				return "mypage/order_success"; 
				
			}else {
				payInfovo.setErrorMsg("비정상적인 접근 error04"); // 결제 정보 검증 실패
				model.addAttribute("payInfovo", payInfovo);
				
				return "mypage/order_fail";
			}
		
		}else {
			
			return "mypage/order_fail";			
		}
	}	
}
