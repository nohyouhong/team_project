package com.kh.team.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.team.dao.MessageDao;
import com.kh.team.vo.MessageVo;
import com.kh.team.vo.PagingDto;

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
		boolean result = messageDao.updateOpendate(mno);
		if(result) {
			MessageVo messageVo = messageDao.readMessage(mno);
			return messageVo;
		}
		return null;
	}

	@Override
	public List<MessageVo> listMessage(String userid, String mType, PagingDto pagingDto) {
		List<MessageVo> messageList = messageDao.listMessage(userid, mType, pagingDto);
		return messageList;
	}

	@Override
	public boolean deleteMessage(int mno) {
		boolean result = messageDao.deleteMessage(mno);
		if(result) {
			return true;
		}
		return false;
	}

	@Override
	public int getCount(PagingDto pagingDto) {
		int count = messageDao.getCount(pagingDto);
		return count;
	}

	
}
