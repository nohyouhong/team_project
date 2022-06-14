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
		int a_bno = inquiryDao.getNexta_bno();
		inquiryVo.setA_bno(a_bno);
		boolean result = inquiryDao.insertInquiry(inquiryVo);
		String[] files = inquiryVo.getFiles();
		if(files != null && files.length != 0) {
			for(String a_picture : files) {
				inquiryDao.insertAttach(a_picture, a_bno);
			}
		}
		return result;
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
	public boolean deleteInquiry(int a_bno) {
		boolean result = inquiryDao.deleteInquiry(a_bno);
		if(result) {
			return true;
		}
		return false;
	}

	@Override
	public InquiryVo readInquiry(int a_bno) {
		InquiryVo inquiryVo = inquiryDao.readInquiry(a_bno);
		return inquiryVo;
	}

	@Override
	public List<InquiryVo> InquiryList(String userid) {
		List<InquiryVo> inquiryList = inquiryDao.InquiryList(userid);
		return inquiryList;
	}

	@Override
	public int getCount(PagingDto pagingDto) {
		int count = inquiryDao.getCount(pagingDto);
		return count;
	}

}
