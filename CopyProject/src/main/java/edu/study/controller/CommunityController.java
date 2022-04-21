package edu.study.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.UUID;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;

import edu.study.service.Community_BoardService;
import edu.study.service.Community_ReplyService;
import edu.study.service.FollowService;
import edu.study.service.HomeService;
import edu.study.service.MemberService;
import edu.study.service.ScrapService;
import edu.study.vo.AttatchImageVO;
import edu.study.vo.Community_BoardVO;
import edu.study.vo.Community_ReplyVO;
import edu.study.vo.FollowVO;
import edu.study.vo.HomeSearchVO;
import edu.study.vo.MemberVO;
import edu.study.vo.PagingVO;
import edu.study.vo.ScrapVO;
import edu.study.vo.SearchVO;

/**
 * Handles requests for the application home page.
 */
@RequestMapping(value = "/community")
@Controller
public class CommunityController {

	@Autowired
	private Community_BoardService Community_boardService;
	@Autowired
	private HomeService homeService;
	@Autowired
	private Community_ReplyService replyService;
	@Autowired
	private MemberService memberService;
	@Autowired
	private FollowService followService;
	@Autowired
	private ScrapService scrapService;

	/**
	 * Simply selects the home view to render by returning its name.
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/home_insert.do", method = RequestMethod.GET)
	public String home_insert(Locale locale, Model model, SearchVO vo, HttpServletRequest req) throws Exception {

		String nowUri = req.getRequestURI();

		HttpSession session = req.getSession();
		session.setAttribute("nowUri", nowUri);

		int deleteResult = homeService.deleteSearchList();

		List<HomeSearchVO> searchList = homeService.listSearchList();

		model.addAttribute("searchList", searchList);

		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");

		if (loginUser == null) {
			return "redirect:/login/login.do";
		} else {
			return "community/home_insert";
		}

	}

	@RequestMapping(value = "/uploadAjaxAction", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public String uploadAjaxActionPOST(MultipartFile uploadFile, Model model, Community_BoardVO boardVO)
			throws Exception {

		String uploadFolder = "C:\\Users\\82102\\git\\TeamProject2022\\HomeFriends\\src\\main\\webapp\\resources\\upload";

		/* 날짜 폴더 경로 */
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		Date date = new Date();

		String str = sdf.format(date);

		String datePath = str.replace("-", File.separator);

		/* 폴더 생성 */
		File uploadPath = new File(uploadFolder, datePath);

		if (uploadPath.exists() == false) {
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

		// key-value 형태로 맵에 저장
		map.put("ivo", ivo);

		// 맵을 JSON Object를 바꾸고 다시 문자열로 바꿈
		String jsonString = gson.toJson(map);

		return jsonString;

	}

	@RequestMapping(value = "/home_insert.do", method = RequestMethod.POST)
	public String home_insert(Model model, Community_BoardVO boardVO, HttpServletRequest req) throws Exception {

		int deleteResult = homeService.deleteSearchList();

		List<HomeSearchVO> searchList = homeService.listSearchList();

		model.addAttribute("searchList", searchList);

		HttpSession session = req.getSession();
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		boardVO.setMidx(loginUser.getMidx());
		boardVO.setWriter(loginUser.getNick_name());

		Community_boardService.insert(boardVO);

		return "redirect:home_view.do?cbidx=" + boardVO.getCbidx() + "&fmidx=" + boardVO.getMidx() +"&nowPage=1";
	}

	@RequestMapping(value = "/home_modify.do", method = RequestMethod.GET)
	public String home_modify(Locale locale, Model model, int cbidx, HttpServletRequest req) throws Exception {

		int deleteResult = homeService.deleteSearchList();

		List<HomeSearchVO> searchList = homeService.listSearchList();

		model.addAttribute("searchList", searchList);

		Community_BoardVO vo = Community_boardService.detail(cbidx);

		model.addAttribute("vo", vo);

		return "community/home_modify";
	}

	@RequestMapping(value = "/home_modify.do", method = RequestMethod.POST)
	public String home_modify(Locale locale, Model model, Community_BoardVO boardVO) throws Exception {

		int deleteResult = homeService.deleteSearchList();

		List<HomeSearchVO> searchList = homeService.listSearchList();

		model.addAttribute("searchList", searchList);

		Community_boardService.update(boardVO);

		return "redirect:home_view.do?cbidx=" + boardVO.getCbidx() + "&fmidx=" + boardVO.getMidx() + "&nowPage=1";
	}

	@RequestMapping(value = "/home_delete.do", method = RequestMethod.POST)
	public String home_delete(Locale locale, Model model, int cbidx) throws Exception {

		int deleteResult = homeService.deleteSearchList();

		List<HomeSearchVO> searchList = homeService.listSearchList();

		model.addAttribute("searchList", searchList);

		Community_boardService.delete(cbidx);

		return "redirect:home_list.do?&sort=recent";
	}

