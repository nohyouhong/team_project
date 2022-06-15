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
	public ColumnVo getColumnTitlePic(int c_bno) {
		ColumnVo ColumnTitlePic = columnDao.getColumnTitlePic(c_bno);
		return ColumnTitlePic;
	}
	
	@Override
	public int getColumnC_rnum(int c_bno) {
		int c_rnum = columnDao.getColumnC_rnum(c_bno);
		return c_rnum;
	}
	
	@Override
	public int getColumnCount() {
		int c_count = columnDao.getColumnCount();
		return c_count;
	}
	
	@Override
	public ColumnVo getTopColumn() {
		ColumnVo topColumn = columnDao.getTopColumn();
		return topColumn;
	}
	
	@Override
	public List<ColumnVo> getSubColumnList() {
		List<ColumnVo> subColumnList = columnDao.getSubColumnList();
		return subColumnList;
	}

	@Override
	public boolean modifyColumn(ColumnVo columnVo) {
		boolean result = columnDao.modifyColumn(columnVo);
		return result;
	}

	@Override
	public boolean deleteColumn(int c_bno) {
		boolean result = columnDao.deleteColumn(c_bno);
		return result;
	}

	@Override
	public boolean insertColumnLike(int c_bno, String userid) {
		boolean result = columnDao.insertColumnLike(c_bno, userid);
		return result;
	}

	@Override
	public boolean updateColumnLikeCount(int c_bno, int likeCount) {
		boolean result = columnDao.updateColumnLikeCount(c_bno, likeCount);
		return result;
	}

	@Override
	public boolean deleteColumnLike(int c_bno, String userid) {
		boolean result = columnDao.deleteColumnLike(c_bno, userid);
		return result;
	}

	@Override
	public boolean isColumnLike(int c_bno, String userid) {
		boolean result = columnDao.isColumnLike(c_bno, userid);
		return result;
	}

	@Override
	public List<String> getdeletefiles(int c_bno) {
		List<String> deleteFiles = columnDao.getdeletefiles(c_bno);
		return deleteFiles;
	}

}
