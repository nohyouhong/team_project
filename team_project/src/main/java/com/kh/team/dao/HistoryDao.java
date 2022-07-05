package com.kh.team.dao;

import java.util.List;

import com.kh.team.vo.HistoryVo;

public interface HistoryDao {
	public List<HistoryVo> getOrderHistoryList(String userid);
	public boolean cancleOrder(int h_pno);
}
