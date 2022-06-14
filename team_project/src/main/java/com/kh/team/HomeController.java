package com.kh.team;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.team.service.ColumnService;
import com.kh.team.vo.ColumnVo;

@Controller
public class HomeController {
	
	@Autowired
	private ColumnService columnService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		List<ColumnVo> mainColumnList = columnService.getMainColumnList();
//		System.out.println("mainColumnList: " + mainColumnList);
		for (ColumnVo columnVo : mainColumnList) {
			int c_bno = columnVo.getC_bno();
			String c_content = columnVo.getC_content();
			String inval_tag_C_content = c_content.replaceAll("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>", "");
//			System.out.println("ColumnController, column_list, tagc_content: " + tagC_content);
			columnVo.setC_content(inval_tag_C_content);
			List<ColumnVo> column_main_title_pics = columnService.getColumnTitlePic(c_bno);
			for (ColumnVo column_pic_vo : column_main_title_pics) {
				String column_main_title_pic = column_pic_vo.getC_picture();
				columnVo.setC_picture(column_main_title_pic);
			}
		}
		model.addAttribute("mainColumnList", mainColumnList);
		return "main_contents";
	}
	
}
