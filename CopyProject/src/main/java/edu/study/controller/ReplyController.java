package edu.study.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import edu.study.service.Community_ReplyService;
import edu.study.vo.Community_ReplyVO;

@RequestMapping(value="/reply")
@Controller
public class ReplyController {
	
	@Autowired
	private Community_ReplyService replyService;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 * @return 
	 * @throws Exception 
	 */	
	
	//댓글 조회
	
	//댓글 작성
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	@ResponseBody
	public String postWrite(Community_ReplyVO vo, HttpServletRequest request) throws Exception {
		
		replyService.write(vo);
		
		/* Gson 생성 */
		Gson gson = new Gson();
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		//key-value 형태로 맵에 저장
		map.put("vo", vo);
		
		// 맵을 JSON Object를 바꾸고 다시 문자열로 바꿈
	    String jsonString = gson.toJson(map);
	                
	    return jsonString;
		
	}
	//댓글 수정
	@RequestMapping(value="/modify", method = RequestMethod.POST)
	@ResponseBody
	public String postModify(int cbridx, Model model, Community_ReplyVO vo) throws Exception {
		
		replyService.modify(vo);
		
		model.addAttribute("cbridx", cbridx);
		
		/* Gson 생성 */
		Gson gson = new Gson();
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		//key-value 형태로 맵에 저장
		map.put("vo", vo);
		
		// 맵을 JSON Object를 바꾸고 다시 문자열로 바꿈
	    String jsonString = gson.toJson(map);
	                
	    return jsonString;
	}
	
	//댓글 삭제
	@RequestMapping(value="/delete", method = RequestMethod.POST)
	@ResponseBody
	public String postDelete(int cbridx, Model model, Community_ReplyVO vo) throws Exception {
		
		replyService.delete(cbridx);
		
		model.addAttribute("cbridx", cbridx);
		
		/* Gson 생성 */
		Gson gson = new Gson();
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		//key-value 형태로 맵에 저장
		map.put("vo", vo);
		
		// 맵을 JSON Object를 바꾸고 다시 문자열로 바꿈
	    String jsonString = gson.toJson(map);
	                
	    return jsonString;
	}
	
	//답글 작성
	@RequestMapping(value="/Reinsert", method = RequestMethod.POST)
	@ResponseBody
	public String postReinsert(Model model, Community_ReplyVO vo) throws Exception {
		
		replyService.Reinsert(vo);
		
		/* 답글 작성 lvl 업데이트 */
		replyService.lvlUp(vo);
		
		/* Gson 생성 */
		Gson gson = new Gson();
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		//key-value 형태로 맵에 저장
		map.put("vo", vo);
		
		// 맵을 JSON Object를 바꾸고 다시 문자열로 바꿈
	    String jsonString = gson.toJson(map);
	                
	    return jsonString;
	}
}
