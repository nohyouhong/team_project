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
	public OrderProductVo read(int l_lno) {
		return orderDao.read(l_lno);
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
	public List<OrderProductVo> getBasketProduct(int l_lno) {
		return orderDao.getBasketProduct(l_lno);
	}
	
	@Override
	public List<OrderProductVo> getBasketProductOptions(int p_bno) {
		return orderDao.getBasketProductOptions(p_bno);
	}
	
	@Override
	public List<OrderProductVo> getBasketProductOptionsAll(int p_bno) {
		return orderDao.getBasketProductOptionsAll(p_bno);
	}

	@Override
	@Transactional
	public boolean basketProductCreate(OrderProductVo orderProductVo) {
		
		int l_lno = orderProductVo.getL_lno();
		int[] p_inos = orderProductVo.getP_inos();
		int[] o_prices = orderProductVo.getO_prices();
		int[] o_amounts = orderProductVo.getO_amounts();
		int[] o_sums = orderProductVo.getO_sums();
		if((p_inos != null && !p_inos.equals("")) 
			&& (o_prices != null && !o_prices.equals(""))
			&& (o_amounts != null && !o_amounts.equals(""))
			&& (o_sums != null && !o_sums.equals(""))){
			for(int i = 0; i < o_prices.length; i ++) {
				int p_ino = p_inos[i];
				int o_price = o_prices[i]; 
				int o_amount = o_amounts[i]; 
				int o_sum = o_sums[i]; 
				boolean result = orderDao.getInoByLno(l_lno, p_ino);
				if(result) {//중복된 옵션이 있는데 추가한경우 빼내서 플러스시킴(업데이트)
					OrderProductVo oldVo = orderDao.getBasketProductVoByIno(p_ino);
					int old_o_amount = oldVo.getO_amount(); 
					int old_o_sum = oldVo.getO_sum(); 
					oldVo.setO_amount(old_o_amount + o_amount);
					oldVo.setO_sum(old_o_sum + o_sum);
					orderDao.basketProductUpdate(oldVo);
				}else {//중복된 옵션이 있지 않는경우
					int o_pno = orderDao.getNextPno();
					orderProductVo.setO_pno(o_pno);
					orderProductVo.setP_ino(p_ino);
					orderProductVo.setO_price(o_price);
					orderProductVo.setO_amount(o_amount);
					orderProductVo.setO_sum(o_sum);
					orderDao.basketProductCreate(orderProductVo);
				}
			}
		}
		return true;
	}

	@Override
	@Transactional
	public boolean basketProductUpdate(OrderProductVo orderProductVo) {
		int l_lno = orderProductVo.getL_lno();
		int p_ino = orderProductVo.getP_ino();
		boolean result = orderDao.getInoByLno(l_lno, p_ino);
		if(result) {//중복된 바꾸기
			OrderProductVo oldVo = orderDao.getBasketProductVoByIno(p_ino);
			orderProductVo.setO_pno(oldVo.getO_pno());
			orderDao.basketProductUpdate(orderProductVo);
		}else {//중복된 옵션이 있지 않는경우
			int o_pno = orderDao.getNextPno();
			orderProductVo.setO_pno(o_pno);
			orderDao.basketProductCreate(orderProductVo);
		}
		return true;
	}

	@Override
	@Transactional
	public boolean basketProductDelete(int[] o_pnos) {
		for(int o_pno : o_pnos) {
			orderDao.basketProductDelete(o_pno);
		}
		return true;
	}

}
