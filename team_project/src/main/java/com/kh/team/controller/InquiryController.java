package com.kh.team.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.team.service.InquiryService;
import com.kh.team.vo.InquiryVo;

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
}
