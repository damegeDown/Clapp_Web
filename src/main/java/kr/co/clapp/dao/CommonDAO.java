package kr.co.clapp.dao;

import java.util.List;

import kr.co.clapp.entities.CommonCodeEntity;
import kr.co.clapp.entities.MemberEntity;
import kr.co.clapp.entities.ProductEntity;
import kr.co.clapp.entities.TicketEntity;

public interface CommonDAO {
  /**
   * 공통코드
   * @param commonCodeEntity
   * @return
   */
  List<CommonCodeEntity> getCommonCodeList(CommonCodeEntity commonCodeEntity);
  /**
   * 회사명
   * @return
   */
  List<String> searchCompanyName();
  /**
   * 회사번호
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
   * 상품 목록
   * @return
   */
  List<ProductEntity> getProduct();
}
