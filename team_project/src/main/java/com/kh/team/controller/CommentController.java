package com.kh.team.controller;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.kh.team.service.CommentService;
import com.kh.team.util.MyFileUploader;
import com.kh.team.vo.RecipeCommentVo;
import com.kh.team.vo.RecipeReviewVo;

@RestController
@RequestMapping("/comment")
public class CommentController {
	
	@Autowired
	private CommentService commentService;
	
	@RequestMapping( value="/recipeCommentList/{r_bno}", method = RequestMethod.GET)
	public List<RecipeCommentVo> recipeCommentList(@PathVariable("r_bno")int r_bno) {
		List<RecipeCommentVo> recipeCommentList = commentService.recipeCommentList(r_bno);
		System.out.println(r_bno);
		System.out.println(recipeCommentList);
		return recipeCommentList;
	}
	
	@RequestMapping( value="/recipeCommentListNum/{r_bno}", method = RequestMethod.GET)
	public int recipeCommentListNum(@PathVariable("r_bno")int r_bno) {
		int recipeCommentListNum = commentService.recipeCommentListNum(r_bno);
		return recipeCommentListNum;
	}
	
	@RequestMapping( value="/insertRecipeComment", method = RequestMethod.POST)
	public String insertRecipeComment(RecipeCommentVo recipeCommentVo, MultipartFile file) {
		System.out.println(file);
		try {
			String originalFilename = file.getOriginalFilename();
			System.out.println(originalFilename);
			if(originalFilename != null && !originalFilename.equals("")) {
				String saveFilename = MyFileUploader.uploadFile("//192.168.0.110/boardattach",
						originalFilename, file.getBytes());
				recipeCommentVo.setR_userpic(saveFilename);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println(recipeCommentVo);
		boolean result = commentService.insertRecipeComment(recipeCommentVo);
		return String.valueOf(result);
	}
	
	@RequestMapping( value="/replyRecipeComment", method = RequestMethod.POST)
	public String replyRecipeComment(RecipeCommentVo recipeCommentVo, MultipartFile file) {
		try {
			String originalFilename = file.getOriginalFilename();
			System.out.println(originalFilename);
			if(originalFilename != null && !originalFilename.equals("")) {
				String saveFilename = MyFileUploader.uploadFile("//192.168.0.110/boardattach",
						originalFilename, file.getBytes());
				recipeCommentVo.setR_userpic(saveFilename);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println(recipeCommentVo);
		boolean result = commentService.replyRecipeComment(recipeCommentVo);
		return String.valueOf(result);
	}
	
	@RequestMapping( value="/deleteRecipeComment/{r_cno}", method = RequestMethod.GET)
	public String deleteRecipeComment(@PathVariable("r_cno") int r_cno) {
		System.out.println("r_cno받음");
		boolean result = commentService.deleteRecipeComment(r_cno);
		System.out.println("r_cno실행");
		return String.valueOf(result);
	}
	
//	요리후기
	
	@RequestMapping( value="/recipeReviewList/{r_bno}", method = RequestMethod.GET)
	public List<RecipeReviewVo> recipeReviewList(@PathVariable("r_bno")int r_bno) {
		List<RecipeReviewVo> recipeReviewList = commentService.recipeReviewList(r_bno);
		System.out.println(r_bno);
		System.out.println(recipeReviewList);
		return recipeReviewList;
	}
	
	@RequestMapping( value="/recipeReviewImageList/{r_bno}", method = RequestMethod.GET)
	public List<RecipeReviewVo> recipeReviewImageList(@PathVariable("r_bno")int r_bno) {
		List<RecipeReviewVo> recipeReviewImageList = commentService.recipeReviewImageList(r_bno);
		return recipeReviewImageList;
	}
	
	@RequestMapping( value="/recipeReviewListNum/{r_bno}", method = RequestMethod.GET)
	public int recipeReviewListNum(@PathVariable("r_bno")int r_bno) {
		int recipeReviewListNum = commentService.recipeReviewListNum(r_bno);
		return recipeReviewListNum;
	}
	
	@RequestMapping( value="/recipeReviewandImageListNum/{r_bno}", method = RequestMethod.GET)
	public int recipeReviewandImageListNum(@PathVariable("r_bno")int r_bno) {
		int recipeReviewandImageListNum = commentService.recipeReviewandImageListNum(r_bno);
		System.out.println("recipeReviewandImageListNum" + recipeReviewandImageListNum);
		return recipeReviewandImageListNum;
	}
	
	@RequestMapping( value="/insertRecipeReview", method = RequestMethod.POST)
	public String insertRecipeReview(RecipeReviewVo recipeReviewVo, MultipartFile file) {
		System.out.println(file);
		try {
			String originalFilename = file.getOriginalFilename();
			System.out.println(originalFilename);
			if(originalFilename != null && !originalFilename.equals("")) {
				String saveFilename = MyFileUploader.uploadFile("//192.168.0.110/boardattach",
						originalFilename, file.getBytes());
				recipeReviewVo.setR_reviewpic(saveFilename);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println(recipeReviewVo);
		boolean result = commentService.insertRecipeReview(recipeReviewVo);
		return String.valueOf(result);
	}
	
	@RequestMapping( value="/deleteRecipeReview/{r_rno}", method = RequestMethod.GET)
	public String deleteRecipeReview(@PathVariable("r_rno") int r_rno) {
		System.out.println("r_rno받음");
		boolean result = commentService.deleteRecipeReview(r_rno);
		return String.valueOf(result);
	}
}

