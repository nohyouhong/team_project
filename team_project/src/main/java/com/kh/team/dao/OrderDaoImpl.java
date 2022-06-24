package com.kh.team.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.team.vo.OrderProductVo;

@Repository
public class OrderDaoImpl implements OrderDao{
private final String NAMESPACE = "com.kh.team.mappers.order.";
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public boolean updateBasket(int l_lno, String userid) {
		Map<String, Object> parameter = new HashMap<String, Object>();
		parameter.put("l_lno", l_lno);
		parameter.put("userid", userid);
		int count = sqlSession.update(NAMESPACE + "updateBasket", parameter);
		if(count > 0) {
			return true;
		}
		return false;
	}
	
	@Override
	public int getLnoByUserId(String userid) {
		int l_lno = sqlSession.selectOne(NAMESPACE + "getLnoByUserId", userid);
		return l_lno;
	}
	
	@Override
	public boolean create(String userid) {
		int count = sqlSession.insert(NAMESPACE + "create", userid);
		if(count > 0) {
			return true;
		}
		return false;
	}

	@Override
	public OrderProductVo read(int o_lno) {
		OrderProductVo orderVo = sqlSession.selectOne(NAMESPACE + "read", o_lno);
		return orderVo;
	}

	@Override
	public boolean update(OrderProductVo orderProductVo) {
		int count = sqlSession.update(NAMESPACE + "update", orderProductVo);
		if(count > 0) {
			return true;
		}
		return false;
	}

	@Override
	public int getNextPno() {
		int o_pno = sqlSession.selectOne(NAMESPACE + "getNextPno");
		return o_pno;
	}

	@Override
	public List<OrderProductVo> getBasketProduct(int o_lno) {
		List<OrderProductVo> basketProductList = sqlSession.selectList(NAMESPACE + "getBasketProduct", o_lno);
		return basketProductList;
	}

	@Override
	public boolean basketProductCreate(OrderProductVo orderProductVo) {
		int count = sqlSession.insert(NAMESPACE + "basketProductCreate", orderProductVo);
		if(count > 0) {
			return true;
		}
		return false;
	}

	@Override
	public boolean basketProductUpdate(OrderProductVo orderProductVo) {
		int count = sqlSession.update(NAMESPACE + "basketProductUpdate", orderProductVo);
		if(count > 0) {
			return true;
		}
		return false;
	}

	@Override
	public boolean basketProductDelete(int o_pno) {
		int count = sqlSession.delete(NAMESPACE + "basketProductDelete", o_pno);
		if(count > 0) {
			return true;
		}
		return false;
	}


}
