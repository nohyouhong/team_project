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
	public String inquiry() {
		return "inquiry/inquiry_form";
	}
	
	@RequestMapping(value="/inquiry_run", method=RequestMethod.POST)
	public String inquiryRun(InquiryVo inquiryVo) {
		inquiryService.insertInquiry(inquiryVo);
		return "redirect:/inquiry/inquiry_list";
	}
	
	@RequestMapping(value="/inquiry_list", method=RequestMethod.GET)
	public String inquiryList(HttpSession session, InquiryVo inquiryVo, Model model, PagingDto pagingDto) {
		MemberVo loginVo = (MemberVo)session.getAttribute("loginVo");
		String writer = loginVo.getUserid();
		pagingDto.setCount(inquiryService.getCount(pagingDto));
		pagingDto.setPage(pagingDto.getPage());
		List<InquiryVo> inquiryList = inquiryService.InquiryList(writer, pagingDto);
		List<InquiryVo> allInquiryList = inquiryService.allInquiryList(pagingDto);
		model.addAttribute("inquiryList", inquiryList);
		model.addAttribute("allInquiryList", allInquiryList);
		model.addAttribute("pagingDto", pagingDto);
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
		inquiryService.deleteInquiry(a_bno);
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
	
	@RequestMapping(value="/inquiryReplyForm", method=RequestMethod.GET)
	public String inquiryReplyForm(int a_bno, Model model) {
		InquiryVo inquiryVo = inquiryService.readInquiry(a_bno);
		model.addAttribute("inquiryVo", inquiryVo);
		return "/inquiry/inquiryReply_form";
	}
	
	@RequestMapping(value="/inquiryReplyRun", method=RequestMethod.POST)
	public String inquiryReplyRun(InquiryVo inquiryVo) {
		inquiryService.insertInquiryReply(inquiryVo);
		return "redirect:/inquiry/inquiry_list";
	}
}
