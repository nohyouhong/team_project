package com.kh.team.dao;

import java.util.List;

import com.kh.team.vo.PagingDto;
import com.kh.team.vo.RecipeBoardVo;
import com.kh.team.vo.ingredientVo;


public interface RecipeBoardDao {
	public boolean create(RecipeBoardVo recipeBoardVo);
	public boolean ingredCreate(ingredientVo ingredintVo);
	public RecipeBoardVo read(int bno);
	public boolean update(RecipeBoardVo recipeBoardVo);
	public boolean delete(int r_bno);
	public List<RecipeBoardVo> list(PagingDto pagingDto);
	public int getCount(PagingDto pagingDto);
	public void updateViewCnt(int bno); 
	public int getNextBno();
	public void insertPicture(String picture, int bno);
	public void insertContent(String content, int bno);
}
