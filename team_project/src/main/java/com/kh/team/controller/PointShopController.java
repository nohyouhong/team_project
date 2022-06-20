package com.kh.team.controller;

import java.io.FileInputStream;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.team.service.PointShopService;

@Controller
@RequestMapping("/pointshop")
public class PointShopController {
	
	@Autowired
	private PointShopService pointShopService;
	
	@RequestMapping(value="/createForm", method=RequestMethod.GET)
	public String createForm() {
		return "pointshop/create_form";
	}
	
	@RequestMapping(value="/update_form", method=RequestMethod.GET)
	public String updateForm() {
		return "pointshop/update_form";
	}
	
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public String list() {
		return "pointshop/list";
	}
	
	@RequestMapping(value="/read", method=RequestMethod.GET)
	public String read() {
		return "pointshop/read";
	}
	
	@RequestMapping(value="/shopping_basket", method=RequestMethod.GET)
	public String shoppingBasket() {
		return "pointshop/shopping_basket";
	}
}