	@RequestMapping(value = "/home_story.do", method = RequestMethod.GET)
	public String home_story(Locale locale, Model model, SearchVO vo, HttpServletRequest req) throws Exception {

		String nowUri = req.getRequestURI();

		HttpSession session = req.getSession();
		session.setAttribute("nowUri", nowUri);

		int deleteResult = homeService.deleteSearchList();

		List<HomeSearchVO> searchList = homeService.listSearchList();

		model.addAttribute("searchList", searchList);

		List<Community_BoardVO> list = Community_boardService.list(vo);

		model.addAttribute("list", list);

		Community_BoardVO Comm_Main = Community_boardService.getCommunity_Mainimage();

		model.addAttribute("CommMain", Comm_Main);

		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		model.addAttribute("loginUser", loginUser);

		return "community/home_story";
	}

	@RequestMapping(value = "/home_list.do", method = RequestMethod.GET)
	public String home_list(Locale locale, Model model, SearchVO vo, HttpServletRequest req) throws Exception {

		String nowUri = req.getRequestURI();

		HttpSession session = req.getSession();
		session.setAttribute("nowUri", nowUri);

		int deleteResult = homeService.deleteSearchList();

		List<HomeSearchVO> searchList = homeService.listSearchList();

		model.addAttribute("searchList", searchList);

		List<Community_BoardVO> selectlist = Community_boardService.selectlist(vo);

		model.addAttribute("selectlist", selectlist);

		int listCnt = Community_boardService.getBoardlistCnt();

		model.addAttribute("listCnt", listCnt);

		return "community/home_list";
	}

	@RequestMapping(value = "/home_view.do", method = RequestMethod.GET)
	public String home_view(Locale locale, Model model, int cbidx, int nowPage, HttpServletRequest request,
			HttpServletResponse response, int fmidx) throws Exception {

		String nowUri = request.getRequestURI();

		HttpSession session = request.getSession();
		session.setAttribute("nowUri", nowUri + "?cbidx=" + cbidx + "&fmidx=" + fmidx + "&nowPage=1");

		int deleteResult = homeService.deleteSearchList();

		List<HomeSearchVO> searchList = homeService.listSearchList();

		model.addAttribute("searchList", searchList);

		Community_BoardVO vo = Community_boardService.detail(cbidx);

		model.addAttribute("vo", vo);

		// origin_cbridx
		Integer orincbridx = Community_boardService.cbridx();

		if (orincbridx == null) {
			orincbridx = 0;
		}
		model.addAttribute("orincbridx", orincbridx + 1);

		// 쿠키생성
		Cookie oldCookie = null;
		Cookie[] cookies = request.getCookies();
		if (cookies != null) {
			for (Cookie cookie : cookies) {
				if (cookie.getName().equals("HomeView")) {
					oldCookie = cookie;
				}
			}
		}

		if (oldCookie != null) {
			if (!oldCookie.getValue().contains("[" + cbidx + "]")) {
				Community_boardService.viewCount(cbidx);
				oldCookie.setValue(oldCookie.getValue() + "_[" + cbidx + "]");
				oldCookie.setPath("/");
				oldCookie.setMaxAge(60 * 60 * 24);
				response.addCookie(oldCookie);
			}
		} else {
			Community_boardService.viewCount(cbidx);
			Cookie newCookie = new Cookie("HomeView", "[" + cbidx + "]");
			newCookie.setPath("/");
			newCookie.setMaxAge(60 * 60 * 60);
			response.addCookie(newCookie);
		}

		// 페이징처리
		int total = replyService.count(cbidx);
		PagingVO pvo = new PagingVO(total, nowPage, 10);
		int start = pvo.getStart();
		int end = pvo.getEnd();
		
		//함수 제거
		replyService.delfnc();
		//함수 생성
		replyService.intofnc(cbidx);
		
		List<Community_ReplyVO> reply = replyService.list(cbidx, start, end);
		model.addAttribute("reply", reply);
		model.addAttribute("pvo", pvo);

		// 팔로우 유무 조회
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		int midx = 0;

		if (loginUser != null) {
			midx = loginUser.getMidx();
		}
		model.addAttribute("midx", midx);
		FollowVO fvo = new FollowVO();

		fvo.setMidx(midx);
		fvo.setFmidx(fmidx);

		int isFollow = Community_boardService.isFollow(fvo);

		model.addAttribute("isFollow", isFollow);

		// 스크랩 유무 조회
		ScrapVO scrap = new ScrapVO();

		scrap.setMidx(midx);
		scrap.setCbidx(cbidx);

		int isScrap = Community_boardService.isScrap(scrap);

		model.addAttribute("isScrap", isScrap);

		return "community/home_view";
	}

