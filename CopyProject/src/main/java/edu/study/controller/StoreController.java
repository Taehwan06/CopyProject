package edu.study.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.StringTokenizer;

import javax.servlet.http.Cookie;
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
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

import com.google.gson.Gson;

import edu.study.service.HomeService;
import edu.study.service.StoreService;
import edu.study.vo.BasketVO;
import edu.study.vo.HomeSearchVO;
import edu.study.vo.MemberVO;
import edu.study.vo.SearchVO;
import edu.study.vo.StoreVO;
import edu.study.vo.Store_qnaVO;

/**
 * Handles requests for the application home page.
 */
@RequestMapping(value="/store")
@Controller
@EnableWebMvc
public class StoreController {
	
	@Autowired
	private StoreService storeService;
	@Autowired
	private HomeService homeService;

	/**
	 * Simply selects the home view to render by returning its name.
	 * @throws Exception 
	 */
	@RequestMapping(value = "/store.do", method = RequestMethod.GET)
	public String store(Locale locale, Model model, SearchVO vo) throws Exception {
		
		int deleteResult = homeService.deleteSearchList();
		
		List<HomeSearchVO> searchList = homeService.listSearchList();
		
		model.addAttribute("searchList", searchList);
			
		List<List> list = new ArrayList<List>();
		
		vo.setDiscount("yes");
		List<StoreVO> list1 = storeService.list(vo);
		vo.setSell_cnt("yes");
		vo.setDiscount(null);
		List<StoreVO> list2 = storeService.list(vo);
		vo.setReview_cnt("yes");
		vo.setSell_cnt(null);
		List<StoreVO> list3 = storeService.list(vo);
		
		list.add(list1);
		list.add(list2);
		list.add(list3);
		
		model.addAttribute("list",list);
		
		
		return "store/store";
	}
	
	@RequestMapping(value = "/store_insert.do", method = RequestMethod.GET)
	public String store_insert(HttpServletRequest request, Locale locale, Model model, SearchVO vo) throws Exception {
		
		HttpSession session = request.getSession();
		MemberVO member = (MemberVO)session.getAttribute("loginUser");

		if(member==null) {return "redirect:/login/login.do";}
		if(!member.getGrade().equals("A")) {return "redirect:/store/store.do";}

		
		
		int deleteResult = homeService.deleteSearchList();
		
		List<HomeSearchVO> searchList = homeService.listSearchList();
		
		model.addAttribute("searchList", searchList);
			
		return "store/store_insert";
	}
	@RequestMapping(value = "/store_insert.do", method = RequestMethod.POST)
	public @ResponseBody String store_insertOK(HttpServletRequest request, Locale locale, Model model, StoreVO vo, @RequestParam String img_style) throws Exception {
		
		int deleteResult = homeService.deleteSearchList();
		
//		List<HomeSearchVO> searchList = homeService.listSearchList();
//		
//		model.addAttribute("searchList", searchList);
			
		int idx1 = img_style.indexOf("url(");
		int idx2 = img_style.lastIndexOf("\"");
		String new_img_style = img_style.substring(idx1+5, idx2);
		vo.setImg_origin(new_img_style);
		vo.setImg_system(new_img_style);
		StringTokenizer st = new StringTokenizer(vo.getDetail(), ",");
		String remain = "";
		while(st.hasMoreTokens()) {
		   String cur = st.nextToken();
		   if (cur.equals("0")) {
		       continue;
		    } 
		   remain = cur;
		   break;
		}
		vo.setDetail(remain);
		if(vo.getFree_delivery()!="N") {
			vo.setDelivery_charge("0");
		}
		
		
		
		HttpSession session = request.getSession();
		MemberVO member = (MemberVO)session.getAttribute("loginUser");
		
		
			
		vo.setMidx(member.getMidx());
		vo.setWriter(member.getMembername());
		
		
		storeService.insert(vo);

		return vo.getSpidx()+"";
		
	}
	
	@RequestMapping(value="/lookup", method = RequestMethod.GET, produces = "application/text; charset=UTF-8")
	public @ResponseBody String lookup(Locale locale, Model model, SearchVO vo) throws Exception {
		
		List<StoreVO> list = storeService.list(vo);
		
//		ResponseVO<StoreVO> response = new ResponseVO<StoreVO>();
//		response.setList(list);
//		HttpHeaders headers = new HttpHeaders();
//		headers.add("content-type", "application/json; charset=UTF-8");
//		
//		return new ResponseEntity<ResponseVO<StoreVO>>(response,headers, HttpStatus.OK);
		
		String json = new Gson().toJson(list);
	    return json;
	}
	
	
	@RequestMapping(value="/test", method = RequestMethod.GET)
	public @ResponseBody String test() throws Exception {
	    return "asdf";
	}
	
