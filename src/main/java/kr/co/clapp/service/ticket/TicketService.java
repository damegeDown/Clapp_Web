package kr.co.clapp.service.ticket;

import kr.co.clapp.entities.MemberEntity;
import kr.co.clapp.entities.TicketEntity;

import java.util.List;

public interface TicketService {
	/**
	 * 티켓 사용 내역 목록
	 * @param ticketEntity
	 * @return
	 * @throws Exception
	 */
	TicketEntity getUserTicketUsedList(TicketEntity ticketEntity) throws Exception;
	/**
	 * 티켓 적용 서비스 목록
	 * @param ticketEntity
	 * @return
	 * @throws Exception
	 */
	TicketEntity getTicketProductServiceList(TicketEntity ticketEntity) throws Exception;
    /**
     * 티켓 적용 서비스 신규 적용(new)
     * @param ticketEntity
     * @return
     * @throws Exception
     */
    int insertTicketProductServiceNew(TicketEntity ticketEntity) throws Exception;
	/**
	 * 티켓 적용 서비스 신규 적용(등록)
	 * @param ticketEntity
	 * @return
	 * @throws Exception
	 */
	int insertTicketProductService(TicketEntity ticketEntity) throws Exception;
	/**
	 * 이달의 티켓 사용 개수 카운트
	 */
	TicketEntity getTicketSum(TicketEntity ticketEntity) throws Exception;
	/**
	 * 티켓 적용 서비스 유저 타입 카운트
	 */
	int getUserTypeCount(TicketEntity ticketEntity) throws Exception;
	
	/**
	 * 사용자 티켓발급
	 * @param ticketEntity
	 * @return
	 * @throws Exception
	 */
	int insertUserTicketMaster(TicketEntity ticketEntity) throws Exception;
	/**
	 * 사용가능 티켓 조회
	 * @param ticketEntity
	 * @return
	 */
    TicketEntity getAvailableTicket(TicketEntity ticketEntity);
	/**
	 * 사용자 티켓 사용우선수위 위인 티켓키를 불러온다.
	 * @param memberEntity
	 * @return
	 */
	List<TicketEntity> getPrioritieTicketKey(MemberEntity memberEntity);
	/**
	 * 사용자 티켓 차감
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
	 * 사용자 티켓 정보
	 * @param ticketEntity
	 * @return
	 */
	TicketEntity selectTicketInfo(TicketEntity ticketEntity);
	/**
	 * 티켓 사용 히스토리
	 * @param ticketParam
	 * @return
	 */
	TicketEntity selectTicketUsedHistory(TicketEntity ticketParam);
	/**
	 * 사용자 티켓 사용 히스토리 
	 * @param ticketEntity
	 * @return
	 */
    List<TicketEntity> getUserTicketProductList(TicketEntity ticketEntity);
    /**
     * 사용자 티켓 차감
     * @param ticketInfo
     * @return
     */
	TicketEntity getMyHistory(TicketEntity ticketInfo);


     int selectTimeDiff(int reservation_id);

    int returnTicket(TicketEntity ticketEntity);

    int chkReservation(int reservation_id);
}

