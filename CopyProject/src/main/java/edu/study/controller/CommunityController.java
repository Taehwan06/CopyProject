package edu.study.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;

import edu.study.service.Community_BoardService;
import edu.study.service.HomeService;
import edu.study.vo.AttatchImageVO;
import edu.study.vo.Community_BoardVO;
import edu.study.vo.HomeSearchVO;
import edu.study.vo.MemberVO;
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
	 * @return 
	 * @throws Exception 
	 */	
	@RequestMapping(value = "/home_insert.do", method = RequestMethod.GET)
	public String home_insert(Locale locale, Model model, SearchVO vo,HttpServletRequest req) throws Exception {
		
		int deleteResult = homeService.deleteSearchList();
		
		List<HomeSearchVO> searchList = homeService.listSearchList();
		
		model.addAttribute("searchList", searchList);
		
		HttpSession session = req.getSession(); 
	    MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");
	    	
	    if(loginUser == null) {
	         return "redirect:/login/login.do";
	      }else {
	         return "community/home_insert";
	      }
		
	}
	@RequestMapping(value = "/uploadAjaxAction", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public String uploadAjaxActionPOST(MultipartFile uploadFile,  Model model, Community_BoardVO boardVO) throws Exception {
	
		String uploadFolder = "C:\\Users\\82102\\git\\TeamProject2022\\HomeFriends\\src\\main\\webapp\\resources\\upload";
		
		/* 날짜 폴더 경로 */
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		Date date = new Date();
		
		String str = sdf.format(date);
		
		String datePath = str.replace("-", File.separator);
		
		/* 폴더 생성 */
		File uploadPath = new File(uploadFolder, datePath);
		
		if(uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}
		
		/* 이미지 정보 담는 객체 */
		AttatchImageVO ivo = new AttatchImageVO();
		
		/* Gson 생성 */
		Gson gson = new Gson();
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		
		/* 파일 이름 */
		String uploadFileName = uploadFile.getOriginalFilename();
		ivo.setFileName(uploadFileName);
		ivo.setUploadPath(datePath);
		
		
		/* uuid 적용 파일 이름 */
		String uuid = UUID.randomUUID().toString();
		ivo.setUuid(uuid);
		
		uploadFileName = uuid + "_" + uploadFileName;
		/* 파일 위치, 파일 이름을 합친 File 객체 */
		File saveFile = new File(uploadPath, uploadFileName);
		
		/* 파일 저장 */
		uploadFile.transferTo(saveFile);
		
		//key-value 형태로 맵에 저장
		map.put("ivo", ivo);
		
		// 맵을 JSON Object를 바꾸고 다시 문자열로 바꿈
	    String jsonString = gson.toJson(map);
	                
	    return jsonString;

	}
	
	@RequestMapping(value = "/home_insert.do", method = RequestMethod.POST)
	public String home_insert(Model model, Community_BoardVO boardVO, HttpServletRequest req) throws Exception {
		System.out.println();
		int deleteResult = homeService.deleteSearchList();
		
		List<HomeSearchVO> searchList = homeService.listSearchList();
		
		model.addAttribute("searchList", searchList);
		
		HttpSession session = req.getSession(); 
	    MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");
	    boardVO.setMidx(loginUser.getMidx());
	    boardVO.setWriter(loginUser.getNick_name());
		
		Community_boardService.insert(boardVO);
		
	
		return "redirect:home_view.do?cbidx="+boardVO.getCbidx();
	}
	@RequestMapping(value = "/home_modify.do", method = RequestMethod.GET)
	public String home_modify(Locale locale, Model model, int cbidx, HttpServletRequest req) throws Exception {
		
		int deleteResult = homeService.deleteSearchList();
		
		List<HomeSearchVO> searchList = homeService.listSearchList();
		
		model.addAttribute("searchList", searchList);
		
		Community_BoardVO vo = Community_boardService.detail(cbidx);
	      
	    model.addAttribute("vo",vo);
		
		return "community/home_modify";
	}
	@RequestMapping(value = "/home_modify.do", method = RequestMethod.POST)
	public String home_modify(Locale locale, Model model, Community_BoardVO boardVO) throws Exception {
		
		int deleteResult = homeService.deleteSearchList();
		
		List<HomeSearchVO> searchList = homeService.listSearchList();
		
		model.addAttribute("searchList", searchList);
		
		Community_boardService.update(boardVO);
		
		return "redirect:home_view.do?cbidx="+boardVO.getCbidx();
	}
	
	@RequestMapping(value = "/home_delete.do", method = RequestMethod.POST)
	public String home_delete(Locale locale, Model model, int cbidx) throws Exception {
		
		int deleteResult = homeService.deleteSearchList();
		
		List<HomeSearchVO> searchList = homeService.listSearchList();
		
		model.addAttribute("searchList", searchList);
		
		Community_boardService.delete(cbidx);
		
		return "redirect:home_list.do";
	}
	
	@RequestMapping(value = "/home_story.do", method = RequestMethod.GET)
	public String home_story(Locale locale, Model model, SearchVO vo,HttpServletRequest req) throws Exception {
		
		int deleteResult = homeService.deleteSearchList();
		
		List<HomeSearchVO> searchList = homeService.listSearchList();
		
		model.addAttribute("searchList", searchList);
		
		List<Community_BoardVO> list = Community_boardService.list();
		
		model.addAttribute("list",list);
		
		Community_BoardVO Comm_Main = Community_boardService.getCommunity_Mainimage();
		
		model.addAttribute("CommMain",Comm_Main);
		
		HttpSession session = req.getSession(); 
	    MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");
	    model.addAttribute("loginUser", loginUser);
	    
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
