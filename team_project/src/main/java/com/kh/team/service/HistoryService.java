package com.kh.team.service;

import java.util.List;

import com.kh.team.vo.HistoryVo;

public interface HistoryService {
	public List<HistoryVo> getOrderHistoryList(String userid);
	public boolean cancleOrder(int h_pno);
}
