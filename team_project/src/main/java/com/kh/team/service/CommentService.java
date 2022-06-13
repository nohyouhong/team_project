package com.kh.team.service;

import java.util.List;

import com.kh.team.vo.RecipeCommentVo;
import com.kh.team.vo.RecipeReviewVo;

public interface CommentService {
	public List<RecipeCommentVo> recipeCommentList(int r_bno);
	public int recipeCommentListNum(int r_bno);
	public boolean insertRecipeComment(RecipeCommentVo recipeCommentVo);
	public boolean replyRecipeComment(RecipeCommentVo recipeCommentVo);
	public boolean deleteRecipeComment(int r_cno);

	public List<RecipeReviewVo> recipeReviewList(int r_bno);
	public int recipeReviewListNum(int r_bno);
	public int recipeReviewandImageListNum(int r_bno);
	public boolean insertRecipeReview(RecipeReviewVo recipeReviewVo);
	public boolean replyRecipeReview(RecipeReviewVo recipeReviewVo);
	public boolean deleteRecipeReview(int r_rno);
}
