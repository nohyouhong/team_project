package com.kh.team.service;

import java.util.List;

import com.kh.team.vo.PagingDto;
import com.kh.team.vo.RecipeBoardVo;
import com.kh.team.vo.ingredientVo;

public interface RecipeBoardService {
	public boolean create(RecipeBoardVo recipeBoardVo, ingredientVo ingredintVo);
	public RecipeBoardVo read(int bno);
	public boolean update(RecipeBoardVo recipeBoardVo);
	public boolean delete(int r_bno);
	public List<RecipeBoardVo> list(PagingDto pagingDto);
	public int getCount(PagingDto pagingDto);
}
