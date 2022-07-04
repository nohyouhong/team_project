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
	public int getNextHno() {
		int hno = payDao.getNextHno();
		return hno;
	}

	@Override
	public boolean insertFinalAddr(PayVo payVo) {
		boolean result = payDao.insertFinalAddr(payVo);
		return result;
	}

	@Override
	public boolean insertFinalProduct(PayVo payVo) {
		boolean result = payDao.insertFinalProduct(payVo);
		return result;
	}

	@Override
	public boolean updateOState(int o_pno) {
		boolean result = payDao.updateOState(o_pno);
		return result;
	}

	@Override
	public PayVo getRecentAddr(String userid) {
		PayVo payVo = payDao.getRecentAddr(userid);
		return payVo;
	}
	
}
