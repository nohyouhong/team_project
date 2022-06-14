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
		inquiryService.insertInquiry(inquiryVo);
		return "redirect:/inquiry/inquiry_list";
	}
	
	@RequestMapping(value="/inquiry_list", method=RequestMethod.GET)
	public String inquiryList(HttpSession session, InquiryVo inquiryVo, Model model) {
		MemberVo loginVo = (MemberVo)session.getAttribute("loginVo");
		String userid = loginVo.getUserid();
		List<InquiryVo> inquiryList = inquiryService.InquiryList(userid,inquiryService.TYPE_SENDER);
		List<InquiryVo> allInquiryList = inquiryService.allInquiryList();
		model.addAttribute("inquiryList", inquiryList);
		model.addAttribute("allInquiryList", allInquiryList);
		return "inquiry/inquiry_list";
	}
	
	@RequestMapping(value="/inquiry_read", method=RequestMethod.GET)
	public String inquiryRead(int a_bno, Model model) {
		InquiryVo inquiryVo = inquiryService.readInquiry(a_bno);
		List<String> inquiryImages = inquiryService.getInquiryImages(a_bno);
		model.addAttribute("inquiryVo", inquiryVo);
		model.addAttribute("inquiryImages", inquiryImages);
		return "inquiry/inquiry_read";
	}
	
	@RequestMapping(value="/inquiry_delete", method=RequestMethod.GET)
	public String inquiryDelete(int a_bno) {
		boolean result = inquiryService.deleteInquiry(a_bno);
		return "redirect:/inquiry/inquiry_list";
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
}
