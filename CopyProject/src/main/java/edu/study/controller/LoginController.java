package edu.study.controller;

import java.util.List;
import java.util.Locale;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.scribejava.core.model.OAuth2AccessToken;

import edu.study.service.HomeService;
import edu.study.service.MemberService;
import edu.study.service.testService;
import edu.study.util.RandomNumber;
import edu.study.util.RandomPass;
import edu.study.vo.HomeSearchVO;
import edu.study.vo.MemberVO;
import edu.study.vo.NaverLoginVO;

/**
 * Handles requests for the application home page.
 */

@RequestMapping(value="/login")
@Controller
public class LoginController {
	
	@Autowired	
	private JavaMailSender mailSender;
	@Autowired
	private MemberService memberService;
	@Autowired
	private HomeService homeService;
	private RandomNumber randomNumber;
	private RandomPass randomPass;
	private String apiResult = null;
	
	@Autowired
	private testService testService;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 * @throws Exception 
	 */
	@RequestMapping(value = "/join.do", method = RequestMethod.GET)
	public String join(Locale locale, Model model) throws Exception {
		
		int deleteResult = homeService.deleteSearchList();
		
		List<HomeSearchVO> searchList = homeService.listSearchList();
		
		model.addAttribute("searchList", searchList);
		
		return "login/join";
	}
	
	@RequestMapping(value = "/join.do", method = RequestMethod.POST)
	public String join(Locale locale, Model model, MemberVO vo) throws Exception {
		
		int deleteResult = homeService.deleteSearchList();
		
		List<HomeSearchVO> searchList = homeService.listSearchList();
		
		model.addAttribute("searchList", searchList);
		
		String phone = vo.getPhone();
		String phone1 = phone.substring(0, 3);
		String phone2 = phone.substring(3, 7);
		String phone3 = phone.substring(7);
		
		vo.setPhone1(phone1);
		vo.setPhone2(phone2);
		vo.setPhone3(phone3);
		
		int result = memberService.insert(vo);
		
		model.addAttribute("vo", vo);
		
		return "login/join_result";
	}
	
	@RequestMapping(value = "/login.do", method = RequestMethod.GET)
	public String login(Locale locale, Model model, HttpSession session) throws Exception {
		
		int deleteResult = homeService.deleteSearchList();
		
		List<HomeSearchVO> searchList = homeService.listSearchList();
		
		model.addAttribute("searchList", searchList);
		
		NaverLoginVO naverLoginVO = new NaverLoginVO();
		
		/* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginVO클래스의 getAuthorizationUrl메소드 호출 */
		String naverAuthUrl = naverLoginVO.getAuthorizationUrl(session);
		
		//https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************&
		//redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&state=e68c269c-5ba9-4c31-85da-54c16c658125
		
		//네이버
		model.addAttribute("url", naverAuthUrl);
		
		return "login/login";
	}
	
	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public String login(Locale locale, Model model, HttpServletRequest request, MemberVO vo) throws Exception {
		
		int deleteResult = homeService.deleteSearchList();
		
		List<HomeSearchVO> searchList = homeService.listSearchList();
		
		model.addAttribute("searchList", searchList);
		
		HttpSession session = request.getSession();
		MemberVO loginUser = memberService.login(vo);
		
		if(loginUser == null) {
			session.setAttribute("loginUser", null);
			return "login/login_fail";
		}else {
			session.setAttribute("loginUser", loginUser);
			
			String nowUri = (String)session.getAttribute("nowUri");
			if(nowUri != null) {
				session.setAttribute("nowUri", null);
				return "redirect: "+nowUri;
			}else {
				return "redirect:/";
			}
		}
	}
	
	@RequestMapping(value = "/logout.do", method = RequestMethod.GET)
	public String logout(Locale locale, Model model, HttpSession session, HttpServletRequest request) throws Exception {
		
		int deleteResult = homeService.deleteSearchList();
		
		List<HomeSearchVO> searchList = homeService.listSearchList();
		
		model.addAttribute("searchList", searchList);
		
		session.invalidate();
		
		return "redirect:/";
	}
	
	@RequestMapping(value = "/join_result.do", method = RequestMethod.GET)
	public String join_result(Locale locale, Model model) throws Exception {
		
		int deleteResult = homeService.deleteSearchList();
		
		List<HomeSearchVO> searchList = homeService.listSearchList();
		
		model.addAttribute("searchList", searchList);
		
		return "login/join_result";
	}
	
	@RequestMapping(value = "/find_id.do", method = RequestMethod.GET)
	public String find_id(Locale locale, Model model) throws Exception {
		
		int deleteResult = homeService.deleteSearchList();
		
		List<HomeSearchVO> searchList = homeService.listSearchList();
		
		model.addAttribute("searchList", searchList);
		
		return "login/find_id";
	}
	
