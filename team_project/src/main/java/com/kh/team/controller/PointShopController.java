package com.kh.team.controller;

import java.io.FileInputStream;
import java.lang.ProcessBuilder.Redirect;
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

import com.kh.team.service.OrderService;
import com.kh.team.service.PointShopService;
import com.kh.team.util.MyFileUploader;
import com.kh.team.vo.IngredientListVo;
import com.kh.team.vo.IngredientVo;
import com.kh.team.vo.MemberVo;
import com.kh.team.vo.OrderProductVo;
import com.kh.team.vo.PagingDto;
import com.kh.team.vo.PointShopBoardVo;
import com.kh.team.vo.ProductVo;
import com.kh.team.vo.RecipeBoardVo;
import com.kh.team.vo.RecipeStepVo;

@Controller
@RequestMapping("/pointshop")
public class PointShopController {
	
	@Autowired
	private PointShopService pointShopService;
	
	@Autowired
	private OrderService orderService;
	
	@RequestMapping(value="/createForm", method=RequestMethod.GET)
	public String createForm() {
		return "pointshop/create_form";
	}
	
	@RequestMapping(value="/update_form", method=RequestMethod.GET)
	public String updateForm(int p_bno, Model model, PagingDto pagingDto) {
		PointShopBoardVo pointShopBoardVo = pointShopService.read(p_bno);
		List<ProductVo> productList = pointShopService.productRead(p_bno);
		List<String> productPicList = pointShopService.productPicList(p_bno);
		List<String> productExPicList = pointShopService.productExPicList(p_bno);
		List<String> tagList = pointShopService.tagRead(p_bno);
		model.addAttribute("pointShopBoardVo", pointShopBoardVo);
		model.addAttribute("productList", productList);
		model.addAttribute("productPicList", productPicList);
		model.addAttribute("productExPicList", productExPicList);
		model.addAttribute("tagList", tagList);
		return "pointshop/update_form";
	}
	
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public String list(Model model, PagingDto pagingDto, HttpSession session) {
		MemberVo loginVo = (MemberVo)session.getAttribute("loginVo");
		int boardCount = pointShopService.getCount(pagingDto);
		pagingDto.setCount(boardCount);
		pagingDto.setPerPage(16);
		pagingDto.setPage(pagingDto.getPage());
		List<PointShopBoardVo> pointShopBoardList = pointShopService.list(pagingDto);
		model.addAttribute("pointShopBoardList", pointShopBoardList);
		model.addAttribute("pagingDto", pagingDto);
		model.addAttribute("boardCount", boardCount);
		model.addAttribute("loginVo", loginVo);
		return "pointshop/list";
	}
	
	@RequestMapping(value="/shopping_basket", method=RequestMethod.GET)
	public String shoppingBasket(HttpSession session, Model model) {
//		MemberVo memberVo = (MemberVo)session.getAttribute("loginVo");
//		int l_lno = memberVo.getBasket();
//		OrderProductVo orderProductVo = orderService.read(l_lno);
//		List<OrderProductVo> orderProductList = orderService.getBasketProduct(l_lno);
//		model.addAttribute("orderProductVo", orderProductVo);
//		model.addAttribute("orderProductList", orderProductList);
		return "pointshop/shopping_basket";
	}
	
	@RequestMapping(value="/orderProductList", method=RequestMethod.GET)
	@ResponseBody
	public List<OrderProductVo> orderProductList(HttpSession session) {
		MemberVo memberVo = (MemberVo)session.getAttribute("loginVo");
		int l_lno = memberVo.getBasket();
		List<OrderProductVo> orderProductList = orderService.getBasketProduct(l_lno);
		return orderProductList;
	}
	
	@RequestMapping(value="/orderProductOptionList", method=RequestMethod.GET)
	@ResponseBody
	public List<OrderProductVo> orderProductOptionList(int p_bno) {
		List<OrderProductVo> orderProductOptionList = orderService.getBasketProductOptions(p_bno);
		return orderProductOptionList;
	}
	
	@RequestMapping(value="/deleteBasket", method=RequestMethod.GET)
	public String deleteBasket(int[] o_pno) {
		boolean result = orderService.basketProductDelete(o_pno);
		return "redirect:/pointshop/shopping_basket";
	}
	
