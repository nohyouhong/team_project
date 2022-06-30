package com.kh.team.service;

import java.util.List;

import com.kh.team.vo.OrderProductVo;

public interface PayService {
	public List<OrderProductVo> getOrderList(int o_pno);
	public List<OrderProductVo> getOrderOptionList(int p_ino);
	public List<String> getProductName(int p_bno);
}
