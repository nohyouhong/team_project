package com.kh.team.dao;

import java.util.List;

import com.kh.team.vo.AddrVo;

public interface AddrDao {
	
	public boolean insertAddr(AddrVo addrVo);
	public List<AddrVo> addrList(String userid);
	public AddrVo readAddr(int add_no);
	public boolean updateAddr(AddrVo addrVo);
	public boolean deleteAddr(int add_no);
	
}
