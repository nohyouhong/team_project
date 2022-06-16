package com.kh.team.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.team.dao.MemberDao;
import com.kh.team.dao.PointDao;
import com.kh.team.vo.MemberVo;
import com.kh.team.vo.PointVo;

@Service
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	MemberDao memberDao;
	
	@Autowired
	PointDao pointDao;
	
	@Override
	@Transactional
	public boolean insertMember(MemberVo memberVo) {
		PointVo pointVo = new PointVo(memberVo.getUserid(), PointDao.JOIN_POINT, PointDao.JOIN_CODE);
		boolean result = memberDao.insertMember(memberVo);
		pointDao.updatePoint(pointVo);
		pointDao.insertPoint(pointVo);
		return result;
	}

	@Override
	public List<MemberVo> getMemberList() {
		return null;
	}

	@Override
	public MemberVo getMemberById(String userid) {
		MemberVo memberVo = memberDao.getMemberById(userid);
		return memberVo;
	}

	@Override
	public boolean modifyMember(MemberVo memberVo) {
		return false;
	}

	@Override
	public boolean deleteMember(String userid) {
		return false;
	}

	@Override
	public MemberVo getMemberByIdAndPw(String userid, String userpw) {
		MemberVo memberVo = memberDao.getMemberByIdAndPw(userid, userpw);
		return memberVo;
	}

	@Override
	public List<PointVo> getPoint_list(String userid) {
		List<PointVo> point_list = pointDao.getPoint_list(userid);
		return point_list;
	}

	@Override
	public int checkId(String userid) {
		int cnt = memberDao.checkId(userid);
		return cnt;
	}

	@Override
	public int recogExistId(String username, String email, String cellphone) {
		int count = memberDao.recogExistId(username, email, cellphone);
		return count;
	}

	@Override
	public List<String> findId(String username, String email, String cellphone) {
		List<String> userids = memberDao.findId(username, email, cellphone);
		return userids;
	}

	@Override
	public int recogId(String userid, String username, String email) {
		int count = memberDao.recogId(userid, username, email);
		return count;
	}

	@Override
	public boolean updateUserImage(String filename, String userid) {
		return memberDao.updateUserImage(filename, userid);
	}
}
