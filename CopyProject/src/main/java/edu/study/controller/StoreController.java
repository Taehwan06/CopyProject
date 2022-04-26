package edu.study.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.LinkedHashSet;
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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

import com.google.gson.Gson;

import edu.study.service.HomeService;
import edu.study.service.StoreService;
import edu.study.vo.BasketVO;
import edu.study.vo.Community_ReplyVO;
import edu.study.vo.EventVO;
import edu.study.vo.HomeSearchVO;
import edu.study.vo.MemberVO;
import edu.study.vo.PagingVO;
import edu.study.vo.ScrapVO;
import edu.study.vo.SearchVO;
import edu.study.vo.StorePagingVO;
import edu.study.vo.StoreVO;
import edu.study.vo.Store_qnaVO;
import edu.study.vo.Store_reviewVO;

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
	//스토어 메인페이지
	@RequestMapping(value = "/store.do", method = RequestMethod.GET)
	public String store(HttpServletRequest request, Locale locale, Model model, SearchVO vo) throws Exception {
		
		//현제 페이지 uri저장를 세션에 저장(로그인시 현제페이지로 돌아옴)
		String nowUri = request.getRequestURI();
		HttpSession session = request.getSession();
		session.setAttribute("nowUri", nowUri);
		
		//오래된 검색어 지우기
		int deleteResult = homeService.deleteSearchList();
		//검색어순위 담기
		List<HomeSearchVO> searchList = homeService.listSearchList();
		model.addAttribute("searchList", searchList);
		
		//화면에 보내줄 상품리스트의 리스트(3종)
		List<List> list = new ArrayList<List>();
		//4개만 가져오도록 리미트 설정
		vo.setPage("limit");
		//할인율 순
		vo.setDiscount("yes");
		List<StoreVO> list1 = storeService.list(vo);
		//판매량 순
		vo.setSell_cnt("yes");
		vo.setDiscount(null);
		List<StoreVO> list2 = storeService.list(vo);
		//쿠기에있는 최근본 상품과 같은 디테일값으로 조회
		vo.setSell_cnt(null);
		List<StoreVO> list3 ;
		Cookie[] myCookies = request.getCookies();
		String recentView = null;
		if(myCookies != null) {
		    for(int i = 0; i < myCookies.length; i++) {
		    	if(myCookies[i].getName().equals("recentView")) {
		    		recentView = myCookies[i].getValue();
		    	}
		    }
		    if(recentView != null) {
			    String[] spidxAryDup = recentView.split("&"); 
			    int size = spidxAryDup.length;
				String[] reverseSpidxAry = new String[size];
				for (int i = size - 1, j = 0; i >= 0; i--, j++) {
					reverseSpidxAry[j] = spidxAryDup[i];
				}
				LinkedHashSet<String> linkedHashSet = new LinkedHashSet<String>(Arrays.asList(reverseSpidxAry));
				String[] spidxAry = linkedHashSet.toArray(new String[0]);
				StoreVO selectOne = storeService.detail(Integer.parseInt(spidxAry[0]));
				vo.setDetail(selectOne.getDetail());
		    }
			list3 = storeService.list(vo);
	    }else {
	    	list3 = storeService.list(vo);
	    }

		//list에 담기
		list.add(list1);
		list.add(list2);
		list.add(list3);
		
		//정보 담아주기
		model.addAttribute("list",list);
		
		
		return "store/store";
	}
	
	//상품 등록 페이지이동
	@RequestMapping(value = "/store_insert.do", method = RequestMethod.GET)
	public String store_insert(HttpServletResponse response, HttpServletRequest request, Locale locale, Model model, SearchVO vo) throws Exception {
		
		//로그아웃 후 뒤로가기로 페이지 입장시 입장불가
		response.setHeader("Cache-Control","no-store");
		
		//오래된 검색기록 삭제
		int deleteResult = homeService.deleteSearchList();
		//검색어순위 담기
		List<HomeSearchVO> searchList = homeService.listSearchList();
		model.addAttribute("searchList", searchList);
		
		//로그인페이지 이동 후 로그인시 다시 돌아오기위해 uri저장
		String nowUri = request.getRequestURI();
		HttpSession session = request.getSession();
		session.setAttribute("nowUri", nowUri);
		
		//로그인유저 조회
		MemberVO member = (MemberVO)session.getAttribute("loginUser");
		
		//미로그인시 로그인페이지이동
		if(member==null) {
			System.out.println("잘못된 접근으로인한 로그인이동");
			return "redirect:/login/login.do";
		}
		//로그인된 유저 등급확인
		if(!member.getGrade().equals("A")) {
			System.out.println(member.getMidx()+"유저의 잘못된 방식의 접근");
			return "redirect:/store/store.do";
		}
		
		//페이지이동
		return "store/store_insert";
	}
	
	//상품 등록
	@RequestMapping(value = "/store_insert.do", method = RequestMethod.POST)
	public String store_insertOK(HttpServletRequest request, Locale locale, Model model,
			StoreVO vo/* , @RequestParam String img_style */) throws Exception {
	
		
		//오래된 검색기록 삭제
		int deleteResult = homeService.deleteSearchList();
		
		//이전에는 이미지스타일 코드를 받아 DB에 스타일코드로 집어넣음
			//이렇게 진행할시 상품관련 페이지 입장시 로딩이 느려짐
//		List<HomeSearchVO> searchList = homeService.listSearchList();
//		
//		model.addAttribute("searchList", searchList);
			
	
//		int idx1 = img_style.indexOf("url("); 
//		int idx2 = img_style.lastIndexOf("\"");
//		String new_img_style = img_style.substring(idx1+5, idx2);
//		vo.setImg_origin(new_img_style); 
//		vo.setImg_system(new_img_style);
		 
//		StringTokenizer st = new StringTokenizer(vo.getDetail(), ",");
//		String remain = "";
//		while(st.hasMoreTokens()) {
//		   String cur = st.nextToken();
//		   if (cur.equals("0")) {
//		       continue;
//		    } 
//		   remain = cur;
//		   break;
//		}
//		vo.setDetail(remain);
		
		
		//전달받은 정보중 배달이 무료배송일시 배달료를 0원으로 측정
		if(vo.getFree_delivery().equals("Y")) {
			vo.setDelivery_charge("0");
		}
		
		
		//로그인한 유저의 정보
		HttpSession session = request.getSession();
		MemberVO member = (MemberVO)session.getAttribute("loginUser");
		
		//로그인한 유저(작성자)의 인덱스번호와 닉네임을 vo에 담음
		vo.setMidx(member.getMidx());
		vo.setWriter(member.getMembername());
		
		//상품등록
		//쿼리에서 생성된 상품 spidx를 가져옴
		storeService.insert(vo);
		
		//등록된 페이지로 이동
		return "redirect:store_view.do?spidx=" + vo.getSpidx();
		
	}
	
	//카테고리 상품 필터
	@RequestMapping(value="/lookup", method = RequestMethod.GET, produces = "application/text; charset=UTF-8")
	@ResponseBody
	public String lookup(Locale locale, Model model, SearchVO vo) throws Exception {
		
		//전달받은 데이터로 상품을 조회
		List<StoreVO> list = storeService.list(vo);
		
//		ResponseVO<StoreVO> response = new ResponseVO<StoreVO>();
//		response.setList(list);
//		HttpHeaders headers = new HttpHeaders();
//		headers.add("content-type", "application/json; charset=UTF-8");
//		
//		return new ResponseEntity<ResponseVO<StoreVO>>(response,headers, HttpStatus.OK);
		
		//json으로 변경 후 호출한 페이지에 전송
		String json = new Gson().toJson(list);
	    return json;
	}
	
	//상품 수정 페이지 이동
	@RequestMapping(value = "/store_modify.do", method = RequestMethod.GET)
	public String store_modify(HttpServletResponse response, HttpServletRequest request, Locale locale, Model model, int spidx) throws Exception {
		
		//로그아웃 후 뒤로가기로 페이지 입장시 입장불가
		response.setHeader("Cache-Control","no-store");
		
		
		int deleteResult = homeService.deleteSearchList();
		List<HomeSearchVO> searchList = homeService.listSearchList();
		
		//로그인유저 조회
		HttpSession session = request.getSession();
		MemberVO member = (MemberVO)session.getAttribute("loginUser");
		
		//미로그인시 로그인페이지이동
		if(member==null) {return "redirect:/login/login.do";}
		
		//로그인된 유저 등급확인
		if(!member.getGrade().equals("A")) {return "redirect:/store/store.do";}
		
		//해당상품 정보조회
		StoreVO selectOne = storeService.detail(spidx);
		
		//상품정보 담기
		model.addAttribute("vo",selectOne);
		
		//수정페이지 이동
		return "store/store_modify";
	}
	
	//상품 수정
	@RequestMapping(value = "/store_modify.do", method = RequestMethod.POST)
	public String store_modifyOK(HttpServletRequest request, Locale locale, Model model,
			StoreVO vo/* , @RequestParam String img_style */) throws Exception {

		int deleteResult = homeService.deleteSearchList();
		
		//기존 이미지를 스타일코드로 받던방식(사용안함)
		/*
		 * int idx1 = img_style.indexOf("url("); int idx2 = img_style.lastIndexOf("\"");
		 * String new_img_style = img_style.substring(idx1+5, idx2);
		 * vo.setImg_origin(new_img_style); vo.setImg_system(new_img_style);
		 */
		//디테일값 여러개 넘어올 시 하나만 추림(사용안함)
//		StringTokenizer st = new StringTokenizer(vo.getDetail(), ",");
//		String remain = "";
//		while(st.hasMoreTokens()) {
//		   String cur = st.nextToken();
//		   if (cur.equals("0")) {
//		       continue;
//		    } 
//		   remain = cur;
//		   break;
//		}
//		vo.setDetail(remain);
		
		//무료배송여부
		if(vo.getFree_delivery().equals("Y")) {
			vo.setDelivery_charge("0");
		}
		
		
		
		HttpSession session = request.getSession();
		MemberVO member = (MemberVO)session.getAttribute("loginUser");
		
		
		//로그인한 유저로 작성자 변경
		vo.setMidx(member.getMidx());
		vo.setWriter(member.getMembername());
		
		
		int result = storeService.update(vo);
		
		
		return "redirect:store_view.do?spidx=" + vo.getSpidx();
		
	}
	
	//상품삭제
	@RequestMapping(value = "/store_del.do", method = RequestMethod.GET)
	public String store_del(HttpServletRequest request, Locale locale, Model model, int spidx) throws Exception {
		int deleteResult = homeService.deleteSearchList();
		List<HomeSearchVO> searchList = homeService.listSearchList();
		
		//로그인유저 조회
		HttpSession session = request.getSession();
		MemberVO member = (MemberVO)session.getAttribute("loginUser");
		
		//미로그인시 로그인페이지이동
		if(member==null) {return "redirect:/login/login.do";}
		
		//로그인된 유저 등급확인
		if(!member.getGrade().equals("A")) {return "redirect:/store/store.do";}
		
		//상품삭제
		int result = storeService.delete(spidx);
		
		
		return "redirect:/store/store.do";
	}
	
	//카테고리(상품리스트) 페이지
	@RequestMapping(value = "/store_list.do", method = RequestMethod.GET)
	public String store_list(HttpServletRequest request, Locale locale, Model model, SearchVO vo, String type) throws Exception {
		
		String nowUri = request.getRequestURI();
	      
		HttpSession session = request.getSession();
		session.setAttribute("nowUri", nowUri);
		
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
		
		Cookie[] myCookies = request.getCookies();
		String recentView = null;
		if(myCookies != null) {
		    for(int i = 0; i < myCookies.length; i++) {
		    	if(myCookies[i].getName().equals("recentView")) {
		    		recentView = myCookies[i].getValue();
		    	}
		    }
		    if(type != null) {
			    if(type.equals("select")) {
				    if(recentView != null) {
					    String[] spidxAryDup = recentView.split("&"); 
					    int size = spidxAryDup.length;
					    
						String[] reverseSpidxAry = new String[size];
						
						for (int i = size - 1, j = 0; i >= 0; i--, j++) {
							reverseSpidxAry[j] = spidxAryDup[i];
						}
						LinkedHashSet<String> linkedHashSet = new LinkedHashSet<String>(Arrays.asList(reverseSpidxAry));
						
						String[] spidxAry = linkedHashSet.toArray(new String[0]);
					
						StoreVO selectOne = storeService.detail(Integer.parseInt(spidxAry[0]));
						
						vo.setDetail(selectOne.getDetail());
						
						List<StoreVO> list = storeService.list(vo);
			
						model.addAttribute("list",list);
						
						return "store/store_list";
						
				    }
			    }
		    }
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
	
	//상품 상세보기
	@RequestMapping(value = "/store_view.do", method = RequestMethod.GET)
	public String store_view(Locale locale, Model model, int spidx,@RequestParam(value="nowPage", required = false, defaultValue="1") int nowPage, @RequestParam(value="qanowPage", required = false, defaultValue="1") int qanowPage, HttpServletResponse response, HttpServletRequest request) throws Exception {
		String nowUri = request.getRequestURI();
	      
		HttpSession session = request.getSession();
		session.setAttribute("nowUri", nowUri+"?spidx="+spidx);
		
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
	
		
		//상품정보
		StoreVO selectOne = storeService.detail(spidx);
		//문의글 갯수 가져오기
		int qna_cnt = storeService.qna_cnt(spidx);
		
		selectOne.setQna_cnt(qna_cnt);
		
		model.addAttribute("vo",selectOne);
		
		//문의페이징
		int total = storeService.qna_cnt(spidx);
		PagingVO pvo = new PagingVO(total,qanowPage,4);
	    int start = pvo.getStart();
	    int end = pvo.getEnd();
	    List<Store_qnaVO> qnalist = storeService.qnaList(spidx, start, end);
		model.addAttribute("qavo",qnalist);
		model.addAttribute("qapvo", pvo);

		//리뷰페이징
		total = storeService.review_count(spidx);
		PagingVO rpvo = new PagingVO(total,nowPage,4);
  	    start = rpvo.getStart();
  	    end = rpvo.getEnd();
  	    List<Store_reviewVO> list = storeService.reviewList(spidx, start, end);
		model.addAttribute("rvo",list);
		model.addAttribute("pvo", rpvo);
		
		
		session = request.getSession();
		MemberVO member = (MemberVO)session.getAttribute("loginUser");
		
		//좋아요여부
		int midx = 0;
		if(member!=null) {
			midx = member.getMidx();
		}
  	    
  	    int islikey = storeService.islikey(midx,spidx);
  	    
  	    model.addAttribute("islikey", islikey);	
		
		
		
		return "store/store_view";
		
		
	}
	
	//실패-에이젝스로 해보려했지만 받고나서 하단 바 정보처리가 복잡하여 포기
//	@RequestMapping(value="/review_paging", method = RequestMethod.GET, produces = "application/text; charset=UTF-8")
//	public @ResponseBody String paging(Locale locale, Model model,StorePagingVO vo) throws Exception {
//		
//		
//		int total = storeService.review_count(vo.getSpidx());
//  	    PagingVO pvo = new PagingVO(total,vo.getNowPage(), 4);
//  	    int start = pvo.getStart();
//  	    vo.setStart(start);
//  	    int end = pvo.getEnd();
//  	    vo.setEnd(end);
//  	    List<Store_reviewVO> list = storeService.reviewList(vo);
//  	    
//		String json = new Gson().toJson(list);
//	    return json;
//	}
		
	
	@RequestMapping(value = "/store_review_insert.do", method = RequestMethod.GET)
	public String store_review_insert(HttpServletResponse response, HttpServletRequest request, Locale locale, Model model, int spidx) throws Exception {
		
		//로그아웃 후 뒤로가기로 페이지 입장시 입장불가
		response.setHeader("Cache-Control","no-store");
		
		int deleteResult = homeService.deleteSearchList();
		
		List<HomeSearchVO> searchList = homeService.listSearchList();
		
		model.addAttribute("searchList", searchList);
		
		HttpSession session = request.getSession();
		MemberVO member = (MemberVO)session.getAttribute("loginUser");

		if(member==null) {return "redirect:/login/login.do";}
		
		StoreVO selectOne = storeService.detail(spidx);
		
		model.addAttribute("vo", selectOne);	
		
		model.addAttribute("spidx", spidx);	
		return "store/store_review_insert";
	}
	@RequestMapping(value = "/store_review_insert.do", method = RequestMethod.POST)
	public @ResponseBody String store_review_insertOK(HttpServletRequest request, Locale locale, Model model,
			Store_reviewVO vo/* , @RequestParam String img_style */) throws Exception {
	
		int deleteResult = homeService.deleteSearchList();
		
		List<HomeSearchVO> searchList = homeService.listSearchList();
		
		model.addAttribute("searchList", searchList);
//		if(img_style != null && !img_style.equals("") && !img_style.equals("undefined")) {
//			int idx1 = img_style.indexOf("url(");
//			int idx2 = img_style.lastIndexOf("\"");
//			String new_img_style = img_style.substring(idx1+5, idx2);
//			vo.setImg_origin(new_img_style);
//			vo.setImg_system(new_img_style);
//		}
		
		HttpSession session = request.getSession();
		MemberVO member = (MemberVO)session.getAttribute("loginUser");
		vo.setMidx(member.getMidx());
		vo.setWriter(member.getNick_name());
		
		int result = storeService.store_review_insert(vo);
		
		//상품 별점 및 리뷰갯수 갱신
		StoreVO svo = new StoreVO();
		svo = storeService.store_review_cnt(vo.getSpidx());
		svo.setSpidx(vo.getSpidx());
		double score = svo.getScore()/svo.getReview_cnt();
		
		score = Math.round(score * 10) / 10.0;

		svo.setScore(score);
		storeService.store_review_change(svo);
		
		return result+"";
	}
	
	//리뷰수정
	@RequestMapping(value = "/store_review_modify.do", method = RequestMethod.GET)
	public String store_store_modify(HttpServletResponse response, HttpServletRequest request, Locale locale, Model model, int spidx, int sridx) throws Exception {
		
		//로그아웃 후 뒤로가기로 페이지 입장시 입장불가
		response.setHeader("Cache-Control","no-store");
		
		int deleteResult = homeService.deleteSearchList();
		List<HomeSearchVO> searchList = homeService.listSearchList();
		
		HttpSession session = request.getSession();
		MemberVO member = (MemberVO)session.getAttribute("loginUser");

		if(member==null) {return "redirect:/login/login.do";}

		StoreVO selectOne = storeService.detail(spidx);
		
		
		
		model.addAttribute("vo", selectOne);	
		
		Store_reviewVO selectReview = storeService.store_review_Detail(sridx);
		
		if(member.getMidx()!=selectReview.getMidx()) {return "redirect:/login/login.do";}
		model.addAttribute("rvo",selectReview);
			
		return "store/store_review_modify";
	}
	
	@RequestMapping(value = "/store_review_modify.do", method = RequestMethod.POST)
	public @ResponseBody String store_store_modifyOK(HttpServletRequest request, Locale locale, Model model,
			Store_reviewVO vo/* , @RequestParam String img_style */) throws Exception {
		
		int deleteResult = homeService.deleteSearchList();
		
//		List<HomeSearchVO> searchList = homeService.listSearchList();
//		
//		model.addAttribute("searchList", searchList);
			
//		int idx1 = img_style.indexOf("url(");
//		int idx2 = img_style.lastIndexOf("\"");
//		String new_img_style = img_style.substring(idx1+5, idx2);
//		vo.setImg_origin(new_img_style);
//		vo.setImg_system(new_img_style);
		
		HttpSession session = request.getSession();
		MemberVO member = (MemberVO)session.getAttribute("loginUser");
		
		
			
		vo.setMidx(member.getMidx());
		vo.setWriter(member.getMembername());
		
		
		int result = storeService.store_review_modify(vo);

		return result+"";
		
	}
	//리뷰삭제
	@RequestMapping(value = "/store_review_del.do", method = RequestMethod.POST)
	public @ResponseBody String store_review_delOK(HttpServletRequest request, Locale locale, Model model,int spidx, int sridx, int midx) throws Exception {
		
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
	
	
	
	//qna 작성페이지
	@RequestMapping(value = "/store_qna_insert.do", method = RequestMethod.GET)
	public String store_qna_insert(Locale locale, Model model, int spidx) throws Exception {
		
		int deleteResult = homeService.deleteSearchList();
		
		List<HomeSearchVO> searchList = homeService.listSearchList();
		
		model.addAttribute("searchList", searchList);
		
		StoreVO selectOne = storeService.detail(spidx);
		
		model.addAttribute("vo", selectOne);	
		
		model.addAttribute("spidx", spidx);	
		return "store/store_qna_insert";
	}
	//qna 등록
	@RequestMapping(value = "/store_qna_insert.do", method = RequestMethod.POST)
	public @ResponseBody String store_qna_insertOK(HttpServletRequest request, Locale locale, Model model, Store_qnaVO vo) throws Exception {
		
		int deleteResult = homeService.deleteSearchList();
		
		List<HomeSearchVO> searchList = homeService.listSearchList();
		
		model.addAttribute("searchList", searchList);
		
		HttpSession session = request.getSession();
		MemberVO member = (MemberVO)session.getAttribute("loginUser");
		vo.setMidx(member.getMidx());
		vo.setWriter(member.getNick_name());
		
		int result = storeService.qnaIn(vo);
		
		return result+"";
	}
	
	//qna수정페이지 이동
	@RequestMapping(value = "/store_qna_modify.do", method = RequestMethod.GET)
	public String store_qna_modify(Locale locale, Model model, int spidx, int sqidx) throws Exception {
		
		int deleteResult = homeService.deleteSearchList();
		
		List<HomeSearchVO> searchList = homeService.listSearchList();
		
		model.addAttribute("searchList", searchList);
		
		StoreVO selectOne = storeService.detail(spidx);
		model.addAttribute("vo", selectOne);	
		
		Store_qnaVO qna_vo = storeService.qna_detail(sqidx);
		model.addAttribute("qna_vo", qna_vo);
		
		
		model.addAttribute("spidx", spidx);	
		return "store/store_qna_modify";
	}
	//qna저장
	@RequestMapping(value = "/store_qna_modify.do", method = RequestMethod.POST)
	public @ResponseBody String store_qna_modifyOK(HttpServletRequest request, Locale locale, Model model, Store_qnaVO vo) throws Exception {
		
		int deleteResult = homeService.deleteSearchList();
		
		List<HomeSearchVO> searchList = homeService.listSearchList();
		
		model.addAttribute("searchList", searchList);
		
		HttpSession session = request.getSession();
		MemberVO member = (MemberVO)session.getAttribute("loginUser");
		vo.setMidx(member.getMidx());
		vo.setWriter(member.getNick_name());
		
		int result = storeService.qna_modify(vo);
		
		return result+"";
	}
	//qna 질문 삭제
	@RequestMapping(value = "/store_qna_q_del.do", method = RequestMethod.POST)
	public @ResponseBody String store_qna_q_delOK(HttpServletRequest request, Locale locale, Model model, int sqidx, int midx) throws Exception {
		
		int deleteResult = homeService.deleteSearchList();
		
		List<HomeSearchVO> searchList = homeService.listSearchList();
		
		model.addAttribute("searchList", searchList);
		
		HttpSession session = request.getSession();
		MemberVO member = (MemberVO)session.getAttribute("loginUser");
		
		int result=0;
		if(member==null) {return "redirect:/login/login.do";}
		if(member.getMidx() == midx) {
			result = storeService.qna_q_del(sqidx);
		}
		return result+"";
	}
	//qna 답변등록
	@RequestMapping(value = "/store_qna_a_insert.do", method = RequestMethod.POST)
	public @ResponseBody String store_qna_a_insertOK(HttpServletRequest request, Locale locale, Model model, Store_qnaVO vo) throws Exception {
		
		int deleteResult = homeService.deleteSearchList();
		
		List<HomeSearchVO> searchList = homeService.listSearchList();
		
		model.addAttribute("searchList", searchList);
		
		HttpSession session = request.getSession();
		MemberVO member = (MemberVO)session.getAttribute("loginUser");
		vo.setAmidx(member.getMidx());
		vo.setAnswer_writer(member.getNick_name());
		
		int result = storeService.qna_reply(vo);
		
		return result+"";
	}
	//qna 답변 삭제
	@RequestMapping(value = "/store_qna_a_del.do", method = RequestMethod.POST)
	public @ResponseBody String store_qna_a_delOK(HttpServletRequest request, Locale locale, Model model, int sqidx) throws Exception {
		
		int deleteResult = homeService.deleteSearchList();
		
		List<HomeSearchVO> searchList = homeService.listSearchList();
		
		model.addAttribute("searchList", searchList);
		
		HttpSession session = request.getSession();
		MemberVO member = (MemberVO)session.getAttribute("loginUser");
		int result=0;
		if(member==null) {return "redirect:/login/login.do";}
		if(member.getGrade().equals("A")) {
			result = storeService.qna_a_del(sqidx);
		}
		return result+"";
	}
	//장바구니 등록
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
		vo.setImg_system(svo.getImg_system());
		vo.setPrice(Integer.parseInt(svo.getSale_price()));
		vo.setDelivery_charge(Integer.parseInt(svo.getDelivery_charge()));
		vo.setBrand(svo.getBrand());
		
		int result = storeService.basketIn(vo);
		
		 
	
		return result+""; 
	}
	
	//좋아요등록
	@RequestMapping(value = "/likeIN", method = RequestMethod.GET)
	public @ResponseBody String likeIN(HttpServletRequest request, Locale locale, Model model, int spidx, int midx) throws Exception {
		
		int deleteResult = homeService.deleteSearchList();
		
		List<HomeSearchVO> searchList = homeService.listSearchList();
		
		model.addAttribute("searchList", searchList);
		
		HttpSession session = request.getSession();
		MemberVO member = (MemberVO)session.getAttribute("loginUser");
		
		if(member == null) {
			return "100";
		}
		
		if(member != null &&midx != member.getMidx()) {
			midx=member.getMidx();
		}
		
		int result = storeService.likeIN(midx,spidx);
		
		return result+"";
	}
	//좋앙 삭제
	@RequestMapping(value = "/likeDEL", method = RequestMethod.GET)
	public @ResponseBody String likeDEL(HttpServletRequest request, Locale locale, Model model, int spidx, int midx) throws Exception {
		
		int deleteResult = homeService.deleteSearchList();
		
		List<HomeSearchVO> searchList = homeService.listSearchList();
		
		model.addAttribute("searchList", searchList);
		
		HttpSession session = request.getSession();
		MemberVO member = (MemberVO)session.getAttribute("loginUser");
		
		if(member == null) {
			return "100";
		}
		
		int result = storeService.likeDEL(midx,spidx);
		
		return result+"";
	}
	//좋아요페이지이동
	@RequestMapping(value = "/likey.do", method = RequestMethod.GET)
	public String likey(HttpServletRequest request, Locale locale, Model model, SearchVO vo) throws Exception {
		
		int deleteResult = homeService.deleteSearchList();
		
		List<HomeSearchVO> searchList = homeService.listSearchList();
		
		model.addAttribute("searchList", searchList);
		
		HttpSession session = request.getSession();
		MemberVO member = (MemberVO)session.getAttribute("loginUser");
		
		if(member == null) {return "redirect:/login/login.do";};

		
		
		//쿠기에서 최근본 항목을 가져와 리스트로 가져옴
		List<StoreVO> list ;
		Cookie[] myCookies = request.getCookies();
		String recentView = null;
		vo.setPage("limit");
		if(myCookies != null) {
		    for(int i = 0; i < myCookies.length; i++) {
		    	if(myCookies[i].getName().equals("recentView")) {
		    		recentView = myCookies[i].getValue();
		    	}
		    }
		    
		    if(recentView != null) {
			    String[] spidxAryDup = recentView.split("&"); 
			    int size = spidxAryDup.length;
			    
				String[] reverseSpidxAry = new String[size];
				
				for (int i = size - 1, j = 0; i >= 0; i--, j++) {
					reverseSpidxAry[j] = spidxAryDup[i];
				}
				LinkedHashSet<String> linkedHashSet = new LinkedHashSet<String>(Arrays.asList(reverseSpidxAry));
				
				String[] spidxAry = linkedHashSet.toArray(new String[0]);
			
				StoreVO selectOne = storeService.detail(Integer.parseInt(spidxAry[0]));
				
				vo.setDetail(selectOne.getDetail());
				
		    }
			list = storeService.list(vo);
	    }else {
	    	list = storeService.list(vo);
	    }

		model.addAttribute("list", list);
		//좋아요 리스트
		List<StoreVO> likelist = storeService.likelist(member.getMidx());
		
		model.addAttribute("likelist",likelist);
			
		return "store/likey";
	}
	
	@RequestMapping(value = "/recommend.do", method = RequestMethod.GET)
	public String recommend(Locale locale, Model model, SearchVO vo) throws Exception {
		
		int deleteResult = homeService.deleteSearchList();
		
		List<HomeSearchVO> searchList = homeService.listSearchList();
		
		model.addAttribute("searchList", searchList);
			
		return "store/recommend";
	}
	
	
	//이미지파일 업로드
	@RequestMapping(value = "/fileUpload", method = RequestMethod.POST)
	@ResponseBody
	public String fileUpload(Locale locale, Model model, HttpServletRequest request, @RequestParam("imgFile") MultipartFile imgFile) throws Exception {
		
		//String savePath = "C://Users//lth-m//git//TeamProject2022//HomeFriends//src//main//webapp//resources//image";  // 파일이 저장될 프로젝트 안의 폴더 경로
		String savePath = request.getServletContext().getRealPath("/resources/image");  // 파일이 저장될 프로젝트 안의 폴더 경로
		//String savePath ="C://Users//MYCOM//git//TeamProject2022//HomeFriends//src//main//webapp//resources//image";
		
		 
		
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
	
	//이벤트페이지
	@RequestMapping(value = "/event.do", method = RequestMethod.GET)
	public String event(Locale locale, Model model) throws Exception {
		
		int deleteResult = homeService.deleteSearchList();
		
		List<HomeSearchVO> searchList = homeService.listSearchList();
		
		model.addAttribute("searchList", searchList);
		
		List<EventVO> elist = storeService.eventlist();
		model.addAttribute("elist", elist);
		
			
		return "store/event";
	}
	
	//이벤트 상세보기
	@RequestMapping(value = "/event_view.do", method = RequestMethod.GET)
	public String event_view(Locale locale, Model model, int eidx) throws Exception {
		
		int deleteResult = homeService.deleteSearchList();
		
		List<HomeSearchVO> searchList = homeService.listSearchList();
		
		model.addAttribute("searchList", searchList);
		
		EventVO evo = storeService.event_detail(eidx);
		model.addAttribute("evo",evo);
			
		return "store/event_view";
	}
	
	
}
