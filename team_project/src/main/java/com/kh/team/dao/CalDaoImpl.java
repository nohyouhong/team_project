package com.kh.team.dao;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.team.vo.DateData;


@Repository
public class CalDaoImpl implements CalDao {
	private final String NAMESPACE = "com.kh.team.mappers.cal.";
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public int isAttend(String userid, Date sysdate) {
		Map<String, Object> map = new HashMap<>();
		map.put("userid", userid);
		map.put("sysdate", sysdate);
		int count = sqlSession.selectOne(NAMESPACE + "isAttend", map);
		return count;
	}

	@Override
	public boolean updateMemberTattend(String userid) {
		int count = sqlSession.update(NAMESPACE + "updateMemberTattend", userid);
		if (count > 0) {
			return true;
		}
		return false;
	}

	@Override
	public boolean insertAttend(String userid) {
		int count = sqlSession.insert(NAMESPACE + "insertAttend", userid);
		if (count > 0) {
			return true;
		}
		return false;
	}

	@Override
	public boolean updateAttendCount(String userid) {
		int count = sqlSession.update(NAMESPACE + "updateAttendCount", userid);
		if (count  > 0) {
			return true;
		}
		return false;
	}

	@Override
	public DateData getAttendDate(String userid, String attend_date) {
		Map<String, String> map = new HashMap<>();
		map.put("userid", userid);
		map.put("attend_date", attend_date);
		DateData dateDatas = sqlSession.selectOne(NAMESPACE + "getAttendDate", map);
		return dateDatas;
	}
	
	
}
