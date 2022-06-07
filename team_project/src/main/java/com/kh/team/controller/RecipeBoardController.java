package com.kh.team.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.team.service.RecipeBoardService;
import com.kh.team.util.MyFileUploader;
import com.kh.team.vo.RecipeBoardVo;

@Controller
@RequestMapping("/recipeboard")
public class RecipeBoardController {
	
	@Autowired
	private RecipeBoardService recipeBoardService;
	
	//글쓰기폼
	@RequestMapping(value="/createForm", method=RequestMethod.GET)
	public String createForm() {
		return "board/create_form";
	}
	
	//글등록
	@RequestMapping(value="/createRun", method=RequestMethod.POST)
	public String createRun(RecipeBoardVo recipeBoardVo, RedirectAttributes rttr) {
		System.out.println("BoardController, createRun, recipeBoardVo: " + recipeBoardVo);
		boolean result = recipeBoardService.create(recipeBoardVo);
		System.out.println("BoardController, createRun, result: " + result);
		rttr.addFlashAttribute("create_result", result);
		return "redirect:/recipeBoard/list";
	}

	//조회
	@RequestMapping(value="/read", method=RequestMethod.GET)
	public String read(int bno, Model model, PagingDto pagingDto) {
		System.out.println("BoardController, read, bno: " + bno);
		System.out.println("BoardController, read, pagingDto: " + pagingDto);
		RecipeBoardVo recipeBoardVo = recipeBoardService.read(bno);
		model.addAttribute("recipeBoardVo", recipeBoardVo);
		model.addAttribute("pagingDto", pagingDto);
		return "recipeboard/read";
	}
	
	@RequestMapping(value="/update_form", method=RequestMethod.GET)
	public String updateForm() {
		return "recipeboard/update_form";
	}
	
	@RequestMapping(value="/updateRun", method=RequestMethod.POST)
	public String updateRun(RecipeBoardVo recipeBoardVo, int bno, RedirectAttributes rttr, PagingDto pagingDto) {
		System.out.println("BoardController, updateRun, recipeBoardVo: " + recipeBoardVo);
		System.out.println("BoardController, updateRun, pagingDto: " + pagingDto);
		boolean result = recipeBoardService.update(recipeBoardVo);
		rttr.addFlashAttribute("update_result", result);
		rttr.addAttribute("bno", recipeBoardVo.getR_bno());
		rttr.addAttribute("page", pagingDto.getPage());
		rttr.addAttribute("perPage", pagingDto.getPerPage());
		rttr.addAttribute("searchType", pagingDto.getSearchType());
		rttr.addAttribute("keyword", pagingDto.getKeyword());
		return "redirect:/recipeboard/read";
	}
	
	@RequestMapping(value="/delete", method=RequestMethod.GET)
	public String delete(int bno, RedirectAttributes rttr, PagingDto pagingDto) {
		boolean result = recipeBoardService.delete(bno);
		rttr.addFlashAttribute("delete_result", result);
		rttr.addAttribute("page", pagingDto.getPage());
		rttr.addAttribute("perPage", pagingDto.getPerPage());
		rttr.addAttribute("searchType", pagingDto.getSearchType());
		rttr.addAttribute("keyword", pagingDto.getKeyword());
		return "redirect:/recipeboard/list";
	}
	
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public String list(Model model, PagingDto pagingDto) {
		pagingDto.setCount(recipeBoardService.getCount(pagingDto));
		pagingDto.setPage(pagingDto.getPage());
		List<RecipeBoardVo> recipeBoardList = recipeBoardService.list(pagingDto);
		model.addAttribute("boardList", recipeBoardList);
		model.addAttribute("pagingDto", pagingDto);
		
		return "recipeboard/list";
	}
	
	@RequestMapping(value="/replyRun", method=RequestMethod.POST)
	public String replyRun(RecipeBoardVo recipeBoardVo, RedirectAttributes rttr) {
		boolean result = recipeBoardService.insertReply(recipeBoardVo);
		rttr.addFlashAttribute("reply_result", result);
		return "redirect:/recipeboard/list";
	}
	
	@RequestMapping(value="/uploadFile", method=RequestMethod.POST)
	@ResponseBody
	public String uploadFile(MultipartFile file) throws Exception{
		System.out.println("file: " + file);
		String originalFilename = file.getOriginalFilename();
		byte[] fileData = file.getBytes();
		String saveFilename = MyFileUploader.uploadFile("//192.168.0.110/boardattach", originalFilename, fileData);
		System.out.println("saveFilename: " + saveFilename);
		
		return saveFilename;
	}
	
	@RequestMapping(value="/deleteFile", method=RequestMethod.GET)
	@ResponseBody
	public String deleteFile(String filename) {
		boolean result = MyFileUploader.deleteFile(filename);
		return String.valueOf(result);
	}
}
