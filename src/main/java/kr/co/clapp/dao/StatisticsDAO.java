package kr.co.clapp.dao;

import java.util.List;

import kr.co.clapp.entities.StatisticsEntity;

public interface StatisticsDAO {

	/**
	 * 사이트 현황
	 * @param statisticsEntity
	 * @return
	 */
	List<StatisticsEntity> getSiteReport(StatisticsEntity statisticsEntity);
	/**
	 * 회원가입
	 * @param statisticsEntity
	 * @return
	 */
	List<StatisticsEntity> getJoinMemberReport(StatisticsEntity statisticsEntity);
	/**
	 * 로그인수
	 * @param statisticsEntity
	 * @return
	 */
	List<StatisticsEntity> getLoginCountReport(StatisticsEntity statisticsEntity);
	/**
	 * 탈퇴 회원수 현황
	 * @param statisticsEntity
	 * @return
	 */
	List<StatisticsEntity> getDropOutMemberReport(StatisticsEntity statisticsEntity) throws Exception;
	/**
	 * 수시 / 타켓 메일 현황
	 * @param statisticsEntity
	 * @return
	 */
	List<StatisticsEntity> getMailReport(StatisticsEntity statisticsEntity);
	/**
	 * 티켓 사용 내역
	 * @param statisticsEntity
	 * @return
	 */
	List<StatisticsEntity> getUsedTicketReport(StatisticsEntity statisticsEntity);
	/**
	 * 티켓 사용 내역 시간별
	 * @param statisticsEntity
	 * @return
	 */
	List<StatisticsEntity> getUsedTicketTimeReport(StatisticsEntity statisticsEntity);
	/**
	 * 상품 적용 서비스
	 * @param statisticsEntity
	 * @return
	 */
	List<StatisticsEntity> getTicketProductReport(StatisticsEntity statisticsEntity);
	/**
	 * 문의메일
	 * @param statisticsEntity
	 * @return
	 */
	List<StatisticsEntity> getMailInquiryReport(StatisticsEntity statisticsEntity);
	/**
	 * 유선상담 문의
	 * @param statisticsEntity
	 * @return
	 */
	List<StatisticsEntity> getCableAdviceReprot(StatisticsEntity statisticsEntity);
}
