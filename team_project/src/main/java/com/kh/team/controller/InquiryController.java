package com.kh.team.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.team.service.InquiryService;
import com.kh.team.vo.InquiryVo;
import com.kh.team.vo.MemberVo;
import com.kh.team.vo.PagingDto;

@Controller
@RequestMapping("/inquiry")
public class InquiryController {
	
	@Autowired
	private InquiryService inquiryService;
	
	@RequestMapping(value="/inquiry_form", method=RequestMethod.GET)
	public String ask() {
		return "inquiry/inquiry_form";
	}
	
	@RequestMapping(value="/inquiry_run", method=RequestMethod.POST)
	public String inquiryRun(HttpSession session, InquiryVo inquiryVo) {
		MemberVo loginVo = (MemberVo)session.getAttribute("loginVo");
		String userid = loginVo.getUserid();
		inquiryVo.setUserid(userid);
		inquiryService.insertInquiry(inquiryVo);
		return "redirect:/inquiry/inquiry_list";
	}
	
	@RequestMapping(value="/inquiry_list", method=RequestMethod.GET)
	public String inquiryList(InquiryVo inquiryVo, Model model, PagingDto pagingDto) {
		pagingDto.setCount(inquiryService.getCount(pagingDto));
		pagingDto.setPage(pagingDto.getPage());
		List<InquiryVo> inquiryList = inquiryService.inquiryList(pagingDto);
		model.addAttribute("inquiryList", inquiryList);
		model.addAttribute("pagingDto", pagingDto);
		return "inquiry/inquiry_list";
	}
	
	@RequestMapping(value="/inquiry_admin_list", method=RequestMethod.GET)
	public String inquiryAdminList(InquiryVo inquiryVo, Model model, PagingDto pagingDto) {
		pagingDto.setCount(inquiryService.getCount(pagingDto));
		pagingDto.setPage(pagingDto.getPage());
		List<InquiryVo> inquiryList = inquiryService.inquiryList(pagingDto);
		model.addAttribute("inquiryList", inquiryList);
		model.addAttribute("pagingDto", pagingDto);
		return "inquiry/inquiry_admin_list";
	}
	
	@RequestMapping(value="/inquiry_read", method=RequestMethod.GET)
	public String inquiryRead(int i_bno, Model model) {
		InquiryVo inquiryVo = inquiryService.readInquiry(i_bno);
		model.addAttribute("inquiryVo", inquiryVo);
		return "inquiry/inquiry_read";
	}
	
	@RequestMapping(value="/inquiry_admin_read", method=RequestMethod.GET)
	public String inquiryAdminRead(int i_bno, Model model) {
		InquiryVo inquiryVo = inquiryService.readInquiry(i_bno);
		model.addAttribute("inquiryVo", inquiryVo);
		return "inquiry/inquiry_admin_read";
	}
	
	@RequestMapping(value="/inquiry_delete", method=RequestMethod.GET)
	public String inquiryDelete(int i_bno) {
		inquiryService.deleteInquiry(i_bno);
		return "redirect:/inquiry/inquiry_list";
	}
	
	@RequestMapping(value="/inquiryReplyForm", method=RequestMethod.GET)
	public String inquiryReplyForm(int i_bno, Model model) {
		InquiryVo inquiryVo = inquiryService.readInquiry(i_bno);
		model.addAttribute("inquiryVo", inquiryVo);
		return "/inquiry/inquiryReply_form";
	}
	
	@RequestMapping(value="/inquiryAdminReplyForm", method=RequestMethod.GET)
	public String inquiryAdminReplyForm(int i_bno, Model model) {
		InquiryVo inquiryVo = inquiryService.readInquiry(i_bno);
		model.addAttribute("inquiryVo", inquiryVo);
		return "/inquiry/inquiry_admin_reply_form";
	}
	
	@RequestMapping(value="/inquiryReplyRun", method=RequestMethod.POST)
	public String inquiryReplyRun(InquiryVo inquiryVo) {
		inquiryService.insertInquiryReply(inquiryVo);
		return "redirect:/inquiry/inquiry_list";
	}
	@RequestMapping(value="/inquiryAdminReplyRun", method=RequestMethod.POST)
	public String inquiryAdminReplyRun(InquiryVo inquiryVo) {
		inquiryService.insertInquiryReply(inquiryVo);
		return "redirect:/inquiry/inquiry_admin_list";
	}
}
