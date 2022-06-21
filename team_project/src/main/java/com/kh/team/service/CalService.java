package com.kh.team.service;

import java.sql.Date;
import java.util.List;

import com.kh.team.vo.DateData;


public interface CalService {
	public int isAttend(String userid, Date sysdate);
	public boolean updateMemberTattend(String userid);
	public boolean insertAttend(String userid);
	public DateData getAttendDate(String userid, String attend_date);
}
