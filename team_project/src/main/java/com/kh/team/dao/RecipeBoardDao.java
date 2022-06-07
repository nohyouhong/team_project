package com.kh.team.dao;

import java.util.List;

import com.kh.team.vo.RecipeBoardVo;


public interface RecipeBoardDao {
	public boolean create(RecipeBoardVo recipeBoardVo);
	public RecipeBoardVo read(int bno);
	public boolean update(RecipeBoardVo recipeBoardVo);
	public boolean delete(int r_bno);
	public List<RecipeBoardVo> list(PagingDto pagingDto);
	public int getCount(PagingDto pagingDto);
	public void updateViewCnt(int bno); 
	public int getNextBno();
	public void insertAttach(String filename, int bno);
}
