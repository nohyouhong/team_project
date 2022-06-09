package com.kh.team.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/customer")
public class CustomerController {
	
	@RequestMapping(value="/customer_center", method=RequestMethod.GET)
	public String coustomerCenter() {
		return "customer/customer_center";
	}
	
	@RequestMapping(value="/agreement", method=RequestMethod.GET)
	public String inquiry() {
		return "customer/agreement";
	}
	
}
