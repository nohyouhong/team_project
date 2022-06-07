package com.kh.team.service;

import java.util.List;

import com.kh.team.vo.MessageVo;
import com.kh.team.vo.PagingDto;

public interface MessageService {
	public static final String TYPE_SENDER = "sender";
	public static final String TYPE_RECEIVER = 	"receiver";
	
	public boolean sendMessage(MessageVo messageVo);
	public MessageVo readMessage(int mno);
	public boolean deleteMessage(int mno);
	public List<MessageVo> listMessage(String userid, String mType, PagingDto pagingDto);
	public int getCount(String userid, String mType);
}
