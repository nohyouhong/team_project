package com.kh.team.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.kh.team.vo.MessageVo;

public class MessageDaoImpl implements MessageDao{
	private String NAMESPACE = "com.kh.team.mappers.message.";
	
	@Autowired
	private SqlSession sqlsession;

	@Override
	public boolean insertMessage(MessageVo messageVo) {
		int count = sqlsession.insert(NAMESPACE+"insertMessage", messageVo);
		if(count >0) {
			return true;
		}
		return false;
	}

	@Override
	public MessageVo readMessage(int mno) {
		MessageVo messageVo = sqlsession.selectOne(NAMESPACE+"readMessage", mno);
		return messageVo;
	}

	@Override
	public boolean updateOpendate(int mno) {
		int count = sqlsession.update(NAMESPACE+"updateOpendate", mno);
		if(count > 0) {
			return true;
		}
		return false;
	}

	@Override
	public boolean deleteMessage(int mno) {
		int count = sqlsession.delete(NAMESPACE+"deleteMessage", mno);
		if(count >0) {
			return true;
		}
		return false;
	}

	@Override
	public List<MessageVo> listMessage(String userid, String mType) {
		Map<String, String> map = new HashMap<>();
		map.put("userid", userid);
		map.put("mType", mType);
		List<MessageVo> messageList = sqlsession.selectList(NAMESPACE, mType);
		return messageList;
	}

}