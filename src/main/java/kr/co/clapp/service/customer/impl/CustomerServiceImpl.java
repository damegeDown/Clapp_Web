package kr.co.clapp.service.customer.impl;

import kr.co.clapp.constants.CommonCode;
import kr.co.clapp.dao.CustomerDAO;
import kr.co.clapp.entities.*;
import kr.co.clapp.service.customer.CustomerService;
import kr.co.digigroove.commons.messages.Messages;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional(readOnly=true)
public class CustomerServiceImpl implements CustomerService {
  @Autowired
  private CustomerDAO customerDAO;
  
  
  @Autowired
  private Messages messages;
    /**
     * 테스트신청
     */
//    @Override
//    @Transactional(readOnly = false, rollbackFor = Exception.class)
//    public int insertApplyForm(ApplyFormEntity applyFormEntity) throws Exception {
//        int result = 0;
//        result = customerDAO.insertApplyForm(applyFormEntity);
//        return result;
//    }

    /**
   * 이메일 문의 목록
   */
  public ServiceInquiryEntity getServiceInquiryList(ServiceInquiryEntity serviceInquiryEntity) throws Exception{
	serviceInquiryEntity.setPageParams();
	if (serviceInquiryEntity.getSortListSize() == 0) serviceInquiryEntity.setSortListSize(PageEntity.PAGE_LIST_SIZE_PARAM);
	serviceInquiryEntity.setPageSize(serviceInquiryEntity.getSortListSize(), PageEntity.PAGE_GROUP_SIZE_PARAM);
	serviceInquiryEntity.setDataSize(customerDAO.getServiceInquiryCount(serviceInquiryEntity));
	List<ServiceInquiryEntity> serviceInquiryListResult = customerDAO.getServiceInquiryList(serviceInquiryEntity);
	serviceInquiryEntity.setServiceInquiryList(serviceInquiryListResult);
	return serviceInquiryEntity;
  }
  /**
   * 이메일 문의 상세
   */
  @Override
  public ServiceInquiryEntity getServiceInquiryDetail(ServiceInquiryEntity serviceInquiryEntity){
	  ServiceInquiryEntity serviceInquiryInfo = customerDAO.getServiceInquiryDetail(serviceInquiryEntity);
	  return serviceInquiryInfo;
  }
  
  /**
   * 이메일 답변 등록
   */
  @Override
  @Transactional(readOnly = false, rollbackFor = Exception.class)
  public int insertServiceInquiryAnswer(ServiceInquiryEntity serviceInquiryEntity) throws Exception{
	  int result = 0;
	  result = customerDAO.insertServiceInquiryAnswer(serviceInquiryEntity);
	  return result;
  }
  /**
   * 이메일 답변 목록
   */
  public ServiceInquiryEntity getServiceInquiryAnswerList(ServiceInquiryEntity serviceInquiryEntity) throws Exception{
	List<ServiceInquiryEntity> serviceInquiryAnswerListResult = customerDAO.getServiceInquiryAnswerList(serviceInquiryEntity);
	serviceInquiryEntity.setServiceInquiryAnswerList(serviceInquiryAnswerListResult);
	return serviceInquiryEntity;
  }
  /**
   * 유선 상담 내역 목록
   */
  public CabledAdviceEntity getCabledAdviceList(CabledAdviceEntity cabledAdviceEntity) throws Exception{
	  cabledAdviceEntity.setPageParams();
	if (cabledAdviceEntity.getSortListSize() == 0) cabledAdviceEntity.setSortListSize(PageEntity.PAGE_LIST_SIZE_PARAM);
	cabledAdviceEntity.setPageSize(cabledAdviceEntity.getSortListSize(), PageEntity.PAGE_GROUP_SIZE_PARAM);
	cabledAdviceEntity.setDataSize(customerDAO.getCabledAdviceCount(cabledAdviceEntity));
	List<CabledAdviceEntity> cabledAdviceListResult = customerDAO.getCabledAdviceList(cabledAdviceEntity);
	cabledAdviceEntity.setCabledAdviceList(cabledAdviceListResult);
	return cabledAdviceEntity;
  }
  /**
   * 유선 상담 내역 상세
   */
  @Override
  public CabledAdviceEntity getCabledAdviceDetail(CabledAdviceEntity cabledAdviceEntity){
	  CabledAdviceEntity cabledAdviceInfo = customerDAO.getCabledAdviceDetail(cabledAdviceEntity);
	  return cabledAdviceInfo;
  }
  /**
   * 유선 상담 내역 등록
   */
  @Override
  @Transactional(readOnly = false, rollbackFor = Exception.class)
  public int insertCabledAdvice(CabledAdviceEntity cabledAdviceEntity) throws Exception{
	  int result = 0;
	  result = customerDAO.insertCabledAdvice(cabledAdviceEntity);
	  return result;
  }
  /**
   * 유선 상담 등록 완료
   */
  @Override
  @Transactional(readOnly = false, rollbackFor = Exception.class)
  public int modifyCabledAdvice(CabledAdviceEntity cabledAdviceEntity) throws Exception{
	  int result = CommonCode.ZERO;
	  result = customerDAO.modifyCabledAdvice(cabledAdviceEntity);
	  return result;
  }
  @Override
  public int getAdviceCount() throws Exception {
  	return customerDAO.getAdviceCount();
  }

