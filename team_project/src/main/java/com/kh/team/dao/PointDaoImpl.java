package com.kh.team.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.team.vo.PointVo;

@Repository
public class PointDaoImpl implements PointDao {
	private final String NAMESPACE = "com.kh.team.mappers.point.";
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<PointVo> getPoint_list(String userid) {
		List<PointVo> point_list = sqlSession.selectList(NAMESPACE + "getPoint_list", userid);
		return point_list;
	}

	@Override
	public void insertPoint(PointVo pointVo) {
		sqlSession.insert(NAMESPACE + "insertPoint", pointVo);
	}

	@Override
	public void updatePoint(PointVo pointVo) {
		sqlSession.update(NAMESPACE + "updatePoint", pointVo);
	}

	@Override
	public void deletePoint(int pno) {
		sqlSession.delete(NAMESPACE + "deletePoint", pno);
	}

	
}
