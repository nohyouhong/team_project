package com.kh.team.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.team.vo.HistoryVo;

@Repository
public class HistoryDaoImpl implements HistoryDao{

	private final String NAMESPACE = "com.kh.team.mappers.history.";
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<HistoryVo> getOrderHistoryList(String userid) {
		List<HistoryVo> historyList = sqlSession.selectList(NAMESPACE+"getOrderHistoryList", userid);
		return historyList;
	}

	@Override
	public boolean cancleOrder(int hno) {
		int cnt = sqlSession.delete(NAMESPACE+"cancleOrder", hno);
		if(cnt >0) {
			return true;
		}
		return false;
	}

}
