package com.kh.team;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kh.team.dao.PointShopDao;
import com.kh.team.vo.PointShopVo;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/**/*.xml")
public class PointShopDaoTest {
	
	@Autowired
	private PointShopDao pointShopDao;
	
	@Test
	public void testPointList() {
		String userid = "user01";
		List<PointShopVo> point_list = pointShopDao.getPoint_list(userid);
		System.out.println("PointShopDaoTest, testPointList, point_list: " + point_list);
	}
}
