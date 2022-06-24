package com.kh.team.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.team.vo.AddrVo;

@Repository
public class AddrDaoImpl implements AddrDao {
	private final String NAMESPACE = "com.kh.team.mappers.addr.";
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public boolean insertAddr(AddrVo addrVo) {
		int count = sqlSession.insert(NAMESPACE + "insertAddr", addrVo);
		if (count  > 0) {
			return true;
		}
		return false;
	}
	
	@Override
	public boolean updateAdd_code(String userid) {
		int count = sqlSession.update(NAMESPACE + "updateAdd_code", userid);
		if(count > 0) {
			return true;
		}
		return false;
	}

	@Override
	public List<AddrVo> addrList(String userid) {
		List<AddrVo> addrList = sqlSession.selectList(NAMESPACE + "addrList", userid);
		return addrList;
	}

	@Override
	public AddrVo readAddr(int add_no) {
		AddrVo addrVo = sqlSession.selectOne(NAMESPACE + "readAddr", add_no);
		return addrVo;
	}

	@Override
	public boolean updateAddr(AddrVo addrVo) {
		int count = sqlSession.update(NAMESPACE + "updateAddr", addrVo);
		if (count > 0) {
			return true;
		}
		return false;
	}

	@Override
	public boolean deleteAddr(int add_no) {
		int count = sqlSession.delete(NAMESPACE + "deleteAddr", add_no);
		if (count > 0) {
			return true;
		}
		return false;
	}
	
}
