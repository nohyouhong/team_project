package com.kh.team.controller;

import java.io.FileInputStream;
import java.util.List;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.team.service.ColumnService;
import com.kh.team.util.MyFileUploader;
import com.kh.team.vo.ColumnVo;

@Controller
@RequestMapping("/column")
public class ColumnController {
	
	@Autowired
	private ColumnService columnService;
	
	// 칼럼 작성 폼
	@RequestMapping(value="/column_form", method=RequestMethod.GET)
	public String column_form()	{
		
		return "column/column_form";
	}
	
	@RequestMapping(value="/column_run", method=RequestMethod.POST)
	public String column_run(ColumnVo columnVo, RedirectAttributes rttr)	{
		System.out.println("ColumnControlService, column_run, columnVo: " + columnVo);
		String c_content = columnVo.getC_content();
		boolean result = columnService.insertColumn(columnVo);
		System.out.println("ColumController, column_run, result" + result);
		return "redirect: /column/column_list";
	}
	
	@RequestMapping(value="/uploadColumnImage", method=RequestMethod.POST)
	@ResponseBody
	public String uploadColumnImage(@RequestParam("file")MultipartFile file) throws Exception {
		System.out.println("ColumController, uploadColumnImage, file: " + file);
		String file_root = "//192.168.0.110/boardattach";
		String originalFilename = file.getOriginalFilename();
		System.out.println("ColumController, uploadColumnImage, originalFilename: " + originalFilename);
		byte[] fileData = file.getBytes();
		String saveFilename = MyFileUploader.uploadFile(file_root, originalFilename, fileData);
		System.out.println("ColumController, uploadColumnImage, saveFilename: " + saveFilename);
		String url = "/column/displayImage?column_image=" + saveFilename;
        return url;
    }
	
	@RequestMapping(value = "/displayImage", method = RequestMethod.GET)
	@ResponseBody
	public byte[] displayImage(String column_image) throws Exception {
		FileInputStream fis;
		fis = new FileInputStream(column_image);
		byte[] data = IOUtils.toByteArray(fis);
		fis.close();
		return data;
	}
	
	@RequestMapping(value="/column_list", method=RequestMethod.GET) 
	public String column_list(Model model) {
		List<ColumnVo> columnList = columnService.getColumnList();
		model.addAttribute("columnList", columnList);
		return "column/column_list";
	}
	
	@RequestMapping(value="/readColumn", method=RequestMethod.GET) 
	public String readColumn(int c_bno, Model model) {
		ColumnVo columnVo = columnService.readColumn(c_bno);
		model.addAttribute("columnVo", columnVo);
		return "column/column_content";
	}
	
	@RequestMapping(value="/column_like", method=RequestMethod.POST)
	public String likeColumn() {
		
		return null;
	}
	
}
