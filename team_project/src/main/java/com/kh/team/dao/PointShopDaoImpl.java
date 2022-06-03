package com.kh.team.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.team.vo.PointShopVo;

@Repository
public class PointShopDaoImpl implements PointShopDao {
	private final String NAMESPACE = "com.kh.team.mappers.pointshop.";
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<PointShopVo> getPoint_list(String userid) {
		List<PointShopVo> point_list = sqlSession.selectList(NAMESPACE + "getPoint_list", userid);
		return point_list;
	}

	
}
