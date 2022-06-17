package com.kh.team.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.team.dao.AskDao;
import com.kh.team.vo.AskVo;
import com.kh.team.vo.PagingDto;

@Service
public class AskServiceImpl implements AskService{
	
	@Autowired
	private AskDao askDao;

	@Override
	public boolean insertAsk(AskVo askVo) {
		int a_bno = askDao.getNexta_bno();
		askVo.setA_bno(a_bno);
		askVo.setRe_group(a_bno);
		boolean result = askDao.insertAsk(askVo);
		String[] files = askVo.getFiles();
		if(files != null && files.length != 0) {
			for(String a_picture : files) {
				askDao.insertAttach(a_picture, a_bno);
			}
		}
		return result;
	}

	@Override
	public boolean updateAsk(AskVo askVo) {
		boolean result = askDao.updateAsk(askVo);
		if(result) {
			return true;
		}
		return false;
	}

	@Override
	public boolean deleteAsk(int a_bno) {
		boolean result = askDao.deleteAsk(a_bno);
		if(result) {
			return true;
		}
		return false;
	}

	@Override
	public AskVo readAsk(int a_bno) {
		AskVo AskVo = askDao.readAsk(a_bno);
		return AskVo;
	}

	@Override
	public List<AskVo> AskList(String writer, PagingDto pagingDto, int re_group) {
		int re_group1 = askDao.getReGroup(writer);
		List<AskVo> AskList = askDao.askList(writer, pagingDto, re_group1);
		return AskList;
	}

	@Override
	public int getCount(PagingDto pagingDto) {
		int count = askDao.getCount(pagingDto);
		return count;
	}

	@Override
	public List<AskVo> allAskList(PagingDto pagingDto) {
		List<AskVo> allAskList = askDao.allAskList(pagingDto);
		return allAskList;
	}

	@Override
	public List<String> getAskImages(int a_bno) {
		List<String> AskImages = askDao.getAskImages(a_bno);
		return AskImages;
	}

	@Override
	@Transactional
	public boolean insertAskReply(AskVo askVo) {
		askDao.updateAstate(askVo.getA_bno());
		int a_bno = askDao.getNexta_bno();
		askVo.setA_bno(a_bno);
		askDao.updateAskReSeq(askVo);
		boolean result = askDao.insertAskReply(askVo);
		if(result) {
			return true;
		}
		return false;
	}

}
