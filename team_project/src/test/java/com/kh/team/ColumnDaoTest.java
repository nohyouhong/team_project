package com.kh.team;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kh.team.dao.ColumnDao;
import com.kh.team.dao.PointDao;
import com.kh.team.vo.ColumnVo;
import com.kh.team.vo.PointVo;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/**/*.xml")
public class ColumnDaoTest {
	
	@Autowired
	private ColumnDao columnDao;
	
	@Test
	public void isLikeTest() {
		String userid = "user01";
		int c_bno = 8;
		boolean isLikeResult = columnDao.isColumnLike(c_bno, userid);
		System.out.println("isLikeResult: " + isLikeResult);
		
	}
	
	@Test
	public void insertLikeTest() {
		String userid = "user01";
		int c_bno = 8;
		boolean result1 = columnDao.insertColumnLike(c_bno, userid);
		System.out.println("result1: " + result1);
	}
	
	@Test
	public void deleteLikeTest() {
		String userid = "user01";
		int c_bno = 8;
		boolean result1 = columnDao.deleteColumnLike(c_bno, userid);
		System.out.println("result1: " + result1);
	}
	
	@Test
	public void updateLikeTest() {
		int c_bno = 8;
		boolean result = columnDao.updateColumnLikeCount(c_bno, ColumnDao.COLUMNLIKE);
		System.out.println("result: " + result);
	}
	
	@Test
	public void insertTestColumn() {
		for (int i = 6; i < 20; i++) {
			ColumnVo columnVo = new ColumnVo(i, "Dummy Column - " + i, "dummy column - " + i, "user01");			
			columnDao.insertColumn(columnVo);
		}
	}
}
