package com.kh.team.dao;

import java.sql.Date;


public interface CalDao {
	public int isAttend(String userid, Date sysdate);
	public boolean updateMemberTattend(String userid);
	public boolean updateAttendCount(String userid);
	public boolean insertAttend(String userid);
}
