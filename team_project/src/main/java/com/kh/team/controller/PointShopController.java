package com.kh.team.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/point")
public class PointShopController {
	@RequestMapping(value="/point_list", method = RequestMethod.GET)
	public String pointList() {
		
		return "point/point_list";
	}
}
