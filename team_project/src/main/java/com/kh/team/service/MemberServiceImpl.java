package com.kh.team.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.kh.team.dao.MemberDao;
import com.kh.team.vo.MemberVo;


public class MemberServiceImpl implements MemberService{
	
	@Autowired
	MemberDao memberDao;
	
	@Override
	public void insertMember(MemberVo memberVo) {
		memberDao.insertMember(memberVo);
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
}
