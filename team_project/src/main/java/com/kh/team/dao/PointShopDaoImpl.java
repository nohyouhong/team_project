package com.kh.team.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.team.vo.MemberVo;
import com.kh.team.vo.PagingDto;
import com.kh.team.vo.PointShopBoardVo;
import com.kh.team.vo.ProductVo;


@Repository
public class PointShopDaoImpl implements PointShopDao {
private final String NAMESPACE = "com.kh.team.mappers.pointshop.";
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public int getCount(PagingDto pagingDto) {
		int count = sqlSession.selectOne(NAMESPACE + "getCount", pagingDto); 
		return count;
	}
	
	@Override
	public int getNextBno() {
		int p_bno = sqlSession.selectOne(NAMESPACE + "getNextBno");
		return p_bno;
	}
	
	@Override
	public boolean create(PointShopBoardVo pointShopBoardVo) {
		int count = sqlSession.insert(NAMESPACE + "create", pointShopBoardVo);
		if(count > 0) {
			return true;
		}
		return false;
	}

	@Override
	public boolean productExPicCreate(String p_picture, int p_bno) {
		Map<String, Object> parameter = new HashMap<String, Object>();
		parameter.put("p_picture", p_picture);
		parameter.put("p_bno", p_bno);
		int count = sqlSession.insert(NAMESPACE + "productExPicCreate", parameter);
		if(count > 0) {
			return true;
		}
		return false;
	}
	
	@Override
	public PointShopBoardVo read(int p_bno) {
		PointShopBoardVo pointShopBoardVo = sqlSession.selectOne(NAMESPACE + "read", p_bno);
		return pointShopBoardVo;
	}

	@Override
	public List<PointShopBoardVo> list(PagingDto pagingDto) {
		List<PointShopBoardVo> pointShopBoardVoList = sqlSession.selectList(NAMESPACE + "list", pagingDto);
		return pointShopBoardVoList;
	}
	
	@Override
	public List<String> productExPicList(int p_bno) {
		List<String> productExPicList = sqlSession.selectList(NAMESPACE + "productExPicList", p_bno);
		return productExPicList;
	}

	@Override
	public boolean update(PointShopBoardVo pointShopBoardVo) {
		int count = sqlSession.update(NAMESPACE + "update", pointShopBoardVo);
		if(count > 0) {
			return true;
		}
		return false;
	}
	
	@Override
	public boolean updateProductExPicList(String p_picture) {
		int count = sqlSession.update(NAMESPACE + "updateProductExPicList", p_picture);
		if(count > 0) {
			return true;
		}
		return false;
	}

	@Override
	public boolean delete(int p_bno) {
		int count = sqlSession.delete(NAMESPACE + "delete", p_bno);
		if(count > 0) {
			return true;
		}
		return false;
	}


	@Override
	public int getNextPno() {
		int pno = sqlSession.selectOne(NAMESPACE + "getNextPno");
		return pno;
	}
	
	@Override
	public int getPnoByBno(int p_bno) {
		int pno = sqlSession.selectOne(NAMESPACE + "getPnoByBno", p_bno);
		return pno;
	}
	
	@Override
	public boolean productCreate(int pno, int p_bno, String p_name) {
		Map<String, Object> parameter = new HashMap<String, Object>();
		parameter.put("pno", pno);
		parameter.put("p_bno", p_bno);
		parameter.put("p_name", p_name);
		int count = sqlSession.insert(NAMESPACE + "productCreate", parameter);
		if(count > 0) {
			return true;
		}
		return false;
	}
	
	@Override
	public boolean productInfoCreate(ProductVo productVo) {
		int count = sqlSession.insert(NAMESPACE + "productInfoCreate", productVo);
		if(count > 0) {
			return true;
		}
		return false;
	}

	@Override
	public boolean productPicCreate(String p_picture, int pno) {
		Map<String, Object> parameter = new HashMap<String, Object>();
		parameter.put("p_picture", p_picture);
		parameter.put("pno", pno);
		int count = sqlSession.insert(NAMESPACE + "productPicCreate", parameter);
		if(count > 0) {
			return true;
		}
		return false;
	}

	@Override
	public List<ProductVo> productRead(int pno) {
		List<ProductVo> productVoList = sqlSession.selectList(NAMESPACE + "productRead", pno);
		return productVoList;
	}
	
	@Override
	public List<String> productPicList(int pno) {
		List<String> productPicList = sqlSession.selectList(NAMESPACE + "productPicList", pno);
		return productPicList;
	}

	@Override
	public boolean productUpdate(ProductVo productVo) {
		int count = sqlSession.update(NAMESPACE + "productUpdate", productVo);
		if(count > 0) {
			return true;
		}
		return false;
	}

	@Override
	public boolean productDelete(int pno) {
		int count = sqlSession.delete(NAMESPACE + "productDelete", pno);
		if(count > 0) {
			return true;
		}
		return false;
	}

	@Override
	public boolean tagCreate(String p_tag, int p_bno) {
		Map<String, Object> parameter = new HashMap<String, Object>();
		parameter.put("p_tag", p_tag);
		parameter.put("p_bno", p_bno);
		int count = sqlSession.insert(NAMESPACE + "tagCreate", parameter);
		if(count > 0) {
			return true;
		}
		return false;
	}

	@Override
	public List<String> tagRead(int p_bno) {
		List<String> tagList = sqlSession.selectList(NAMESPACE + "tagRead", p_bno);
		return tagList;
	}

	@Override
	public boolean tagDelete(int p_bno) {
		int count = sqlSession.delete(NAMESPACE + "tagDelete", p_bno);
		if(count > 0) {
			return true;
		}
		return false;
	}

	


}
