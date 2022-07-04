package com.kh.team.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.team.vo.PagingDto;
import com.kh.team.vo.PointVo;

@Repository
public class PointDaoImpl implements PointDao {
	private final String NAMESPACE = "com.kh.team.mappers.point.";
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<PointVo> getPoint_list(String userid, PagingDto pagingDto) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userid", userid);
		map.put("startRow", pagingDto.getStartRow());
		map.put("endRow", pagingDto.getEndRow());
		List<PointVo> point_list = sqlSession.selectList(NAMESPACE + "getPoint_list", map);
		return point_list;
	}
	
	@Override
	public int getPointCount(String userid) {
		int count = sqlSession.selectOne(NAMESPACE + "getPointCount", userid);
		return count;
	}

	@Override
	public boolean insertPoint(PointVo pointVo) {
		int count = sqlSession.insert(NAMESPACE + "insertPoint", pointVo);
		if (count > 0) {
			return true;
		}
		return false;
	}

	@Override
	public boolean updatePoint(PointVo pointVo) {
		int count = sqlSession.update(NAMESPACE + "updatePoint", pointVo);
		if (count > 0) {
			return true;
		}
		return false;
	}

	@Override
	public void deletePoint(int pno) {
		sqlSession.delete(NAMESPACE + "deletePoint", pno);
	}

	@Override
	public int AllPoint(String userid) {
		int allPoint = sqlSession.selectOne(NAMESPACE+"sumPoint", userid);
		return allPoint;
	}

	@Override
	public int nowPoint(String userid) {
		int nowPoint = sqlSession.selectOne(NAMESPACE+"nowPoint", userid);
		return nowPoint;
	}

}
