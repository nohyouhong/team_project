package com.kh.team.dao;

import java.util.List;

import com.kh.team.vo.ColumnVo;

public interface ColumnDao {
	public static final int COLUMNLIKE = 1;
	public static final int COLUMNDISLIKE = -1;
	
	// 칼럼 데이터 삽입
	public int getNextC_bno();
	public boolean insertColumn(ColumnVo columnVo);
	public boolean insertColumnPicture(String filename, int c_bno);
	
	// 칼럼 읽기
	public ColumnVo readColumn(int c_bno);
	
	// 칼럼 리스트
	public List<ColumnVo> getColumnList();
	public List<ColumnVo> getColumnTitlePic(int c_bno);
	
	// viewcnt 상위 4개 리스트
	public List<ColumnVo> getMainColumnList();
	
	// 칼럼 수정
	public boolean modifyColumn(ColumnVo columnVo);
	
	// 칼럼 삭제
	public boolean deleteColumn(int c_bno);
	public boolean deleteColumnPic(int c_bno);
	public boolean deleteColumnLikes(int c_bno);
	public List<String> getdeletefiles(int c_bno);
	
	// 칼럼 좋아요
	public boolean insertColumnLike(int c_bno, String userid);
	public boolean updateColumnLikeCount(int c_bno, int likeCount);
	public boolean deleteColumnLike(int c_bno, String userid);
	public boolean isColumnLike(int c_bno, String userid);
	
	// 칼럼 조회수
	public void increaseColumnViewcnt(int c_bno);
	
}
