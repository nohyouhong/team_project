package com.kh.team.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.team.vo.MemberVo;

@Repository
public class MemberDaoImpl implements MemberDao{
	private final String NAMESPACE = "com.kh.team.mappers.member.";
	
	@Autowired 
	private SqlSession sqlSession;

	@Override
	public boolean insertMember(MemberVo memberVo) {
		int count = sqlSession.insert(NAMESPACE + "insertMember", memberVo);
		if(count > 0) {
			return true;
		}
		return false;
	}

	@Override
	public List<MemberVo> getMemberList() {
		List<MemberVo> memberList = sqlSession.selectList(NAMESPACE + "getMemberList");
		return memberList;
	}

	@Override
	public MemberVo getMemberById(String userid) {
		MemberVo memberVo = sqlSession.selectOne(NAMESPACE + "getMemberById", userid);
		return memberVo;
	}

	@Override
	public boolean modifyMember(MemberVo memberVo) {
		System.out.println(memberVo);
		int count = sqlSession.update(NAMESPACE + "modifyMember", memberVo);
		if( count > 0) {
			return true;
		}
		return false;
	}

	@Override
	public boolean deleteMember(String userid) {
		int count = sqlSession.delete(NAMESPACE + "deleteMember", userid);
		if(count > 0) {
			return true;
		}
		return false;
	}

	@Override
	public MemberVo getMemberByIdAndPw(String userid, String userpw) {
		Map<String, String> parameter = new HashMap<String, String>();
		parameter.put("userid", userid);
		parameter.put("userpw", userpw);
		MemberVo memberVo = sqlSession.selectOne(
				NAMESPACE + "getMemberByIdAndPw", parameter);
		return memberVo;
	}

	@Override
	public int checkId(String userid) {
		int cnt = sqlSession.selectOne(NAMESPACE+"checkId", userid);
		return cnt;
	}

	@Override
	public int recogExistId(String username, String email, String cellphone) {
		Map<String, String> map = new HashMap<>();
		map.put("username", username);
		map.put("email", email);
		map.put("cellphone", cellphone);
		int count = sqlSession.selectOne(NAMESPACE + "recogExistId", map);
		return count;
	}

	@Override
	public List<String> findId(String username, String email, String cellphone) {
		Map<String, String> map = new HashMap<>();
		map.put("username", username);
		map.put("email", email);
		map.put("cellphone", cellphone);
		List<String> userid = sqlSession.selectList(NAMESPACE + "findId", map);
		return userid;
	}

	@Override
	public int recogId(String username, String email, String cellphone) {
		Map<String, String> map = new HashMap<>();
		map.put("username", username);
		map.put("email", email);
		map.put("cellphone", cellphone);
		int count = sqlSession.selectOne(NAMESPACE + "recogId", map);
		return count;
	}

}
