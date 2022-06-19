package com.kh.team;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kh.team.dao.MemberDao;
import com.kh.team.vo.MemberVo;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/**/*.xml")
public class MemberDaoTest {
	
	@Autowired
	private MemberDao memberDao;
	
	@Test
	public void testInsertMember() {
		MemberVo memberVo = new MemberVo("user10", "1234", "유저10", "user@email.com", "M", null);
		memberDao.insertMember(memberVo);
	}
	
	@Test
	public void testGetMemberList() {
		List<MemberVo> memberList = memberDao.getMemberList();
		System.out.println("memberList: " + memberList);
	}
	
	@Test
	public void testGetMemberById() {
		MemberVo memberVo = memberDao.getMemberById("user10");
		System.out.println("memberVo: " + memberVo);
	}
	
//	@Test
//	public void testModifyMember() {
//		MemberVo memberVo = new MemberVo("user10", "1234", "유저10", "user@email.com", "M");
//		boolean result = memberDao.modifyMember(memberVo);
//		System.out.println("result: " + result);
//	}
	
	@Test
	public void testDeleteMember() {
		boolean result = memberDao.deleteMember("user10");
		System.out.println(result);
	}
	
	@Test
	public void testFindId() {
//		String userid = "user01";
//		String username = "홍길동";
//		String email = "";
//		String cellphone = "01022334455";
//		int count = memberDao.recogExistId(username, email, cellphone);
//		int count2 = memberDao.recogId(userid, username, email);
//		List<String> userid = memberDao.findId(username, email, cellphone);
//		System.out.println("count: " + count);
//		System.out.println("userid: " + userid);
	}
	
}
