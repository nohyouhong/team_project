package com.kh.team.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.team.dao.AskDao;
import com.kh.team.vo.AskVo;
import com.kh.team.vo.PagingDto;

@Service
public class AskServiceImpl implements AskService{
	
	@Autowired
	private AskDao AskDao;

	@Override
	public boolean insertAsk(AskVo AskVo) {
		int a_bno = AskDao.getNexta_bno();
		AskVo.setA_bno(a_bno);
		AskVo.setRe_group(a_bno);
		boolean result = AskDao.insertAsk(AskVo);
		String[] files = AskVo.getFiles();
		if(files != null && files.length != 0) {
			for(String a_picture : files) {
				AskDao.insertAttach(a_picture, a_bno);
			}
		}
		return result;
	}

	@Override
	public boolean updateAsk(AskVo AskVo) {
		boolean result = AskDao.updateAsk(AskVo);
		if(result) {
			return true;
		}
		return false;
	}

	@Override
	public boolean deleteAsk(int a_bno) {
		boolean result = AskDao.deleteAsk(a_bno);
		if(result) {
			return true;
		}
		return false;
	}

	@Override
	public AskVo readAsk(int a_bno) {
		AskVo AskVo = AskDao.readAsk(a_bno);
		return AskVo;
	}

	@Override
	public List<AskVo> AskList(String writer, PagingDto pagingDto) {
		List<AskVo> AskList = AskDao.askList(writer, pagingDto);
		return AskList;
	}

	@Override
	public int getCount(PagingDto pagingDto) {
		int count = AskDao.getCount(pagingDto);
		return count;
	}

	@Override
	public List<AskVo> allAskList(PagingDto pagingDto) {
		List<AskVo> allAskList = AskDao.allAskList(pagingDto);
		return allAskList;
	}

	@Override
	public List<String> getAskImages(int a_bno) {
		List<String> AskImages = AskDao.getAskImages(a_bno);
		return AskImages;
	}

	@Override
	public boolean insertAskReply(AskVo AskVo) {
		AskDao.updateAskReSeq(AskVo);
		boolean result = AskDao.insertAskReply(AskVo);
		if(result) {
			return true;
		}
		return false;
	}

}
