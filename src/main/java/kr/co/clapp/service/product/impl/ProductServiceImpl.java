package kr.co.clapp.service.product.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.clapp.dao.ProductDAO;
import kr.co.clapp.entities.ProductEntity;
import kr.co.clapp.service.product.ProductService;

@Service
public class ProductServiceImpl implements ProductService {
	@Autowired
	private ProductDAO productDAO;
	/**
	 * 상품 정보
	 */
	@Override 
	public ProductEntity getProductInfo(ProductEntity productEntity) {
		productEntity = productDAO.getProductInfo(productEntity);
		return productEntity;
	}
	/**
	 * 상품 정보 가져오기
	 */
	@Override
	public ProductEntity getProductTypeInfo(ProductEntity productEntity){
		productEntity = productDAO.getProductTypeInfo(productEntity);
		return productEntity;
	}
	/**
	 * 상품 리스트
	 */
	@Override
	public ProductEntity getProductList(ProductEntity productEntity) {
		productEntity.setProductList(productDAO.getProductList(productEntity));
		return productEntity;
	}

}
