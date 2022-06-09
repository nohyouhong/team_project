package com.kh.team.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.team.vo.NoticeVo;
import com.kh.team.vo.PagingDto;

@Repository
public class NoticeDaoImpl implements NoticeDao{
	private String NAMESPACE = "com.kh.team.mappers.notice.";
	
	@Autowired
	private SqlSession sqlsession;

	@Override
	public boolean insertNotice(NoticeVo noticeVo) {
		int count = sqlsession.insert(NAMESPACE+"insertNotice", noticeVo);
		if(count>0) {
			return true;
		}
		return false;
	}

	@Override
	public NoticeVo readNotice(int n_bno) {
		NoticeVo noticeVo = sqlsession.selectOne(NAMESPACE+"readNotice", n_bno);
		return noticeVo;
	}

	@Override
	public boolean updateNotice(int n_bno) {
		int count = sqlsession.update(NAMESPACE+"updateNotice", n_bno);
		if(count > 0) {
			return true;
		}
		return false;
	}

	@Override
	public boolean deleteNotice(int n_bno) {
		int count = sqlsession.delete(NAMESPACE+"deleteNotice", n_bno);
		if(count >0) {
			return true;
		}
		return false;
	}

	@Override
	public List<NoticeVo> noticeList(PagingDto pagingDto) {
		Map<String, Object> map = new HashMap<>();
		map.put("startRow", pagingDto.getStartRow());
		map.put("endRow", pagingDto.getEndRow());
		List<NoticeVo> noticeList = sqlsession.selectList(NAMESPACE+"noticeList", map);
		return noticeList;
	}

	@Override
	public int getCount(PagingDto pagingDto) {
		int count = sqlsession.selectOne(NAMESPACE+"getCount", pagingDto);
		return count;
	}


}
