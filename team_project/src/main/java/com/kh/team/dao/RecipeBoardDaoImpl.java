package com.kh.team.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.team.vo.PagingDto;
import com.kh.team.vo.RecipeBoardVo;
import com.kh.team.vo.IngredientVo;

@Repository
public class RecipeBoardDaoImpl implements RecipeBoardDao{
private final String NAMESPACE = "com.kh.team.mappers.recipeboard.";
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public boolean create(RecipeBoardVo recipeBoardVo) {
		int count = sqlSession.insert(NAMESPACE + "create", recipeBoardVo);
		if(count > 0) {
			return true;
		}
		return false;
	}
	
	@Override
	public boolean ingredCreate(IngredientVo ingredientVo) {
		System.out.println(ingredientVo);
		int count = sqlSession.insert(NAMESPACE + "ingredCreate", ingredientVo);
		if(count > 0) {
			return true;
		}
		return false;
	}

	@Override
	public RecipeBoardVo read(int r_bno) {
		RecipeBoardVo recipeBoardVo = sqlSession.selectOne(NAMESPACE + "read", r_bno);
		return recipeBoardVo;
	}
	
	@Override
	public List<String> readContents(int r_bno) {
		List<String> recipeBoardContents = sqlSession.selectList(NAMESPACE + "readContents", r_bno);
		return recipeBoardContents;
	}
	
	@Override
	public List<String> readPictures(int r_bno) {
		List<String> recipeBoardPictures = sqlSession.selectList(NAMESPACE + "readPictures", r_bno);
		return recipeBoardPictures;
	}

	@Override
	public boolean update(RecipeBoardVo recipeBoardVo) {
		int count = sqlSession.update(NAMESPACE + "update", recipeBoardVo);
		if(count > 0) {
			return true;
		}
		return false;
	}

	@Override
	public boolean delete(int r_bno) {
		int count = sqlSession.delete(NAMESPACE + "delete", r_bno);
		if(count > 0) {
			return true;
		}
		return false;
	}

	@Override
	public List<RecipeBoardVo> list(PagingDto pagingDto) {
		List<RecipeBoardVo> list = sqlSession.selectList(NAMESPACE + "list", pagingDto);
		return list;
	}

	@Override
	public int getCount(PagingDto pagingDto) {
		int count = sqlSession.selectOne(NAMESPACE + "getCount", pagingDto); 
		return count;
	}

	@Override
	public void updateViewCnt(int r_bno) {
		sqlSession.update(NAMESPACE + "updateViewCnt", r_bno);
		
	}

	@Override
	public int getNextBno() {
		int r_bno = sqlSession.selectOne(NAMESPACE + "getNextBno");
		return r_bno;
	}

	@Override
	public void insertPicture(String r_picture, int r_bno) {
		Map<String, Object> parameter = new HashMap<String, Object>();
		parameter.put("r_picture", r_picture);
		parameter.put("r_bno", r_bno);
		sqlSession.insert(NAMESPACE + "insertPicture", parameter);
	}
	
	@Override
	public void insertContent(String r_content, int r_bno) {
		Map<String, Object> parameter = new HashMap<String, Object>();
		parameter.put("r_content", r_content);
		parameter.put("r_bno", r_bno);
		sqlSession.insert(NAMESPACE + "insertContent", parameter);
	}
	
}
