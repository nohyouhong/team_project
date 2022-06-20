package com.kh.team.service;

import java.sql.Date;


public interface CalService {
	public int isAttend(String userid, Date sysdate);
	public boolean updateMemberTattend(String userid);
	public boolean insertAttend(String userid);
}