	@RequestMapping(value = "/find_id.do", method = RequestMethod.POST)
	public String find_id(Locale locale, Model model, MemberVO vo, HttpServletResponse response) throws Exception {
		
		response.setHeader("Cache-Control","no-store");
		
		int deleteResult = homeService.deleteSearchList();
		
		List<HomeSearchVO> searchList = homeService.listSearchList();
		
		model.addAttribute("searchList", searchList);
		
		MemberVO user = memberService.findId(vo);
		
		if(user == null) {
			return "login/find_id_result_none";
		}else {
			model.addAttribute("user", user);
			
			return "login/find_id_result";
		}			
	}
	
	@RequestMapping(value = "/find_id_result.do", method = RequestMethod.GET)
	public String find_id_result(Locale locale, Model model, HttpServletResponse response) throws Exception {
		
		response.setHeader("Cache-Control","no-store");
		
		int deleteResult = homeService.deleteSearchList();
		
		List<HomeSearchVO> searchList = homeService.listSearchList();
		
		model.addAttribute("searchList", searchList);
		
		return "login/find_id_result";
	}
	
	@RequestMapping(value = "/find_pwd.do", method = RequestMethod.GET)
	public String find_pwd(Locale locale, Model model) throws Exception {
		
		int deleteResult = homeService.deleteSearchList();
		
		List<HomeSearchVO> searchList = homeService.listSearchList();
		
		model.addAttribute("searchList", searchList);
		
		return "login/find_pwd";
	}
	
	@RequestMapping(value = "/find_pwd.do", method = RequestMethod.POST)
	public String find_pwd(Locale locale, Model model, MemberVO vo
			, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		response.setHeader("Cache-Control","no-store");
		
		int deleteResult = homeService.deleteSearchList();
		
		List<HomeSearchVO> searchList = homeService.listSearchList();
		
		model.addAttribute("searchList", searchList);
		
		MemberVO user = memberService.findPwd(vo);
		
		System.out.println("user="+user);
		
		if(user == null) {
			return "redirect:/login/find_pwd_result_none.do";
		}else {	
			String ranPass = randomPass.random();
			user.setPass(ranPass);
			
			int result = memberService.updateTempPwd(user);
			model.addAttribute("user", user);
			
			if(result>0) {
				
				HttpSession session = request.getSession(); 
			    session.setAttribute("user", user);
				
				String setfrom = "homefriendsmail@gmail.com";
				String tomail = user.getId(); // 받는 사람 이메일
				String title = "[홈 프렌즈] 임시 비밀번호 입니다."; // 제목
				String content = "회원님의 임시 비밀번호는 "+ranPass+" 입니다."; // 내용

				try {
					MimeMessage message = mailSender.createMimeMessage();
					MimeMessageHelper messageHelper = new MimeMessageHelper(message,
							true, "UTF-8");

					messageHelper.setFrom(setfrom); // 보내는사람 생략하면 정상작동을 안함
					messageHelper.setTo(tomail); // 받는사람 이메일
					messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
					messageHelper.setText(content); // 메일 내용

					mailSender.send(message);
					
					return "redirect:/login/find_pwd_result.do";
					
				} catch (Exception e) {
					System.out.println(e);
				}
				
				return "redirect:/login/find_pwd_result_fail.do";
				
			}else {
				return "redirect:/login/find_pwd_result_fail.do";	
			}
		}
	}
	
	@RequestMapping(value = "/find_pwd_result.do", method = RequestMethod.GET)
	public String find_pwd_result(Locale locale, Model model, MemberVO vo
			, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		response.setHeader("Cache-Control","no-store");
		
		HttpSession session = request.getSession(); 
	    MemberVO user = (MemberVO)session.getAttribute("user");
	    model.addAttribute("user", user);
	    session.setAttribute("user", null);
		
		int deleteResult = homeService.deleteSearchList();
		
		List<HomeSearchVO> searchList = homeService.listSearchList();
		
		model.addAttribute("searchList", searchList);
			
		return "login/find_pwd_result";
	}
	
	@RequestMapping(value = "/find_pwd_result_none.do", method = RequestMethod.GET)
	public String find_pwd_result_none(Locale locale, Model model, MemberVO vo, HttpServletRequest request) throws Exception {
		
		int deleteResult = homeService.deleteSearchList();
		
		List<HomeSearchVO> searchList = homeService.listSearchList();
		
		model.addAttribute("searchList", searchList);
		
		return "login/find_pwd_result_none";
	}
	
	@RequestMapping(value = "/find_pwd_result_fail.do", method = RequestMethod.GET)
	public String find_pwd_result_fail(Locale locale, Model model, MemberVO vo, HttpServletRequest request) throws Exception {
		
		int deleteResult = homeService.deleteSearchList();
		
		List<HomeSearchVO> searchList = homeService.listSearchList();
		
		model.addAttribute("searchList", searchList);
		
		return "login/find_pwd_result_fail";
	}
	
