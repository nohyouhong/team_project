package com.kh.team.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.team.dao.ColumnDao;
import com.kh.team.vo.ColumnVo;

@Service
public class ColumnServiceImpl implements ColumnService {
	
	@Autowired
	private ColumnDao columnDao;
	
	@Override
	public boolean insertColumn(ColumnVo columnVo) {
		int c_bno = columnDao.getNextC_bno();
		columnVo.setC_bno(c_bno);
		boolean insertResult = columnDao.insertColumn(columnVo);
		String[] files = columnVo.getPictures();
		if (files != null && files.length != 0) {
			for (String filename : files) {
				boolean insertPictureResult = columnDao.insertColumnPicture(filename, c_bno); 		
			}
		}
		if (insertResult) {
			return true;
		}
		return false;
	}

	@Override
	public ColumnVo readColumn(int c_bno) {
		ColumnVo columnVo = columnDao.readColumn(c_bno);
		return columnVo;
	}

	@Override
	public List<ColumnVo> getColumnList() {
		List<ColumnVo> columnList = columnDao.getColumnList();
		return columnList;
	}

	@Override
	public boolean updateColumn(ColumnVo columnVo) {
		
		return false;
	}

	@Override
	public boolean deleteColumn(int c_bno) {
		
		return false;
	}

}
