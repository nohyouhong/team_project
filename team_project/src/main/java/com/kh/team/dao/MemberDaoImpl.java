package com.kh.team.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.team.vo.MemberVo;
import com.kh.team.vo.PagingDto;

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
	public List<MemberVo> getMemberList(PagingDto pagingDto) {
		List<MemberVo> memberList = sqlSession.selectList(NAMESPACE + "getMemberList", pagingDto);
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
	public int checkPhoneNum(String cellphone) {
		int cnt = sqlSession.selectOne(NAMESPACE+"checkPhoneNum", cellphone);
		return cnt;
	}

	@Override
	public int recogExistId(MemberVo memberVo) {
		int count = sqlSession.selectOne(NAMESPACE + "recogExistId", memberVo);
		return count;
	}

	@Override
	public List<String> findId(MemberVo memberVo) {
		List<String> userid = sqlSession.selectList(NAMESPACE + "findId", memberVo);
		return userid;
	}

	@Override
	public int recogId(MemberVo memberVo) {
		int count = sqlSession.selectOne(NAMESPACE + "recogId", memberVo);
		return count;
	}

	@Override
	public boolean modifyPw(MemberVo memberVo) {
		int count = sqlSession.update(NAMESPACE + "modifyPw", memberVo);
		if (count > 0) {
			return true;
		}
		return false;
	}
	
	@Override
	public boolean updateUserImage(String filename, String userid) {
		Map<String, String> map = new HashMap<>();
		map.put("m_picture", filename);
		map.put("userid", userid);
		int count = sqlSession.update(NAMESPACE + "updateUserImage", map);
		if( count > 0) {
			return true;
		}
		return false;
	}

	@Override
	public boolean insertAdmin(MemberVo memberVo) {
		int count = sqlSession.insert(NAMESPACE+"insertAdmin", memberVo);
		if(count>0) {
			return true;
		}
		return false;
	}

	@Override
	public int getM_attend_count(String userid) {
		int m_point_count = sqlSession.selectOne(NAMESPACE + "getM_attend_count", userid);
		return m_point_count;
	}

	@Override
	public boolean initializeM_attend_count(String userid) {
		int count = sqlSession.update(NAMESPACE + "initializeM_attend_count", userid);
		if (count > 0) {
			return true;
		}
		return false;
	}


}
