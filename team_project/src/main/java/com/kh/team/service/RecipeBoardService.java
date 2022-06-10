package com.kh.team.service;

import java.util.List;

import com.kh.team.vo.PagingDto;
import com.kh.team.vo.RecipeBoardVo;
import com.kh.team.vo.RecipeStepVo;
import com.kh.team.vo.IngredientListVo;
import com.kh.team.vo.IngredientVo;
import com.kh.team.vo.MemberVo;

public interface RecipeBoardService {
	public boolean create(RecipeBoardVo recipeBoardVo, IngredientListVo ingredientListVo);
	public RecipeBoardVo read(int r_bno);
	public List<RecipeStepVo> readStepVos(int r_bno);
	public List<IngredientVo> readIngreds(int r_bno);
	public boolean update(RecipeBoardVo recipeBoardVo);
	public boolean delete(int r_bno);
	public List<RecipeBoardVo> list(PagingDto pagingDto);
	public int getCount(PagingDto pagingDto);
	public MemberVo getMemberVoByBno(int r_bno);
}
