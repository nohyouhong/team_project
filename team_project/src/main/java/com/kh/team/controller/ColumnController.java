package com.kh.team.controller;


import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonObject;
import com.kh.team.service.MemberService;
import com.kh.team.util.MyFileUploader;
import com.kh.team.vo.ColumnVo;

@Controller
@RequestMapping("/column")
public class ColumnController {
	
	@Autowired
	MemberService memberService;
	
	// 컬럼 작성 폼
	@RequestMapping(value="/column_form", method=RequestMethod.GET)
	public String column_form()	{
		
		return "column/column_form";
	}
	
	@RequestMapping(value="/column_run", method=RequestMethod.POST)
	public String column_run(ColumnVo columnVo)	{
		System.out.println("ColumnControlService, column_run, columnVo: " + columnVo);
		return "column/column_list";
	}
	
	@RequestMapping(value="/uploadColumnImage", method=RequestMethod.POST)
	@ResponseBody
	public String uploadColumnImage(MultipartFile file) throws Exception {
		System.out.println("ColumController, uploadColumnImage, file: " + file);
		String originalFilename = file.getOriginalFilename();
		System.out.println("ColumController, uploadColumnImage, originalFilename: " + originalFilename);
		byte[] fileData = file.getBytes();
		String saveFilename = MyFileUploader.uploadFile("c:/boardattach", originalFilename, fileData);
		System.out.println("ColumController, uploadColumnImage, saveFilename: " + saveFilename);
		return saveFilename;
	}
	
	@RequestMapping(value="/column_list", method=RequestMethod.GET) 
	public String column_list() {
		
		return "column/column_list";
	}
	
	@RequestMapping(value="/column_content", method=RequestMethod.GET) 
	public String column_content() {
		
		return "column/column_content";
	}
	
	
	
}
