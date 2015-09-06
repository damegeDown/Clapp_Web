package kr.co.clapp.service.customer;

import kr.co.clapp.entities.BoardNoticeEntity;
import kr.co.clapp.entities.BoardQnaEntity;
import kr.co.clapp.entities.CabledAdviceEntity;
import kr.co.clapp.entities.ServiceInquiryEntity;
import kr.co.clapp.entities.ApplyFormEntity;
import kr.co.clapp.entities.validation.FormInquireInfoEntity;

public interface CustomerService {
    /**
     * 테스트 신청
     * @param applyFormEntity
     * @return
     * @throws Exception
     */
//    int insertApplyForm(ApplyFormEntity applyFormEntity) throws Exception;
	/**
	 * 이메일 문의 목록
	 * @param serviceInquiryEntity
	 * @return
	 * @throws Exception
	 */
	ServiceInquiryEntity getServiceInquiryList(ServiceInquiryEntity serviceInquiryEntity) throws Exception;
	/**
	 * 이메일 문의 상세
	 * @param serviceInquiryEntity
	 * @return
	 * @throws Exception
	 */
	ServiceInquiryEntity getServiceInquiryDetail(ServiceInquiryEntity serviceInquiryEntity) throws Exception;
	/**
	 * 이메일 문의 누적 카운트
	 */
	ServiceInquiryEntity getInquiryCount(ServiceInquiryEntity serviceInquiryEntity) throws Exception;
	/**
	 * 이메일 문의 검색 카운트
	 */
	ServiceInquiryEntity getInquirySearchCount(
			ServiceInquiryEntity serviceInquiryEntity) throws Exception;
	/**
	 * 이메일 문의 답변 등록
	 * @param serviceInquiryEntity
	 * @return
	 * @throws Exception
	 */
	int insertServiceInquiryAnswer(ServiceInquiryEntity serviceInquiryEntity) throws Exception;
	/**
	 * 이메일 문의 답변 목록
	 * @param serviceInquiryEntity
	 * @return
	 * @throws Exception
	 */
	ServiceInquiryEntity getServiceInquiryAnswerList(ServiceInquiryEntity serviceInquiryEntity) throws Exception;
	/**
	 * 유선 상담 내역 목록
	 * @param cabledAdviceEntity
	 * @return
	 * @throws Exception
	 */
	CabledAdviceEntity getCabledAdviceList(CabledAdviceEntity cabledAdviceEntity) throws Exception;
	/**
	 * 유선상담 누적 카운트
	 */
	int getAdviceCount() throws Exception;
	/**
	 * 유선 상담 내역 상세
	 * @param cabledAdviceEntity
	 * @return
	 */
	CabledAdviceEntity getCabledAdviceDetail(CabledAdviceEntity cabledAdviceEntity) throws Exception;
	/**
	 * 유선 상담 등록
	 * @param cabledAdviceEntity
	 * @return
	 * @throws Exception
	 */
	int insertCabledAdvice(CabledAdviceEntity cabledAdviceEntity) throws Exception;
	/**
	 * 유선 상담 등록 완료
	 * @param cabledAdviceEntity
	 * @return
	 * @throws Exception
	 */
	int modifyCabledAdvice(CabledAdviceEntity cabledAdviceEntity) throws Exception;
	/**
	 * 공지사항 목록
	 * @param boardNoticeEntity
	 * @return
	 */
	BoardNoticeEntity getBoardNoticeList(BoardNoticeEntity boardNoticeEntity) throws Exception;
	/**
	 * 공지사항 상세
	 * @param boardNoticeEntity
	 * @return
	 * @throws Exception
	 */
	BoardNoticeEntity getBoardNoticeDetail(BoardNoticeEntity boardNoticeEntity) throws Exception;
	/**
	 * 공지사항 등록
	 * @param boardNoticeEntity
	 * @return
	 * @throws Exception 
	 */
	int insertBoardNotice(BoardNoticeEntity boardNoticeEntity) throws Exception;
	/**
	 * 공지사항 수정
	 * @param boardNoticeEntity
	 * @return
	 * @throws Exception
	 */
	int modifyBoardNotice(BoardNoticeEntity boardNoticeEntity) throws Exception;
	/**
	 * 공지사항 삭제
	 * @param boardNoticeEntity
	 * @return
	 * @throws Exception
	 */
	int removeBoardNotice(BoardNoticeEntity boardNoticeEntity) throws Exception;
	/**
	 * 도움말 관리 목록
	 * @param boardQnaEntity
	 * @return
	 * @throws Exception
	 */
	BoardQnaEntity getBoardQnaList(BoardQnaEntity boardQnaEntity) throws Exception;
	/**
	 * 도움말 상세
	 * @param boardQnaEntity
	 * @return
	 * @throws Exception
	 */
	BoardQnaEntity getBoardQnaDetail(BoardQnaEntity boardQnaEntity) throws Exception;
	/**
	 * 도움말 등록
	 * @param boardQnaEntity
	 * @return
	 * @throws Exception
	 */
	int insertBoardQna(BoardQnaEntity boardQnaEntity) throws Exception;
	/**
	 * 도움말 수정
	 * @param boardQnaEntity
	 * @return
	 * @throws Exception
	 */
	int modifyBoardQna(BoardQnaEntity boardQnaEntity) throws Exception;
	/**
	 * 도움말 삭제
	 * @param boardQnaEntity
	 * @return
	 * @throws Exception
	 */
	int removeBoardQna(BoardQnaEntity boardQnaEntity) throws Exception;
	/**
	 * 도움말 상위 노출
	 * @param boardQnaEntity
	 * @return
	 * @throws Exception
	 */
	int qnaTop10Open(BoardQnaEntity boardQnaEntity) throws Exception;
	/**
	 * 도움말 상위 노출 해제
	 * @param boardQnaEntity
	 * @return
	 * @throws Exception
	 */
	int qnaTop10Close(BoardQnaEntity boardQnaEntity) throws Exception;
	/**
	 * 도움말 TOP10 카운트
	 */
	int getCountExposedBoardQna() throws Exception;
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
	BoardNoticeEntity getBoardNoticeUserList(BoardNoticeEntity boardNoticeEntity);
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
	BoardQnaEntity getBoardQnaUserList(BoardQnaEntity boardQnaEntity);

}
