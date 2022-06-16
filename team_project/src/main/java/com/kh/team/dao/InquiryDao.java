package com.kh.team.dao;

import java.util.List;

import com.kh.team.vo.AskVo;
import com.kh.team.vo.InquiryVo;
import com.kh.team.vo.PagingDto;

public interface InquiryDao {
	public boolean insertInquiry(InquiryVo inquiryVo);
	public boolean updateInquiry(InquiryVo inquiryVo);
	public boolean deleteInquiry(int i_bno);
	public InquiryVo readInquiry(int i_bno);
	public List<InquiryVo> inquiryList(String userid, PagingDto pagingDto);
	public int getCount(PagingDto pagingDto);
	public int getNexti_bno();
	public boolean insertInquiryReply(InquiryVo inquiryVo);//답글쓰기
	public void updateInquiryReSeq(InquiryVo inquiryVo);//답글 순서조정
}
