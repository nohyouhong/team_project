package com.kh.team.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.team.dao.CommentDao;
import com.kh.team.vo.RecipeCommentVo;


@Service
public class CommentServiceImpl implements CommentService{

	@Autowired
	CommentDao commentDao;
	
	@Override
	public List<RecipeCommentVo> recipeCommentList(int r_bno) {
		return commentDao.recipeCommentList(r_bno);
	}

	@Override
	public int recipeCommentListNum(int r_bno) {
		return commentDao.recipeCommentListNum(r_bno);
	}
	
	@Override
	public boolean insertRecipeComment(RecipeCommentVo recipeCommentVo) {
		return commentDao.insertRecipeComment(recipeCommentVo);
	}
	
	@Override
	@Transactional
	public boolean replyRecipeComment(RecipeCommentVo recipeCommentVo) {
		int r_cno = commentDao.getNextCno();
		recipeCommentVo.setR_cno(r_cno);
		commentDao.replyRecipeComment(recipeCommentVo);
		boolean result = commentDao.updateReLevel(r_cno);
		return result;
	}

	@Override
	public boolean deleteRecipeComment(int r_cno) {
		return commentDao.deleteRecipeComment(r_cno);
	}

}
