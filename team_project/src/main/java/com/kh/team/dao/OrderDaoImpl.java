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
	public OrderProductVo read(int l_lno) {
		OrderProductVo orderVo = sqlSession.selectOne(NAMESPACE + "read", l_lno);
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
	public boolean getInoByLno(int l_lno, int p_ino) {
		Map<String, Object> parameter = new HashMap<String, Object>();
		parameter.put("l_lno", l_lno);
		parameter.put("p_ino", p_ino);
		int count = sqlSession.selectOne(NAMESPACE + "getInoByLno", parameter);
		if(count > 0) {
			return true;
		}
		return false;
	}
	
	@Override
	public OrderProductVo getBasketProductVoByIno(int p_ino) {
		OrderProductVo basketProductVo = sqlSession.selectOne(NAMESPACE + "getBasketProductVoByIno", p_ino);
		return basketProductVo;
	}
	
	@Override
	public List<OrderProductVo> getBasketProduct(int l_lno) {
		List<OrderProductVo> basketProductList = sqlSession.selectList(NAMESPACE + "getBasketProduct", l_lno);
		return basketProductList;
	}

	@Override
	public List<OrderProductVo> getBasketProductOptions(int p_bno, int l_lno) {
		Map<String, Object> parameter = new HashMap<String, Object>();
		parameter.put("p_bno", p_bno);
		parameter.put("l_lno", l_lno);
		List<OrderProductVo> basketProductOptionList = sqlSession.selectList(NAMESPACE + "getBasketProductOptions", parameter);
		return basketProductOptionList;
	}
	
	@Override
	public List<OrderProductVo> getBasketProductOptionsAll(int p_bno) {
		List<OrderProductVo> basketProductOptionList = sqlSession.selectList(NAMESPACE + "getBasketProductOptionsAll", p_bno);
		return basketProductOptionList;
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
		int count = sqlSession.update(NAMESPACE + "basketProductDelete", o_pno);
		if(count > 0) {
			return true;
		}
		return false;
	}

}
