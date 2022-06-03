package com.kh.team;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kh.team.dao.PointDao;
import com.kh.team.vo.PointVo;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/**/*.xml")
public class PointDaoTest {
	
	@Autowired
	private PointDao pointDao;
	
	@Test
	public void testPointList() {
		String userid = "user01";
		List<PointVo> point_list = pointDao.getPoint_list(userid);
		System.out.println("PointShopDaoTest, testPointList, point_list: " + point_list);
	}
	
	@Test
	public void testPointInsert() {
		String userid = "user01";
		int point = pointDao.ATTENDANCE_POINT;
		int p_code = pointDao.ATTENDANCE_CODE;
		PointVo pointVo = new PointVo();
		pointVo.setUserid(userid);
		pointVo.setPoint(point);
		pointVo.setP_code(p_code);
		pointDao.insertPoint(pointVo);
	}
	
	@Test
	public void testPointUpdate() {
		PointVo pointVo = new PointVo();
		pointVo.setUserid("user01");
		pointVo.setPoint(50);
		pointVo.setP_code(pointDao.USE_POINT_CODE);
		pointDao.updatePoint(pointVo);
	}
	
	@Test
	public void testPointDelete() {
		int pno = 11;
		pointDao.deletePoint(pno);
	}
}
