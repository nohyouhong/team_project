package com.kh.team.service;

import java.util.List;

import com.kh.team.vo.AskVo;
import com.kh.team.vo.PagingDto;

public interface AskService {
	public boolean insertAsk(AskVo askVo);
	public boolean updateAsk(AskVo askVo);
	public boolean deleteAsk(int a_bno);
	public AskVo readAsk(int a_bno);
	public List<AskVo> AskList(String writer, PagingDto pagingDto, int re_group);
	public List<AskVo> allAskList(PagingDto pagingDto);
	public int getCount(PagingDto pagingDto);
	public List<String> getAskImages(int a_bno);
	public boolean insertAskReply(AskVo ask);//답글쓰기
}
