package kr.co.clapp.service.common.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.clapp.dao.CommonDAO;
import kr.co.clapp.entities.CommonCodeEntity;
import kr.co.clapp.entities.MemberEntity;
import kr.co.clapp.entities.ProductEntity;
import kr.co.clapp.entities.TicketEntity;
import kr.co.clapp.service.common.CommonService;

@Service
public class CommonServiceImpl implements CommonService {
	@Autowired
	private CommonDAO CommonDAO;

	/**
	 * 공통코드 불러오기
	 */
	@Override
	public List<CommonCodeEntity> getCommonCodeList(
			CommonCodeEntity commonCodeEntity) {
	  List<CommonCodeEntity> resultList = CommonDAO.getCommonCodeList(commonCodeEntity); 
      return resultList;
	}
	
	/**
	 * 회사명 불러오기
	 */
	@Override
	public List<String> searchCompanyName() {
      return CommonDAO.searchCompanyName();
	}
	
	/**
	 * 사업자 번호 불러오기
	 */
	@Override
	public String searchCompanyNumber(MemberEntity memberEntity) {
      return CommonDAO.searchCompanyNumber(memberEntity);
	}
	/**
	 * 모바일 제조사
	 */
	@Override
	public List<TicketEntity> getMobileMaker() {
		return CommonDAO.getMobileMaker();
	}
	/**
	 * 디바이스
	 */
	@Override
	public List<TicketEntity> getDevice() {
		return CommonDAO.getDevice();
	}
	/**
	 * 상품 목록
	 */ 
	@Override
	public List<ProductEntity> getProduct() {
		return CommonDAO.getProduct();
	}

}