	@RequestMapping(value = "/store_modify.do", method = RequestMethod.GET)
	public String store_modify(HttpServletRequest request, Locale locale, Model model, int spidx) throws Exception {
		int deleteResult = homeService.deleteSearchList();
		List<HomeSearchVO> searchList = homeService.listSearchList();
		
		HttpSession session = request.getSession();
		MemberVO member = (MemberVO)session.getAttribute("loginUser");

		if(member==null) {return "redirect:/login/login.do";}
		if(!member.getGrade().equals("A")) {return "redirect:/store/store.do";}

		StoreVO selectOne = storeService.detail(spidx);
		
		model.addAttribute("vo",selectOne);
			
		return "store/store_modify";
	}
	
	@RequestMapping(value = "/store_modify.do", method = RequestMethod.POST)
	public @ResponseBody String store_modifyOK(HttpServletRequest request, Locale locale, Model model, StoreVO vo, @RequestParam String img_style) throws Exception {
		
		int deleteResult = homeService.deleteSearchList();
		
//		List<HomeSearchVO> searchList = homeService.listSearchList();
//		
//		model.addAttribute("searchList", searchList);
			
		int idx1 = img_style.indexOf("url(");
		int idx2 = img_style.lastIndexOf("\"");
		String new_img_style = img_style.substring(idx1+5, idx2);
		vo.setImg_origin(new_img_style);
		vo.setImg_system(new_img_style);
		StringTokenizer st = new StringTokenizer(vo.getDetail(), ",");
		String remain = "";
		while(st.hasMoreTokens()) {
		   String cur = st.nextToken();
		   if (cur.equals("0")) {
		       continue;
		    } 
		   remain = cur;
		   break;
		}
		vo.setDetail(remain);
		if(vo.getFree_delivery()!="N") {
			vo.setDelivery_charge("0");
		}
		
		
		
		HttpSession session = request.getSession();
		MemberVO member = (MemberVO)session.getAttribute("loginUser");
		
		
			
		vo.setMidx(member.getMidx());
		vo.setWriter(member.getMembername());
		
		
		int result = storeService.update(vo);

		return result+"";
		
	}
	
	@RequestMapping(value = "/store_del.do", method = RequestMethod.GET)
	public String store_del(HttpServletRequest request, Locale locale, Model model, int spidx) throws Exception {
		int deleteResult = homeService.deleteSearchList();
		List<HomeSearchVO> searchList = homeService.listSearchList();
		
		HttpSession session = request.getSession();
		MemberVO member = (MemberVO)session.getAttribute("loginUser");

		if(member==null) {return "redirect:/login/login.do";}
		if(!member.getGrade().equals("A")) {return "redirect:/store/store.do";}

		int result = storeService.delete(spidx);
		
		
		return "redirect:/store/store.do";
	}
	
	@RequestMapping(value = "/store_list.do", method = RequestMethod.GET)
	public String store_list(Locale locale, Model model, SearchVO vo, String type) throws Exception {
		
		int deleteResult = homeService.deleteSearchList();
		
		List<HomeSearchVO> searchList = homeService.listSearchList();
		
		model.addAttribute("searchList", searchList);
			
		if(type!=null) {
			if(type.equals("Discount")) {
				vo.setDiscount("yes");
			}else if(type.equals("sell_cnt")) {
				vo.setSell_cnt("yes");
			}else if(type.equals("review_cnt")) {
				vo.setReview_cnt("yes");
			}
		}
		if(type==null) {
			vo.setOrder("sell_cnt");
		}
		List<StoreVO> list = storeService.list(vo);
		
		model.addAttribute("list",list);
		
		return "store/store_list";
	}
	
	/*
	 * @RequestMapping(value = "/distribution.do", method = RequestMethod.GET)
	 * public List<StoreVO> store_list_distribution(Locale locale, Model
	 * model,SearchVO vo) throws Exception {
	 * 
	 * 
	 * 
	 * List<StoreVO> list = storeService.list(vo);
	 * 
	 * 
	 * 
	 * return list; }
	 */
	
