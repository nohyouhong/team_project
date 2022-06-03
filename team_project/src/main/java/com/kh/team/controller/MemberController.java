package com.kh.team.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.team.service.MemberService;
import com.kh.team.vo.MemberVo;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	MemberService memberService;
	
	@RequestMapping(value="/mapper", method=RequestMethod.GET) 
	public String home() {
		return "member/home";
	}
	
	@RequestMapping(value="/getMemberById", method=RequestMethod.GET) 
	public String getMemberById(String userid, Model model) {
//		MemberVo memberVo = memberService.getMemberById(userid);
//		model.addAttribute("memberVo", memberVo);
		return "member/info";
	}
	
	@RequestMapping(value="/join_form", method=RequestMethod.GET)
	public String joinForm() {
		return "member/join_form";
	}

	@RequestMapping(value="/login_form", method=RequestMethod.GET)
	public String loginForm() {
		return "member/login_form";
	}
	
	@RequestMapping(value="/point_list", method = RequestMethod.GET)
	public String pointList() {
		
		return "point/point_list";
	}
}
