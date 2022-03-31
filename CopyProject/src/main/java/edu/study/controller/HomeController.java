package edu.study.controller;

import java.util.List;
import java.util.Locale;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import edu.study.service.HomeService;
import edu.study.vo.HomeSearchVO;
import edu.study.vo.HomeStoreVO;
import edu.study.vo.HomeStoryVO;
import edu.study.vo.MemberVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	private HomeService homeService;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 * @throws Exception 
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) throws Exception {
		
		int deleteResult = homeService.deleteSearchList();
		
		List<HomeSearchVO> searchList = homeService.listSearchList();
		
		model.addAttribute("searchList", searchList);
				
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
		
		return "search_result_none";
	}
		
	@RequestMapping(value = "/last_view.do", method = RequestMethod.GET)
	public String last_view(Locale locale, Model model) throws Exception {
		
		int deleteResult = homeService.deleteSearchList();
		
		List<HomeSearchVO> searchList = homeService.listSearchList();
		
		model.addAttribute("searchList", searchList);		
		
		return "last_view";
	}
	
}
