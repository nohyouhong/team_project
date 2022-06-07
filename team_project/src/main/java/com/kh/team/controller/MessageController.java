package com.kh.team.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.team.service.MessageService;
import com.kh.team.vo.MessageVo;
import com.kh.team.vo.PagingDto;

@Controller
@RequestMapping("/message")
public class MessageController {
	
	@Autowired
	private MessageService messageService;
	
	@RequestMapping(value="/send_list", method = RequestMethod.GET)
	public String sendMessageList(Model model, PagingDto pagingDto) {
		pagingDto.setCount(messageService.getCount(pagingDto));
		pagingDto.setPage(pagingDto.getPage());
		String userid = "user01";
		List<MessageVo> send_list = messageService.listMessage(userid, messageService.TYPE_SENDER, pagingDto);
		model.addAttribute("send_list", send_list);
		model.addAttribute("pagingDto", pagingDto);
		return "message/send_msg_list";
	}
	
	@RequestMapping(value="/receive_list", method = RequestMethod.GET)
	public String receiveMessageList(Model model, PagingDto pagingDto) {
		pagingDto.setCount(messageService.getCount(pagingDto));
		pagingDto.setPage(pagingDto.getPage());
		String userid = "user01";
		List<MessageVo> receive_list = messageService.listMessage(userid, messageService.TYPE_RECEIVER, pagingDto);
		model.addAttribute("receive_list", receive_list);
		model.addAttribute("pagingDto", pagingDto);
		return "message/receive_msg_list";
	}
	
	@RequestMapping(value="/message_read", method = RequestMethod.GET)
	public String readMessage(int mno, Model model) {
		MessageVo messageVo = messageService.readMessage(mno);
		model.addAttribute("messageVo", messageVo);
		return "message/message_read";
	}
	
	@RequestMapping(value="/message_delete", method = RequestMethod.GET)
	public String deleteMessage(int mno, RedirectAttributes rttr) {
		System.out.println("message_delete, mno: " +mno);
		boolean result = messageService.deleteMessage(mno);
		rttr.addFlashAttribute("message_delete", result);
		return "redirect:/message/message_list";
	}
}
