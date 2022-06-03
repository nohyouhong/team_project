package com.kh.team.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.team.service.MemberService;

@Controller
@RequestMapping("/column")
public class ColumnController {
	
	@Autowired
	MemberService memberService;
	
	
	@RequestMapping(value="/column_list", method=RequestMethod.GET) 
	public String column_list() {
		
		return "column/column_list";
	}
	
	@RequestMapping(value="/column_content", method=RequestMethod.GET) 
	public String column_content() {
		
		return "column/column_content";
	}
	
	
}