	@RequestMapping(value="/addBasket", method=RequestMethod.POST)
	@ResponseBody
	public String addBasket(OrderProductVo orderProductVo, HttpSession session) {
		MemberVo memberVo = (MemberVo)session.getAttribute("loginVo");
		orderProductVo.setL_lno(memberVo.getBasket());
		boolean result = orderService.basketProductCreate(orderProductVo);
		return String.valueOf(result);
	}
	
	@RequestMapping(value="/updateBasket", method=RequestMethod.POST)
	public String updateBasket(OrderProductVo orderProductVo, HttpSession session) {
		System.out.println(orderProductVo);
		MemberVo memberVo = (MemberVo)session.getAttribute("loginVo");
		orderProductVo.setL_lno(memberVo.getBasket());
		orderService.basketProductUpdate(orderProductVo);
		return "redirect:/pointshop/shopping_basket";
	}
	
	@RequestMapping(value="/createRun", method=RequestMethod.POST)
	public String createRun(PointShopBoardVo pointShopBoardVo, ProductVo productVo, 
			RedirectAttributes rttr, @RequestParam("files") List<MultipartFile> files) {
		try {
			//상품이미지들
			int index = 0;
			String[] productPictures = new String[4];
			for(int i = 0; i < 4; i++) {
				String oneOriginalFilename = files.get(i).getOriginalFilename();
				if(oneOriginalFilename != null && !oneOriginalFilename.equals("")) {
					String p_picture = MyFileUploader.uploadFile(
							"//192.168.0.110/boardattach", oneOriginalFilename, files.get(i).getBytes());
					productPictures[index++] = p_picture;
				} 
			}
			String[] checkedPictures = picturesCheckNull(productPictures);
			productVo.setP_pictures(checkedPictures);
			
			//상품설명이미지들(4번째부터 상품설명사진임)
			int productExIndex = 0;
			String[] productExPictures = new String[files.size() - 4];
			for(int i = 4; i < files.size(); i++) {
				String oneOriginalFilename = files.get(i).getOriginalFilename();
				if(oneOriginalFilename != null && !oneOriginalFilename.equals("")) {
					String p_picture = MyFileUploader.uploadFile(
							"//192.168.0.110/boardattach", oneOriginalFilename, files.get(i).getBytes());
					productExPictures[productExIndex++] = p_picture;
				} 
			}
			String[] checkedExPictures = picturesCheckNull(productExPictures);
			pointShopBoardVo.setP_pictures(checkedExPictures);
			
			boolean result = pointShopService.create(productVo, pointShopBoardVo);
			rttr.addFlashAttribute("create_result", result);
		} catch(Exception e) {
			e.printStackTrace();
		}
		return "redirect:/pointshop/list";
	}
	
	@RequestMapping(value="/updateRun", method=RequestMethod.POST)
	public String updateRun(PointShopBoardVo pointShopBoardVo, ProductVo productVo, 
			RedirectAttributes rttr, @RequestParam("files") List<MultipartFile> files) {
		System.out.println(pointShopBoardVo);
		System.out.println(productVo);
		try {
			//상품이미지들
			String[] productPictures1 = pointShopBoardVo.getP_pictures();
			String[] productPictures2 = new String[4];
			for(int i = 0; i < 4; i++) {
				String oneOriginalFilename = files.get(i).getOriginalFilename();
				if(oneOriginalFilename != null && !oneOriginalFilename.equals("")) {
					String p_picture = MyFileUploader.uploadFile(
							"//192.168.0.110/boardattach", oneOriginalFilename, files.get(i).getBytes());
					productPictures2[i] = p_picture;
					System.out.println("p_picture" + p_picture);
				} else {
					productPictures2[i] = productPictures1[i];
					System.out.println("productPictures1[i]" + productPictures1[i]);
					
				}
			}
			pointShopBoardVo.setP_pictures2(productPictures2);
			
			//상품설명이미지들(4번째부터 상품설명사진임)
			int productExIndex = 0;
			String[] productExPictures1 = pointShopBoardVo.getP_exPictures();
			String[] productExPictures2 = new String[files.size() - 5];
			for(int i = 1; i < files.size() - 4; i++) {
				String oneOriginalFilename = files.get(i + 4).getOriginalFilename();
				if(oneOriginalFilename != null && !oneOriginalFilename.equals("")) {
					String p_picture = MyFileUploader.uploadFile(
							"//192.168.0.110/boardattach", oneOriginalFilename, files.get(i + 4).getBytes());
					productExPictures2[productExIndex] = p_picture;
					productExIndex++;
				} else {
					productExPictures2[productExIndex] = productExPictures1[productExIndex + 1];
					productExIndex++;
				}
			}
			pointShopBoardVo.setP_exPictures2(productExPictures2);
			
			boolean result = pointShopService.update(productVo, pointShopBoardVo);
			rttr.addFlashAttribute("update_result", result);
		} catch(Exception e) {
			e.printStackTrace();
		}
		return "redirect:/pointshop/read?p_bno=" + pointShopBoardVo.getP_bno();
	}
	
