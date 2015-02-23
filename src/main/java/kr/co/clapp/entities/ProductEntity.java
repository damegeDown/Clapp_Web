package kr.co.clapp.entities;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

public class ProductEntity implements Serializable{
	
	private static final long serialVersionUID = -4130574473146792097L;
	
	//PRODUCT_MASTER
	private int productMasterKey;				// 상품 고유키 ;
	private String productName;					// 상품명;
	private String productExplain;				// 상품 설명 ;
	private int productPrice;						// 상품 가격 ;
	private int productUseTime;					// 상품 시간 ;
	private int productExpirationDate;			// 상품 유효기간(일로표기)
	private String productPriceExplain;			// 상품 가격 설명 
	private int productTicketAmount;			// 티켓 수 
	private String productTicketExplain;		// 티켓 설명 
	private String productType;					// 상품 타입(상품 타입 : 1 : 신규가입,  2: 상품 구매, 3: 상품 문의)
	private Date insertDate;						// 등록날짜 
	private List<ProductEntity> productList;	//상품 리스트 
	
	//PRODUCT_SERVICE
	private int serviceCode;						// 서비스 코드

	public int getProductMasterKey() {
		return productMasterKey;
	}

	public void setProductMasterKey(int productMasterKey) {
		this.productMasterKey = productMasterKey;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getProductExplain() {
		return productExplain;
	}

	public void setProductExplain(String productExplain) {
		this.productExplain = productExplain;
	}

	public int getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}

	public int getProductUseTime() {
		return productUseTime;
	}

	public void setProductUseTime(int productUseTime) {
		this.productUseTime = productUseTime;
	}

	public int getProductExpirationDate() {
		return productExpirationDate;
	}

	public void setProductExpirationDate(int productExpirationDate) {
		this.productExpirationDate = productExpirationDate;
	}

	public String getProductPriceExplain() {
		return productPriceExplain;
	}

	public void setProductPriceExplain(String productPriceExplain) {
		this.productPriceExplain = productPriceExplain;
	}

	public int getProductTicketAmount() {
		return productTicketAmount;
	}

	public void setProductTicketAmount(int productTicketAmount) {
		this.productTicketAmount = productTicketAmount;
	}

	public String getProductTicketExplain() {
		return productTicketExplain;
	}

	public void setProductTicketExplain(String productTicketExplain) {
		this.productTicketExplain = productTicketExplain;
	}

	public String getProductType() {
		return productType;
	}

	public void setProductType(String productType) {
		this.productType = productType;
	}

	public Date getInsertDate() {
		return insertDate;
	}

	public void setInsertDate(Date insertDate) {
		this.insertDate = insertDate;
	}

	public int getServiceCode() {
		return serviceCode;
	}

	public void setServiceCode(int serviceCode) {
		this.serviceCode = serviceCode;
	}

	public List<ProductEntity> getProductList() {
		return productList;
	}

	public void setProductList(List<ProductEntity> productList) {
		this.productList = productList;
	}
	
	
	 
}
