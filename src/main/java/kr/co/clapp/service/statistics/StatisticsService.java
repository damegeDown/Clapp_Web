package kr.co.clapp.service.statistics;


import kr.co.clapp.entities.StatisticsEntity;
import org.springframework.ui.Model;


public interface StatisticsService {
	/**
	 * 사이트현황
	 * @param statisticsEntity
	 * @return
	 * @throws Exception
	 */
	StatisticsEntity getSiteReport(StatisticsEntity statisticsEntity);
	/**
	 * 회원가입수
	 * @param statisticsEntity
	 * @return
	 */
	StatisticsEntity getJoinMemberReport(StatisticsEntity statisticsEntity);
	/**
	 * 로그인수
	 * @param statisticsEntity
	 * @return
	 */
	StatisticsEntity getLoginCountReport(StatisticsEntity statisticsEntity);
	/**
	 * 탈퇴 회원 현황
	 * @param statisticsEntity
	 * @return
	 */
	StatisticsEntity getDropOutMemberReport(StatisticsEntity statisticsEntity, Model model);
	/**
	 * 수시 / 타켓 발송 메일
	 * @param statisticsEntity
	 * @return
	 */
	StatisticsEntity getMailReport(StatisticsEntity statisticsEntity);
	/**
	 * 티켓 사용 내역
	 * @param statisticsEntity
	 * @return
	 */
	void getUsedTicketReport(StatisticsEntity statisticsEntity, Model model);
	/**
	 * 티켓 사용 내역 시간별
	 * @param statisticsEntity
	 * @return
	 */
	void getTicketProductReport(StatisticsEntity statisticsEntity, Model model);
	/**
	 * 메일 문의
	 * @param statisticsEntity
	 * @param model
	 */
	void getMailInquiryReport(StatisticsEntity statisticsEntity, Model model);
	/**
	 * 유선상담 문의
	 * @param statisticsEntity
	 * @param model
	 */
	void getCableAdviceReprot(StatisticsEntity statisticsEntity, Model model);

    /**
     * 회원가입 누적 카운트
     * @param statisticsEntity
     * @return
     */
    StatisticsEntity getJoinMemberCount(StatisticsEntity statisticsEntity);
}
