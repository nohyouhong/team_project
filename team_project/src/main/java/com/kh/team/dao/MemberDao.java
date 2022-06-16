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
	public int recogExistId(String username, String email, String cellphone);
	public List<String> findId(String username, String email, String cellphone);
	public int recogId(String userid, String username, String email);
}
