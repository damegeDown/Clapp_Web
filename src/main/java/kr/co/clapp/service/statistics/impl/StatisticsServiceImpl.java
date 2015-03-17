package kr.co.clapp.service.statistics.impl;

import kr.co.clapp.controller.admin.statistics.StatisticsController;
import kr.co.clapp.dao.StatisticsDAO;
import kr.co.clapp.entities.StatisticsEntity;
import kr.co.clapp.service.statistics.StatisticsService;
import kr.co.digigroove.commons.utils.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

@Service
public class StatisticsServiceImpl implements StatisticsService {
  private static final Logger logger = LoggerFactory.getLogger(StatisticsController.class);
  @Autowired
  private StatisticsDAO statisticsDAO;
  
  HashMap<String, Object> commonCode  = new HashMap<String, Object>();	
  /**
   * 사이트 현황
   */
  @Override
  public StatisticsEntity getSiteReport(StatisticsEntity statisticsEntity){	
	statisticsEntity.setStatisticsList(statisticsDAO.getSiteReport(statisticsEntity));
    return statisticsEntity;
  }

  /**
   * 회원가입현황
   */
  @Override
  public StatisticsEntity getJoinMemberReport(StatisticsEntity statisticsEntity) {
	statisticsEntity.setStatisticsList(statisticsDAO.getJoinMemberReport(statisticsEntity));
	return statisticsEntity;
  }
  /**
   * 로그인 현황
   */
  @Override
  public StatisticsEntity getLoginCountReport(StatisticsEntity statisticsEntity) {
	statisticsEntity.setStatisticsList(statisticsDAO.getLoginCountReport(statisticsEntity));
	return statisticsEntity;
  }

  /**
   * 탈퇴 회원 현황
   */
  @Override
  public StatisticsEntity getDropOutMemberReport(StatisticsEntity statisticsEntity, Model model) {
	try {
	  //날짜별 탈퇴 회원수
	  statisticsEntity.setSearchKey("date");
	  List<StatisticsEntity> dropOutList = statisticsDAO.getDropOutMemberReport(statisticsEntity);
	  //탈퇴 사유별 탈퇴 회원수
	  statisticsEntity.setSearchKey("reason");
	  List<StatisticsEntity> dropOutReasonList= statisticsDAO.getDropOutMemberReport(statisticsEntity);
      StatisticsEntity dropOutMemberCount  = statisticsDAO.getDropOutMemberCount(statisticsEntity);
	  statisticsEntity.setDropOutList(dropOutList);
	  statisticsEntity.setDropOutReasonList(dropOutReasonList);
      model.addAttribute("dropOutMemberCount", dropOutMemberCount);

	  //공통
	  commonCode.put("navigation", "탈퇴 회원");   // 현재 페이지 네비게이션
      commonCode.put("searchResult", "> 검색결과 :  <span class='colorSkyBlue'>"+dropOutList.get(0).getSumDropOutCount()+"</span> 명");   // 검색 결과
      commonCode.put("dropOutReason", "> 탈퇴 사유별 : <span class='colorSkyBlue'>"+dropOutReasonList.get(0).getDropOutReason()+" ("+dropOutReasonList.get(0).getSumDropOutCount()+"</span> 건)");   // 검색 결과
      commonCode.put("mainMenu", "permissionMaster");				// left main menu
	  commonCode.put("subMenu", "statistics");				// left sub menu
	  commonCode.put("subMenu2", "dropOutMemberReport");	// left sub menu
	  model.addAttribute("CommonCode", commonCode);
	} catch (SQLException e) {
		logger.error("StatisticsServiceImpl.dropOutMemberReport : SQLException", e);
	} catch (Exception e) {
		logger.error("StatisticsServiceImpl.dropOutMemberReport : Exception", e); 
	}
	return statisticsEntity;
  }
  /**
   * 메일수신 현황
   */
  @Override
  public StatisticsEntity getMailReport(StatisticsEntity statisticsEntity) {
	statisticsEntity.setStatisticsList(statisticsDAO.getMailReport(statisticsEntity));
    return statisticsEntity; 
  }

