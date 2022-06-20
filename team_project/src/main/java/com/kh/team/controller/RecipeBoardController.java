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

import com.kh.team.service.RecipeBoardService;
import com.kh.team.util.MyFileUploader;
import com.kh.team.vo.MemberVo;
import com.kh.team.vo.PagingDto;
import com.kh.team.vo.RecipeBoardVo;
import com.kh.team.vo.RecipeStepVo;
import com.kh.team.vo.IngredientListVo;
import com.kh.team.vo.IngredientVo;

@Controller
@RequestMapping("/recipeboard")
public class RecipeBoardController {
	
	@Autowired
	private RecipeBoardService recipeBoardService;
	
	@RequestMapping(value="/createForm", method=RequestMethod.GET)
	public String createForm() {
		return "recipeboard/create_form";
	}
	
	@RequestMapping(value="/createRun", method=RequestMethod.POST)
	public String createRun(RecipeBoardVo recipeBoardVo, IngredientVo ingredientVo, 
			IngredientListVo ingredientListVo, HttpSession session, RedirectAttributes rttr, MultipartFile file, 
			@RequestParam("files") List<MultipartFile> files) {
		MemberVo memberVo = (MemberVo)session.getAttribute("loginVo");
		String userid = memberVo.getUserid();
		recipeBoardVo.setUserid(userid);
		try {
			//타이틀이미지
			String originalFilename = file.getOriginalFilename();
			String r_titlepic = MyFileUploader.uploadFile(
					"//192.168.0.110/boardattach", originalFilename, file.getBytes());
			recipeBoardVo.setR_titlepic(r_titlepic);
			
			//요리스탭이미지들
			int index = 0;
			String[] pictures = new String[files.size()];
			for(MultipartFile onefile : files) {
				String oneOriginalFilename = onefile.getOriginalFilename();
//				System.out.println(index + oneOriginalFilename);
				if(oneOriginalFilename != null && !oneOriginalFilename.equals("")) {
					String picture = MyFileUploader.uploadFile(
							"//192.168.0.110/boardattach", oneOriginalFilename, onefile.getBytes());
					pictures[index++] = picture;
				} else{
					pictures[index++] = "";
				}
			}
			recipeBoardVo.setPictures(pictures);
//			System.out.println("BoardController, createRun, recipeBoardVo: " + recipeBoardVo);
			
			boolean result = recipeBoardService.create(recipeBoardVo, ingredientListVo);
//			System.out.println("BoardController, createRun, result: " + result);
			rttr.addFlashAttribute("create_result", result);
		} catch(Exception e) {
			e.printStackTrace();
		}
		return "redirect:/recipeboard/list";
	}

	@RequestMapping(value="/read", method=RequestMethod.GET)
	public String read(int r_bno, Model model, PagingDto pagingDto) {
//		System.out.println("BoardController, read, r_bno: " + r_bno);
//		System.out.println("BoardController, read, pagingDto: " + pagingDto);
		RecipeBoardVo recipeBoardVo = recipeBoardService.read(r_bno);
		List<IngredientVo> ingredientVoList = recipeBoardService.readIngreds(r_bno);
		List<RecipeStepVo> recipeStepVoList = recipeBoardService.readStepVos(r_bno);
		List<String> tagList = recipeBoardService.getTags(r_bno);
		MemberVo memberVo = recipeBoardService.getMemberVoByBno(r_bno);
//		System.out.println(recipeBoardVo);
//		System.out.println(ingredientVoList);
//		System.out.println(recipeStepVoList);
//		System.out.println("tagList" + tagList);
		model.addAttribute("recipeBoardVo", recipeBoardVo);
		model.addAttribute("ingredientVoList", ingredientVoList);
		model.addAttribute("recipeStepVoList", recipeStepVoList);
		model.addAttribute("tagList", tagList);
		model.addAttribute("memberVo", memberVo);
		model.addAttribute("pagingDto", pagingDto);
		return "recipeboard/read";
	}
	
	@RequestMapping(value="/updateForm", method=RequestMethod.GET)
	public String updateForm(int r_bno, Model model, PagingDto pagingDto) {
		RecipeBoardVo recipeBoardVo = recipeBoardService.read(r_bno);
		List<IngredientVo> ingredientVoList = recipeBoardService.readIngreds(r_bno);
		List<RecipeStepVo> recipeStepVoList = recipeBoardService.readStepVos(r_bno);
		List<String> tagList = recipeBoardService.getTags(r_bno);
		model.addAttribute("recipeBoardVo", recipeBoardVo);
		model.addAttribute("ingredientVoList", ingredientVoList);
		model.addAttribute("recipeStepVoList", recipeStepVoList);
		model.addAttribute("tagList", tagList);
		model.addAttribute("pagingDto", pagingDto);
		return "recipeboard/update_form";
	}
	
