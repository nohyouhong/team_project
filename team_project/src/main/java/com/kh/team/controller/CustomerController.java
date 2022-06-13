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

import com.kh.team.service.NoticeService;
import com.kh.team.util.MyFileUploader;
import com.kh.team.vo.NoticeVo;
import com.kh.team.vo.PagingDto;

@Controller
@RequestMapping("/customer")
public class CustomerController {
	
	@Autowired
	NoticeService noticeService;
	
	@RequestMapping(value="/customer_center", method=RequestMethod.GET)
	public String coustomerCenter() {
		return "customer/customer_center";
	}
	
	@RequestMapping(value="/agreement", method=RequestMethod.GET)
	public String agreement() {
		return "customer/agreement";
	}
	
	@RequestMapping(value="/rules", method=RequestMethod.GET)
	public String rules() {
		return "customer/rules";
	}
	
	@RequestMapping(value="/notice", method=RequestMethod.GET)
	public String notice(PagingDto pagingDto, Model model) {
		pagingDto.setCount(noticeService.getCount(pagingDto));
		pagingDto.setPage(pagingDto.getPage());
		List<NoticeVo> notice_list = noticeService.noticeList(pagingDto);
		model.addAttribute("notice_list", notice_list);
		model.addAttribute("pagingDto", pagingDto);
		return "customer/notice";
	}
	
	
	@RequestMapping(value="/inquiry_form", method=RequestMethod.GET)
	public String inquiry() {
		return "customer/inquiry_form";
	}
	
	@RequestMapping(value="/notice_form", method=RequestMethod.GET)
	public String noticeForm() {
		return "customer/notice_form";
	}

	@RequestMapping(value="/notice_run", method=RequestMethod.POST)
	public String noticeRun(NoticeVo noticeVo, RedirectAttributes rttr) {
		System.out.println("notice_run, noticeVo:" + noticeVo);
		noticeService.insertNotice(noticeVo);
		return "redirect:/customer/notice";
	}
	
	@RequestMapping(value="/notice_modify_run", method=RequestMethod.POST)
	public String noticeRead(NoticeVo noticeVo, int n_bno, RedirectAttributes rttr) {
		System.out.println("noticeVo: " + noticeVo);
		noticeService.updateNotice(noticeVo);
		rttr.addAttribute("n_bno", noticeVo.getN_bno());
		rttr.addAttribute("n_title", noticeVo.getN_title());
		rttr.addAttribute("n_content", noticeVo.getN_content());
		return "redirect:/customer/notice";
	}
	
	@RequestMapping(value="/notice_delete", method= RequestMethod.GET)
	public String noticeDelete(int n_bno) {
		System.out.println("notice_delete, n_bno: " + n_bno);
		noticeService.deleteNotice(n_bno);
		return "redirect:/customer/notice";
	}
	
	@RequestMapping(value="/uploadFile", method = RequestMethod.POST)
	@ResponseBody
	public String uploadFile(MultipartFile file) throws Exception{
		String originalFilename = file.getOriginalFilename();
		byte[] fileData = file.getBytes();
		String saveFilename = MyFileUploader.uploadFile("C:/boardattach", originalFilename, fileData);
//		System.out.println("saveFilename: " + saveFilename);
		return saveFilename;
	}
	
	@RequestMapping(value="/deleteFile", method = RequestMethod.GET)
	@ResponseBody
	public String deleteFile(String filename) {
		boolean result = MyFileUploader.deleteFile(filename);
		return String.valueOf(result);
	}
}
