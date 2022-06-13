package com.kh.team.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.team.vo.RecipeCommentVo;
import com.kh.team.vo.RecipeReviewVo;


@Repository
public class CommentDaoImpl implements CommentDao{

	private final String NAMESPACE = "com.kh.team.mappers.comment.";
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int getNextCno() {
		int r_cno = sqlSession.selectOne(NAMESPACE + "getNextCno");
		return r_cno;
	}
	
	@Override
	public List<RecipeCommentVo> recipeCommentList(int r_bno) {
		List<RecipeCommentVo> recipeCommentList = sqlSession.selectList(NAMESPACE + "recipeCommentList", r_bno);
		return recipeCommentList;
	}
	
	@Override
	public int recipeCommentListNum(int r_bno) {
		int recipeCommentListNum = sqlSession.selectOne(NAMESPACE + "recipeCommentListNum", r_bno);
		return recipeCommentListNum;
	}

	@Override
	public boolean insertRecipeComment(RecipeCommentVo recipeCommentVo) {
		int count = sqlSession.insert(NAMESPACE + "insertRecipeComment", recipeCommentVo);
		if(count > 0) {
			return true;
		}
		return false;
	}
	
	@Override
	public boolean replyRecipeComment(RecipeCommentVo recipeCommentVo) {
		int count = sqlSession.insert(NAMESPACE + "replyRecipeComment", recipeCommentVo);
		if(count > 0) {
			return true;
		}
		return false;
	}
	
	@Override
	public boolean updateReLevel(int r_cno) {
		int count = sqlSession.update(NAMESPACE + "updateReLevel", r_cno);
		if(count > 0) {
			return true;
		}
		return false;
	}

	@Override
	public boolean deleteRecipeComment(int r_cno) {
		int count = sqlSession.delete(NAMESPACE + "deleteRecipeComment", r_cno);
		if(count > 0) {
			return true;
		}
		return false;
	}

	@Override
	public int getNextrno() {
		int r_rno = sqlSession.selectOne(NAMESPACE + "getNextrno");
		return r_rno;
	}

	@Override
	public List<RecipeReviewVo> recipeReviewList(int r_bno) {
		List<RecipeReviewVo> recipeReviewList = sqlSession.selectList(NAMESPACE + "recipeReviewList", r_bno);
		return recipeReviewList;
	}

	@Override
	public int recipeReviewListNum(int r_bno) {
		int recipeReviewListNum = sqlSession.selectOne(NAMESPACE + "recipeReviewListNum", r_bno);
		return recipeReviewListNum;
	}

	@Override
	public int recipeReviewandImageListNum(int r_bno) {
		int recipeReviewandImageListNum = sqlSession.selectOne(NAMESPACE + "recipeReviewandImageListNum", r_bno);
		return recipeReviewandImageListNum;
	}

	@Override
	public boolean insertRecipeReview(RecipeReviewVo recipeReviewVo) {
		int count = sqlSession.insert(NAMESPACE + "insertRecipeReview", recipeReviewVo);
		if(count > 0) {
			return true;
		}
		return false;
	}

	@Override
	public boolean replyRecipeReview(RecipeReviewVo recipeReviewVo) {
		int count = sqlSession.insert(NAMESPACE + "replyRecipeReview", recipeReviewVo);
		if(count > 0) {
			return true;
		}
		return false;
	}

	@Override
	public boolean reviewUpdateReLevel(int r_rno) {
		int count = sqlSession.update(NAMESPACE + "reviewUpdateReLevel", r_rno);
		if(count > 0) {
			return true;
		}
		return false;
	}

	@Override
	public boolean deleteRecipeReview(int r_rno) {
		int count = sqlSession.delete(NAMESPACE + "deleteRecipeReview", r_rno);
		if(count > 0) {
			return true;
		}
		return false;
	}
}
