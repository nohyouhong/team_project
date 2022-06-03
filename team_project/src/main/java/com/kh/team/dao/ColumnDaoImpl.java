package com.kh.team.dao;

import java.util.List;

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
	public boolean insertColumn(ColumnVo columnVo) {
		int count = sqlSession.insert(NAMESPACE + "insertColumn", columnVo);
		if (count > 0) {
			return true;
		}
		return false;
	}

	@Override
	public ColumnVo readColumn(int c_bno) {
		ColumnVo columnVo = sqlSession.selectOne(NAMESPACE + "readColumn", c_bno);
		return columnVo;
	}

	@Override
	public List<ColumnVo> getColumnList() {
		List<ColumnVo> ColumnList = sqlSession.selectList(NAMESPACE + "getColumnList");
		return ColumnList;
	}

	@Override
	public boolean updateColumn(ColumnVo columnVo) {
		int count = sqlSession.update(NAMESPACE + "updateColumn", columnVo);
		if (count > 0) {
			return true;
		}
		return false;
	}

	@Override
	public boolean deleteColumn(int c_bno) {
		int count = sqlSession.delete(NAMESPACE + "deleteColumn", c_bno);
		if (count > 0) {
			return true;
		}
		return false;
	}

}