	@RequestMapping(value = "/following.do", method = RequestMethod.GET)
	public String following(Locale locale, Model model, SearchVO vo, HttpSession session, HttpServletRequest req) throws Exception {
		
		String nowUri = req.getRequestURI();
		session.setAttribute("nowUri", nowUri);
		
		int deleteResult = homeService.deleteSearchList();

		List<HomeSearchVO> searchList = homeService.listSearchList();

		model.addAttribute("searchList", searchList);

		List<MemberVO> mlist = memberService.mlist();
		
		List<Community_BoardVO> boardlist = Community_boardService.boardlist();

		model.addAttribute("boardlist", boardlist);

		MemberVO activeUser = (MemberVO) session.getAttribute("loginUser");

		int midx = 0;
		
		List<FollowVO> flist = null;
		
		if (activeUser != null) {
			midx = activeUser.getMidx();

			flist = followService.selectActiveUserList(midx);
			
			model.addAttribute("flist", flist);
		}
		
		List<Community_BoardVO> followlist = null;
		List<MemberVO> memberlist = null;
		
		//비로그인시
		if(flist == null) {
			followlist = null;
			memberlist = null;
			
			for(int i=0; i<mlist.size(); i++) {
				int mmidx = mlist.get(i).getMidx();
				List<Community_BoardVO> temp = new ArrayList<>();
				for(Community_BoardVO bvo : boardlist) {
					if(mmidx == bvo.getMidx()) {
						temp.add(bvo);
					}
				}
				mlist.get(i).setBvo(temp);
			}
			model.addAttribute("memberlist", mlist);
			
		//로그인, 팔로우가 없을시
		}else if(flist.isEmpty()) {
			followlist = null;
			memberlist = null;
			
			for(int i=0; i<mlist.size(); i++) {
				int mmidx = mlist.get(i).getMidx();
				List<Community_BoardVO> temp = new ArrayList<>();
				for(Community_BoardVO bvo : boardlist) {
					if(mmidx == bvo.getMidx()) {
						temp.add(bvo);
					}
				}
				mlist.get(i).setBvo(temp);
			}
			model.addAttribute("memberlist", mlist);
			
		//로그인, 팔로우유저가 있을시
		}else {
			followlist = Community_boardService.followlist(flist);
			
			FollowVO fvo = new FollowVO();
			fvo.setMidx(activeUser.getMidx());
			flist.add(fvo);
			
			memberlist = memberService.notfollowlist(flist);
			
			model.addAttribute("followlist", followlist);
			
			for(int i=0; i<memberlist.size(); i++) {
				int mmidx = memberlist.get(i).getMidx();
				List<Community_BoardVO> temp = new ArrayList<>();
				for(Community_BoardVO bvo : boardlist) {
					if(mmidx == bvo.getMidx()) {
						temp.add(bvo);
					}
				}
				memberlist.get(i).setBvo(temp);
			}
			model.addAttribute("memberlist", memberlist);
		}
		return "community/following";
	}

	@RequestMapping(value = "/follow", method = RequestMethod.POST)
	@ResponseBody
	public String follow(int midx, Model model, HttpServletRequest req) throws Exception {

		HttpSession session = req.getSession();

		MemberVO activeUser = (MemberVO) session.getAttribute("loginUser");
		MemberVO passiveUser = memberService.inquiryOfUserByMidx(midx);

		FollowVO follow = new FollowVO();
		follow.setMidx(activeUser.getMidx());
		follow.setFmidx(passiveUser.getMidx());
		follow.setFmidx_nick(passiveUser.getNick_name());

		followService.follow(follow);

		return "FollowOK";
	}

	@RequestMapping(value = "/scrap.do", method = RequestMethod.GET)
	public String scrap(Locale locale, Model model, SearchVO vo, HttpServletRequest request) throws Exception {
		
		String nowUri = request.getRequestURI();

		HttpSession session = request.getSession();
		session.setAttribute("nowUri", nowUri);
		
		int deleteResult = homeService.deleteSearchList();

		List<HomeSearchVO> searchList = homeService.listSearchList();

		model.addAttribute("searchList", searchList);

		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		
		List<Community_BoardVO> boardlist = Community_boardService.boardlist();

		model.addAttribute("boardlist", boardlist);

		int midx = 0;
		
		List<ScrapVO> scrapList = null;
		if (loginUser != null) {
			midx = loginUser.getMidx();
			scrapList = scrapService.selectActiveUserList(midx);
		}
		
		List<Community_BoardVO> slist = null;
		if(scrapList == null) {
			slist = null;
		}else if(scrapList.isEmpty()) {
			slist = null;
		}else {
			slist = Community_boardService.scrapList(scrapList);
		}
		model.addAttribute("slist", slist);
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
