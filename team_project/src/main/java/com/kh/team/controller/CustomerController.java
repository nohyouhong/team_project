package com.kh.team.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
	public String notice(Model model) {
		List<NoticeVo> notice_list = noticeService.noticeList();
		model.addAttribute("notice_list", notice_list);
		return "customer/notice";
	}
	
	
	@RequestMapping(value="/inquiry_form", method=RequestMethod.GET)
	public String inquiry() {
		return "customer/inquiry_form";
	}

	
}
