package com.kh.team.dao;

import java.util.List;

import com.kh.team.vo.OrderProductVo;

public interface OrderDao {
//  유저 장바구니 바꿔주기
	public boolean updateBasket(int l_lno, String userid);
	
//	장바구니
	public int getLnoByUserId(String userid);
	public boolean create(String userid);
	public OrderProductVo read(int l_lno);
	public boolean update(OrderProductVo orderProductVo);
	
//	장바구니물건
	public int getNextPno();
	public boolean getInoByLno(int l_lno, int p_ino);
	public OrderProductVo getBasketProductVoByIno(int p_ino);//안씀
	public List<OrderProductVo> getBasketProduct(int l_lno);
	public List<OrderProductVo> getBasketProductOptions(int p_bno, int l_lno);
	public List<OrderProductVo> getBasketProductOptionsAll(int p_bno);
	public boolean basketProductCreate(OrderProductVo orderProductVo);
	public boolean basketProductUpdate(OrderProductVo orderProductVo);
	public boolean basketProductDelete(int o_pno);
}
