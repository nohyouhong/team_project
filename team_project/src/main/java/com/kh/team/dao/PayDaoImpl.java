package com.kh.team.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.team.vo.OrderProductVo;
import com.kh.team.vo.PayVo;

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
	
	@Override
	public int getNextHno() {
		int hno = sqlSession.selectOne(NAMESPACE + "getNextHno");
		return hno;
	}

	@Override
	public boolean insertFinalAddr(PayVo payVo) {
		int count = sqlSession.insert(NAMESPACE + "insertFinalAddr", payVo);
		if (count > 0) {
			return true;
		}
		return false;
	}

	@Override
	public boolean insertFinalProduct(PayVo payVo) {
		int count = sqlSession.insert(NAMESPACE + "insertFinalProduct", payVo);
		if (count > 0) {
			return true;
		}
		return false;
	}

	@Override
	public boolean updateOState(int o_pno) {
		int count = sqlSession.update(NAMESPACE + "updateOState", o_pno);
		if (count > 0) {
			return true;
		}
		return false;
	}
	
}
