package com.kh.team.service;

import java.util.List;

import com.kh.team.vo.MessageVo;

public interface MessageService {
	public static final String TYPE_SENDER = "sender";
	public static final String TYPE_RECEIVER = 	"receiver";
	
	public boolean sendMessage(MessageVo messageVo);
	public MessageVo readMessage(int mno);
	public List<MessageVo> listMessage(String userid, String mType);
}
