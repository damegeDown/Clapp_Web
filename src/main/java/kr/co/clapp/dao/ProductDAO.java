package kr.co.clapp.dao;

import java.util.List;

import kr.co.clapp.entities.ProductEntity;

public interface ProductDAO {
	/**
	 * 타입별 상품 가져오기
	 * @param productEntity
	 * @return
	 */
	ProductEntity getProductTypeInfo(ProductEntity productEntity);
	
	/**
	 * 상품 정보
	 * @param productEntity
	 * @return
	 */
	ProductEntity getProductInfo(ProductEntity productEntity);
	/**
	 * 상품 리스트
	 * @param productEntity
	 * @return
	 */
	List<ProductEntity> getProductList(ProductEntity productEntity);

}
