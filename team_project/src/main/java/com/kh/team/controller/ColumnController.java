package com.kh.team.controller;


import java.io.File;
import java.io.InputStream;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kh.team.service.MemberService;
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
	
	// 컬럼 이미지파일 받기
//	@RequestMapping(value = "/uploadSummernoteImageFile", produces = "application/json; charset=utf8")
//	@ResponseBody
//	public String uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile,
//			HttpServletRequest request) {
//		JsonObject jsonObject = new JsonObject();
//
//		/*
//		 * String fileRoot = "C:\\summernote_image\\"; // 외부경로로 저장을 희망할때.
//		 */
//
//		// 내부경로로 저장
//		String contextRoot = new HttpServletRequestWrapper(request).getRealPath("/");
//		String fileRoot = contextRoot + "resources/fileupload/";
//
//		String originalFileName = multipartFile.getOriginalFilename(); // 오리지날 파일명
//		String extension = originalFileName.substring(originalFileName.lastIndexOf(".")); // 파일 확장자
//		String savedFileName = UUID.randomUUID() + extension; // 저장될 파일 명
//
//		File targetFile = new File(fileRoot + savedFileName);
//		try {
//			InputStream fileStream = multipartFile.getInputStream();
//			FileUtils.copyInputStreamToFile(fileStream, targetFile); // 파일 저장
//			jsonObject.addProperty("url", "/summernote/resources/fileupload/" + savedFileName); // contextroot +
//																								// resources + 저장할 내부
//																								// 폴더명
//			jsonObject.addProperty("responseCode", "success");
//
//		} catch (IOException e) {
//			FileUtils.deleteQuietly(targetFile); // 저장된 파일 삭제
//			jsonObject.addProperty("responseCode", "error");
//			e.printStackTrace();
//		}
//		String a = jsonObject.toString();
//		return a;
//	}
	
	@RequestMapping(value="/column_list", method=RequestMethod.GET) 
	public String column_list() {
		
		return "column/column_list";
	}
	
	@RequestMapping(value="/column_content", method=RequestMethod.GET) 
	public String column_content() {
		
		return "column/column_content";
	}
	
	
	
}