  /**
   * 사용내역 시간대별
   */
  @Override
  public void getUsedTicketReport(StatisticsEntity statisticsEntity, Model model) {
	  	StatisticsEntity statisticsDateEntity = new StatisticsEntity();
		StatisticsEntity statisticsTimeEntity = new StatisticsEntity();
		StatisticsEntity statisticsDeviceEntity = new StatisticsEntity();
		try {
		  int totalMember = 0;
		  int totalCompany = 0;
		  Date d = new Date();
		  SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM");
		  if(StringUtils.isEmpty(statisticsEntity.getSearchValue())) {
			  statisticsEntity.setSearchValue(sdf.format(d));
		  }
		  /**
		   * 티켓 사용내역 날짜
		   */
		  statisticsEntity.setSearchKey("date");
		  List<StatisticsEntity> statisticsDateList = statisticsDAO.getUsedTicketReport(statisticsEntity);
		  statisticsDateEntity.setStatisticsList(statisticsDateList);
		  int dataLen = statisticsDateList.size();
		  //검색 결과 총인원을 구한다
		  for(int i = 0; i < dataLen; i++) {
			  //총 일반회원
			  totalMember += statisticsDateList.get(i).getSumUsedTicketMember();
			  //총 기업/단체 회원
			  totalCompany += statisticsDateList.get(i).getSumUsedTicketCompanyMember();
		  }
		  statisticsDateEntity.setSumUsedTicketMember(totalMember);
		  statisticsDateEntity.setSumUsedTicketCompanyMember(totalCompany);
		  model.addAttribute("statisticsDateList", statisticsDateEntity);
		   
		  /**
		   * 티켓 사용내역 사용시간
		   */
		  statisticsEntity.setSearchKey("time");
		  List<StatisticsEntity> statisticsTimeList = statisticsDAO.getUsedTicketReport(statisticsEntity);
		  statisticsTimeEntity.setStatisticsList(statisticsTimeList);
		  model.addAttribute("statisticsTimeList", statisticsTimeEntity);

		  /**
		   * 티켓 사용내역 디바이스
		   */
		  statisticsEntity.setSearchKey("device");
		  List<StatisticsEntity> statisticsDeviceList = statisticsDAO.getUsedTicketReport(statisticsEntity);
		  statisticsDeviceEntity.setStatisticsList(statisticsDeviceList);
		  model.addAttribute("statisticsDeviceList", statisticsDeviceEntity);
		  
		  
		} catch (Exception e) {
	  	  logger.error("StatisticsController.usedTicketReport" , e);
		}
		 //공통
	    commonCode.put("navigation", "티켓 사용 내역");   						// 현재 페이지 네비게이션
	    commonCode.put("searchResult", "> 검색결과 : 일반회원 <span class='colorSkyBlue'>"+statisticsDateEntity.getSumUsedTicketMember()+"</span> 개 / 기업,단체 <span class='colorSkyBlue'>"+statisticsDateEntity.getSumUsedTicketCompanyMember()+"</span> 개");   	// 현재 페이지 네비게이션
	    commonCode.put("usedTime", "> 사용 시간별 건수");   						// 현재 페이지 네비게이션
	    commonCode.put("usedDevice", "> 사용 디바이스별 건수");   					// 현재 페이지 네비게이션
	    commonCode.put("mainMenu", "permissionMaster");							// left main menu 
	    commonCode.put("subMenu", "statistics");							// left sub menu
	    commonCode.put("subMenu2", "usedTicketReport");							// left sub menu
	    model.addAttribute("CommonCode", commonCode);
  }

