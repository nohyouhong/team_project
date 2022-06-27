package com.kh.team.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.team.dao.MemberDao;
import com.kh.team.dao.PointDao;
import com.kh.team.vo.MemberVo;
import com.kh.team.vo.PagingDto;
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
	public List<MemberVo> getMemberList(PagingDto pagingDto) {
		List<MemberVo> member_list = memberDao.getMemberList(pagingDto);
		return member_list;
	}

	@Override
	public MemberVo getMemberById(String userid) {
		MemberVo memberVo = memberDao.getMemberById(userid);
		return memberVo;
	}

	@Override
	public boolean modifyMember(MemberVo memberVo) {
		boolean result = memberDao.modifyMember(memberVo);
		if(result) {
			return true;
		}
		return false;
	}
	
	@Override
	public boolean updateUserImage(String filename, String userid) {
		return memberDao.updateUserImage(filename, userid);
	}

	@Override
	public boolean deleteMember(String userid) {
		boolean result = memberDao.deleteMember(userid);
		if(result) {
			return true;
		}
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
	public int checkNick(String nickname) {
		int cnt = memberDao.checkNick(nickname);
		return cnt;
	}
	
	@Override
	public int checkPhoneNum(String cellphone) {
		int cnt = memberDao.checkPhoneNum(cellphone);
		return cnt;
	}

	@Override
	public int recogExistId(MemberVo memberVo) {
		int count = memberDao.recogExistId(memberVo);
		return count;
	}

	@Override
	public List<String> findId(MemberVo memberVo) {
		List<String> userids = memberDao.findId(memberVo);
		return userids;
	}

	@Override
	public int recogId(MemberVo memberVo) {
		int count = memberDao.recogId(memberVo);
		return count;
	}

	@Override
	public boolean modifyPw(MemberVo memberVo) {
		boolean result = memberDao.modifyPw(memberVo);
		return result;
	}

	@Override
	public boolean insertAdmin(MemberVo memberVo) {
		boolean result = memberDao.insertAdmin(memberVo);
		return result;
	}

	@Override
	public int sumPoint(String userid) {
		int allPoint = pointDao.AllPoint(userid);
		return allPoint;
	}

	@Override
	public int nowPoint(String userid) {
		int nowPoint = pointDao.nowPoint(userid);
		return nowPoint;
	}

	

	

}
