package edu.study.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.study.service.Community_BoardService;
import edu.study.service.HomeService;
import edu.study.service.StoreService;
import edu.study.vo.Community_BoardVO;
import edu.study.vo.HomeSearchVO;
import edu.study.vo.HomeStoreVO;
import edu.study.vo.HomeStoryVO;
import edu.study.vo.SearchVO;
import edu.study.vo.StoreVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	private HomeService homeService;
	@Autowired
	private Community_BoardService Community_boardService;
	@Autowired
	private StoreService storeService;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 * @throws Exception 
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) throws Exception {
		
		int deleteResult = homeService.deleteSearchList();
		
		List<HomeSearchVO> searchList = homeService.listSearchList();
		
		model.addAttribute("searchList", searchList);
		
		List<Community_BoardVO> list = Community_boardService.list();
	      
	    model.addAttribute("list",list);
	    
	    SearchVO searchvo = new SearchVO();
	    searchvo.setReview_cnt("yes");
	    List<StoreVO> storeList = storeService.list(searchvo);
	    
	    model.addAttribute("storeList",storeList);
				
		return "home";
	}
	
	@RequestMapping(value = "/search.do", method = RequestMethod.GET)
	public String search(Locale locale, Model model, HomeSearchVO vo) throws Exception {
		
		int insertResult = homeService.insertSearchList(vo);
		int deleteResult = homeService.deleteSearchList();
		
		List<HomeSearchVO> searchList = homeService.listSearchList();
		
		model.addAttribute("searchList", searchList);
		
		if(vo.getSearch_value() != null) {
			String searchVal = vo.getSearch_value();
			String[] splitStr = searchVal.split(",");
			String searchValueSplit = splitStr[0];
			vo.setSearch_value(searchValueSplit);
		}		
		
		model.addAttribute("searchvo", vo);
		
		List<HomeStoryVO> storyList = homeService.searchStory(vo);
		
		model.addAttribute("storyList", storyList);
		
		List<HomeStoreVO> storeList = homeService.searchStore(vo);
		
		model.addAttribute("storeList", storeList);
		
		if(storyList.size() > 0 || storeList.size() > 0) {
			return "search_result";
		}else {
			return "search_result_none";
		}
	}
	
	@RequestMapping(value = "/search_result.do", method = RequestMethod.GET)
	public String search_result(Locale locale, Model model) throws Exception {
		
		int deleteResult = homeService.deleteSearchList();
		
		List<HomeSearchVO> searchList = homeService.listSearchList();
		
		model.addAttribute("searchList", searchList);
		
		return "search_result";
	}
	
	@RequestMapping(value = "/search_result_none.do", method = RequestMethod.GET)
	public String search_result_none(Locale locale, Model model) throws Exception {
		
		int deleteResult = homeService.deleteSearchList();
		
		List<HomeSearchVO> searchList = homeService.listSearchList();
		
		model.addAttribute("searchList", searchList);
		
		SearchVO searchvo = new SearchVO();
	    searchvo.setReview_cnt("yes");
	    List<StoreVO> storeList = storeService.list(searchvo);
	    
	    model.addAttribute("storeList",storeList);
		
		return "search_result_none";
	}
		
	@RequestMapping(value = "/last_view.do", method = RequestMethod.GET)
	public String last_view(Locale locale, Model model) throws Exception {
		
		int deleteResult = homeService.deleteSearchList();
		
		List<HomeSearchVO> searchList = homeService.listSearchList();
		
		model.addAttribute("searchList", searchList);
		
		return "last_view";
	}
	
	@RequestMapping(value = "/recentView.do", method = RequestMethod.GET)
	public String recentView(Locale locale, Model model, HttpServletResponse response, HttpServletRequest request, HomeStoreVO vo) throws Exception {
		
		int deleteResult = homeService.deleteSearchList();
		
		List<HomeSearchVO> searchList = homeService.listSearchList();
		
		model.addAttribute("searchList", searchList);		
		
		
		
		
		
		
		Cookie[] myCookies = request.getCookies();
		String recentView = "0&";

	    for(int i = 0; i < myCookies.length; i++) {
	    	if(myCookies[i].getName().equals("recentView")) {
	    		recentView = myCookies[i].getValue();
	    	}
	    }
			    
		String[] spidxAryDup = recentView.split("&");
		
		System.out.println(spidxAryDup);
		
		// 배열을 HashSet으로 변환
		HashSet<String> hashSet = new HashSet<>(Arrays.asList(spidxAryDup));
		// HashSet을 배열로 변환
		String[] spidxAry = hashSet.toArray(new String[0]);
		// Dup이 제거된 배열 출력
		System.out.println(spidxAry.length);
		System.out.println(Arrays.toString(spidxAry));
		
		
		int size = spidxAry.length;
				
		String[] reversespidxAry = new String[size];
		
		for (int i = size - 1, j = 0; i >= 0; i--, j++) {
			reversespidxAry[j] = spidxAry[i];
		}
		
		List<HomeStoreVO> recentViewList = new ArrayList<HomeStoreVO>();
		
		if(size > 12) {
			for(int i=0; i<12; i++) {
				vo.setSpidx(Integer.parseInt(reversespidxAry[i]));
				HomeStoreVO recentvo = homeService.recentViewStore(vo);
				recentViewList.add(recentvo);
			}
		}else {
			for(int i=0; i<size; i++) {
				vo.setSpidx(Integer.parseInt(reversespidxAry[i]));
				HomeStoreVO recentvo = homeService.recentViewStore(vo);
				recentViewList.add(recentvo);
			}
		}
		
		model.addAttribute("recentViewList", recentViewList);
		
		return "recentView";
	}
	
}
