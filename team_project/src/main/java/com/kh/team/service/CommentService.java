package com.kh.team.service;

import java.util.List;

import com.kh.team.vo.RecipeCommentVo;

public interface CommentService {
	public List<RecipeCommentVo> recipeCommentList(int r_bno);
	public int recipeCommentListNum(int r_bno);
	public boolean insertRecipeComment(RecipeCommentVo recipeCommentVo);
	public boolean replyRecipeComment(RecipeCommentVo recipeCommentVo);
	public boolean deleteRecipeComment(int r_cno);
}
