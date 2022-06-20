package com.kh.team.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.team.dao.CalDao;

@Service
public class CalServiceImpl implements CalService {
	
	@Autowired
	private CalDao calDao;
}
