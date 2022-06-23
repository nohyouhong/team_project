package com.kh.team.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.team.vo.InquiryVo;
import com.kh.team.vo.PagingDto;

@Repository
public class InquiryDaoImpl implements InquiryDao{
	
	private final String NAMESPACE = "com.kh.team.mappers.inquiry.";
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public boolean insertInquiry(InquiryVo inquiryVo) {
		int count = sqlSession.insert(NAMESPACE+"insertInquiry", inquiryVo);
		if(count >0) {
			return true;
		}
		return false;
	}

	@Override
	public boolean updateInquiry(InquiryVo inquiryVo) {
		int count = sqlSession.update(NAMESPACE+"updateInquiry", inquiryVo);
		if(count >0) {
			return true;
		}
		return false;
	}

	@Override
	public boolean deleteInquiry(int i_bno) {
		int count = sqlSession.delete(NAMESPACE, i_bno);
		if(count >0) {
			return true;
		}
		return false;
	}

	@Override
	public InquiryVo readInquiry(int i_bno) {
		InquiryVo inquiryVo = sqlSession.selectOne(NAMESPACE+"readInquiry", i_bno);
		return inquiryVo;
	}

	@Override
	public List<InquiryVo> inquiryList(PagingDto pagingDto) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pagingDto", pagingDto);
		map.put("startRow", pagingDto.getStartRow());
		map.put("endRow", pagingDto.getEndRow());
		List<InquiryVo> inquiryList = sqlSession.selectList(NAMESPACE+"listInquiry", map);
		return inquiryList;
	}

	@Override
	public int getCount(PagingDto pagingDto) {
		int count = sqlSession.selectOne(NAMESPACE+"getCount", pagingDto);
		return count;
	}

	@Override
	public int getNexti_bno() {
		int i_bno = sqlSession.selectOne(NAMESPACE+"getNexti_bno");
		return i_bno;
	}

	@Override
	public boolean insertInquiryReply(InquiryVo inquiryVo) {
		int count = sqlSession.insert(NAMESPACE+"insertInquiryReply", inquiryVo);
		if(count >0) {
			return true;
		}
		return false;
	}

	@Override
	public void updateInquiryReSeq(InquiryVo inquiryVo) {
		sqlSession.update(NAMESPACE+"updateReSeq", inquiryVo);
		
	}

	@Override
	public void updateIstate(int i_bno) {
		sqlSession.update(NAMESPACE+"updateIstate", i_bno);
	}

}
