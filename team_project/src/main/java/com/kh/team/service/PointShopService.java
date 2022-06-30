package com.kh.team.service;

import java.util.List;

import com.kh.team.vo.MemberVo;
import com.kh.team.vo.PagingDto;
import com.kh.team.vo.PointShopBoardVo;
import com.kh.team.vo.ProductVo;

public interface PointShopService {
	
	public int getCount(PagingDto pagingDto);
	public boolean create(ProductVo productVo,PointShopBoardVo pointShopBoardVo);
	public PointShopBoardVo read(int p_bno);
	public List<PointShopBoardVo> list(PagingDto pagingDto);
	public List<ProductVo> productRead(int pno);
	public List<String> productExPicList(int p_bno);
	public List<String> productPicList(int pno);
	public List<String> tagRead(int p_bno);
	public boolean update(PointShopBoardVo pointShopBoardVo);
	public boolean delete(int p_bno);
}
