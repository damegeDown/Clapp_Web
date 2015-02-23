package kr.co.clapp.service.product;

import kr.co.clapp.entities.ProductEntity;

public interface ProductService {
	/**
	 * 상품 정보 가져오기
	 */
	ProductEntity getProductTypeInfo(ProductEntity productEntity);

	/**
	 * 상품정보 불러오기
	 * @return
	 */
	ProductEntity getProductInfo(ProductEntity productEntity);
	/**
	 * 상품 정보 리스트 불러오기
	 * @param productEntity
	 * @return
	 */
	ProductEntity getProductList(ProductEntity productEntity);
}
