package com.kh.team.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/pay")
public class PayController {
	
	
	@RequestMapping(value="/paymentScreen", method=RequestMethod.GET)
	public String paymentScreen() {
		
		return "pointshop/payment_screen";
	}
	
}
