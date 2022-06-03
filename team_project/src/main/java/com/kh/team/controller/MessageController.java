package com.kh.team.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.team.service.MessageService;
import com.kh.team.vo.MessageVo;

@Controller
@RequestMapping("/message")
public class MessageController {
	
	@Autowired
	private MessageService messageService;
	
	@RequestMapping(value="/message_list", method = RequestMethod.GET)
	public String pointList(Model model) {
		String userid = "user01";
		List<MessageVo> r_msg_list = messageService.listMessage(userid, messageService.TYPE_RECEIVER);
		List<MessageVo> s_msg_list = messageService.listMessage(userid, messageService.TYPE_SENDER);
		model.addAttribute("receive_messagelist", r_msg_list);
		model.addAttribute("send_messagelist", s_msg_list);
		return "message/message_list";
	}
}
