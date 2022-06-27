package com.kh.team.dao;

import java.util.List;

import com.kh.team.vo.PagingDto;
import com.kh.team.vo.RecipeBoardVo;
import com.kh.team.vo.RecipeStepVo;
import com.kh.team.vo.IngredientVo;


public interface RecipeBoardDao {
	public boolean create(RecipeBoardVo recipeBoardVo);
	public boolean ingredCreate(IngredientVo ingredintVo);
	public boolean ingredInfoCreate(IngredientVo ingredintVo);
	public boolean tagCreate(String r_tag, int r_bno);
	public RecipeBoardVo read(int r_bno);
	public List<RecipeStepVo> readStepVos(int r_bno);
	public List<IngredientVo> readIngreds(int r_bno);
	public List<String> getTags(int r_bno);
	public List<RecipeBoardVo> list(PagingDto pagingDto);
	public boolean update(RecipeBoardVo recipeBoardVo);
	public boolean ingredDelete(int r_bno);
	public boolean tagDelete(int r_bno);
	public boolean delete(int r_bno);
	public int getCount(PagingDto pagingDto);
	public void updateViewCnt(int r_bno); 
	public int getNextBno();
	public int getNextCno();
	public float getAvgRating(int r_bno);
	public int getRatingNum(int r_bno);
	public void insertContent(String content, int r_bno, int r_cno);
	public void insertPicture(String picture, int r_cno);
	public boolean deleteContent(int r_bno);
	public String getUseridByBno(int r_bno);
	public boolean checkIngredInfo(String i_name);
	public String getIngredUnitByName(String i_name);

}
