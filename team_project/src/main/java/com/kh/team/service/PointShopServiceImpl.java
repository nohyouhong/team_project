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
	public int getCount(PagingDto pagingDto) {
		int count = pointShopDao.getCount(pagingDto);
		return count;
	}
	
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
	@Transactional
	public boolean update(ProductVo productVo, PointShopBoardVo pointShopBoardVo) {
		
		int p_bno = pointShopBoardVo.getP_bno();
		boolean result = pointShopDao.update(pointShopBoardVo);
		pointShopDao.deleteProductExPicList(p_bno);
		String[] exPictures = pointShopBoardVo.getP_exPictures2();
		if(exPictures != null && exPictures.length != 0) {
			for(String picture : exPictures) {
				pointShopDao.productExPicCreate(picture, p_bno);
			}
		}
		
		//물품등록
		int pno = productVo.getPno();
		String p_name = productVo.getP_name();
		pointShopDao.productUpdate(pno, p_name);
		int infoCount = pointShopDao.getProductInfoCount(pno);
		
		int[] p_ino = productVo.getP_inos();
		String[] p_options = productVo.getP_options();
		int[] p_prices = productVo.getP_prices();
		int[] p_discounts = productVo.getP_discounts();
		int[] p_stocks = productVo.getP_stocks();
		int[] p_sums = productVo.getP_sums();
		
		
		//삭제
		if(infoCount > p_options.length) {
			int deleteCount = infoCount - p_options.length;
			for(int i = 0; i < deleteCount; i++) {
				
			}
		}
		//생성및 수정		
		if((p_options != null && p_options.length != 0) &&
				(p_prices != null && p_prices.length != 0) &&
				(p_discounts != null && p_discounts.length != 0) &&
				(p_stocks != null && p_stocks.length != 0) &&
				(p_sums != null && p_sums.length != 0)) {
			for(int i = 0; i < p_options.length; i++) {
				if(p_ino[i] != 0) {
					ProductVo productInfoVo = new ProductVo(pno, p_options[i], p_prices[i], p_discounts[i], p_stocks[i], p_sums[i]);
					productInfoVo.setP_ino(p_ino[i]);
					pointShopDao.productInfoUpdate(productInfoVo);
				}else {
					ProductVo productInfoVo = new ProductVo(pno, p_options[i], p_prices[i], p_discounts[i], p_stocks[i], p_sums[i]);  
					pointShopDao.productInfoCreate(productInfoVo);
				}
			}
		}
		
		pointShopDao.productPicListDelete(pno);
		String[] pictures = pointShopBoardVo.getP_pictures2();
		if(pictures != null && pictures.length != 0) {
			for(int i = 0; i < pictures.length; i++) {
				pointShopDao.productPicCreate(pictures[i], pno);
			}
		}
		return result;
	}

	@Override
	public boolean delete(int p_bno) {
		return pointShopDao.delete(p_bno);
	}
	
}
