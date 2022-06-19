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
		String[] i_amounts = ingredientListVo.getI_amounts();
		if((i_names != null && i_names.length != 0) &&
				(i_amounts != null && i_amounts.length != 0)) {
			for(int i = 0; i < i_names.length; i++) {
				IngredientVo ingredientVo = new IngredientVo(r_bno, i_names[i], i_amounts[i]);  
				recipeBoardDao.ingredCreate(ingredientVo);
			}
		}
		String[] r_tags = recipeBoardVo.getR_tags();
		System.out.println("tags" + r_tags);
		if(r_tags != null && r_tags.length != 0) {
			for(int i = 0; i < r_tags.length; i++) {
				recipeBoardDao.tagCreate(r_tags[i], r_bno);
			}
		}
		
		return result;
	}

	@Override
	public RecipeBoardVo read(int r_bno) {
		recipeBoardDao.updateViewCnt(r_bno);
		RecipeBoardVo recipeBoardVo = recipeBoardDao.read(r_bno);
		float avgRating = recipeBoardDao.getAvgRating(r_bno);
		recipeBoardVo.setAvgRating(avgRating);
		
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
	public List<String> getTags(int r_bno) {
		List<String> tagList = recipeBoardDao.getTags(r_bno);
		return tagList;
	}
	
	@Override
	@Transactional
	public boolean update(RecipeBoardVo recipeBoardVo, IngredientListVo ingredientListVo) {
		//레시피보드
		boolean result = recipeBoardDao.update(recipeBoardVo);
		int r_bno = recipeBoardVo.getR_bno();
		recipeBoardDao.ingredDelete(r_bno);
		recipeBoardDao.deleteContent(r_bno);
		recipeBoardDao.tagDelete(r_bno);
		//내용물을 지우고 다시 작성
		
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
		String[] i_amounts = ingredientListVo.getI_amounts();
		if((i_names != null && i_names.length != 0) &&
				(i_amounts != null && i_amounts.length != 0)) {
			for(int i = 0; i < i_names.length; i++) {
				IngredientVo ingredientVo = new IngredientVo(r_bno, i_names[i], i_amounts[i]);  
				recipeBoardDao.ingredCreate(ingredientVo);
			}
		}
		String[] r_tags = recipeBoardVo.getR_tags();
		System.out.println("tags" + r_tags);
		if(r_tags != null && r_tags.length != 0) {
			for(int i = 0; i < r_tags.length; i++) {
				recipeBoardDao.tagCreate(r_tags[i], r_bno);
			}
		}
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
		for(RecipeBoardVo recipeBoardVo : list) {
			 int r_bno = recipeBoardVo.getR_bno();
			 float avgRating = recipeBoardDao.getAvgRating(r_bno);
			 int ratingNum = recipeBoardDao.getRatingNum(r_bno);
			 recipeBoardVo.setAvgRating(avgRating);
			 recipeBoardVo.setRatingNum(ratingNum);
		}
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

	@Override
	public boolean ingredInfoCreate(IngredientVo ingredintVo) {
		return recipeBoardDao.ingredInfoCreate(ingredintVo);
	}

	@Override
	public boolean checkIngredInfo(String i_name) {
		return recipeBoardDao.checkIngredInfo(i_name);
	}
}
