package com.kh.team.service;

import java.util.List;

import com.kh.team.vo.ColumnVo;
import com.kh.team.vo.PagingDto;

public interface ColumnService {
	public boolean insertColumn(ColumnVo columnVo);
	
	public ColumnVo readColumn(int c_bno);
	
	public List<ColumnVo> getColumnList(PagingDto pagingDto);
	public ColumnVo getColumnTitlePic(int c_bno);
	public List<ColumnVo> getRowColumnList();
	
	public ColumnVo getTopColumn();
	public List<ColumnVo> getSubColumnList();
	public int getColumnC_rnum(int c_bno);
	public int getColumnCount();
	
	public boolean modifyColumn(ColumnVo columnVo);
	
	public boolean deleteColumn(int c_bno);
	public List<String> getdeletefiles(int c_bno);
	
	public boolean insertColumnLike(int c_bno, String userid);
	public boolean updateColumnLikeCount(int c_bno, int likeCount);
	public boolean deleteColumnLike(int c_bno, String userid);
	public boolean isColumnLike(int c_bno, String userid);
}
