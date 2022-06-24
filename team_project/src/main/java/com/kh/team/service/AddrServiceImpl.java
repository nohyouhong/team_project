package com.kh.team.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.team.dao.AddrDao;
import com.kh.team.dao.MemberDao;
import com.kh.team.vo.AddrVo;

@Service
public class AddrServiceImpl implements AddrService {
	
	@Autowired
	private AddrDao addrDao;
	
	
	@Override
	public boolean insertAddr(AddrVo addrVo) {
		int add_code = addrVo.getAdd_code();
		String userid = addrVo.getUserid();
		if (add_code == AddrDao.BASICADDRESS) {
			addrDao.updateAdd_code(userid);
		}
		boolean result = addrDao.insertAddr(addrVo);
		return result;
	}

	@Override
	public List<AddrVo> addrList(String userid) {
		List<AddrVo> addrList = addrDao.addrList(userid);
		return addrList;
	}

	@Override
	public AddrVo readAddr(int add_no) {
		AddrVo addrVo = addrDao.readAddr(add_no);
		return addrVo;
	}

	@Override
	public boolean updateAddr(AddrVo addrVo) {
		boolean result = addrDao.updateAddr(addrVo);
		return result;
	}

	@Override
	public boolean deleteAddr(int add_no) {
		boolean result = addrDao.deleteAddr(add_no);
		return result;
	}

}
