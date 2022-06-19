package com.kh.team.dao;


import java.util.List;

import com.kh.team.vo.MemberVo;

public interface MemberDao { 
	public boolean insertMember(MemberVo memberVo); 
	public List<MemberVo> getMemberList();
	public MemberVo getMemberById(String userid);
	public int checkId(String userid);
	public boolean modifyMember(MemberVo memberVo);
	public boolean updateUserImage(String filename, String userid);
	public boolean deleteMember(String userid);
	public MemberVo getMemberByIdAndPw(String userid, String userpw);
	public int recogExistId(MemberVo memberVo);
	public List<String> findId(MemberVo memberVo);
	public int recogId(MemberVo memberVo);
	public boolean modifyPw(MemberVo memberVo);
}
