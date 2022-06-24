package com.kh.team.dao;

import java.util.List;

import com.kh.team.vo.AddrVo;

public interface AddrDao {
	public static final int NORMALADDRESS = 1001;
	public static final int BASICADDRESS = 1002;
	public static final int RECENTADDRESS = 1003;
	
	public boolean insertAddr(AddrVo addrVo);
	public List<AddrVo> addrList(String userid);
	public AddrVo readAddr(int add_no);
	public boolean updateAddr(AddrVo addrVo);
	public boolean deleteAddr(int add_no);
	
}
