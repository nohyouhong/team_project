package com.kh.team.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.team.dao.PointShopDao;
import com.kh.team.dao.RecipeBoardDao;
import com.kh.team.vo.IngredientVo;
import com.kh.team.vo.MemberVo;
import com.kh.team.vo.PagingDto;
import com.kh.team.vo.PointShopBoardVo;
import com.kh.team.vo.ProductVo;
import com.kh.team.vo.RecipeStepVo;

@Service
public class PointShopServiceImpl implements PointShopService{
	
	@Autowired
	private PointShopDao pointShopDao;

	@Override
	@Transactional
	public boolean create(ProductVo productVo,PointShopBoardVo pointShopBoardVo) {
		System.out.println(productVo);
		//포인트샵보드
		int p_bno = pointShopDao.getNextBno();
		pointShopBoardVo.setP_bno(p_bno);
		boolean result = pointShopDao.create(pointShopBoardVo);
		String[] pictures1 = pointShopBoardVo.getP_pictures();
		if(pictures1 != null && pictures1.length != 0) {
			for(String picture : pictures1) {
				pointShopDao.productExPicCreate(picture, p_bno);
			}
		}
		//물품등록
		int pno = pointShopDao.getNextPno();
		productVo.setPno(pno);
		pointShopDao.productCreate(pno, p_bno, productVo.getP_name());
		String[] p_options = productVo.getP_options();
		int[] p_prices = productVo.getP_prices();
		int[] p_discounts = productVo.getP_discounts();
		int[] p_stocks = productVo.getP_stocks();
		int[] p_sums = productVo.getP_sums();
		
		for(int p_sum : p_sums) {
//			System.out.println(p_sum);
		}
		if((p_options != null && p_options.length != 0) &&
				(p_prices != null && p_prices.length != 0) &&
				(p_discounts != null && p_discounts.length != 0) &&
				(p_stocks != null && p_stocks.length != 0) &&
				(p_sums != null && p_sums.length != 0)) {
			for(int i = 0; i < p_options.length; i++) {
				System.out.println(p_sums[i]);
				ProductVo productInfoVo = new ProductVo(pno, p_options[i], p_prices[i], p_discounts[i], p_stocks[i], p_sums[i]);  
				pointShopDao.productInfoCreate(productInfoVo);
			}
		}
		String[] pictures2 = productVo.getP_pictures();
		if(pictures2 != null && pictures2.length != 0) {
			for(String picture : pictures2) {
				pointShopDao.productPicCreate(picture, pno);
			}
		}
		//태그등록
		String[] p_tags = pointShopBoardVo.getP_tags();
		if(p_tags != null && p_tags.length != 0) {
			for(int i = 0; i < p_tags.length; i++) {
				pointShopDao.tagCreate(p_tags[i], p_bno);
			}
		}
		return false;
	}

	@Override
	public PointShopBoardVo read(int p_bno) {
		return pointShopDao.read(p_bno);
	}

	@Override
	public List<PointShopBoardVo> list(PagingDto pagingDto) {
		List<PointShopBoardVo> list = pointShopDao.list(pagingDto);
		return list;
	}

	@Override
	public List<ProductVo> productRead(int p_bno) {
		int pno = pointShopDao.getPnoByBno(p_bno);
		List<ProductVo> productList = pointShopDao.productRead(pno);
		return productList;
	}

	@Override
	public List<String> productExPicList(int p_bno) {
		List<String> productExPicList = pointShopDao.productExPicList(p_bno);
		return productExPicList;
	}

	@Override
	public List<String> productPicList(int p_bno) {
		int pno = pointShopDao.getPnoByBno(p_bno);
		List<String> productPicList = pointShopDao.productPicList(pno);
		return productPicList;
	}

	@Override
	public List<String> tagRead(int p_bno) {
		List<String> tagList = pointShopDao.tagRead(p_bno);
		return tagList;
	}

	@Override
	public boolean update(PointShopBoardVo pointShopBoardVo) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean delete(int p_bno) {
		// TODO Auto-generated method stub
		return false;
	}
	
}
