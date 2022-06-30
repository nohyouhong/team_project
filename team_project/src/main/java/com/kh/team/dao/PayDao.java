package com.kh.team.dao;

import java.util.List;

import com.kh.team.vo.OrderProductVo;

public interface PayDao {
	public List<OrderProductVo> getOrderList(int o_pno);
	public List<OrderProductVo> getOrderOptionList(int p_ino);
	public List<String> getProductName(int p_bno);
	public int getDeliverCount(int p_bno);
}
