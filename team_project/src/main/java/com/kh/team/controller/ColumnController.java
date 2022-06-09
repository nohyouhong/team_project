package com.kh.team.controller;

import java.io.FileInputStream;
import java.util.List;

import javax.servlet.http.HttpSession;

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

import com.kh.team.dao.ColumnDao;
import com.kh.team.service.ColumnService;
import com.kh.team.util.MyFileUploader;
import com.kh.team.vo.ColumnVo;

@Controller
@RequestMapping("/column")
public class ColumnController {
	
	@Autowired
	private ColumnService columnService;
	
	// 칼럼 작성 폼
	@RequestMapping(value="/column_create_form", method=RequestMethod.GET)
	public String column_create_form()	{
		
		return "column/column_create_form";
	}
	
	@RequestMapping(value="/column_create_run", method=RequestMethod.POST)
	public String column_create_run(ColumnVo columnVo, RedirectAttributes rttr)	{
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
	
	@RequestMapping(value="/column_modify_form", method=RequestMethod.GET)
	public String column_modify_form(int c_bno, Model model) {
		ColumnVo columnVo = columnService.readColumn(c_bno);
		model.addAttribute("columnVo", columnVo);
		return "/column/column_modify_form";
	}

	@RequestMapping(value="/column_modify_run", method=RequestMethod.POST)
	public String column_modify_run(ColumnVo columnVo) {
		System.out.println("columnVo: " + columnVo);
		columnService.modifyColumn(columnVo);
		return "redirect: /column/readColumn?c_bno=" + columnVo.getC_bno();
	}

	@RequestMapping(value="/column_delete", method=RequestMethod.GET)
	public String column_delete(int c_bno) {
		System.out.println("c_bno: " + c_bno);
		columnService.deleteColumn(c_bno);
		return "redirect: /column/column_list";
	}
	
	@RequestMapping(value="/readColumn", method=RequestMethod.GET) 
	public String readColumn(int c_bno, Model model) {
		ColumnVo columnVo = columnService.readColumn(c_bno);
		model.addAttribute("columnVo", columnVo);
		List<ColumnVo> columnList = columnService.getColumnList();
		model.addAttribute("columnList", columnList);
		return "column/column_content";
	}
	
	@RequestMapping(value="/column_like", method=RequestMethod.POST)
	@ResponseBody
	public String likeColumn(int c_bno, String userid, HttpSession session) {
		System.out.println("c_bno: " + c_bno);
		System.out.println("userid: " + userid);
		boolean isLikeResult = columnService.isColumnLike(c_bno, userid);
		System.out.println("isLikeResult: " + isLikeResult);
		if (isLikeResult) {
			columnService.deleteColumnLike(c_bno, userid);
			columnService.updateColumnLikeCount(c_bno, ColumnDao.COLUMNDISLIKE);
		} else {
			columnService.insertColumnLike(c_bno, userid);
			columnService.updateColumnLikeCount(c_bno, ColumnDao.COLUMNLIKE);			
		}
		return "success";
	}
	
	@RequestMapping(value="/is_column_like", method=RequestMethod.GET)
	@ResponseBody
	public String is_likeColumn(int c_bno, String userid) {	
		boolean result = columnService.isColumnLike(c_bno, userid);
		return String.valueOf(result);
	}
	
}
