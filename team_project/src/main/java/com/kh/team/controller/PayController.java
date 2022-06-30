package com.kh.team.controller;

import java.io.FileInputStream;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.team.service.AddrService;
import com.kh.team.service.PayService;
import com.kh.team.vo.AddrVo;
import com.kh.team.vo.MemberVo;
import com.kh.team.vo.OrderProductVo;

@Controller
@RequestMapping("/pay")
public class PayController {
	
	@Autowired
	private AddrService addrService;
	
	@Autowired
	private PayService payService;
	
	@RequestMapping(value="/paymentScreen", method=RequestMethod.GET)
	public String paymentScreen(HttpSession session, Model model, int[] o_pno) {
		List<Object> orderLists = new ArrayList<>();
		for (int i = 0; i < o_pno.length; i++) {
			List<OrderProductVo> orderList = payService.getOrderList(o_pno[i]);
			OrderProductVo orderProductVo = orderList.get(0);
			int p_ino = orderProductVo.getP_ino();
			int p_bno = orderProductVo.getP_bno();
			List<OrderProductVo> orderOptionList = payService.getOrderOptionList(p_ino);
			OrderProductVo optionVo = orderOptionList.get(0);
			String p_option = optionVo.getP_option();
			int p_price = optionVo.getP_price();
			String p_discount = optionVo.getP_discount();
			List<String> productName = payService.getProductName(p_bno);
			String p_title = productName.get(0);
			orderProductVo.setP_option(p_option);
			orderProductVo.setP_price(p_price);
			orderProductVo.setP_discount(p_discount);
			orderProductVo.setP_title(p_title);
			orderOptionList.add(orderProductVo);
			orderLists.add(orderProductVo);
		}
		model.addAttribute("orderLists", orderLists);
		return "pointshop/payment_screen";
	}
	
	@RequestMapping(value="/displayImage", method=RequestMethod.GET)
	@ResponseBody
	public byte[] displayImage(String filename) throws Exception{
		FileInputStream fis = new FileInputStream(filename);
		byte[] data = IOUtils.toByteArray(fis);
		fis.close();
		return data;
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
