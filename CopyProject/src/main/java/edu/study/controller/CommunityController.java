package edu.study.controller;

import java.io.File;
import java.util.List;
import java.util.Locale;
import java.util.UUID;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.study.service.Community_BoardService;
import edu.study.service.HomeService;
import edu.study.vo.Community_BoardVO;
import edu.study.vo.HomeSearchVO;
import edu.study.vo.SearchVO;

/**
 * Handles requests for the application home page.
 */
@RequestMapping(value="/community")
@Controller
public class CommunityController {
	
	@Autowired
	private Community_BoardService Community_boardService;
	@Autowired
	private HomeService homeService;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 * @throws Exception 
	 */
	@RequestMapping(value = "/home_insert.do", method = RequestMethod.GET)
	public String home_insert(Locale locale, Model model, SearchVO vo) throws Exception {
		
		int deleteResult = homeService.deleteSearchList();
		
		List<HomeSearchVO> searchList = homeService.listSearchList();
		
		model.addAttribute("searchList", searchList);
		
		return "community/home_insert";
		
	}
	
	@RequestMapping(value = "/home_insert.do", method = RequestMethod.POST)
	public String home_insert(Model model, Community_BoardVO boardVO, RedirectAttributes rttr) throws Exception {
		
		int deleteResult = homeService.deleteSearchList();
		
		List<HomeSearchVO> searchList = homeService.listSearchList();
		
		model.addAttribute("searchList", searchList);
		//로그인 처리
		/*
		MemberVO memberVO = (MemberVO) session.getAttribute("adminSession");
		String nick_ = memberVO.getNick_name();
		boardVO.setWriter(nick_);
		
		boardVO.setContent(boardVO.getContent().replace("\r\n", "<br>"));
		*/
		//파일 업로드 처리
		String fileName = null;
		String originalFileName = null;
		String uploadPath = "C:\\Users\\82102\\git\\TeamProject2022\\HomeFriends\\src\\main\\webapp\\resources\\upload\\file\\";
		MultipartFile uploadFile = boardVO.getUploadFile();
		if (!uploadFile.isEmpty()) {
			originalFileName = uploadFile.getOriginalFilename();
			String ext = FilenameUtils.getExtension(originalFileName);	//확장자 구하기
			UUID uuid = UUID.randomUUID();	//UUID 구하기
			fileName=uuid+"."+ext;
			uploadFile.transferTo(new File(uploadPath + fileName));
		}
		boardVO.setFileName(fileName);
		boardVO.setImg_origin(originalFileName);
		
		Community_boardService.insert(boardVO);
	
		return "redirect:home_list.do";
	}
	@RequestMapping(value = "/home_modify.do", method = RequestMethod.GET)
	public String home_modify(Locale locale, Model model, int cbidx) throws Exception {
		
		int deleteResult = homeService.deleteSearchList();
		
		List<HomeSearchVO> searchList = homeService.listSearchList();
		
		model.addAttribute("searchList", searchList);
		
		Community_BoardVO vo = Community_boardService.detail(cbidx);
	      
	    model.addAttribute("vo",vo);
		
		return "community/home_modify";
	}
	
	@RequestMapping(value = "/home_delete.do", method = RequestMethod.GET)
	public String home_delete(Locale locale, Model model, int cbidx) throws Exception {
		
		int deleteResult = homeService.deleteSearchList();
		
		List<HomeSearchVO> searchList = homeService.listSearchList();
		
		model.addAttribute("searchList", searchList);
		
		Community_boardService.delete(cbidx);
		
		return "redirect:home_list.do";
	}
	
	@RequestMapping(value = "/home_story.do", method = RequestMethod.GET)
	public String home_story(Locale locale, Model model, SearchVO vo) throws Exception {
		
		int deleteResult = homeService.deleteSearchList();
		
		List<HomeSearchVO> searchList = homeService.listSearchList();
		
		model.addAttribute("searchList", searchList);
		
		List<Community_BoardVO> list = Community_boardService.list(vo);
		
		model.addAttribute("list",list);
		
		Community_BoardVO Comm_Main = Community_boardService.getCommunity_Mainimage();
		
		model.addAttribute("CommMain",Comm_Main);
		
		
		
		return "community/home_story";
	}
	
	@RequestMapping(value = "/home_list.do", method = RequestMethod.GET)
	public String home_list(Locale locale, Model model, SearchVO vo) throws Exception {
		
		int deleteResult = homeService.deleteSearchList();
		
		List<HomeSearchVO> searchList = homeService.listSearchList();
		
		model.addAttribute("searchList", searchList);
		
		List<Community_BoardVO> list = Community_boardService.list(vo);
		
		model.addAttribute("list",list);
		
		int listCnt = Community_boardService.getBoardlistCnt(vo);
		
		model.addAttribute("listCnt",listCnt);
		
		return "community/home_list";
	}
	
	@RequestMapping(value = "/home_view.do", method = RequestMethod.GET)
	public String home_view(Locale locale, Model model, int cbidx) throws Exception {
		
		int deleteResult = homeService.deleteSearchList();
		
		List<HomeSearchVO> searchList = homeService.listSearchList();
		
		model.addAttribute("searchList", searchList);
		
		Community_BoardVO vo = Community_boardService.detail(cbidx);
	      
	    model.addAttribute("vo",vo);
		
		return "community/home_view.jsp?cbidx="+vo.getCbidx();
	}
	
	@RequestMapping(value = "/following.do", method = RequestMethod.GET)
	public String following(Locale locale, Model model, SearchVO vo) throws Exception {
		
		int deleteResult = homeService.deleteSearchList();
		
		List<HomeSearchVO> searchList = homeService.listSearchList();
		
		model.addAttribute("searchList", searchList);
		
		return "community/following";
	}
	
	@RequestMapping(value = "/scrap.do", method = RequestMethod.GET)
	public String scrap(Locale locale, Model model, SearchVO vo) throws Exception {
		
		int deleteResult = homeService.deleteSearchList();
		
		List<HomeSearchVO> searchList = homeService.listSearchList();
		
		model.addAttribute("searchList", searchList);
				
		return "community/scrap";
	}
	
	@RequestMapping(value = "/qna.do", method = RequestMethod.GET)
	public String qna(Locale locale, Model model, SearchVO vo) throws Exception {
		
		int deleteResult = homeService.deleteSearchList();
		
		List<HomeSearchVO> searchList = homeService.listSearchList();
		
		model.addAttribute("searchList", searchList);
				
		return "community/qna";
	}
	
	@RequestMapping(value = "/qna_insert.do", method = RequestMethod.GET)
	public String qna_insert(Locale locale, Model model, SearchVO vo) throws Exception {
		
		int deleteResult = homeService.deleteSearchList();
		
		List<HomeSearchVO> searchList = homeService.listSearchList();
		
		model.addAttribute("searchList", searchList);
				
		return "community/qna_insert";
	}
	
	@RequestMapping(value = "/qna_modify.do", method = RequestMethod.GET)
	public String qna_modify(Locale locale, Model model, SearchVO vo) throws Exception {
		
		int deleteResult = homeService.deleteSearchList();
		
		List<HomeSearchVO> searchList = homeService.listSearchList();
		
		model.addAttribute("searchList", searchList);
				
		return "community/qna_modify";
	}
	
}
