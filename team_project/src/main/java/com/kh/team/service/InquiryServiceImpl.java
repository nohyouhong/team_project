package com.kh.team.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.team.dao.InquiryDao;
import com.kh.team.vo.InquiryVo;
import com.kh.team.vo.PagingDto;

@Service
public class InquiryServiceImpl implements InquiryService{
	
	@Autowired
	private InquiryDao inquiryDao;

	@Override
	public boolean insertInquiry(InquiryVo inquiryVo) {
		int i_bno = inquiryDao.getNexti_bno();
		inquiryVo.setI_bno(i_bno);
		inquiryVo.setRe_group(i_bno);
		boolean result = inquiryDao.insertInquiry(inquiryVo);
		if(result) {
			return true;
		}
		return false;
	}

	@Override
	public boolean updateInquiry(InquiryVo inquiryVo) {
		boolean result = inquiryDao.updateInquiry(inquiryVo);
		if(result) {
			return true;
		}
		return false;
	}

	@Override
	public boolean deleteInquiry(int i_bno) {
		boolean result = inquiryDao.deleteInquiry(i_bno);
		if(result) {
			return true;
		}
		return false;
	}

	@Override
	public InquiryVo readInquiry(int i_bno) {
		InquiryVo inquiryVo = inquiryDao.readInquiry(i_bno);
		return inquiryVo;
	}

	@Override
	public List<InquiryVo> inquiryList(String userid, PagingDto pagingDto) {
		List<InquiryVo> inquiryList = inquiryDao.inquiryList(userid, pagingDto);
		return inquiryList;
	}

	@Override
	public int getCount(PagingDto pagingDto) {
		int count = inquiryDao.getCount(pagingDto);
		return count;
	}

	@Override
	public int getNexti_bno() {
		int count = inquiryDao.getNexti_bno();
		return count;
	}

	@Override
	public boolean insertInquiryReply(InquiryVo inquiryVo) {
		boolean result = inquiryDao.insertInquiryReply(inquiryVo);
		if(result) {
			return true;
		}
		return false;
	}

}
