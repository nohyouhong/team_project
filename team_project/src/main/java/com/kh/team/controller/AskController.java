package com.kh.team.controller;

import java.io.FileInputStream;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.team.service.AskService;
import com.kh.team.vo.AskVo;
import com.kh.team.vo.MemberVo;
import com.kh.team.vo.PagingDto;

@Controller
@RequestMapping("/ask")
public class AskController {
	
	@Autowired
	private AskService askService;
	
	@RequestMapping(value="/ask_form", method=RequestMethod.GET)
	public String ask() {
		return "ask/ask_form";
	}
	
	@RequestMapping(value="/all_ask_form", method=RequestMethod.GET)
	public String allask() {
		return "ask/all_ask_form";
	}
	
	@RequestMapping(value="/ask_run", method=RequestMethod.POST)
	public String askRun(HttpSession session, AskVo askVo) {
		MemberVo loginVo = (MemberVo)session.getAttribute("loginVo");
		String writer = loginVo.getUserid();
		askVo.setWriter(writer);
//		System.out.println("askVo: "+askVo);
		askService.insertAsk(askVo);
		return "redirect:/ask/ask_list";
	}
	
	@RequestMapping(value="/ask_board", method=RequestMethod.GET)
	public String askBoard() {
		return "ask/ask_board";
	}
	
	@RequestMapping(value="/ask_list", method=RequestMethod.GET)
	public String askList(HttpSession session, AskVo askVo, Model model, PagingDto pagingDto) {
		MemberVo loginVo = (MemberVo)session.getAttribute("loginVo");
		String writer = loginVo.getUserid();
		pagingDto.setCount(askService.getCount(pagingDto));
		pagingDto.setPage(pagingDto.getPage());
		List<AskVo> askList = askService.AskList(writer, pagingDto);
		model.addAttribute("askList", askList);
		model.addAttribute("pagingDto", pagingDto);
		return "ask/ask_list";
	}
	
	@RequestMapping(value="/ask_admin_list", method=RequestMethod.GET)
	public String askAdminList(AskVo askVo, Model model, PagingDto pagingDto) {
		pagingDto.setCount(askService.getCount(pagingDto));
		pagingDto.setPage(pagingDto.getPage());
		List<AskVo> allAskList = askService.allAskList(pagingDto);
		model.addAttribute("allAskList", allAskList);
		model.addAttribute("pagingDto", pagingDto);
		return "ask/ask_admin_list";
	}
	
	@RequestMapping(value="/ask_read", method=RequestMethod.GET)
	public String askRead(int a_bno, Model model) {
		AskVo askVo = askService.readAsk(a_bno);
		List<String> askImages = askService.getAskImages(a_bno);
		model.addAttribute("askVo", askVo);
		model.addAttribute("askImages", askImages);
		return "ask/ask_read";
	}
	
	@RequestMapping(value="/ask_delete", method=RequestMethod.GET)
	public String askDelete(int a_bno) {
		askService.deleteAsk(a_bno);
		return "redirect:/ask/ask_list";
	}
	
	@RequestMapping(value = "/displayImage", method = RequestMethod.GET)
	@ResponseBody
	public byte[] displayImage(String filename) throws Exception {
		FileInputStream fis;
		fis = new FileInputStream(filename);
		byte[] data = IOUtils.toByteArray(fis);
		fis.close();
		return data;
	}
	
	@RequestMapping(value="/askReplyForm", method=RequestMethod.GET)
	public String askReplyForm(int a_bno, Model model) {
		AskVo askVo = askService.readAsk(a_bno);
		model.addAttribute("askVo", askVo);
		return "/ask/ask_reply_form";
	}
	
	@RequestMapping(value="/askReplyRun", method=RequestMethod.POST)
	public String askReplyRun(AskVo askVo) {
		askService.insertAskReply(askVo);
		return "redirect:/ask/ask_list";
	}
}
