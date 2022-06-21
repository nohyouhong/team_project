package com.kh.team.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.team.dao.PointShopDao;
import com.kh.team.dao.RecipeBoardDao;

@Service
public class PointShopServiceImpl implements PointShopService{
	
	@Autowired
	private PointShopDao pointShopDao;
	
}
