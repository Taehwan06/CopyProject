package edu.study.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import edu.study.service.ScrapService;
import edu.study.vo.MemberVO;
import edu.study.vo.ScrapVO;

/**
 * Handles requests for the application home page.
 */
@RequestMapping(value="/scrap")
@Controller
public class ScrapController {
	
	@Autowired
	private ScrapService scrapService;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 * @return 
	 * @throws Exception 
	 */
	
	//스크랩 하기
	@RequestMapping(value="/scrapUp", method = RequestMethod.POST)
	@ResponseBody
	public String scrapOn(int cbidx, HttpServletRequest req, Model model) throws Exception {
		
		String nowUri = req.getRequestURI();
	      
        HttpSession session = req.getSession();
        session.setAttribute("nowUri", nowUri);
        
        MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");
        
        ScrapVO scrap = new ScrapVO();
        scrap.setCbidx(cbidx);
        scrap.setMidx(loginUser.getMidx());
        
        scrapService.scrapOn(scrap);
        scrapService.scrapUp(cbidx);
		
		return "ScrapOK";
	}
	
	//스크랩 취소
	@RequestMapping(value="/scrapDown", method = RequestMethod.POST)
	@ResponseBody
	public String scrapOff(int cbidx, HttpSession session, Model model) throws Exception {
		
		MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");
        
        ScrapVO scrap = new ScrapVO();
        scrap.setCbidx(cbidx);
        scrap.setMidx(loginUser.getMidx());
        
        scrapService.scrapOff(scrap);
        scrapService.scrapDown(cbidx);
		
		return "UnScrapOK";
	}
}
