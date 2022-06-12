package com.kh.team.dao;

import java.util.List;

import com.kh.team.vo.RecipeCommentVo;

public interface CommentDao {
	public int getNextCno();
	public List<RecipeCommentVo> recipeCommentList(int r_bno);
	public int recipeCommentListNum(int r_bno);
	public boolean insertRecipeComment(RecipeCommentVo recipeCommentVo);
	public boolean replyRecipeComment(RecipeCommentVo recipeCommentVo);
	public boolean updateReLevel(int r_cno);
	public boolean deleteRecipeComment(int r_cno);
}
