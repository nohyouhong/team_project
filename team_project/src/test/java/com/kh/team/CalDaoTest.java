package com.kh.team;


import java.sql.Date;
import java.time.LocalDate;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kh.team.dao.CalDao;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/**/*.xml")
public class CalDaoTest {
	
	@Autowired
	private CalDao calDao;
	
	@Test
	public void isAttendTest() {
		String userid = "user01";
		Date sysdate = Date.valueOf(LocalDate.now());
		int count = calDao.isAttend(userid, sysdate);
		System.out.println("count: " + count);
	};
	
}
