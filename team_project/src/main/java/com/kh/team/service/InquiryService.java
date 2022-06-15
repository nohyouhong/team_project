package com.kh.team.service;

import java.util.List;

import com.kh.team.vo.InquiryVo;
import com.kh.team.vo.PagingDto;

public interface InquiryService {
	public boolean insertInquiry(InquiryVo inquiryVo);
	public boolean updateInquiry(InquiryVo inquiryVo);
	public boolean deleteInquiry(int a_bno);
	public InquiryVo readInquiry(int a_bno);
	public List<InquiryVo> InquiryList(String writer, PagingDto pagingDto);
	public List<InquiryVo> allInquiryList(PagingDto pagingDto);
	public int getCount(PagingDto pagingDto);
	public List<String> getInquiryImages(int a_bno);
	public boolean insertInquiryReply(InquiryVo inquiryVo);//답글쓰기
}