  @Override
  public void getTicketProductReport(StatisticsEntity statisticsEntity, Model model) {
	  StatisticsEntity statisticsDateEntity = new StatisticsEntity();
	  StatisticsEntity statisticsReasonEntity = new StatisticsEntity();
	  int targetAll = 0;
	  int targetGeneral = 0;
	  int targetCompany = 0;
	  int targetUnit = 0;
	  int dayOfTarget = 0;
	  int dayOfAmount = 0;
	  try {
		  Date d = new Date();
		  SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM");
		  if(StringUtils.isEmpty(statisticsEntity.getSearchValue())) {
			  statisticsEntity.setSearchValue(sdf.format(d));
		  }
		  statisticsEntity.setSearchKey("date");
		  List<StatisticsEntity> statisticsDateList = statisticsDAO.getTicketProductReport(statisticsEntity); 
		  int dataLen = statisticsDateList.size();
		  //검색 결과 총인원을 구한다
		  for(int i = 0; i < dataLen; i++) {
			  //총 전처
			  targetAll += statisticsDateList.get(i).getServiceTargetAll();
			  //총 일반
			  targetGeneral += statisticsDateList.get(i).getServiceTargetGeneral();
			  //총 일반
			  targetCompany += statisticsDateList.get(i).getServiceTargetCompany();
			  //총 일반
			  targetUnit += statisticsDateList.get(i).getServiceTargetUnit();
		  }
		  statisticsDateEntity.setStatisticsList(statisticsDateList);
		  model.addAttribute("statisticsDateList", statisticsDateList);
		  
		  statisticsEntity.setSearchKey("reason");
		  List<StatisticsEntity> statisticsReasonList = statisticsDAO.getTicketProductReport(statisticsEntity);
		  int reasonLen = statisticsReasonList.size();
		  //검색 결과 총인원을 구한다
		  for(int i = 0; i < reasonLen; i++) {
			  //총 일반
			  dayOfTarget += statisticsReasonList.get(i).getDayOfTargetTotal();
			  //총 일반
			  dayOfAmount += statisticsReasonList.get(i).getDayOfAmountTotal();
		  }
		  statisticsReasonEntity.setTotDayOfTargetTotal(dayOfTarget);
		  statisticsReasonEntity.setTotDayOfAmountTotal(dayOfAmount);
		  statisticsReasonEntity.setStatisticsList(statisticsReasonList);
		  model.addAttribute("statisticsReasonEntity", statisticsReasonEntity);
	  } catch (Exception e) {
		  logger.error("StatisticsController.usedTicketReport" , e);
	  }
	  
	  //공통
	  commonCode.put("navigation", "티켓 / 상품적용 서비스");   						// 현재 페이지 네비게이션
	  commonCode.put("searchResult", "> 검색결과 : 전체 <span class='colorSkyBlue'>"+targetAll+"</span> 건 / 일반 <span class='colorSkyBlue'>"+targetGeneral+"</span> 건 / 기업/단체 <span class='colorSkyBlue'>"+targetCompany+"</span> 건 / 개별 <span class='colorSkyBlue'>"+targetUnit+"</span> 건");   	// 현재 페이지 네비게이션
	  commonCode.put("searchReason", "> 적용 사유별 <span class='colorSkyBlue'>"+dayOfTarget+"</span> 건 / <span class='colorSkyBlue'>" +dayOfAmount+ "</span> 개");   						// 현재 페이지 네비게이션
	  commonCode.put("mainMenu", "permissionMaster");							// left main menu 
	  commonCode.put("subMenu", "statistics");							// left sub menu
	  commonCode.put("subMenu2", "ticketProductReport");							// left sub menu
	  model.addAttribute("CommonCode", commonCode);
  }

