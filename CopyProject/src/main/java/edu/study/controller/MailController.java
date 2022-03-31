package edu.study.controller;

import java.util.Locale;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import edu.study.service.MemberService;
import edu.study.util.RandomNumber;
import edu.study.util.RandomPass;
import edu.study.vo.MemberVO;

/**
 * Handles requests for the application home page.
 */
@RequestMapping(value="/mail")
@Controller
public class MailController {
	
	
	@Autowired
	private JavaMailSender mailSender;
	@Autowired
	private MemberService memberService;
	private RandomNumber randomNumber;
	private RandomPass randomPass;
	
	@RequestMapping(value = "/number_send.do")
	public String numberSending(Locale locale, Model model, MemberVO vo, HttpServletRequest request) throws Exception {

		String ranNum = randomNumber.random();
		String setfrom = "testmaillth@gmail.com";
		String tomail = "lth-mail@nate.com"; // 받는 사람 이메일
		String title = "[홈 프렌즈] 이메일 인증 번호입니다."; // 제목
		String content = "이메일 인증 번호는 "+ranNum+" 입니다."; // 내용

		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message,
					true, "UTF-8");

			messageHelper.setFrom(setfrom); // 보내는사람 생략하면 정상작동을 안함
			messageHelper.setTo(tomail); // 받는사람 이메일
			messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
			messageHelper.setText(content); // 메일 내용

			mailSender.send(message);
		} catch (Exception e) {
			System.out.println(e);
		}

		return "login/mail_send_result";
	}
	
	@RequestMapping(value = "/pass_send.do")
	public String passSending(Locale locale, Model model, MemberVO vo, HttpServletRequest request) throws Exception {

		MemberVO user = memberService.findPwd(vo);
		
		if(user == null) {
			return "login/find_pwd_result_none";
		}else {	
			String ranPass = randomPass.random();
			user.setPass(ranPass);
			
			int result = memberService.updateTempPwd(user);
			model.addAttribute("user", user);
			
			if(result>0) {
				
				
				String setfrom = "testmaillth@gmail.com";
				String tomail = "lth-mail@nate.com"; // 받는 사람 이메일
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
					
					return "login/find_pwd_result";
					
				} catch (Exception e) {
					System.out.println(e);
				}

				return "login/find_pwd_result_none";
				
			}else {
				return "login/find_pwd_result_fail";
			}
		}
		
	}
}
