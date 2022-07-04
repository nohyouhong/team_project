package com.kh.team.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.team.dao.HistoryDao;
import com.kh.team.vo.HistoryVo;

@Service
public class HistoryServiceImpl implements HistoryService{

	@Autowired
	private HistoryDao historyDao;

	@Override
	public List<HistoryVo> getOrderHistoryList(String userid) {
		List<HistoryVo> historyList = historyDao.getOrderHistoryList(userid);
		return historyList;
	}

	@Override
	public boolean cancleOrder(int hno) {
		boolean result = historyDao.cancleOrder(hno);
		if(result) {
			return true;
		}
		return false;
	}

}
