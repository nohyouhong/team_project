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
import com.kh.team.vo.PayVo;

@Controller
@RequestMapping("/pay")
public class PayController {
	
	@Autowired
	private AddrService addrService;
	
	@Autowired
	private PayService payService;

	
	@RequestMapping(value="/paymentScreen", method=RequestMethod.GET)
	public String paymentScreen(HttpSession session, Model model, int[] o_pno) {
		List<OrderProductVo> orderLists = new ArrayList<>();
		for (int i = 0; i < o_pno.length; i++) {
			System.out.println("o_pno: " + o_pno[i]);
			List<OrderProductVo> orderList = payService.getOrderList(o_pno[i]);
			System.out.println("orderList: " + orderList);
			OrderProductVo orderProductVo = orderList.get(0);
			int p_ino = orderProductVo.getP_ino();
			int p_bno = orderProductVo.getP_bno();
			List<OrderProductVo> orderOptionList = payService.getOrderOptionList(p_ino);
			OrderProductVo optionVo = orderOptionList.get(0);
			String p_option = optionVo.getP_option();
			int p_price = optionVo.getP_price();
			String p_discount = optionVo.getP_discount();
			List<String> productName = payService.getProductName(p_bno);
			int pno = optionVo.getPno();
			String p_title = productName.get(0);
			int deliver_count = payService.getDeliverCount(p_bno);
//			System.out.println("deliver_count: " + deliver_count);
			orderProductVo.setO_pno(o_pno[i]);
			orderProductVo.setPno(pno);
			orderProductVo.setP_option(p_option);
			orderProductVo.setP_price(p_price);
			orderProductVo.setP_discount(p_discount);
			orderProductVo.setP_title(p_title);
			orderProductVo.setDeliver_count(deliver_count);
			orderOptionList.add(orderProductVo);
			orderLists.add(orderProductVo);
		}
		for (int i = 1; i < orderLists.size(); i++) {
			if(orderLists.get(i).getPno() == orderLists.get(i-1).getPno()) {
				orderLists.get(i).setO_deliverycharge(0);
			}
//			System.out.println("orderLists: " + orderLists);
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
	
	@RequestMapping(value="/getRecentAddr", method=RequestMethod.GET)
	@ResponseBody
	public PayVo getRecentAddr(HttpSession session) {
		MemberVo loginVo = (MemberVo)session.getAttribute("loginVo");
		String userid = loginVo.getUserid();
		PayVo payVo = payService.getRecentAddr(userid);
		return payVo;
	}
	
	@RequestMapping(value="/getFinalOrder", method=RequestMethod.POST)
	public String getFinalOrder(PayVo payVo, HttpSession session) {
		MemberVo memberVo = (MemberVo)session.getAttribute("loginVo");
		int hno = payService.getNextHno();
		payVo.setUserid(memberVo.getUserid());
		payVo.setHno(hno);
		payService.insertFinalAddr(payVo);
		for(int i = 0; i < payVo.getH_titles().length; i++) {
			String h_picture = payVo.getH_pictures()[i];
			String h_title = payVo.getH_titles()[i];
			String h_option = payVo.getH_options()[i];
			int h_amount = payVo.getH_amounts()[i];
			int h_price = payVo.getH_prices()[i];
			int h_deliverycharge = payVo.getH_deliverycharges()[i];
			int h_sale = payVo.getH_sales()[i];
			int h_sum_price = payVo.getH_sum_prices()[i];
			PayVo payProductVo = new PayVo(hno, h_picture, h_title, h_option, h_amount, h_price, h_sale, h_sum_price, h_deliverycharge);
			payService.insertFinalProduct(payProductVo);
			payService.updateOState(payVo.getO_pno()[i]);
		}
		
		return "redirect: /pointshop/order_complete";
	}
	
}
