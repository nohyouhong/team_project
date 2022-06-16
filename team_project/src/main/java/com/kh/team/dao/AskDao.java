package com.kh.team.dao;

import java.util.List;

import com.kh.team.vo.AskVo;
import com.kh.team.vo.PagingDto;

public interface AskDao {
	public boolean insertAsk(AskVo askVo);
	public boolean updateAsk(AskVo askVo);
	public boolean deleteAsk(int a_bno);
	public AskVo readAsk(int a_bno);
	public List<AskVo> askList(String writer, PagingDto pagingDto, int re_group);
	public List<AskVo> allAskList(PagingDto pagingDto);
	public int getCount(PagingDto pagingDto);
	public int getNexta_bno();
	public void insertAttach(String a_picture, int a_bno);
	public List<String> getAskImages(int a_bno);//이미지리스트
	public boolean insertAskReply(AskVo askVo);//답글쓰기
	public void updateAskReSeq(AskVo askVo);//답글 순서조정
	public void updateAstate(int a_bno);
	public int getReGroup(String writer);
}
