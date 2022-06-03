package com.kh.team.service;

import java.util.List;

import com.kh.team.vo.PointVo;


public interface PointService {
	public List<PointVo> getPoint_list(String userid);
	
}
