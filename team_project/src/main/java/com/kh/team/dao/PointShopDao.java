package com.kh.team.dao;

import java.util.List;

import com.kh.team.vo.MemberVo;
import com.kh.team.vo.PagingDto;
import com.kh.team.vo.PointShopBoardVo;
import com.kh.team.vo.ProductVo;

public interface PointShopDao {
	public int getNextBno();
	public boolean create(PointShopBoardVo pointShopBoardVo);
	public boolean productExPicCreate(String p_picture, int p_bno);
	public PointShopBoardVo read(int p_bno);
	public List<PointShopBoardVo> list(PagingDto pagingDto);
	public List<String> productExPicList(int p_bno);
	public boolean update(PointShopBoardVo pointShopBoardVo);
	public boolean updateProductExPicList(String p_picture);
	public boolean delete(int p_bno);
	
	public int getNextPno();
	public int getPnoByBno(int p_bno);
	public boolean productCreate(int pno, int p_bno, String p_name);
	public boolean productInfoCreate(ProductVo productVo);
	public boolean productPicCreate(String p_picture, int pno);
	public List<ProductVo> productRead(int pno);
	public List<String> productPicList(int pno);
	public boolean productUpdate(ProductVo productVo);//애는 안쓸듯
	public boolean productDelete(int pno);
	
	public boolean tagCreate(String p_tag, int p_bno);
	public List<String> tagRead(int p_bno);
	public boolean tagDelete(int p_bno);
}
