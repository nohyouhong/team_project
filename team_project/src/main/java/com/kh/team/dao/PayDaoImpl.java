package com.kh.team.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.team.vo.OrderProductVo;

@Repository
public class PayDaoImpl implements PayDao {
	private final String NAMESPACE = "com.kh.team.mappers.pay.";
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<OrderProductVo> getOrderList(int o_pno) {
		List<OrderProductVo> orderList = sqlSession.selectList(NAMESPACE + "getOrderList", o_pno);
		return orderList;
	}

	@Override
	public List<OrderProductVo> getOrderOptionList(int p_ino) {
		List<OrderProductVo> orderOptionList = sqlSession.selectList(NAMESPACE + "getOrderOptionList", p_ino);		
		return orderOptionList;
	}

	@Override
	public List<String> getProductName(int p_bno) {
		List<String> productName = sqlSession.selectList(NAMESPACE + "getProductName", p_bno);				
		return productName;
	}

	@Override
	public int getDeliverCount(int p_bno) {
		int count = sqlSession.selectOne(NAMESPACE + "getDeliverCount", p_bno);
		return count;
	}
	
	
	
}
