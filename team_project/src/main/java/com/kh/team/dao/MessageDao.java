package com.kh.team.dao;

import java.util.List;

import com.kh.team.vo.MessageVo;
import com.kh.team.vo.PagingDto;

public interface MessageDao {
	public boolean insertMessage(MessageVo messageVo);
	public MessageVo readMessage(int mno);
	public boolean updateOpendate(int mno);
	public boolean deleteMessage(int mno);
	public List<MessageVo> listMessage(String userid, String mType, PagingDto pagingDto);
	public int getCount(String userid, String mType);
}
