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
	private String NAMESPACE = "com.kh.team.mappers.inquiry.";
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public boolean insertInquiry(InquiryVo inquiryVo) {
		int count = sqlSession.insert(NAMESPACE+"insertInquiry", inquiryVo);
		if(count>0) {
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
	public boolean deleteInquiry(int a_bno) {
		int count = sqlSession.delete(NAMESPACE+"deleteInquiry", a_bno);
		if(count >0) {
			return true;
		}
		return false;
	}

	@Override
	public InquiryVo readInquiry(int a_bno) {
		InquiryVo inquiryVo = sqlSession.selectOne(NAMESPACE+"readInquiry", a_bno);
		return inquiryVo;
	}

	@Override
	public List<InquiryVo> InquiryList(String userid, String mType) {
		Map<String, Object> map = new HashMap<>();
		map.put("userid", userid);
		map.put("mType", mType);
		List<InquiryVo> InquiryList = sqlSession.selectList(NAMESPACE+"listInquiry", map);
		return InquiryList;
	}

	@Override
	public int getCount(PagingDto pagingDto) {
		int count = sqlSession.selectOne(NAMESPACE+"getCount", pagingDto);
		return count;
	}

	@Override
	public int getNexta_bno() {
		int a_bno = sqlSession.selectOne(NAMESPACE+"getNexta_bno");
		return a_bno;
	}

	@Override
	public void insertAttach(String a_picture, int a_bno) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("a_picture", a_picture);
		map.put("a_bno", a_bno);
		sqlSession.insert(NAMESPACE+"insertAttach", map);
		
	}

	@Override
	public List<InquiryVo> allInquiryList() {
		List<InquiryVo> allInquiryList = sqlSession.selectList(NAMESPACE+"allListInquiry");
		return allInquiryList;
	}

	@Override
	public List<String> getInquiryImages(int a_bno) {
		List<String> InquiryImages = sqlSession.selectList(NAMESPACE+"getInquiryImages", a_bno);
		return InquiryImages;
	}

}
