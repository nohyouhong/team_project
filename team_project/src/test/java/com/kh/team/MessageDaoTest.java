package com.kh.team;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kh.team.dao.MessageDao;
import com.kh.team.vo.MessageVo;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/**/*.xml")
public class MessageDaoTest {

	@Autowired
	private MessageDao messageDao;
	
	@Test
	public void testInsertMessage() {
		for(int i = 1; i <= 10; i++) {
			MessageVo messageVo = new MessageVo("user01", "user02", "hi");
			boolean result = messageDao.insertMessage(messageVo);
			System.out.println("Message, insert_result: " + result);
		}
	}
}
