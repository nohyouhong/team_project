package com.kh.team.dao;

import java.util.List;

import com.kh.team.vo.RecipeCommentVo;
import com.kh.team.vo.RecipeReviewVo;

public interface CommentDao {
	
	public int getNextCno();
	public List<RecipeCommentVo> recipeCommentList(int r_bno);
	public int recipeCommentListNum(int r_bno);
	public boolean insertRecipeComment(RecipeCommentVo recipeCommentVo);
	public boolean replyRecipeComment(RecipeCommentVo recipeCommentVo);
	public boolean updateReLevel(int r_cno);
	public boolean deleteRecipeComment(int r_cno);
	
	public int getNextrno();
	public List<RecipeReviewVo> recipeReviewList(int r_bno);
	public int recipeReviewListNum(int r_bno);
	public int recipeReviewandImageListNum(int r_bno);
	public boolean insertRecipeReview(RecipeReviewVo recipeReviewVo);
	public boolean replyRecipeReview(RecipeReviewVo recipeReviewVo);
	public boolean reviewUpdateReLevel(int r_rno);
	public boolean deleteRecipeReview(int r_rno);
}
