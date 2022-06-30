package com.kh.team.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.team.dao.PayDao;
import com.kh.team.vo.OrderProductVo;

@Service
public class PayServiceImpl implements PayService {
	
	@Autowired
	private PayDao payDao;
	
	@Override
	public List<OrderProductVo> getOrderList(int o_pno) {
		List<OrderProductVo> orderList = payDao.getOrderList(o_pno);
		return orderList;
	}

	@Override
	public List<OrderProductVo> getOrderOptionList(int p_ino) {
		List<OrderProductVo> orderOptionList = payDao.getOrderOptionList(p_ino);		
		return orderOptionList;
	}

	@Override
	public List<String> getProductName(int p_bno) {
		List<String> productName = payDao.getProductName(p_bno);				
		return productName;
	}
	
}
