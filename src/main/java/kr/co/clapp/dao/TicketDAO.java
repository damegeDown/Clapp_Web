package kr.co.clapp.dao;

import kr.co.clapp.entities.MemberEntity;
import kr.co.clapp.entities.PaymentEntity;
import kr.co.clapp.entities.TicketEntity;

import java.util.List;

public interface TicketDAO {
	/**
	 * 티켓 사용 내역 목록
     * @param ticketEntity
     * @return
	 */
	List<TicketEntity> getUserTicketUsedList(TicketEntity ticketEntity);
	/**
	 * 티켓 사용 내역 카운트
	 * @param ticketEntity
	 * @return
	 */
	int getUserTicketUsedCount(TicketEntity ticketEntity);
	/**
	 * 티켓 적용 서비스 목록
	 * @param ticketEntity
	 * @return
	 */
	List<TicketEntity> getTicketProductServiceList(TicketEntity ticketEntity);
	/**
	 * 티켓 적용 서비스 카운트
	 * @param ticketEntity
	 * @return
	 */
	int getTicketProductServiceCount(TicketEntity ticketEntity);
	/**
	 * 티켓 적용 서비스 신규 적용(등록)
	 * @param ticketEntity
	 * @return
	 */
	int insertTicketProductService(TicketEntity ticketEntity);
	/**
	 * 티켓 적용 서비스 신규 적용을 위한 검색
	 * @param ticketEntity
	 * @return
	 */

	int selectUserType(TicketEntity ticketEntity);
	/**
	 * 이달의 티켓 사용 개수 합
	 */
	TicketEntity getTicketSum(TicketEntity ticketEntity);
	/**
	 * 티켓 적용 서비스 유저 타입 카운트
	 */
	int getUserTypeCount(TicketEntity ticketEntity);
	
	/**
	 * 사용자 티켓발급 등록
	 * @param ticketEntity
	 * @return
	 */
	int insertUserTicketMaster(TicketEntity ticketEntity);
	/**
	 * 사용가능 티켓수 조회
	 * @param ticketEntity
	 * @return
	 */
	TicketEntity  getAvailableTicket(TicketEntity ticketEntity);
	/**
	 * 사용자 티켓 사용우선순위가 위인 티켓키
	 * @param memberEntity
	 * @return
	 */
	List<TicketEntity> getPrioritieTicketKey(MemberEntity memberEntity);
    /**
     * 사용자 티켓 사용우선순위가 위인 티켓키(테스팅 신청)
     * @param memberEntity
     * @return
     */
    List<TicketEntity> getPrioritieTicketKey2(MemberEntity memberEntity);
	/**
	 * 사용자 티켓 차감 처리
	 * @param ticketEntity
	 * @return
	 */
	int doUsedTicket(TicketEntity ticketEntity);
	/**
	 * 사용자 티켓 사용 히스토리 입력
	 * @param ticketEntity
	 * @return
	 */
	int insertUsedTicketHistory(TicketEntity ticketEntity);
	/**
	 * 소유한 티켓 정보를 불러온다.
	 * @param ticketParam
	 * @return
	 */
	TicketEntity selectTicketInfo(TicketEntity ticketParam);
	/**
	 * 사용자 티켓 수정
	 * @param ticketParam
	 * @return
	 */
	int modifyUserTicketMaster(TicketEntity ticketParam);
	/**
	 * 티켓 사용 내역
	 * @param ticketParam
	 * @return
	 */
	List<TicketEntity> selectTicketUsedHistory(TicketEntity ticketParam);
	/**
	 * 티켓 사용내역 카운트
	 * @param ticketParam
	 * @return
	 */
	TicketEntity selectTicketUsedHistoryCount(TicketEntity ticketParam);
	/**
	 * 검색내용 카운트
	 * @param ticketParam
	 * @return
	 */
	TicketEntity getSearchCount(TicketEntity ticketParam);
	/**
	 * 사용자 티켓 적립/차감내역 카운트
	 * @param ticketParam
	 * @return
	 */
	int getMyHistoryCount(TicketEntity ticketParam);
	/**
	 * 사용자 티켓 적립/차감내역
	 * @param ticketParam
	 * @return
	 */
	List<TicketEntity> getMyHistory(TicketEntity ticketParam);
	/**
	 * 사용자 티켓 히스토리에 저장
	 * @param ticketEntity
	 * @return
	 */
	int insertUserTicketHistory(TicketEntity ticketEntity);
    /**
     * 클앱 맴버십 시간용자 간 중복 구매 방지
     * @param ticketEntity
     * @return
     */
    List<TicketEntity> getUserTicketProductList(TicketEntity ticketEntity);

	/**
	 * 사용자 티켓 히스토리
	 * @param ticketEntity
	 * @return
	 */


	List<TicketEntity> selectTicketHistoryList(TicketEntity ticketEntity);

    int modifyServiceTicketMaster(TicketEntity ticketEntity);
	
	int insertServiceTicketHistory(TicketEntity ticketEntity);
	
	int removeUserTicketHistory(TicketEntity ticketParam);

    /**
     * 취소할 티켓 정보 히스토리를 불러온다
     * @param ticketParam
     * @return
     */
    TicketEntity selectTicketHistory(TicketEntity ticketParam);

    /**
     * 결제 취소시 사용자 티켓 수정
     * @param ticketParam
     * @return
     */
    int modifyUserTicket(TicketEntity ticketParam);

    /**
     * 취소할 티켓 정보 히스토리의 다음 히스토리를 불러온다
     * @param ticketParam
     * @return
     */
    TicketEntity nextTicketHistoryInfo(TicketEntity ticketParam);

    int updateUserType(PaymentEntity paymentEntity);

    int selectTimeDiff(int reservation_id);

    int modifyUserTicketMasterUse(TicketEntity ticketParam);

    int deleteUserTicketMaster(TicketEntity ticketParam);

    int returnTicket(TicketEntity ticketEntity);

    int chkReservation(int reservation_id);
}
