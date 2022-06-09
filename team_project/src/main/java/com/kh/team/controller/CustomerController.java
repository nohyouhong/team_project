package com.kh.team.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.team.service.NoticeService;
import com.kh.team.vo.NoticeVo;
import com.kh.team.vo.PagingDto;

@Controller
@RequestMapping("/customer")
public class CustomerController {
	
	@Autowired
	NoticeService noticeService;
	
	@RequestMapping(value="/customer_center", method=RequestMethod.GET)
	public String coustomerCenter() {
		return "customer/customer_center";
	}
	
	@RequestMapping(value="/agreement", method=RequestMethod.GET)
	public String agreement() {
		return "customer/agreement";
	}
	
	@RequestMapping(value="/rules", method=RequestMethod.GET)
	public String rules() {
		return "customer/rules";
	}
	
	@RequestMapping(value="/notice", method=RequestMethod.GET)
	public String notice(PagingDto pagingDto, Model model) {
		pagingDto.setCount(noticeService.getCount(pagingDto));
		pagingDto.setPage(pagingDto.getPage());
		List<NoticeVo> notice_list = noticeService.noticeList(pagingDto);
		model.addAttribute("notice_list", notice_list);
		model.addAttribute("pagingDto", pagingDto);
		return "customer/notice";
	}
	
	
	@RequestMapping(value="/inquiry_form", method=RequestMethod.GET)
	public String inquiry() {
		return "customer/inquiry_form";
	}
	
	@RequestMapping(value="/notice_form", method=RequestMethod.GET)
	public String noticeForm() {
		return "customer/notice_form";
	}

	@RequestMapping(value="/notice_run", method=RequestMethod.POST)
	public String createRun(NoticeVo noticeVo, RedirectAttributes rttr) {
		System.out.println("notice_run, noticeVo:" + noticeVo);
		boolean result = noticeService.insertNotice(noticeVo);
		rttr.addFlashAttribute("insert_notice", result);
		return "redirect:/customer/notice";
	}
}
