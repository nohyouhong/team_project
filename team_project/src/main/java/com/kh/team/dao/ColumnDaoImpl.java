package com.kh.team.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.team.vo.ColumnVo;

@Repository
public class ColumnDaoImpl implements ColumnDao {
	private final String NAMESPACE = "com.kh.team.mappers.column.";
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int getNextC_bno() {
		int c_bno = sqlSession.selectOne(NAMESPACE + "getNextC_bno");
		return c_bno;
	}
	
	@Override
	public boolean insertColumn(ColumnVo columnVo) {
		int count = sqlSession.insert(NAMESPACE + "insertColumn", columnVo);
		if (count > 0) {
			return true;
		}
		return false;
	}
	
	@Override
	public boolean insertColumnPicture(String c_picture, int c_bno) {
		Map<String, Object> map = new HashMap<>();
		map.put("c_picture", c_picture);
		map.put("c_bno", c_bno);
		int count = sqlSession.insert(NAMESPACE + "insertColumnPicture", map);
		if (count > 0) {
			return true;
		}
		return false;
	}

	@Override
	public ColumnVo readColumn(int c_bno) {
		ColumnVo columnVo = sqlSession.selectOne(NAMESPACE + "readColumn", c_bno);
		sqlSession.update(NAMESPACE + "increaseColumnViewcnt", c_bno);
		return columnVo;
	}


	@Override
	public List<ColumnVo> getColumnList() {
		List<ColumnVo> columnList = sqlSession.selectList(NAMESPACE + "getColumnList");
		return columnList;
	}
	
	@Override
	public ColumnVo getColumnTitlePic(int c_bno) {
		ColumnVo columnTitlePic = sqlSession.selectOne(NAMESPACE + "getColumnTitlePic", c_bno);
		return columnTitlePic;
	}
	
	@Override
	public int getColumnC_rnum(int c_bno) {
		int c_rnum = sqlSession.selectOne(NAMESPACE + "getColumnC_rnum", c_bno);
		return c_rnum;
	}
	
	@Override
	public int getColumnCount() {
		int c_count = sqlSession.selectOne(NAMESPACE + "getColumnCount");
		return c_count;
	}
	
	@Override
	public ColumnVo getTopColumn() {
		ColumnVo topColumn = sqlSession.selectOne(NAMESPACE + "getTopColumn");
		return topColumn;
	}
	
	@Override
	public List<ColumnVo> getSubColumnList() {
		List<ColumnVo> mainColumnList = sqlSession.selectList(NAMESPACE + "getSubColumnList");
		return mainColumnList;
	}

	@Override
	public boolean modifyColumn(ColumnVo columnVo) {
		int count = sqlSession.update(NAMESPACE + "modifyColumn", columnVo);
		if (count > 0) {
			return true;
		}
		return false;
	}

	@Override
	public boolean deleteColumn(int c_bno) {
		sqlSession.delete(NAMESPACE + "deleteColumnPic", c_bno);
		sqlSession.delete(NAMESPACE + "deleteColumnLikes", c_bno);
		int count = sqlSession.delete(NAMESPACE + "deleteColumn", c_bno);
		if (count > 0) {
			return true;
		}
		return false;
	}
	
	@Override
	public List<String> getdeletefiles(int c_bno) {
		List<String> deletefiles = sqlSession.selectList(NAMESPACE + "getdeletefiles", c_bno);
		return deletefiles;
	}
	
	@Override
	public boolean deleteColumnPic(int c_bno) {
//		int count = sqlSession.delete(NAMESPACE + "deleteColumnPic", c_bno);
//		if (count > 0) {
//			return true;
//		}
		return false;
	}

	@Override
	public boolean deleteColumnLikes(int c_bno) {
//		int count = sqlSession.delete(NAMESPACE + "deleteColumnLikes", c_bno);
//		if (count > 0) {
//			return true;
//		}
		return false;
	}

	@Override
	public boolean insertColumnLike(int c_bno, String userid) {
		Map<String, Object> likeMap = new HashMap<>();
		likeMap.put("c_bno", c_bno);
		likeMap.put("userid", userid);
		int count = sqlSession.insert(NAMESPACE + "insertColumnLike", likeMap);
		if(count > 0) {
			return true;
		}
		return false;
	}
	
	@Override
	public boolean updateColumnLikeCount(int c_bno, int likeCount) {
		Map<String, Object> likeMap = new HashMap<>();
		likeMap.put("c_bno", c_bno);
		likeMap.put("likeCount", likeCount);
		int count = sqlSession.update(NAMESPACE + "updateColumnLikeCount", likeMap);
		if(count > 0) {
			return true;
		}
		return false;
	}

	@Override
	public boolean deleteColumnLike(int c_bno, String userid) {
		Map<String, Object> likeMap = new HashMap<>();
		likeMap.put("c_bno", c_bno);
		likeMap.put("userid", userid);
		int count = sqlSession.delete(NAMESPACE + "deleteColumnLike", likeMap);
		if(count > 0) {
			return true;
		}
		return false;
	}

	@Override
	public boolean isColumnLike(int c_bno, String userid) {
		Map<String, Object> likeMap = new HashMap<>();
		likeMap.put("c_bno", c_bno);
		likeMap.put("userid", userid);
		int isLikeCount = sqlSession.selectOne(NAMESPACE + "isColumnLike", likeMap);
		if(isLikeCount > 0) {
			return true;
		}
		return false;
	}
	
	@Override
	public void increaseColumnViewcnt(int c_bno) {
		
	}

}
