package com.kh.team.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.team.service.DeclareService;
import com.kh.team.vo.DeclareVo;

@Controller
@RequestMapping("/declare")
public class DeclareController {
	
	@Autowired
	DeclareService declareService;
	
	//레시피 댓글 관련----------------------------------------
	
	//관리자입장에서 보는 최근순서로 나오는 신고내역들
	@RequestMapping(value="/recipeCommentDeclareList", method = RequestMethod.GET)
	public String pointList(Model model) {
		List<DeclareVo> declareList = declareService.recipeCommentDeclareList();
		model.addAttribute("declareList", declareList);
		return "";
	};
	
	//특정인이 받은 신고접수만 보고싶을때(과거전적)
	@RequestMapping(value="/recipeCommentDeclareListByCriminal", method = RequestMethod.GET)
	public String pointList(String criminal, Model model) {
		List<DeclareVo> declareList = declareService.recipeCommentDeclareListByCriminal(criminal);
		model.addAttribute("declareList", declareList);
		return "";
	};
	
	//신고접수
	@RequestMapping(value="/insertRecipeCommentDeclare", method=RequestMethod.POST)
	@ResponseBody
	public boolean insertRecipeCommentDeclare(DeclareVo declareVo) {
		boolean result = declareService.insertRecipeCommentDeclare(declareVo);
		return result;
	}

	//??? 관련----------------------------------------
	
	
}
