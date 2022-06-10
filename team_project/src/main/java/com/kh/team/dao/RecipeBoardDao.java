package com.kh.team.dao;

import java.util.List;

import com.kh.team.vo.PagingDto;
import com.kh.team.vo.RecipeBoardVo;
import com.kh.team.vo.RecipeStepVo;
import com.kh.team.vo.IngredientVo;
import com.kh.team.vo.MemberVo;


public interface RecipeBoardDao {
	public boolean create(RecipeBoardVo recipeBoardVo);
	public boolean ingredCreate(IngredientVo ingredintVo);
	public RecipeBoardVo read(int r_bno);
	public List<RecipeStepVo> readStepVos(int r_bno);
	public List<IngredientVo> readIngreds(int r_bno);
	public boolean update(RecipeBoardVo recipeBoardVo);
	public boolean delete(int r_bno);
	public List<RecipeBoardVo> list(PagingDto pagingDto);
	public int getCount(PagingDto pagingDto);
	public void updateViewCnt(int r_bno); 
	public int getNextBno();
	public int getNextCno();
	public void insertContent(String content, int r_bno, int r_cno);
	public void insertPicture(String picture, int r_cno);
	public String getUseridByBno(int r_bno);
}