  /**
   * 공지사항 목록
   */
  public BoardNoticeEntity getBoardNoticeList(BoardNoticeEntity boardNoticeEntity) throws Exception{
	  boardNoticeEntity.setPageParams();
	if (boardNoticeEntity.getSortListSize() == 0) boardNoticeEntity.setSortListSize(PageEntity.PAGE_LIST_SIZE_PARAM);
	boardNoticeEntity.setPageSize(boardNoticeEntity.getSortListSize(), PageEntity.PAGE_GROUP_SIZE_PARAM);
	boardNoticeEntity.setDataSize(customerDAO.getBoardNoticeCount(boardNoticeEntity));
	List<BoardNoticeEntity> boardNoticeListResult = customerDAO.getBoardNoticeList(boardNoticeEntity);
	boardNoticeEntity.setBoardNoticeList(boardNoticeListResult);
	return boardNoticeEntity;
  }
  /**
   * 공지사항 상세
   */
  @Override
  public BoardNoticeEntity getBoardNoticeDetail(BoardNoticeEntity boardNoticeEntity){
	  BoardNoticeEntity boardNoticeInfo = customerDAO.getBoardNoticeDetail(boardNoticeEntity);
	  return boardNoticeInfo;
  }
  /**
   * 공지사항 등록
   */
  @Override
  @Transactional(readOnly = false, rollbackFor = Exception.class)
  public int insertBoardNotice(BoardNoticeEntity boardNoticeEntity) throws Exception{
	  int result = 0;
	  result = customerDAO.insertBoardNotice(boardNoticeEntity);
	  return result;
  }
  /**
   * 공지사항 수정
   */
  @Override
  @Transactional(readOnly = false, rollbackFor = Exception.class)
  public int modifyBoardNotice(BoardNoticeEntity boardNoticeEntity) throws Exception{
	  int result = 0;
	  result = customerDAO.modifyBoardNotice(boardNoticeEntity);
	  return result;
  }
  /**
   * 공지사항 삭제
   */
  @Override
  @Transactional(readOnly = false, rollbackFor = Exception.class)
  public int removeBoardNotice(BoardNoticeEntity boardNoticeEntity) throws Exception{
	  int result = 0;
	  result = customerDAO.removeBoardNotice(boardNoticeEntity);
	  return result;
  }
  /**
   * 도움말 목록
   */
  public BoardQnaEntity getBoardQnaList(BoardQnaEntity boardQnaEntity) throws Exception{
	boardQnaEntity.setPageParams();
	if (boardQnaEntity.getSortListSize() == 0) boardQnaEntity.setSortListSize(PageEntity.PAGE_LIST_SIZE_PARAM);
	boardQnaEntity.setPageSize(boardQnaEntity.getSortListSize(), PageEntity.PAGE_GROUP_SIZE_PARAM);
	boardQnaEntity.setDataSize(customerDAO.getBoardQnaCount(boardQnaEntity));
	List<BoardQnaEntity> boardQnaListResult = customerDAO.getBoardQnaList(boardQnaEntity);
	boardQnaEntity.setBoardQnaList(boardQnaListResult);
	
	BoardQnaEntity boardQnaEntity2 = new BoardQnaEntity();
	boardQnaEntity2.setQnaTop10Open("Y");
	List<BoardQnaEntity> boardQnaSelectedList = customerDAO.getBoardQnaList(boardQnaEntity2);
	boardQnaEntity.setBoardQnaSelectedList(boardQnaSelectedList);
	return boardQnaEntity;
  }
  /**
   * 도움말 상세
   * @param boardQnaEntity
   * @return
   */
  @Override
  public BoardQnaEntity getBoardQnaDetail(BoardQnaEntity boardQnaEntity){
	  BoardQnaEntity boardQnaInfo = customerDAO.getBoardQnaDetail(boardQnaEntity);
	  return boardQnaInfo;
  }
  /**
   * 도움말 등록
   * @param boardQnaEntity
   * @return
   * @throws Exception
   */
  @Override
  @Transactional(readOnly = false, rollbackFor = Exception.class)
  public int insertBoardQna(BoardQnaEntity boardQnaEntity) throws Exception{
	  int result = 0;
	  result = customerDAO.insertBoardQna(boardQnaEntity);
	  return result;
  }
  /**
   * 도움말 수정
   * @param boardQnaEntity
   * @return
   * @throws Exception
   */
  @Override
  @Transactional(readOnly = false, rollbackFor = Exception.class)
  public int modifyBoardQna(BoardQnaEntity boardQnaEntity) throws Exception{
	  int result = 0;
	  result = customerDAO.modifyBoardQna(boardQnaEntity);
	  return result;
  }
  /**
   * 도움말 삭제
   * @param boardQnaEntity
   * @return
   * @throws Exception
   */
  @Override
  @Transactional(readOnly = false, rollbackFor = Exception.class)
  public int removeBoardQna(BoardQnaEntity boardQnaEntity) throws Exception{
	  int result = 0;
	  result = customerDAO.removeBoardQna(boardQnaEntity);
	  return result;
  }
  /**
   * 도움말 상위 노출
   */
  @Override
  @Transactional(readOnly = false, rollbackFor = Exception.class)
  public int qnaTop10Open(BoardQnaEntity boardQnaEntity) throws Exception{
	  int result = 0;
	  result = customerDAO.qnaTop10Open(boardQnaEntity);
	  return result;
  }
  /**
   * 도움말 상위 노출 해제
   */
  @Override
  @Transactional(readOnly = false, rollbackFor = Exception.class)
  public int qnaTop10Close(BoardQnaEntity boardQnaEntity) throws Exception{
	  int result = 0;
	  result = customerDAO.qnaTop10Close(boardQnaEntity);
	  return result;
  }
  /**
   * 도움말 TOP 10 카운트
   */
@Override
public int getCountExposedBoardQna() throws Exception {
	return customerDAO.getCountExposedBoardQna();
}
/**
 * 이메일 문의 누적 카운트
 */
@Override
public ServiceInquiryEntity getInquiryCount(
		ServiceInquiryEntity serviceInquiryEntity) throws Exception {
	ServiceInquiryEntity inquiryCount = customerDAO.getInquiryCount(serviceInquiryEntity);
	return inquiryCount;
}
/**
 * 이메일 문의 검색 카운트
 */
@Override
public ServiceInquiryEntity getInquirySearchCount(
		ServiceInquiryEntity serviceInquiryEntity) throws Exception {
	ServiceInquiryEntity inquirySearchCount = customerDAO.getInquirySearchCount(serviceInquiryEntity);
	return inquirySearchCount;
}
/**
 * 상담 등록
 */
@Override
@Transactional(readOnly = false, rollbackFor = Exception.class)
public int insertInquiry(ServiceInquiryEntity inquiryEntity) {
	return customerDAO.insertInquiry(inquiryEntity);
}
/**
 * 사용자 공지사항 목록
 */
@Override
public BoardNoticeEntity getBoardNoticeUserList(BoardNoticeEntity boardNoticeEntity) {
	boardNoticeEntity.setPageParams();
	boardNoticeEntity.setPageSize(PageEntity.PAGE_LIST_SIZE_PARAM, PageEntity.PAGE_GROUP_SIZE_PARAM);
	boardNoticeEntity.setDataSize(customerDAO.getBoardNoticeUserCount(boardNoticeEntity));
	List<BoardNoticeEntity> boardNoticeListResult = customerDAO.getBoardNoticeUserList(boardNoticeEntity);
	boardNoticeEntity.setBoardNoticeList(boardNoticeListResult);
	return boardNoticeEntity;
}
/**
 * 사용자 공지사항 상세
 */
@Override
public BoardNoticeEntity getBoardNoticeUserDetail(
		BoardNoticeEntity boardNoticeEntity) {
	return customerDAO.getBoardNoticeUserDetail(boardNoticeEntity);
}
@Override
public BoardQnaEntity getBoardQnaUserList(BoardQnaEntity boardQnaEntity) {
	boardQnaEntity.setPageParams();
	boardQnaEntity.setPageSize(PageEntity.PAGE_LIST_SIZE_PARAM, PageEntity.PAGE_GROUP_SIZE_PARAM);
	boardQnaEntity.setDataSize(customerDAO.getBoardQnaUserCount(boardQnaEntity));
	List<BoardQnaEntity> boardQnaListResult = customerDAO.getBoardQnaUserList(boardQnaEntity);
	boardQnaEntity.setBoardQnaList(boardQnaListResult);
	
	BoardQnaEntity boardQnaEntity2 = new BoardQnaEntity();
	boardQnaEntity2.setQnaTop10Open("Y");
	List<BoardQnaEntity> boardQnaSelectedList = customerDAO.getBoardQnaUserList(boardQnaEntity2);
	boardQnaEntity.setBoardQnaSelectedList(boardQnaSelectedList);
	return boardQnaEntity;
}

}