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
		for(int i = 1; i <= 1; i++) {
			MessageVo messageVo = new MessageVo("user02", "user01", "1. 동해물과 백두산이 마르고 닳도록\r\n" + 
					"하느님이 보우하사 우리나라 만세\r\n" + 
					"무궁화 삼천리 화려 강산\r\n" + 
					"대한 사람 대한으로 길이 보전하세");
			boolean result = messageDao.sendMessage(messageVo);
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
		List<MessageVo> listMessage = messageDao.listMessage("user01", "sender", null);
		System.out.println("Message, listMessage: " + listMessage);
	}
}
