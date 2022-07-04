package com.kh.team.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.team.dao.PointDao;
import com.kh.team.vo.PointVo;

@Service
public class PointServiceImpl implements PointService {

	@Autowired
	private PointDao pointDao;
	
	@Override
	public boolean insertPoint(PointVo pointVo) {
		pointVo.setP_code(pointDao.USE_POINT_CODE);
		boolean result = pointDao.insertPoint(pointVo);
		return result;
	}
	
	@Override
	public boolean updatePoint(PointVo pointVo) {
		pointVo.setP_code(pointDao.USE_POINT_CODE);
		boolean result = pointDao.updatePoint(pointVo);
		return result;
	}

	@Override
	public int getPointCount(String userid) {
		int count = pointDao.getPointCount(userid);
		return count;
	}
	
}
