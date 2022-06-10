package com.kh.team.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.team.dao.NoticeDao;
import com.kh.team.vo.NoticeVo;
import com.kh.team.vo.PagingDto;

@Service
public class NoticeServiceImpl implements NoticeService{
	
	@Autowired
	private NoticeDao noticeDao;

	@Override
	public boolean insertNotice(NoticeVo noticeVo) {
		boolean result = noticeDao.insertNotice(noticeVo);
		if(result) {
			return true;
		}
		return false;
	}

	@Override
	public NoticeVo readNotice(int n_bno) {
		NoticeVo noticeVo = noticeDao.readNotice(n_bno);
		return noticeVo;
	}

	@Override
	public boolean updateNotice(NoticeVo noticeVo) {
		boolean result = noticeDao.updateNotice(noticeVo);
		if(result) {
			return true;
		}
		return false;
	}

	@Override
	public boolean deleteNotice(int n_bno) {
		boolean result = noticeDao.deleteNotice(n_bno);
		if(result) {
			return true;
		}
		return false;
	}

	@Override
	public List<NoticeVo> noticeList(PagingDto pagingDto) {
		List<NoticeVo> noticeList = noticeDao.noticeList(pagingDto);
		return noticeList;
	}

	@Override
	public int getCount(PagingDto pagingDto) {
		int count = noticeDao.getCount(pagingDto);
		return count;
	}

}
