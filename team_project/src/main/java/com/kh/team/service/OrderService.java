package com.kh.team.service;

import java.util.List;

import com.kh.team.vo.OrderProductVo;

public interface OrderService {
//	장바구니
	public boolean create(String userid);
	public OrderProductVo read(int o_lno);
	public boolean update(OrderProductVo orderProductVo);
	
//	장바구니물건
	public int getNextPno();
	public List<OrderProductVo> getBasketProduct(int o_lno);
	public boolean basketProductCreate(OrderProductVo orderProductVo);
	public boolean basketProductUpdate(OrderProductVo orderProductVo);
	public boolean basketProductDelete(int o_pno);
}
