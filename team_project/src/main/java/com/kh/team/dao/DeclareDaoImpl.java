package com.kh.team.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.team.vo.DeclareVo;
import com.kh.team.vo.RecipeCommentVo;

@Repository
public class DeclareDaoImpl implements DeclareDao {

	private final String NAMESPACE = "com.kh.team.mappers.declare.";
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<DeclareVo> recipeCommentDeclareList() {
		List<DeclareVo> recipeCommentDeclareList = sqlSession.selectList(NAMESPACE + "recipeCommentDeclareList");
		return recipeCommentDeclareList;
	}

	@Override
	public List<DeclareVo> recipeCommentDeclareListByCriminal(String criminal) {
		List<DeclareVo> recipeCommentDeclareList = sqlSession.selectList(NAMESPACE + "recipeCommentDeclareListByCriminal", criminal);
		return recipeCommentDeclareList;
	}

	@Override
	public boolean insertRecipeCommentDeclare(DeclareVo declareVo) {
		int count = sqlSession.insert(NAMESPACE + "insertRecipeCommentDeclare", declareVo);
		if(count > 0) {
			return true;
		}
		return false;
	}
	
}
