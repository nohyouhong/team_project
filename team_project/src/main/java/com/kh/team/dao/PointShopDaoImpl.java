package com.kh.team.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class PointShopDaoImpl implements PointShopDao {
private final String NAMESPACE = "com.kh.team.mappers.pointshop.";
	
	@Autowired
	private SqlSession sqlSession;

}
