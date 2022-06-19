package com.kh.team.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.team.dao.DeclareDao;
import com.kh.team.vo.DeclareVo;

@Service
public class DeclareServiceImpl implements DeclareService{

	@Autowired
	DeclareDao declareDao;
	
	@Override
	public List<DeclareVo> recipeCommentDeclareList() {
		return declareDao.recipeCommentDeclareList();
	}

	@Override
	public List<DeclareVo> recipeCommentDeclareListByCriminal(String criminal) {
		return declareDao.recipeCommentDeclareListByCriminal(criminal);
	}

	@Override
	public boolean insertRecipeCommentDeclare(DeclareVo declareVo) {
		boolean result = declareDao.insertRecipeCommentDeclare(declareVo);
		return result;
	}

}
