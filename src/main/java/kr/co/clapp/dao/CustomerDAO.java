package kr.co.clapp.dao;


import java.util.List;

import kr.co.clapp.entities.BoardNoticeEntity;
import kr.co.clapp.entities.BoardQnaEntity;
import kr.co.clapp.entities.CabledAdviceEntity;
import kr.co.clapp.entities.ServiceInquiryEntity;
import kr.co.clapp.entities.validation.FormInquireInfoEntity;

public interface CustomerDAO {
	/**
	 * 이메일 문의 목록
	 * @param serviceInquiryEntity
	 * @return
	 */
	List<ServiceInquiryEntity> getServiceInquiryList(ServiceInquiryEntity serviceInquiryEntity);
	/**
	 * 이메일 문의 카운트
	 * @param serviceInquiryEntity
	 * @return
	 */
	int getServiceInquiryCount(ServiceInquiryEntity serviceInquiryEntity);
	/**
	 * 이메일 문의 누적 카운트
	 */
	ServiceInquiryEntity getInquiryCount(ServiceInquiryEntity serviceInquiryEntity);
	/**
	 * 이메일 문의 검색 카운트
	 */
	ServiceInquiryEntity getInquirySearchCount(ServiceInquiryEntity serviceInquiryEntity);
	/**
	 * 이메일 문의 상세
	 * @param serviceInquiryEntity
	 * @return
	 */
	ServiceInquiryEntity getServiceInquiryDetail(ServiceInquiryEntity serviceInquiryEntity);
	/**
	 * 이메일 문의 답변 등록
	 * @param serviceInquiryEntity
	 * @return
	 */
	int insertServiceInquiryAnswer(ServiceInquiryEntity serviceInquiryEntity);
	/**
	 * 이메일 문의 답변 목록
	 * @param serviceInquiryEntity
	 * @return
	 */
	List<ServiceInquiryEntity> getServiceInquiryAnswerList(ServiceInquiryEntity serviceInquiryEntity);
	/**
	 * 유선 상담 내역 카운트
	 * @param cabledAdviceEntity
	 * @return
	 */
	int getCabledAdviceCount(CabledAdviceEntity cabledAdviceEntity);
	/**
	 * 유선 상담 내역 목록
	 * @param cabledAdviceEntity
	 * @return
	 */
	List<CabledAdviceEntity> getCabledAdviceList(CabledAdviceEntity cabledAdviceEntity);
	/**
	 * 유선 상담 내역 누적 카운트
	 */
	int getAdviceCount();
	/**
	 * 유선 상담 내역 상세
	 * @param cabledAdviceEntity
	 * @return
	 */
	CabledAdviceEntity getCabledAdviceDetail(CabledAdviceEntity cabledAdviceEntity);
	/**
	 * 유선 상담 내역 등록
	 * @param cabledAdviceEntity
	 * @return
	 */
	int insertCabledAdvice(CabledAdviceEntity cabledAdviceEntity);
	/**
	 *  유선 상담 내역 등록 완료
	 * @param cabledAdviceEntity
	 * @return
	 */
	int modifyCabledAdvice(CabledAdviceEntity cabledAdviceEntity);
	/**
	 * 공지사항 목록
	 * @param boardNoticeEntity
	 * @return
	 */
	List<BoardNoticeEntity> getBoardNoticeList(BoardNoticeEntity boardNoticeEntity);
	/**
	 * 공지사항 목록 카운트
	 * @param boardNoticeEntity
	 * @return
	 */
	int getBoardNoticeCount(BoardNoticeEntity boardNoticeEntity);
	/**
	 * 공지사항 상세
	 * @param boardNoticeEntity
	 * @return
	 */
	BoardNoticeEntity getBoardNoticeDetail(BoardNoticeEntity boardNoticeEntity);
	/**
	 * 공지사항 등록
	 * @param boardNoticeEntity
	 * @return
	 */
	int insertBoardNotice(BoardNoticeEntity boardNoticeEntity);
	/**
	 * 공지사항 수정
	 * @param boardNoticeEntity
	 * @return
	 */
	int modifyBoardNotice(BoardNoticeEntity boardNoticeEntity);
	/**
	 * 공지사항 삭제
	 * @param boardNoticeEntity
	 * @return
	 */
	int removeBoardNotice(BoardNoticeEntity boardNoticeEntity);
	/**
	 * 도움말 목록
	 * @param boardQnaEntity
	 * @return
	 */
	List<BoardQnaEntity> getBoardQnaList(BoardQnaEntity boardQnaEntity);
	/**
	 * 도움말 목록 카운트
	 * @param boardQnaEntity
	 * @return
	 */
	int getBoardQnaCount(BoardQnaEntity boardQnaEntity);
	/**
	 * 도움말 상세
	 * @param boardQnaEntity
	 * @return
	 */
	BoardQnaEntity getBoardQnaDetail(BoardQnaEntity boardQnaEntity);
	/**
	 * 도움말 등록
	 * @param boardQnaEntity
	 * @return
	 */
	int insertBoardQna(BoardQnaEntity boardQnaEntity);
	/**
	 * 도움말 수정
	 * @param boardQnaEntity
	 * @return
	 */
	int modifyBoardQna(BoardQnaEntity boardQnaEntity);
	/**
	 * 도움말 삭제
	 * @param boardQnaEntity
	 * @return
	 */
	int removeBoardQna(BoardQnaEntity boardQnaEntity);
	/**
	 * 도움말 상위 노출
	 * @param boardQnaEntity
	 * @return
	 */
	int qnaTop10Open(BoardQnaEntity boardQnaEntity);
	/**
	 * 도움말 상위 노출 해제
	 * @param boardQnaEntity
	 * @return
	 */
	int qnaTop10Close(BoardQnaEntity boardQnaEntity);
	/**
	 * 도움말 TOP10 카운트
	 */
	int getCountExposedBoardQna();
	/**
	 * 상담 등록
	 * @param inquiryEntity
	 * @return
	 */
	int insertInquiry(ServiceInquiryEntity inquiryEntity);
	/**
	 * 사용자 공지사항 목록
	 * @param boardNoticeEntity
	 * @return
	 */
	List<BoardNoticeEntity> getBoardNoticeUserList(
			BoardNoticeEntity boardNoticeEntity);
	/**
	 * 사용자 공지사항 카운트
	 * @param boardNoticeEntity
	 * @return
	 */
	int getBoardNoticeUserCount(BoardNoticeEntity boardNoticeEntity);
	/**
	 * 사용자 공지사항 상세
	 * @param boardNoticeEntity
	 * @return
	 */
	BoardNoticeEntity getBoardNoticeUserDetail(
			BoardNoticeEntity boardNoticeEntity);
	/**
	 * 사용자 도움말 목록
	 * @param boardQnaEntity
	 * @return
	 */
	List<BoardQnaEntity> getBoardQnaUserList(BoardQnaEntity boardQnaEntity);
	/**
	 * 사용자 도움말 카운트
	 * @param boardQnaEntity
	 * @return
	 */
	int getBoardQnaUserCount(BoardQnaEntity boardQnaEntity);
	
}
