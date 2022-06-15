package com.kh.team.dao;

import java.util.List;

import com.kh.team.vo.ColumnVo;
import com.kh.team.vo.PagingDto;

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
	public List<ColumnVo> getColumnList(PagingDto pagingDto);
	public ColumnVo getColumnTitlePic(int c_bno);
	
	// 컨텐츠 내의 칼럼 리스트
	public List<ColumnVo> getRowColumnList();
	public int getColumnC_rnum(int c_bno);
	public int getColumnCount();
	
	// viewcnt 1위 column
	public ColumnVo getTopColumn();
	// viewcnt 상위 2~4위 리스트
	public List<ColumnVo> getSubColumnList();
	
	
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
