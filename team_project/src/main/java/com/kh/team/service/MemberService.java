	package com.kh.team.service;

import java.util.List;
import com.kh.team.vo.MemberVo;

public interface MemberService {
	public void insertMember(MemberVo memberVo);
	public List<MemberVo> getMemberList();
	public MemberVo getMemberById(String userid);
	public boolean modifyMember(MemberVo memberVo);
	public boolean deleteMember(String userid);
	public MemberVo getMemberByIdAndPw(String userid, String userpw);
}
