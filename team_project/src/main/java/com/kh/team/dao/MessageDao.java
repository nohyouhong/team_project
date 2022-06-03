package com.kh.team.dao;

import java.util.List;

import com.kh.team.vo.MessageVo;

public interface MessageDao {
	public boolean insertMessage(MessageVo messageVo);
	public MessageVo readMessage(int mno);
	public boolean updateOpendate(int mno);
	public boolean deleteMessage(int mno);
	public List<MessageVo> listMessage(String userid, String mType);
}
