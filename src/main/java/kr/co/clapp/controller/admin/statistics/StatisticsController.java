package kr.co.clapp.controller.admin.statistics;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;

import kr.co.clapp.entities.StatisticsEntity;
import kr.co.clapp.service.statistics.StatisticsService;
import kr.co.digigroove.commons.utils.StringUtils;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/statistics")
public class StatisticsController {
  private static final Logger logger = LoggerFactory.getLogger(StatisticsController.class);
	
  @Autowired
  private StatisticsService statisticsService;
	
  HashMap<String, Object> commonCode  = new HashMap<String, Object>();
	
  @RequestMapping("naverAnalytics")
  public String naverAnalytics(Model model) {
	  
	//공통
	commonCode.put("navigation", "네이버 애널리틱스");   // 현재 페이지 네비게이션
	commonCode.put("mainMenu", "permissionMaster");				// left main menu 
	commonCode.put("subMenu", "statistics");				// left sub menu
	commonCode.put("subMenu2", "naverAnalytics");				// left sub menu
	model.addAttribute("CommonCode", commonCode);
	return "admin/statistics/naverAnalytics";
  }
  /** 
   * 사이트 현황
   * @param statisticsEntity
   * @param model
   * @return
   */
  @RequestMapping("/siteReport")
  public String siteReport(StatisticsEntity statisticsEntity, Model model) {
	StatisticsEntity statisticsList = null;
	try {
	  Date d = new Date();  
	  SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM");
	  if(StringUtils.isEmpty(statisticsEntity.getSearchValue())) {
		  statisticsEntity.setSearchValue(sdf.format(d));
	  }
	  
	  statisticsList = statisticsService.getSiteReport(statisticsEntity);
	  model.addAttribute("statisticsList", statisticsList);
	} catch (Exception e) {
  	  logger.error("StatisticsController.siteReport" , e);
	}
	  
	model.addAttribute("statisticsList", statisticsList);
	//공통
	commonCode.put("navigation", "사이트 현황");   // 현재 페이지 네비게이션
	commonCode.put("mainMenu", "permissionMaster");				// left main menu 
	commonCode.put("subMenu", "statistics");				// left sub menu
	commonCode.put("subMenu2", "siteReport");				// left sub menu
	model.addAttribute("CommonCode", commonCode);
	return "admin/statistics/siteReport";
  }
	
  /**
   * 회원가입 현황
   * @param statisticsEntity
   * @param model
   * @return
   */
  @RequestMapping("/joinMemberReport")
  public String joinMemberReport(StatisticsEntity statisticsEntity, Model model) {
	StatisticsEntity statisticsList = null;
	int sumJoinMember = 0;
    int sumJoinCompanyMember = 0;
	try {
	  Calendar oCalendar = Calendar.getInstance( );
	  if(StringUtils.isEmpty(statisticsEntity.getSearchKey())) {
		  statisticsEntity.setSearchKey("1");
		  //처음 페이지 접속시 현재달의 날짜로 세팅
		  Date d = new Date(); 
		  SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM");
		  statisticsEntity.setStartDate(sdf.format(d)+"/01"); //시작일
		  statisticsEntity.setEndDate(sdf.format(d)+"/"+oCalendar.getActualMaximum(Calendar.DAY_OF_MONTH)); //종료일 
	  }
	  statisticsList = statisticsService.getJoinMemberReport(statisticsEntity);
	  if(statisticsList.getStatisticsList().size() > 0) {
		  statisticsList.setAccrueMember(statisticsList.getStatisticsList().get(0).getAccrueMember());
		  statisticsList.setAccrueCompany(statisticsList.getStatisticsList().get(0).getAccrueCompany());
		  statisticsList.setSumJoinMember(statisticsList.getStatisticsList().get(0).getSumJoinMember());
		  statisticsList.setSumJoinCompanyMember(statisticsList.getStatisticsList().get(0).getSumJoinCompanyMember());
	  }
	  for(int i = 0; i < statisticsList.getStatisticsList().size(); i++) {
		  sumJoinMember += statisticsList.getStatisticsList().get(i).getJoinMember();
		  sumJoinCompanyMember += statisticsList.getStatisticsList().get(i).getJoinCompanyMember();
	  }
	  
	} catch (Exception e) {
	  logger.error("StatisticsController.joinMemberReport", e);
	}
    //공통
    commonCode.put("navigation", "회원가입(누적 일반가입 : <span class='colorSkyBlue'>"+statisticsList.getAccrueMember()+"</span> 명 / 기업,단체가입 : <span class='colorSkyBlue'>"+statisticsList.getAccrueCompany()+"</span> 명)");   // 현재 페이지 네비게이션
    commonCode.put("searchResult", "> 검색결과 : 일반가입 : <span class='colorSkyBlue'>"+sumJoinMember+"</span> 명 / 기업,단체 가입 : <span class='colorSkyBlue'>"+sumJoinCompanyMember+"</span> 명");   // 검색 결과
    commonCode.put("mainMenu", "permissionMaster");				// left main menu 
    commonCode.put("subMenu", "statistics");				// left sub menu
    commonCode.put("subMenu2", "joinMemberReport");				// left sub menu
    model.addAttribute("CommonCode", commonCode);
	return "admin/statistics/joinMemberReport"; 
  }
  
