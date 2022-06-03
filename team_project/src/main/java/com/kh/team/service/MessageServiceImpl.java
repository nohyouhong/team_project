package com.kh.team.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.team.dao.MessageDao;
import com.kh.team.vo.MessageVo;

@Service
public class MessageServiceImpl implements MessageService{
	
	@Autowired
	private MessageDao messageDao;

	@Override
	public boolean sendMessage(MessageVo messageVo) {
		boolean result =messageDao.insertMessage(messageVo);
		if(result) {
			return true;
		}
		return false;
	}

	@Override
	public MessageVo readMessage(int mno) {
		MessageVo messageVo = messageDao.readMessage(mno);
		return messageVo;
	}

	@Override
	public List<MessageVo> listMessage(String userid, String mType) {
		List<MessageVo> messageList = messageDao.listMessage(userid, mType);
		return messageList;
	}

}
