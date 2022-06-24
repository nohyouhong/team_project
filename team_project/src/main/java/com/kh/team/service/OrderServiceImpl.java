package com.kh.team.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.team.dao.OrderDao;
import com.kh.team.vo.OrderProductVo;

@Service
public class OrderServiceImpl implements OrderService{

	@Autowired
	private OrderDao orderDao;
	
	@Override
	@Transactional
	public boolean create(String userid) {
		boolean result = orderDao.create(userid);
		int l_lno = orderDao.getLnoByUserId(userid);
		orderDao.updateBasket(l_lno, userid);
		return result;
	}

	@Override
	public OrderProductVo read(int o_lno) {
		return orderDao.read(o_lno);
	}

	@Override
	public boolean update(OrderProductVo orderProductVo) {
//		orderDao.
		return false;
	}

	@Override
	public int getNextPno() {
		return orderDao.getNextPno();
	}

	@Override
	public List<OrderProductVo> getBasketProduct(int o_lno) {
		return orderDao.getBasketProduct(o_lno);
	}

	@Override
	public boolean basketProductCreate(OrderProductVo orderProductVo) {
//		orderDao.basketProductCreate(orderProductVo);
		int[] o_prices = orderProductVo.getO_prices();
		int[] o_amounts = orderProductVo.getO_amounts();
		int[] o_sums = orderProductVo.getO_prices();
		return false;
	}

	@Override
	public boolean basketProductUpdate(OrderProductVo orderProductVo) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean basketProductDelete(int o_pno) {
		return orderDao.basketProductDelete(o_pno);
	}

}
