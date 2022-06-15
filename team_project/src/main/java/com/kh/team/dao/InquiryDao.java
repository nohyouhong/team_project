package com.kh.team.dao;

import java.util.List;

import com.kh.team.vo.InquiryVo;
import com.kh.team.vo.PagingDto;

public interface InquiryDao {
	public boolean insertInquiry(InquiryVo inquiryVo);
	public boolean updateInquiry(InquiryVo inquiryVo);
	public boolean deleteInquiry(int a_bno);
	public InquiryVo readInquiry(int a_bno);
	public List<InquiryVo> InquiryList(String writer, PagingDto pagingDto);
	public List<InquiryVo> allInquiryList(PagingDto pagingDto);
	public int getCount(PagingDto pagingDto);
	public int getNexta_bno();
	public void insertAttach(String a_picture, int a_bno);
	public List<String> getInquiryImages(int a_bno);//이미지리스트
	public boolean insertInquiryReply(InquiryVo inquiryVo);//답글쓰기
	public void updateInquiryReSeq(InquiryVo inquiryVo);//답글 순서조정
}
