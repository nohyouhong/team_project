package com.kh.team;

import java.util.List;

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
		for(int i = 1; i <= 5; i++) {
			MessageVo messageVo = new MessageVo("user02", "user01", "집에 가고시퐈");
			boolean result = messageDao.insertMessage(messageVo);
			System.out.println("Message, insert_result: " + result);
		}
	}
	
	@Test
	public void testreadMessage() {
		MessageVo messageVo = messageDao.readMessage(1);
		System.out.println("Message, readMessage: " + messageVo);
	}
	
	@Test
	public void testupdateOpendate() {
		boolean result = messageDao.updateOpendate(1);
		System.out.println("Message, updateOpendate: " + result );
	}
	
	@Test
	public void testdeleteMessage() {
		boolean result = messageDao.deleteMessage(10);
		System.out.println("Message, deleteMessage:" + result);
	}
	
	@Test
	public void testlistMessage() {
		List<MessageVo> listMessage = messageDao.listMessage("user01", "sender");
		System.out.println("Message, listMessage: " + listMessage);
	}
}