  /**
   * 로그인 현황
   * @param statisticsEntity
   * @param model
   * @return
   */
  @RequestMapping("/loginCountReport")
  public String loginCountReport(StatisticsEntity statisticsEntity, Model model) {
	StatisticsEntity statisticsList = null;
	int sumLoginCount = 0;
	int sumLoginCompanyCount = 0;
	try {
	  Calendar oCalendar = Calendar.getInstance( );
	  if(StringUtils.isEmpty(statisticsEntity.getSearchKey())) {
		  statisticsEntity.setSearchKey("1");
		  //처음 페이지 접속시 현재달의 날짜로 세팅
		  Date d = new Date(); 
		  SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM");
		  statisticsEntity.setStartDate(sdf.format(d)+"/01"); //시작일
		  statisticsEntity.setEndDate(sdf.format(d)+"/"+oCalendar.getActualMaximum(Calendar.DAY_OF_MONTH)); //종료일  
	  }
	  statisticsList = statisticsService.getLoginCountReport(statisticsEntity);
	  for(int i = 0; i < statisticsList.getStatisticsList().size(); i++) {
		sumLoginCount += statisticsList.getStatisticsList().get(i).getLoginCount();
		sumLoginCompanyCount += statisticsList.getStatisticsList().get(i).getLoginCompanyCount();
	  }
	} catch (Exception e) {
	  logger.error("StatisticsController.joinMemberReport", e);
	}
    //공통
    commonCode.put("navigation", "로그인 수");   // 현재 페이지 네비게이션
    commonCode.put("searchResult", "> 검색결과 : 일반 로그인 수 : <span class='colorSkyBlue'>"+sumLoginCount+"</span> 명 / 기업,단체 로그인 수 : <span class='colorSkyBlue'>"+sumLoginCompanyCount+"</span> 명");   // 검색 결과
    commonCode.put("mainMenu", "permissionMaster");				// left main menu 
    commonCode.put("subMenu", "statistics");				// left sub menu
    commonCode.put("subMenu2", "loginCountReport");				// left sub menu
    model.addAttribute("CommonCode", commonCode);
	return "admin/statistics/loginCountReport"; 
  }
  