	@RequestMapping(value="/delete", method=RequestMethod.GET)
	public String delete(int p_bno, RedirectAttributes rttr, PagingDto pagingDto) {
		boolean result = pointShopService.delete(p_bno);
		rttr.addFlashAttribute("delete_result", result);
		rttr.addAttribute("page", pagingDto.getPage());
		rttr.addAttribute("perPage", pagingDto.getPerPage());
		return "redirect:/pointshop/list";
	}
	
	//널값 체크해서 스트링배열 빈공간 널값 없애기
	public String[] picturesCheckNull(String[] pictures) {
		int index = 0;
		for(int i = 0; i < pictures.length; i++) {
			if(pictures[i] != null && !pictures[i].equals("")) {
				index++;
			}
		}
		int index1 = 0;
		String[] checkedPictures = new String[index];
		for(int i = 0; i < index; i++) {
			if(pictures[i] != null && !pictures[i].equals("")){
				checkedPictures[index1++] = pictures[i];
			}
		} 
		return checkedPictures;
	}
	
	@RequestMapping(value="/read", method=RequestMethod.GET)
	public String read(int p_bno, Model model, PagingDto pagingDto) {
		PointShopBoardVo pointShopBoardVo = pointShopService.read(p_bno);
		List<ProductVo> productList = pointShopService.productRead(p_bno);
		List<String> productPicList = pointShopService.productPicList(p_bno);
		List<String> productExPicList = pointShopService.productExPicList(p_bno);
		List<String> tagList = pointShopService.tagRead(p_bno);
		model.addAttribute("pointShopBoardVo", pointShopBoardVo);
		model.addAttribute("productList", productList);
		model.addAttribute("productPicList", productPicList);
		model.addAttribute("productExPicList", productExPicList);
		model.addAttribute("tagList", tagList);
		model.addAttribute("pagingDto", pagingDto);
		return "pointshop/read";
	}
	
	@RequestMapping(value="/getOptionByBno", method=RequestMethod.GET)
	@ResponseBody
	public List<OrderProductVo> getOptionByBno(int p_bno) {
		List<OrderProductVo> productOptionList = orderService.getBasketProductOptionsAll(p_bno);
		return productOptionList;
	}
	
	@RequestMapping(value="/uploadFile", method=RequestMethod.POST)
	@ResponseBody
	public String uploadFile(MultipartFile file) throws Exception{
		String originalFilename = file.getOriginalFilename();
		byte[] fileData = file.getBytes();
		String saveFilename = MyFileUploader.uploadFile("//192.168.0.110/boardattach", originalFilename, fileData);
		
		return saveFilename;
	}
	
	@RequestMapping(value="/displayImage", method=RequestMethod.GET)
	@ResponseBody
	public byte[] displayImage(String filename) throws Exception{
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
	
	@RequestMapping(value="/order_complete", method=RequestMethod.GET)
	public String orderComplete() {
		return "pointshop/order_complete";
	}
	
	
	@RequestMapping(value="/order_history_list", method=RequestMethod.GET)
	public String orderHistoryList() {
		return "pointshop/order_history_list";
	}
}
