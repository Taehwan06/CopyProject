package edu.study.controller;

import java.util.List;


import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.study.service.HomeService;
import edu.study.service.MypageService;
import edu.study.vo.HomeSearchVO;
import edu.study.vo.HomeStoryVO;
import edu.study.vo.MemberVO;
import edu.study.vo.SearchVO;
import edu.study.vo.OrderListVO;

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
	 
	/**
	 * Simply selects the home view to render by returning its name.
	 * @throws Exception 
	 */
	@RequestMapping(value = "/mypage.do", method = RequestMethod.GET)
	public String mypage(Locale locale, Model model, SearchVO vo) throws Exception {
		
		int deleteResult = homeService.deleteSearchList();
		
		List<HomeSearchVO> searchList = homeService.listSearchList();
		
		model.addAttribute("searchList", searchList);
			
		int midx=1;
		MemberVO result = mypageService.detail(midx);
		model.addAttribute("vo", result);
		
		return "mypage/mypage"; 
	}
	
	@RequestMapping(value = "/member_modify.do", method = RequestMethod.GET)
	public String member_modify(Locale locale, Model model) throws Exception {
		
		int deleteResult = homeService.deleteSearchList();
		
		List<HomeSearchVO> searchList = homeService.listSearchList();
		
		model.addAttribute("searchList", searchList);
			
		int midx=1;
		MemberVO result = mypageService.detail(midx);
		
		model.addAttribute("vo", result);
		
		return "mypage/member_modify"; 
	}
	
	@RequestMapping(value = "/member_modify.do", method = RequestMethod.POST)
	public String member_modifyOk(Locale locale, Model model,MemberVO vo) throws Exception {
		
		int deleteResult = homeService.deleteSearchList();
		
		List<HomeSearchVO> searchList = homeService.listSearchList();
		
		model.addAttribute("searchList", searchList);
			
		vo.setMidx(1);
		int result = mypageService.update(vo);	
		
		return "mypage/mypage";
	}
	
	@RequestMapping(value = "/member_delete.do", method = RequestMethod.GET)
	public String member_delete(Locale locale, Model model) throws Exception {
		
		int deleteResult = homeService.deleteSearchList();
		
		List<HomeSearchVO> searchList = homeService.listSearchList();
		
		model.addAttribute("searchList", searchList);
			
		int midx=1;
		MemberVO result = mypageService.detail(midx);
		
		return "mypage/member_delete"; 
	}
	
	@RequestMapping(value = "/member_delete.do", method = RequestMethod.POST)
	public String member_deleteOk(Locale locale, Model model, MemberVO vo) throws Exception {
		
		int deleteResult = homeService.deleteSearchList();
		
		List<HomeSearchVO> searchList = homeService.listSearchList();
		
		model.addAttribute("searchList", searchList);
			
		vo.setMidx(1);
		int result = mypageService.delete(vo);	
		
		return "mypage/mypage";
	}
	
	
	@RequestMapping(value = "/order_list.do", method = RequestMethod.GET)
	public String order_list(Locale locale, Model model,OrderListVO vo ) throws Exception {
		
		int deleteResult = homeService.deleteSearchList();
		
		List<HomeSearchVO> searchList = homeService.listSearchList();
		
		model.addAttribute("searchList", searchList);
			
		vo.setMidx(1);
		List<OrderListVO> orderList = mypageService.orderList(vo);
		
		model.addAttribute("orderList", orderList);
		
		return "mypage/order_list";
		
	}
	
	@RequestMapping(value = "/payment.do", method = RequestMethod.GET)
	public String payment(Locale locale, Model model, SearchVO vo) throws Exception {
		
		int deleteResult = homeService.deleteSearchList();
		
		List<HomeSearchVO> searchList = homeService.listSearchList();
		
		model.addAttribute("searchList", searchList);
			
		return "mypage/payment";
	}
	
	@RequestMapping(value = "/order_success.do", method = RequestMethod.GET)
	public String order_success(Locale locale, Model model, SearchVO vo) throws Exception {
		
		int deleteResult = homeService.deleteSearchList();
		
		List<HomeSearchVO> searchList = homeService.listSearchList();
		
		model.addAttribute("searchList", searchList);
			
		return "mypage/order_success";
	}
	
	@RequestMapping(value = "/order_fail.do", method = RequestMethod.GET)
	public String order_fail(Locale locale, Model model, SearchVO vo) throws Exception {
		
		int deleteResult = homeService.deleteSearchList();
		
		List<HomeSearchVO> searchList = homeService.listSearchList();
		
		model.addAttribute("searchList", searchList);
			
		return "mypage/order_fail";
	}
	
	@RequestMapping(value = "/basket.do", method = RequestMethod.GET)
	public String basket(Locale locale, Model model, SearchVO vo) throws Exception {
		
		int deleteResult = homeService.deleteSearchList();
		
		List<HomeSearchVO> searchList = homeService.listSearchList();
		
		model.addAttribute("searchList", searchList);
			
		return "mypage/basket";
	}
	
	@RequestMapping(value = "/review_list.do", method = RequestMethod.GET)
	public String review_list(Locale locale, Model model, SearchVO vo) throws Exception {
		
		int deleteResult = homeService.deleteSearchList();
		
		List<HomeSearchVO> searchList = homeService.listSearchList();
		
		model.addAttribute("searchList", searchList);
			
		return "mypage/review_list";
	}
	
	@RequestMapping(value = "/review_insert.do", method = RequestMethod.GET)
	public String review_insert(Locale locale, Model model, SearchVO vo) throws Exception {
		
		int deleteResult = homeService.deleteSearchList();
		
		List<HomeSearchVO> searchList = homeService.listSearchList();
		
		model.addAttribute("searchList", searchList);
			
		return "mypage/review_insert";
	}
	
	@RequestMapping(value = "/delivery.do", method = RequestMethod.GET)
	public String delivery(Locale locale, Model model, SearchVO vo) throws Exception {
		
		int deleteResult = homeService.deleteSearchList();
		
		List<HomeSearchVO> searchList = homeService.listSearchList();
		
		model.addAttribute("searchList", searchList);
			
		return "mypage/delivery";
	}
	
	@RequestMapping(value = "/mileage.do", method = RequestMethod.GET)
	public String mileage(Locale locale, Model model, SearchVO vo) throws Exception {
		
		int deleteResult = homeService.deleteSearchList();
		
		List<HomeSearchVO> searchList = homeService.listSearchList();
		
		model.addAttribute("searchList", searchList);
			
		return "mypage/mileage";
	}
	
	@RequestMapping(value = "/address_list.do", method = RequestMethod.GET)
	public String address_list(Locale locale, Model model, SearchVO vo) throws Exception {
		
		int deleteResult = homeService.deleteSearchList();
		
		List<HomeSearchVO> searchList = homeService.listSearchList();
		
		model.addAttribute("searchList", searchList);
			
		return "mypage/address_list";
	}
	
	@RequestMapping(value = "/address_insert.do", method = RequestMethod.GET)
	public String address_insert(Locale locale, Model model, SearchVO vo) throws Exception {
		
		int deleteResult = homeService.deleteSearchList();
		
		List<HomeSearchVO> searchList = homeService.listSearchList();
		
		model.addAttribute("searchList", searchList);
			
		return "mypage/address_insert";
	}
	
	@RequestMapping(value = "/address_modify.do", method = RequestMethod.GET)
	public String address_modify(Locale locale, Model model, SearchVO vo) throws Exception {
		
		int deleteResult = homeService.deleteSearchList();
		
		List<HomeSearchVO> searchList = homeService.listSearchList();
		
		model.addAttribute("searchList", searchList);
			
		return "mypage/address_modify";
	}
	
	
}
