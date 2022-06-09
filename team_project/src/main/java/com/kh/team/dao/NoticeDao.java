package com.kh.team.dao;

import java.util.List;

import com.kh.team.vo.NoticeVo;
import com.kh.team.vo.PagingDto;

public interface NoticeDao {
	public boolean insertNotice(NoticeVo noticeVo);
	public NoticeVo readNotice(int n_bno);
	public boolean updateNotice(int n_bno);
	public boolean deleteNotice(int n_bno);
	public List<NoticeVo> noticeList(PagingDto pagingDto);
	public int getCount(PagingDto pagingDto);
}
