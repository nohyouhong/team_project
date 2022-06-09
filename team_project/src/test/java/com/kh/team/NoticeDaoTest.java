package com.kh.team;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kh.team.dao.NoticeDao;
import com.kh.team.vo.NoticeVo;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/**/*.xml")
public class NoticeDaoTest {
	
	@Autowired
	private NoticeDao noticeDao;
	
	@Test
	public void testlistMessage() {
		List<NoticeVo> noticeList = noticeDao.noticeList();
		System.out.println("Notice, noticeList: " + noticeList);
	}

}
