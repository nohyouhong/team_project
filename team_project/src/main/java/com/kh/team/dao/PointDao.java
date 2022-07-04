package com.kh.team.dao;

import java.util.List;

import com.kh.team.vo.PointVo;

public interface PointDao {
	public static final int JOIN_POINT = 1000;
	public static final int JOIN_CODE = 1001;
	public static final int ATTENDANCE_POINT = 50;
	public static final int ATTENDANCE_CODE = 1002;
	public static final int TOTAL_ATTEND_POINT = 200;
	public static final int TOTAL_ATTEND_CODE = 1003;
	public static final int USE_POINT_CODE = 1004;
	
	
	public boolean insertPoint(PointVo pointVo);
	public List<PointVo> getPoint_list(String userid);
	public boolean updatePoint(PointVo pointVo);
	public void deletePoint(int pno);
	public int AllPoint(String userid);
	public int nowPoint(String userid);
	
}