	@RequestMapping(value = "/idCheck", method = RequestMethod.POST)
	@ResponseBody
	public String idCheck(Locale locale, Model model, HttpServletRequest request) throws Exception {
		
		int deleteResult = homeService.deleteSearchList();
		
		List<HomeSearchVO> searchList = homeService.listSearchList();
		
		model.addAttribute("searchList", searchList);
		
		String id = request.getParameter("id");
		
		MemberVO idCheck = memberService.idCheckMember(id);
		
		if(idCheck != null) {
			return "idCheckFail";
			
		}else {
			return "idCheckSuccess";
		}
	}
	
	/*
	 * @RequestMapping(value = "/send_number", method = RequestMethod.POST)
	 * 
	 * @ResponseBody public String send_number(Locale locale, Model model,
	 * HttpServletRequest request) throws Exception {
	 * 
	 * int deleteResult = homeService.deleteSearchList();
	 * 
	 * List<HomeSearchVO> searchList = homeService.listSearchList();
	 * 
	 * model.addAttribute("searchList", searchList);
	 * 
	 * String id = request.getParameter("id");
	 * 
	 * MemberVO idCheck = memberService.idCheckMember(id);
	 * 
	 * if(idCheck != null) { return "idCheckFail";
	 * 
	 * }else { memberService.deleteTempNum(id);
	 * 
	 * String ranNum = randomNumber.random();
	 * 
	 * MemberVO tempVo = new MemberVO(); tempVo.setId(id);
	 * tempVo.setTemp_number(ranNum);
	 * 
	 * int result = memberService.insertTempNum(tempVo);
	 * 
	 * if(result > 0) {
	 * 
	 * String setfrom = "homefriendsmail@gmail.com"; 
	 * String tomail = id; // 받는 사람 이메일
	 * String title = "[홈 프렌즈] 이메일 인증 번호입니다."; // 제목 
	 * String content =	"이메일 인증 번호는 "+ranNum+" 입니다."; // 내용
	 * 
	 * try { MimeMessage message = mailSender.createMimeMessage(); MimeMessageHelper
	 * messageHelper = new MimeMessageHelper(message, true, "UTF-8");
	 * 
	 * messageHelper.setFrom(setfrom); // 보내는사람 생략하면 정상작동을 안함
	 * messageHelper.setTo(tomail); // 받는사람 이메일 
	 * messageHelper.setSubject(title); // 메일제목은 생략이 가능하다 
	 * messageHelper.setText(content); // 메일 내용
	 * 
	 * mailSender.send(message); } catch (Exception e) { System.out.println(e); }
	 * 
	 * return "success";
	 * 
	 * }else { return "fail"; } } }
	 */
	
	/*
	 * @RequestMapping(value = "/temp_num_check", method = RequestMethod.POST)
	 * 
	 * @ResponseBody public String temp_num_check(Locale locale, Model model,
	 * HttpServletRequest request) throws Exception {
	 * 
	 * int deleteResult = homeService.deleteSearchList();
	 * 
	 * List<HomeSearchVO> searchList = homeService.listSearchList();
	 * 
	 * model.addAttribute("searchList", searchList);
	 * 
	 * String id = request.getParameter("id"); String temp_number =
	 * request.getParameter("temp_number");
	 * 
	 * MemberVO vo = new MemberVO();
	 * 
	 * vo.setId(id); vo.setTemp_number(temp_number);
	 * 
	 * MemberVO tempCheck = memberService.tempNumCheck(vo);
	 * 
	 * if(tempCheck != null) { return "success";
	 * 
	 * }else { return "fail"; } }
	 */
	
	@RequestMapping(value = "/kakaoLogin.do", method = RequestMethod.POST)
	public String kakaoLogin(Locale locale, Model model, HttpServletRequest request, MemberVO vo) throws Exception {
		
		int deleteResult = homeService.deleteSearchList();
		
		List<HomeSearchVO> searchList = homeService.listSearchList();
		
		model.addAttribute("searchList", searchList);
		
		HttpSession session = request.getSession();
		
		
		vo.setProfile_system("kakao.png");
		
		session.setAttribute("kakaoUser", vo);
		
		return "redirect:/";	
	}
	
