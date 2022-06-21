package com.kh.team.service;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.team.dao.CalDao;
import com.kh.team.dao.MemberDao;
import com.kh.team.dao.PointDao;
import com.kh.team.vo.DateData;
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
		
		return false;
	}

	@Override
	@Transactional
	public boolean insertAttend(String userid) {
		int m_point_count = memberDao.getM_attend_count(userid);
		if (m_point_count >= 19) {
			PointVo pointVo = new PointVo(userid, PointDao.TOTAL_ATTEND_POINT, PointDao.TOTAL_ATTEND_CODE);
			pointDao.insertPoint(pointVo);
			pointDao.updatePoint(pointVo);
			calDao.updateMemberTattend(userid);
			memberDao.initializeM_attend_count(userid);
			boolean result = calDao.insertAttend(userid);
			return result;
		} else {
			PointVo pointVo = new PointVo(userid, PointDao.ATTENDANCE_POINT, PointDao.ATTENDANCE_CODE);			
			pointDao.insertPoint(pointVo);
			pointDao.updatePoint(pointVo);
			calDao.insertAttend(userid);
			calDao.updateMemberTattend(userid);
			boolean result = calDao.updateAttendCount(userid);
			return result;
		}
	}

	@Override
	public DateData getAttendDate(String userid, String attend_date) {
		DateData dateData = calDao.getAttendDate(userid, attend_date);
		return dateData;
	}
}
