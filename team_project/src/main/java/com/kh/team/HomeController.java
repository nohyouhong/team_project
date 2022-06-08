package com.kh.team;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.team.service.MemberService;
import com.kh.team.vo.MemberVo;

@Controller
public class HomeController {
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(HttpSession session) {
//		MemberVo loginVo = memberService.getMemberById("user01");
//		session.setAttribute("loginVo", loginVo);
		return "main_contents";
	}
	
}
