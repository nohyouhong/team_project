package com.kh.team.dao;

import java.util.List;

import com.kh.team.vo.InquiryVo;
import com.kh.team.vo.PagingDto;

public interface InquiryDao {
	public boolean insertInquiry(InquiryVo inquiryVo);
	public boolean updateInquiry(InquiryVo inquiryVo);
	public boolean deleteInquiry(int a_bno);
	public InquiryVo readInquiry(int a_bno);
	public List<InquiryVo> InquiryList(String userid, String mType);
	public List<InquiryVo> allInquiryList();
	public int getCount(PagingDto pagingDto);
	public int getNexta_bno();
	public void insertAttach(String a_picture, int a_bno);
	public List<String> getInquiryImages(int a_bno);
	
}
