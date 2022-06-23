package com.kh.team.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.team.vo.AskVo;
import com.kh.team.vo.PagingDto;

@Repository
public class AskDaoImpl implements AskDao{
	private String NAMESPACE = "com.kh.team.mappers.ask.";
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public boolean insertAsk(AskVo askVo) {
		int count = sqlSession.insert(NAMESPACE+"insertAsk", askVo);
		if(count>0) {
			return true;
		}
		return false;
	}

	@Override
	public boolean updateAsk(AskVo askVo) {
		int count = sqlSession.update(NAMESPACE+"updateAsk", askVo);
		if(count >0) {
			return true;
		}
		return false;
	}

	@Override
	public boolean deleteAsk(int a_bno) {
		int count = sqlSession.delete(NAMESPACE+"deleteAsk", a_bno);
		if(count >0) {
			return true;
		}
		return false;
	}

	@Override
	public AskVo readAsk(int a_bno) {
		AskVo askVo = sqlSession.selectOne(NAMESPACE+"readAsk", a_bno);
		return askVo;
	}

	@Override
	public List<AskVo> askList(String writer, PagingDto pagingDto) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("writer", writer);
		map.put("pagingDto", pagingDto);
		map.put("startRow", pagingDto.getStartRow());
		map.put("endRow", pagingDto.getEndRow());
//		map.put("re_group", re_group);
		List<AskVo> AskList = sqlSession.selectList(NAMESPACE+"listAsk", map);
//		System.out.println("AskList: "+AskList);
		return AskList;
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
	public List<AskVo> allAskList(PagingDto pagingDto) {
		List<AskVo> allAskList = sqlSession.selectList(NAMESPACE+"allListAsk",pagingDto);
		return allAskList;
	}

	@Override
	public List<String> getAskImages(int a_bno) {
		List<String> AskImages = sqlSession.selectList(NAMESPACE+"getAskImages", a_bno);
		return AskImages;
	}

	@Override
	public boolean insertAskReply(AskVo askVo) {
		int count = sqlSession.insert(NAMESPACE+"insertAskReply", askVo);
		if(count >0) {
			return true;
		}
		return false;
	}

	@Override
	public void updateAskReSeq(AskVo askVo) {
		sqlSession.update(NAMESPACE+"updateReSeq", askVo);
	}

	@Override
	public void updateAstate(int a_bno) {
		sqlSession.update(NAMESPACE+"updateAstate", a_bno);
	}

}
