package com.kh.team.dao;

import java.util.List;

import com.kh.team.vo.ColumnVo;

public interface ColumnDao {
	public static final int COLUMNLIKE = 1;
	public static final int COLUMNDISLIKE = -1;
	
	public boolean insertColumn(ColumnVo columnVo);
	public boolean insertColumnPicture(String filename, int c_bno);
	public int getNextC_bno();
	public ColumnVo readColumn(int c_bno);
	public List<ColumnVo> getColumnList();
	public boolean updateColumn(ColumnVo columnVo);
	public boolean deleteColumn(int c_bno);
	public boolean insertColumnLike(int c_bno, String userid);
	public boolean updateColumnLikeCount(int c_bno, int likeCount);
	public boolean deleteColumnLike(int c_bno, String userid);
	public boolean isColumnLike(int c_bno, String userid);
	
}
