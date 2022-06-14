package com.kh.team.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.team.service.InquiryService;
import com.kh.team.vo.InquiryVo;
import com.kh.team.vo.MemberVo;

@Controller
@RequestMapping("/inquiry")
public class InquiryController {
	
	@Autowired
	private InquiryService inquiryService;
	
	@RequestMapping(value="/inquiry_form", method=RequestMethod.GET)
	public String inquiry() {
		return "inquiry/inquiry_form";
	}
	
	@RequestMapping(value="/inquiry_run", method=RequestMethod.POST)
	public String inquiryRun(InquiryVo inquiryVo, RedirectAttributes rttr) {
		System.out.println("inquiry_run, inquiryVo:" + inquiryVo);
		inquiryService.insertInquiry(inquiryVo);
		return "redirect:/inquiry/inquiry_list";
	}
	
	@RequestMapping(value="/inquiry_list", method=RequestMethod.GET)
	public String inquiryList(HttpSession session, InquiryVo inquiryVo, Model model) {
		MemberVo loginVo = (MemberVo)session.getAttribute("loginVo");
		String userid = loginVo.getUserid();
		List<InquiryVo> inquiryList = inquiryService.InquiryList(userid);
		model.addAttribute("inquiryList", inquiryList);
		return "inquiry/inquiry_list";
	}
}