	@RequestMapping(value = "/store_view.do", method = RequestMethod.GET)
	public String store_view(Locale locale, Model model, int spidx, HttpServletResponse response, HttpServletRequest request) throws Exception {
		
		
		// 최근 본 상품 처리 영역
		Cookie[] myCookies = request.getCookies();
		String recentView = null;
		
	    for(int i = 0; i < myCookies.length; i++) {
	    	if(myCookies[i].getName().equals("recentView")) {
	    		recentView = myCookies[i].getValue();
	    	}
	    }
		if(recentView == null) {
			recentView = ""+spidx;
		}else {
			recentView += "&"+spidx;
		}
		
		Cookie recentViewCookie = new Cookie("recentView", recentView);
		recentViewCookie.setMaxAge(60*60*24);
		recentViewCookie.setPath("/"); 
		response.addCookie(recentViewCookie);
	    // 최근 본 상품 영역 끝
	    
	    
		
		int deleteResult = homeService.deleteSearchList();
		
		List<HomeSearchVO> searchList = homeService.listSearchList();
		
		model.addAttribute("searchList", searchList);
	
		
		
		StoreVO selectOne = storeService.detail(spidx);
		
		model.addAttribute("vo",selectOne);
		
		List<Store_qnaVO> qnaList = storeService.qnaList(spidx);
		
		model.addAttribute("qnaList",qnaList);
		
		return "store/store_view";
	}
	
	
	@RequestMapping(value = "/basketIn.do", method = RequestMethod.GET)
	@ResponseBody
	public String basketIn(HttpServletRequest request,Locale locale, Model model,BasketVO vo) throws Exception {
	
		StoreVO svo = storeService.detail(vo.getSpidx());
		
		
		
		HttpSession session = request.getSession();

		MemberVO member = (MemberVO)session.getAttribute("loginUser");
		
		int midx=member.getMidx();
		
		vo.setMidx(midx);
		vo.setTitle(svo.getTitle());
		vo.setFree_delivery(svo.getFree_delivery());
		vo.setImg_origin(svo.getImg_origin());
		vo.setPrice(Integer.parseInt(svo.getSale_price()));
		vo.setDelivery_charge(Integer.parseInt(svo.getDelivery_charge()));
		vo.setImg_system(svo.getImg_origin());
		vo.setBrand(svo.getBrand());
		
		int result = storeService.basketIn(vo);
		
		 
	
		return result+""; 
	}
	
	
	@RequestMapping(value = "/category.do", method = RequestMethod.GET)
	public String category(Locale locale, Model model, SearchVO vo) throws Exception {
		
		int deleteResult = homeService.deleteSearchList();
		
		List<HomeSearchVO> searchList = homeService.listSearchList();
		
		model.addAttribute("searchList", searchList);
			
		return "store/category";
	}
	
	@RequestMapping(value = "/best.do", method = RequestMethod.GET)
	public String best(Locale locale, Model model, SearchVO vo) throws Exception {
		
		int deleteResult = homeService.deleteSearchList();
		
		List<HomeSearchVO> searchList = homeService.listSearchList();
		
		model.addAttribute("searchList", searchList);
			
		return "store/best";
	}
	
	@RequestMapping(value = "/hotdeal.do", method = RequestMethod.GET)
	public String hotdeal(Locale locale, Model model, SearchVO vo) throws Exception {
		
		int deleteResult = homeService.deleteSearchList();
		
		List<HomeSearchVO> searchList = homeService.listSearchList();
		
		model.addAttribute("searchList", searchList);
			
		return "store/hotdeal";
	}
	
	@RequestMapping(value = "/recommend.do", method = RequestMethod.GET)
	public String recommend(Locale locale, Model model, SearchVO vo) throws Exception {
		
		int deleteResult = homeService.deleteSearchList();
		
		List<HomeSearchVO> searchList = homeService.listSearchList();
		
		model.addAttribute("searchList", searchList);
			
		return "store/recommend";
	}
	
	@RequestMapping(value = "/likey.do", method = RequestMethod.GET)
	public String likey(Locale locale, Model model, SearchVO vo) throws Exception {
		
		int deleteResult = homeService.deleteSearchList();
		
		List<HomeSearchVO> searchList = homeService.listSearchList();
		
		model.addAttribute("searchList", searchList);
			
		return "store/likey";
	}
	
	@RequestMapping(value = "/event.do", method = RequestMethod.GET)
	public String event(Locale locale, Model model, SearchVO vo) throws Exception {
		
		int deleteResult = homeService.deleteSearchList();
		
		List<HomeSearchVO> searchList = homeService.listSearchList();
		
		model.addAttribute("searchList", searchList);
			
		return "store/event";
	}
	
	@RequestMapping(value = "/event_view.do", method = RequestMethod.GET)
	public String event_view(Locale locale, Model model, SearchVO vo) throws Exception {
		
		int deleteResult = homeService.deleteSearchList();
		
		List<HomeSearchVO> searchList = homeService.listSearchList();
		
		model.addAttribute("searchList", searchList);
			
		return "store/event_view";
	}
	
	
}
