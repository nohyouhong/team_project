package com.kh.team.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.team.dao.AddrDao;
import com.kh.team.vo.AddrVo;

@Service
public class AddrServiceImpl implements AddrService {
	
	@Autowired
	private AddrDao addrDao;
	
	@Override
	public boolean insertAddr(AddrVo addrVo) {
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
