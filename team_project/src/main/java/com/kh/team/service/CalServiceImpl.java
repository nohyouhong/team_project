package com.kh.team.service;

import java.sql.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.team.dao.CalDao;
import com.kh.team.dao.MemberDao;
import com.kh.team.dao.PointDao;
import com.kh.team.vo.PointVo;

@Service
public class CalServiceImpl implements CalService {
	
	@Autowired
	private CalDao calDao;
	
	@Autowired
	private PointDao pointDao;
	
	@Autowired
	private MemberDao memberDao;

	@Override
	public int isAttend(String userid, Date sysdate) {
		int count = calDao.isAttend(userid, sysdate);
		return count;
	}

	@Override
	public boolean updateMemberTattend(String userid) {
		boolean result = calDao.updateMemberTattend(userid);
		return result;
	}

	@Override
	@Transactional
	public boolean insertAttend(String userid) {
		int m_totalattend = memberDao.getM_totalAttend(userid);
		if (m_totalattend >= 20) {
			PointVo pointVo = new PointVo(userid, PointDao.TOTAL_ATTEND_POINT, PointDao.TOTAL_ATTEND_CODE);
			pointDao.insertPoint(pointVo);
			pointDao.updatePoint(pointVo);
			memberDao.initializeM_totalAttend(userid);
		} else {
			PointVo pointVo = new PointVo(userid, PointDao.ATTENDANCE_POINT, PointDao.ATTENDANCE_CODE);			
			pointDao.insertPoint(pointVo);
			pointDao.updatePoint(pointVo);
		}
		boolean result = calDao.insertAttend(userid);
		return result;
	}
}
