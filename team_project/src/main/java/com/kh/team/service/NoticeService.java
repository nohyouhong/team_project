package com.kh.team.service;

import java.util.List;

import com.kh.team.vo.NoticeVo;
import com.kh.team.vo.PagingDto;

public interface NoticeService {
//	public boolean insertNotice(NoticeVo noticeVo);
//	public NoticeVo readNotice(int n_bno);
//	public boolean updateNotice(int n_bno);
//	public boolean deleteNotice(int n_bno);
	public List<NoticeVo> noticeList();
//	public int getCount(PagingDto pagingDto);
}