	@RequestMapping(value="/updateRun", method=RequestMethod.POST)
	public String updateRun(RecipeBoardVo recipeBoardVo, IngredientVo ingredientVo, PagingDto pagingDto, 
			IngredientListVo ingredientListVo, HttpSession session, RedirectAttributes rttr, MultipartFile file, 
			@RequestParam("files") List<MultipartFile> files) {
//		System.out.println(recipeBoardVo);
//		System.out.println(ingredientListVo);
		MemberVo memberVo = (MemberVo)session.getAttribute("loginVo");
		String userid = memberVo.getUserid();
		recipeBoardVo.setUserid(userid);
		try {
			//타이틀이미지
			String originalFilename = file.getOriginalFilename();
			if(originalFilename != null && !originalFilename.equals("")) {
				String r_titlepic = MyFileUploader.uploadFile(
						"//192.168.0.110/boardattach", originalFilename, file.getBytes());
				recipeBoardVo.setR_titlepic(r_titlepic);
			} 
			//요리스탭이미지들
			int index = 0;
			String[] pictures = recipeBoardVo.getPictures();
			String[] updatePictures = new String[files.size()];
			for(MultipartFile onefile : files) {
				String oneOriginalFilename = onefile.getOriginalFilename();
//				System.out.println(index + oneOriginalFilename);
				if(oneOriginalFilename != null && !oneOriginalFilename.equals("")) {
					String picture = MyFileUploader.uploadFile(
							"//192.168.0.110/boardattach", oneOriginalFilename, onefile.getBytes());
					updatePictures[index] = picture;
					//썻던파일 필요없는건 폴더에서 지우기
					MyFileUploader.deleteFile(pictures[index]);
				} else{
					updatePictures[index] = pictures[index];
				}
				index++;
			}
			recipeBoardVo.setPictures(updatePictures);
			
			boolean result = recipeBoardService.update(recipeBoardVo, ingredientListVo);
			rttr.addFlashAttribute("update_result", result);
			rttr.addAttribute("bno", recipeBoardVo.getR_bno());
			rttr.addAttribute("page", pagingDto.getPage());
			rttr.addAttribute("perPage", pagingDto.getPerPage());
//			rttr.addAttribute("searchType", pagingDto.getSearchType());
//			rttr.addAttribute("keyword", pagingDto.getKeyword());
		} catch(Exception e) {
			e.printStackTrace();
		}
		return "redirect:/recipeboard/read?r_bno=" + recipeBoardVo.getR_bno();
	}

	@RequestMapping(value="/delete", method=RequestMethod.GET)
	public String delete(int r_bno, RedirectAttributes rttr, PagingDto pagingDto) {
		boolean result = recipeBoardService.delete(r_bno);
		rttr.addFlashAttribute("delete_result", result);
		rttr.addAttribute("page", pagingDto.getPage());
		rttr.addAttribute("perPage", pagingDto.getPerPage());
//		rttr.addAttribute("searchType", pagingDto.getSearchType());
//		rttr.addAttribute("keyword", pagingDto.getKeyword());
		return "redirect:/recipeboard/list";
	}
	
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public String list(Model model, PagingDto pagingDto) {
		int boardCount = recipeBoardService.getCount(pagingDto);
		pagingDto.setCount(boardCount);
		pagingDto.setPerPage(16);
		pagingDto.setPage(pagingDto.getPage());
//		System.out.println("pagingDto" + pagingDto);
		List<RecipeBoardVo> recipeBoardList = recipeBoardService.list(pagingDto);
//		System.out.println(recipeBoardList);
		model.addAttribute("recipeBoardList", recipeBoardList);
		model.addAttribute("pagingDto", pagingDto);
		model.addAttribute("boardCount", boardCount);
		
		return "recipeboard/list";
	}
	
	@RequestMapping(value="/uploadFile", method=RequestMethod.POST)
	@ResponseBody
	public String uploadFile(MultipartFile file) throws Exception{
//		System.out.println("file: " + file);
		String originalFilename = file.getOriginalFilename();
		byte[] fileData = file.getBytes();
		String saveFilename = MyFileUploader.uploadFile("//192.168.0.110/boardattach", originalFilename, fileData);
//		System.out.println("saveFilename: " + saveFilename);
		
		return saveFilename;
	}
	
	@RequestMapping(value="/displayImage", method=RequestMethod.GET)
	@ResponseBody
	public byte[] displayImage(String filename) throws Exception{
//		System.out.println("filename" + filename);
		FileInputStream fis = new FileInputStream(filename);
		byte[] data = IOUtils.toByteArray(fis);
		fis.close();
		return data;
	}
	
	@RequestMapping(value="/deleteFile", method=RequestMethod.GET)
	@ResponseBody
	public String deleteFile(String filename) {
		boolean result = MyFileUploader.deleteFile(filename);
		return String.valueOf(result);
	}
	
	@RequestMapping(value="/ingredInfoCreate", method=RequestMethod.POST)
	@ResponseBody
	public String ingredInfoCreate(IngredientVo ingredientVo) {
		boolean result = recipeBoardService.ingredInfoCreate(ingredientVo);
		return String.valueOf(result);
	}
	
	@RequestMapping(value="/checkIngredInfo", method=RequestMethod.GET)
	@ResponseBody
	public String checkIngredInfo(String i_name) {
		boolean result = recipeBoardService.checkIngredInfo(i_name);
		return String.valueOf(result);
	}
}
