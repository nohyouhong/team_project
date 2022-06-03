package com.kh.team.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.team.dao.PointDao;
import com.kh.team.vo.PointVo;

@Service
public class PointServiceImpl implements PointService {
	
	@Autowired
	private PointDao pointDao;

	@Override
	public List<PointVo> getPoint_list(String userid) {
		List<PointVo> point_list = pointDao.getPoint_list(userid);
		return point_list;
	}
	
	
}
