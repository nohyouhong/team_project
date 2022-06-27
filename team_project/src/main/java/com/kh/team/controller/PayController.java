package com.kh.team.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.team.service.AddrService;
import com.kh.team.vo.AddrVo;
import com.kh.team.vo.MemberVo;

@Controller
@RequestMapping("/pay")
public class PayController {
	
	@Autowired
	private AddrService addrService;
	
	@RequestMapping(value="/paymentScreen", method=RequestMethod.GET)
	public String paymentScreen(HttpSession session, Model model) {
//		MemberVo loginVo = (MemberVo)session.getAttribute("loginVo");
//		String userid = loginVo.getUserid();
//		List<AddrVo> addrList = addrService.addrList(userid);
//		model.addAttribute("addrList", addrList);
		return "pointshop/payment_screen";
	}
	
	@RequestMapping(value="/insertAddr", method=RequestMethod.POST)
	@ResponseBody
	public String insertAddr(AddrVo addrVo) {
		System.out.println("PayController, insertAddr, addrVo: " + addrVo);
		boolean result = addrService.insertAddr(addrVo);
		System.out.println("PayController, insertAddr, result: " + result);		
		return String.valueOf(result);
	}
	
	@RequestMapping(value="/addrList", method=RequestMethod.GET)
	@ResponseBody
	public List<AddrVo> addrList(HttpSession session) {
		MemberVo loginVo = (MemberVo)session.getAttribute("loginVo");
		String userid = loginVo.getUserid();
		List<AddrVo> addrList = addrService.addrList(userid);
		return addrList;
	}
	
	@RequestMapping(value="/readAddr", method=RequestMethod.GET)
	@ResponseBody
	public AddrVo readAddr(int add_no) {
		AddrVo addrVo = addrService.readAddr(add_no);
		return addrVo;
	}
	
	@RequestMapping(value="/deleteAddr", method=RequestMethod.GET)
	@ResponseBody
	public String deleteAddr(int add_no) {
		boolean result = addrService.deleteAddr(add_no);
		return String.valueOf(result);
	}
	
	@RequestMapping(value="/modifyAddr", method=RequestMethod.POST)
	@ResponseBody
	public String updateAddr(AddrVo addrVo) {
		System.out.println("updateAddr, addrVo: " + addrVo);
		boolean result = addrService.updateAddr(addrVo);
		return String.valueOf(result);
	}
	
	@RequestMapping(value="/getBasicAddr", method=RequestMethod.GET)
	@ResponseBody
	public AddrVo getBasicAddr(HttpSession session) {
		MemberVo loginVo = (MemberVo)session.getAttribute("loginVo");
		String userid = loginVo.getUserid();
		AddrVo addrVo = addrService.getBasicAddr(userid);
		return addrVo;
	}
}