  /**
   * 탈퇴 회원 현황
   * @param statisticsEntity
   * @param model
   * @return
   */
  @RequestMapping("/dropOutMemberReport")
  public String dropOutMemberReport(StatisticsEntity statisticsEntity, Model model) {
	try {
	  Calendar oCalendar = Calendar.getInstance( );
	  int year = oCalendar.get(Calendar.YEAR);
	  model.addAttribute("year", year);
	  if(StringUtils.isEmpty(statisticsEntity.getSearchValue())){
		  //년도를 문자형으로
		  statisticsEntity.setSearchValue(String.valueOf(year));
	  }
	  //탈퇴 회원수 
	  statisticsEntity = statisticsService.getDropOutMemberReport(statisticsEntity, model);
	} catch (Exception e) {
		logger.error("StatisticsController.dropOutMemberReport", e);
	}
	model.addAttribute("dropOutList", statisticsEntity.getDropOutList());
	model.addAttribute("dropOutReasonList", statisticsEntity.getDropOutReasonList());
	return "admin/statistics/dropOutMemberReport";
  }
  /**
   * 수시 / 타켓 메일 현황
   * @param statisticsEntity
   * @param model
   * @return
   */
  @RequestMapping("/mailReport")
  public String mailReport(StatisticsEntity statisticsEntity, Model model) {
	StatisticsEntity statisticsList = null;
	try {
	  Date d = new Date();
	  SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM");
	  if(StringUtils.isEmpty(statisticsEntity.getSearchValue())) {
		  statisticsEntity.setSearchValue(sdf.format(d));
	  }
	  statisticsList = statisticsService.getMailReport(statisticsEntity);
	  model.addAttribute("statisticsList", statisticsList);
	} catch (Exception e) {
  	  logger.error("StatisticsController.mailReport" , e);
	}
	  
    //공통
    commonCode.put("navigation", "수시 발송용 / 타켓 메일");   // 현재 페이지 네비게이션
    commonCode.put("mainMenu", "permissionMaster");				// left main menu 
    commonCode.put("subMenu", "statistics");				// left sub menu
    commonCode.put("subMenu2", "mailReport");				// left sub menu
    model.addAttribute("CommonCode", commonCode);
	return "admin/statistics/mailReport"; 
  }
  /**
   * 수시 / 타켓 메일 현황
   * @param statisticsEntity
   * @param model
   * @return
   */
  @RequestMapping("/surveyReport")
  public String surveyReport(StatisticsEntity statisticsEntity, Model model) {
	StatisticsEntity statisticsList = null;
	try {
	  Date d = new Date();
	  SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM");
	  if(StringUtils.isEmpty(statisticsEntity.getSearchValue())) {
		  statisticsEntity.setSearchValue(sdf.format(d));
	  }
	  statisticsList = statisticsService.getMailReport(statisticsEntity);
	  model.addAttribute("statisticsList", statisticsList);
	} catch (Exception e) {
  	  logger.error("StatisticsController.surveyReport" , e);
	}
	  
    //공통
    commonCode.put("navigation", "설문");   // 현재 페이지 네비게이션
    commonCode.put("mainMenu", "permissionMaster");				// left main menu 
    commonCode.put("subMenu", "statistics");				// left sub menu
    commonCode.put("subMenu2", "surveyReport");				// left sub menu
    model.addAttribute("CommonCode", commonCode);
	return "admin/statistics/surveyReport"; 
  }
  /**
   * 티켓 사용내역
   * @param ststisticEntity
   * @param model
   * @return
   */
  @RequestMapping("/usedTicketReport")
  public String usedTicketReport(StatisticsEntity statisticsEntity, Model model) {
	  statisticsService.getUsedTicketReport(statisticsEntity, model);
	return "admin/statistics/usedTicketReport";
  }
  /**
   * 티켓/상품적용서비스
   * @param ststisticEntity
   * @param model
   * @return
   */
  @RequestMapping("/ticketProductReport")
  public String ticketProductReport(StatisticsEntity statisticsEntity, Model model) {
	statisticsService.getTicketProductReport(statisticsEntity, model);
    return "admin/statistics/ticketProductReport";
  }
  /**
   * 이메일 문의
   * @param ststisticEntity
   * @param model
   * @return
   */
  @RequestMapping("/mailInquiryReport")
  public String mailInquiryReport(StatisticsEntity statisticsEntity, Model model) {
	statisticsService.getMailInquiryReport(statisticsEntity, model);
    return "admin/statistics/mailInquiryReport";
  }
  /**
   * 유선 상담 문의
   * @param ststisticEntity
   * @param model
   * @return
   */
  @RequestMapping("/cableAdviceReprot")
  public String cableAdviceReprot(StatisticsEntity statisticsEntity, Model model) {
	statisticsService.getCableAdviceReprot(statisticsEntity, model);
    return "admin/statistics/cableAdviceReprot";
  }
}
