package com.kh.team.dao;

import java.util.List;

import com.kh.team.vo.PointShopVo;

public interface PointShopDao {
	
	public List<PointShopVo> getPoint_list(String userid);
	
}
