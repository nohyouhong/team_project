package com.kh.team.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.team.dao.RecipeBoardDao;
import com.kh.team.vo.PagingDto;
import com.kh.team.vo.RecipeBoardVo;

@Service
public class RecipeBoardServiceImpl implements RecipeBoardService{
	
	@Autowired
	private RecipeBoardDao recipeBoardDao;
	
	@Override
	@Transactional
	public boolean create(RecipeBoardVo recipeBoardVo) {
		int r_bno = recipeBoardDao.getNextBno();
		recipeBoardVo.setR_bno(r_bno);
		boolean result = recipeBoardDao.create(recipeBoardVo);
		String[] pictures = recipeBoardVo.getPictures();
		if(pictures != null && pictures.length != 0) {
			for(String filename : pictures) {
				recipeBoardDao.insertAttach(filename, r_bno);
			}
		}
		return result;
	}

	@Override
	public RecipeBoardVo read(int r_bno) {
		recipeBoardDao.updateViewCnt(r_bno);
		RecipeBoardVo recipeBoardVo = recipeBoardDao.read(r_bno);
		return recipeBoardVo;
	}

	@Override
	public boolean update(RecipeBoardVo recipeBoardVo) {
		boolean result = recipeBoardDao.update(recipeBoardVo);
		return result;
	}

	@Override
	public boolean delete(int r_bno) {
		boolean result = recipeBoardDao.delete(r_bno);
		return result;
	}

	@Override
	public List<RecipeBoardVo> list(PagingDto pagingDto) {
		List<RecipeBoardVo> list = recipeBoardDao.list(pagingDto);
		return list;
	}
	
	@Override
	public int getCount(PagingDto pagingDto) {
		int count = recipeBoardDao.getCount(pagingDto);
		return count;
	}
}
