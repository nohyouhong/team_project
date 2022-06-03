package com.kh.team.dao;

import java.util.List;

import com.kh.team.vo.ColumnVo;

public interface ColumnDao {
	public boolean insertColumn(ColumnVo columnVo);
	public ColumnVo readColumn(int c_bno);
	public List<ColumnVo> getColumnList();
	public boolean updateColumn(ColumnVo columnVo);
	public boolean deleteColumn(int c_bno);
	
}
