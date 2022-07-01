package com.kh.team.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.team.dao.PayDao;
import com.kh.team.vo.OrderProductVo;
import com.kh.team.vo.PayVo;

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

	@Override
	public int getDeliverCount(int p_bno) {
		int count = payDao.getDeliverCount(p_bno);
		return count;
	}

	@Override
	public boolean insertFinalOrder(PayVo payVo, int o_pno) {
		boolean result1 = payDao.insertFinalAddr(payVo);
		boolean result2 = payDao.insertFinalProduct(payVo);
		boolean result3 = payDao.updateOState(o_pno);
		if (result1 && result2 && result3) {
			return true;
		}
		return false;
	}
	
}
