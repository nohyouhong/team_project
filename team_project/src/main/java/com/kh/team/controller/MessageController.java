package com.kh.team.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/message")
public class MessageController {
	@RequestMapping(value="/message_list", method = RequestMethod.GET)
	public String pointList() {
		
		return "message/message_list";
	}
}