  @Override
  public void getMailInquiryReport(StatisticsEntity statisticsEntity, Model model) {
	List<StatisticsEntity> statisticsList = null;
	try {
	  Date d = new Date();
	  SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM"); 
	  if(StringUtils.isEmpty(statisticsEntity.getSearchValue())) {
		  statisticsEntity.setSearchValue(sdf.format(d));
	  }
        StatisticsEntity inquiryCount  = statisticsDAO.getInquiryCount(statisticsEntity);
        StatisticsEntity inquirySearchCount  = statisticsDAO.getInquirySearchCount(statisticsEntity);
//      statisticsList = statisticsDAO.getMailInquiryReport(statisticsEntity);
//      statisticsEntity.setStatisticsList(statisticsList);
//      model.addAttribute("statisticsList", statisticsList);
        model.addAttribute("inquiryCount", inquiryCount);
        model.addAttribute("inquirySearchCount", inquirySearchCount);

      // TODO: 답변 만족도 문의후 답변
      List<StatisticsEntity> statisticsAnswerList = statisticsDAO.getMailInquiryReport(statisticsEntity);
      model.addAttribute("statisticsAnswerList", statisticsAnswerList);
      
	} catch (Exception e) {
		logger.error("StatisticsController.getMailInquiryReport" , e);
	} 
	//공통
	commonCode.put("navigation", "이메일 문의 / 답변");   						// 현재 페이지 네비게이션
//	commonCode.put("searchResult", "> 검색결과 : 문의건수 <span class='colorSkyBlue'>"+statisticsList.get(0).getInquiryCount()+"</span> 건 / 답변건수 <span class='colorSkyBlue'>"+statisticsList.get(1).getInquiryCount()+"</span> 건 / 미답변 건수 <span class='colorSkyBlue'>" +statisticsList.get(2).getInquiryCount()+"</span> 건");   	// 현재 페이지 네비게이션
    commonCode.put("searchReason", "> 답변 만족도 점수 ");   						// 현재 페이지 네비게이션
	commonCode.put("mainMenu", "permissionMaster");							// left main menu 
	commonCode.put("subMenu", "statistics");							// left sub menu
	commonCode.put("subMenu2", "mailInquiryReport");							// left sub menu
	model.addAttribute("CommonCode", commonCode);
		
  }

  @Override
  public void getCableAdviceReprot(StatisticsEntity statisticsEntity, Model model) {
	List<StatisticsEntity> statisticsList = null;
	try {
	  Date d = new Date();
	  SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM"); 
	  if(StringUtils.isEmpty(statisticsEntity.getSearchValue())) {
		  statisticsEntity.setSearchValue(sdf.format(d));
	  }
      statisticsList = statisticsDAO.getCableAdviceReprot(statisticsEntity);
      StatisticsEntity cableAdviceTotalCount  = statisticsDAO.getCableAdviceTotalCount(statisticsEntity);
      StatisticsEntity cableAdviceSearchCount  = statisticsDAO.getCableAdviceSearchCount(statisticsEntity);
      statisticsEntity.setStatisticsList(statisticsList);
      model.addAttribute("statisticsList", statisticsList);
      model.addAttribute("cableAdviceTotalCount", cableAdviceTotalCount);
      model.addAttribute("cableAdviceSearchCount", cableAdviceSearchCount);

      
	} catch (Exception e) {
		logger.error("StatisticsController.getMailInquiryReport" , e);
	} 
	//공통
	commonCode.put("navigation", "유선상담 내역");   						// 현재 페이지 네비게이션
//	commonCode.put("searchResult", "> 검색결과 :  <span class='colorSkyBlue'>"+statisticsList.get(0).getAdviceTotal()+"</span> 건");   	// 현재 페이지 네비게이션
	commonCode.put("searchReason", "> 답변 만족도 점수 ");   						// 현재 페이지 네비게이션
	commonCode.put("mainMenu", "permissionMaster");							// left main menu 
	commonCode.put("subMenu", "statistics");							// left sub menu
	commonCode.put("subMenu2", "cableAdviceReprot");							// left sub menu
	model.addAttribute("CommonCode", commonCode);
		

  }
}
 