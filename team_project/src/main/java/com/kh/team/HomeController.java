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
				
		// main_content에 1위 칼럼 목록
		ColumnVo topColumnVo = columnService.getTopColumn();
		String top_c_content = topColumnVo.getC_content().replaceAll("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>", "");
//		System.out.println("top_c_content: " + top_c_content);
		topColumnVo.setC_content(top_c_content);
		int top_c_bno = topColumnVo.getC_bno();
		ColumnVo topColumnPic = columnService.getColumnTitlePic(top_c_bno);
		topColumnVo.setC_picture(topColumnPic.getC_picture());
//		System.out.println("topColumnVo: " + topColumnVo);
		model.addAttribute("topColumnVo", topColumnVo);
		
		// main_content에 2~4위 칼럼 목록
		List<ColumnVo> subColumnList = columnService.getSubColumnList();
//		System.out.println("subColumnList: " + subColumnList);
		for (ColumnVo subColumnVo : subColumnList) {
//			System.out.println("subColumn: " + subColumn);
			String sub_c_content = subColumnVo.getC_content().replaceAll("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>", "");
			subColumnVo.setC_content(sub_c_content);
			int sub_c_bno = subColumnVo.getC_bno();
			ColumnVo subColumnPic = columnService.getColumnTitlePic(sub_c_bno);
			subColumnVo.setC_picture(subColumnPic.getC_picture());
		}
//		System.out.println("subColumnList: " + subColumnList);
		model.addAttribute("subColumnList", subColumnList);
		return "main_contents";
	}
	
}
