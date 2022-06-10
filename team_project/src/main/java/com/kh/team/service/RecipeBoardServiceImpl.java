package com.kh.team.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.team.dao.MemberDao;
import com.kh.team.dao.RecipeBoardDao;
import com.kh.team.vo.PagingDto;
import com.kh.team.vo.RecipeBoardVo;
import com.kh.team.vo.RecipeStepVo;
import com.kh.team.vo.IngredientListVo;
import com.kh.team.vo.IngredientVo;
import com.kh.team.vo.MemberVo;

@Service
public class RecipeBoardServiceImpl implements RecipeBoardService{
	
	@Autowired
	private RecipeBoardDao recipeBoardDao;
	
	@Autowired
	private MemberDao memberDao;
	
	@Override
	@Transactional
	public boolean create(RecipeBoardVo recipeBoardVo, IngredientListVo ingredientListVo) {
		System.out.println("RecipeBoardService, create"+ recipeBoardVo);
		System.out.println("RecipeBoardService, create"+ ingredientListVo);
		int r_bno = recipeBoardDao.getNextBno();
		//레시피보드
		recipeBoardVo.setR_bno(r_bno);
		boolean result = recipeBoardDao.create(recipeBoardVo);
		String[] contents = recipeBoardVo.getR_contents();
		String[] pictures = recipeBoardVo.getPictures();
		System.out.println("contents: " + contents + "pictures: " + pictures);
		if((contents != null && contents.length != 0) &&
				(pictures != null && pictures.length != 0)) {
			for(int i = 0; i < contents.length; i++) {
				int r_cno = recipeBoardDao.getNextCno();
				recipeBoardDao.insertContent(contents[i], r_bno, r_cno);
				recipeBoardDao.insertPicture(pictures[i], r_cno);
			}
		}
		//레시피재료리스트
		String[] i_names = ingredientListVo.getI_names();
		int[] i_amounts = ingredientListVo.getI_amounts();
		if((i_names != null && i_names.length != 0) &&
				(i_amounts != null && i_amounts.length != 0)) {
			for(int i = 0; i < i_names.length; i++) {
				IngredientVo ingredientVo = new IngredientVo(r_bno, i_names[i], i_amounts[i]);  
				recipeBoardDao.ingredCreate(ingredientVo);
			}
		}
		return result;
	}

	@Override
	public RecipeBoardVo read(int r_bno) {
		recipeBoardDao.updateViewCnt(r_bno);
		RecipeBoardVo recipeBoardVo = recipeBoardDao.read(r_bno);
//		List<String> r_contents = recipeBoardDao.readContents(r_bno);
//		List<String> pictures = recipeBoardDao.readPictures(r_bno);
//		if(r_contents != null && r_contents.size() != 0) {
//			String[] contentVals = r_contents.toArray(new String[r_contents.size()]);
//			recipeBoardVo.setR_contents(contentVals);
//		}
//		if(pictures != null && pictures.size() != 0) {
//			String[] pictureVals = pictures.toArray(new String[pictures.size()]);
//			recipeBoardVo.setPictures(pictureVals);
//		}
//		
		return recipeBoardVo;
	}
	
	@Override
	public List<RecipeStepVo> readStepVos(int r_bno) {
		List<RecipeStepVo> recipeStepVoList = recipeBoardDao.readStepVos(r_bno);
		return recipeStepVoList;
	}
	
	@Override
	public List<IngredientVo> readIngreds(int r_bno) {
		List<IngredientVo> ingredientVoList = recipeBoardDao.readIngreds(r_bno);
		return ingredientVoList;
	}
	
	@Override
	public boolean update(RecipeBoardVo recipeBoardVo) {
		boolean result = recipeBoardDao.update(recipeBoardVo);
		return result;
	}

	@Override
	public boolean delete(int r_bno) {
		boolean result = recipeBoardDao.delete(r_bno);
		return result;
	}

	@Override
	public List<RecipeBoardVo> list(PagingDto pagingDto) {
		List<RecipeBoardVo> list = recipeBoardDao.list(pagingDto);
		return list;
	}
	
	@Override
	public int getCount(PagingDto pagingDto) {
		int count = recipeBoardDao.getCount(pagingDto);
		return count;
	}

	@Override
	public MemberVo getMemberVoByBno(int r_bno) {
		String userid = recipeBoardDao.getUseridByBno(r_bno);
		MemberVo memberVo = memberDao.getMemberById(userid);
		return memberVo;
	}
}
