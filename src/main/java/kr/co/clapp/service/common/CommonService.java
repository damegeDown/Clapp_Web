package kr.co.clapp.service.common;

import java.util.List;

import kr.co.clapp.entities.CommonCodeEntity;
import kr.co.clapp.entities.MemberEntity;
import kr.co.clapp.entities.ProductEntity;
import kr.co.clapp.entities.TicketEntity;

public interface CommonService {

	List<CommonCodeEntity> getCommonCodeList(CommonCodeEntity commonCodeEntity);

	List<String> searchCompanyName();
	/**
	 * 회사번호
	 * @param companyName
	 * @return
	 */
	String searchCompanyNumber(MemberEntity memberEntity);
	/**
	 * 모바일 제조사 
	 * @return
	 */
	List<TicketEntity> getMobileMaker();
	/**
	 * 디바이스
	 * @return
	 */
	List<TicketEntity> getDevice();
	/**
	 * 상품목록
	 * @return
	 */
	List<ProductEntity> getProduct();
}