	/*
	 * @RequestMapping(value = "/facebookLogin.do", method = RequestMethod.POST)
	 * public String facebookLogin(Locale locale, Model model, HttpServletRequest
	 * request, MemberVO vo) throws Exception {
	 * 
	 * int deleteResult = homeService.deleteSearchList();
	 * 
	 * List<HomeSearchVO> searchList = homeService.listSearchList();
	 * 
	 * model.addAttribute("searchList", searchList);
	 * 
	 * HttpSession session = request.getSession();
	 * 
	 * 
	 * vo.setProfile_system("facebook.png");
	 * 
	 * session.setAttribute("facebookUser", vo);
	 * 
	 * return "redirect:/"; }
	 */
		
	//네이버 로그인 성공시 callback호출 메소드
	@RequestMapping(value = "/naverCallback", method = { RequestMethod.GET, RequestMethod.POST })
	public String callback(Model model, @RequestParam String code, NaverLoginVO naverLoginVO, 
			@RequestParam String state, HttpServletRequest request) throws Exception {
		
		HttpSession session = request.getSession(); 
		
		OAuth2AccessToken oauthToken;
		oauthToken = naverLoginVO.getAccessToken(session, code, state);
		
		//1. 로그인 사용자 정보를 읽어온다.
		apiResult = naverLoginVO.getUserProfile(oauthToken); //String형식의 json데이터
		/** apiResult json 구조
		{"resultcode":"00",
		"message":"success",
		"response":{"id":"33666449","nickname":"shinn****","age":"20-29","gender":"M","email":"sh@naver.com","name":"\uc2e0\ubc94\ud638"}}
		**/
		
		//2. String형식인 apiResult를 json형태로 바꿈
		JSONParser parser = new JSONParser();
		Object obj = parser.parse(apiResult);
		JSONObject jsonObj = (JSONObject) obj;
		
		//3. 데이터 파싱
		//Top레벨 단계 _response 파싱
		JSONObject response_obj = (JSONObject)jsonObj.get("response");
		
		//response의 nickname값 파싱
		String nickname = (String)response_obj.get("nickname");
		String email = (String)response_obj.get("email");
		String id = (String)response_obj.get("id");
		String mobile = (String)response_obj.get("mobile");
		String gender = (String)response_obj.get("gender");
		String birthday = (String)response_obj.get("birthday");
		String birthyear = (String)response_obj.get("birthyear");
		String name = (String)response_obj.get("name");
		String profile_image = (String)response_obj.get("profile_image");
		String[] birthdayAry = birthday.split("-");
		
		model.addAttribute("result", apiResult);
						
		MemberVO naverUser = new MemberVO();
		
		naverUser.setNick_name(nickname);
		naverUser.setId(email);
		naverUser.setPass(id);
		naverUser.setUid(id);
		naverUser.setPhone(mobile);
		naverUser.setBirthday(birthyear+"년 "+birthdayAry[0]+"월 "+birthdayAry[1]+"일");
		naverUser.setGender(gender);
		naverUser.setMembername(name);
		naverUser.setProfile_origin(profile_image);
		naverUser.setProfile_system("naver.png");
		naverUser.setPost_code("00000");
		naverUser.setAddr("주소를 등록해주세요");
		
		MemberVO naverLoginUser = memberService.loginNaverMember(naverUser);
		
		if(naverLoginUser != null) {
			session.setAttribute("loginUser",naverLoginUser);
			
			return "redirect:/";
		}else {
			memberService.insertNaverMember(naverUser);
			
			MemberVO loginUser = memberService.loginNaverMember(naverUser);
			
			session.setAttribute("loginUser",loginUser);
			
			return "redirect:/";
		}
	}
	
	@RequestMapping(value = "/phoneCheck", method = RequestMethod.GET)
	@ResponseBody 
	public String sendSMS(@RequestParam("phone") String userPhoneNumber) throws Exception { // 휴대폰 문자보내기 
		int randomNum = (int)((Math.random()* (999999 - 100000 + 1)) + 100000);//난수 생성
		
		testService.certifiedPhoneNumber(userPhoneNumber,randomNum); 
		
		return Integer.toString(randomNum);
	}
	
	@RequestMapping(value = "/phoneCheck", method = RequestMethod.POST)
	@ResponseBody
	public String phoneCheck(Locale locale, Model model, HttpServletRequest request) throws Exception {
		
		int deleteResult = homeService.deleteSearchList();
		
		List<HomeSearchVO> searchList = homeService.listSearchList();
		
		model.addAttribute("searchList", searchList);
		
		String phone = request.getParameter("phone");
		String phone1 = phone.substring(0, 3);
		String phone2 = phone.substring(3, 7);
		String phone3 = phone.substring(7);
		
		MemberVO vo = new MemberVO();
		vo.setPhone1(phone1);
		vo.setPhone2(phone2);
		vo.setPhone3(phone3);
		
		MemberVO phoneCheck = memberService.phoneCheckMember(vo);
		
		if(phoneCheck != null) {
			return "CheckFail";
			
		}else {
			return "CheckSuccess";
		}
	}
	
	
}
