	package com.kh.team.service;

import java.util.List;
import com.kh.team.vo.MemberVo;
import com.kh.team.vo.PagingDto;
import com.kh.team.vo.PointVo;

public interface MemberService {
	public boolean insertMember(MemberVo memberVo);
	public boolean insertAdmin(MemberVo memberVo);
	public List<MemberVo> getMemberList(PagingDto pagingDto);
	public MemberVo getMemberById(String userid);
	public int checkId(String userid);
	public int checkNick(String nickname);
	public int checkPhoneNum(String cellphone);
	public boolean modifyMember(MemberVo memberVo);
	public boolean updateUserImage(String filename, String userid);
	public boolean deleteMember(String userid);
	public MemberVo getMemberByIdAndPw(String userid, String userpw);
	
	public List<PointVo> getPoint_list(String userid, PagingDto pagingDto);
	public int sumPoint(String userid);
	public int nowPoint(String userid);
	public int recogExistId(MemberVo memberVo);
	public List<String> findId(MemberVo memberVo);
	public int recogId(MemberVo memberVo);
	public boolean modifyPw(MemberVo memberVo);
}
