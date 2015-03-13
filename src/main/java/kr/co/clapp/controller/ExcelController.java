package kr.co.clapp.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import kr.co.clapp.entities.PaymentEntity;
import kr.co.clapp.entities.StatisticsEntity;
import kr.co.clapp.service.payment.PaymentService;
import kr.co.clapp.service.statistics.StatisticsService;
import kr.co.digigroove.commons.utils.StringUtils;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


@RequestMapping("/excel")
@Controller
public class ExcelController {
  private static final Logger logger = LoggerFactory.getLogger(ExcelController.class);
	
  @Autowired
  private StatisticsService statisticsService;
  @Autowired
  private PaymentService paymentService;
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
	} catch (Exception e) {
  	  logger.error("ExcelController.siteReport" , e);
	}
		  
	model.addAttribute("statisticsList", statisticsList);
	model.addAttribute("excelName", "siteReport_"+statisticsEntity.getSearchValue());
	return "excel/siteReport";
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
	try {
	  Calendar oCalendar = Calendar.getInstance( );
	  if(StringUtils.isEmpty(statisticsEntity.getSearchKey())) {
		  statisticsEntity.setSearchKey("1");
		  //처음 페이지 접속시 현재달의 날짜로 세팅
		  statisticsEntity.setStartDate(oCalendar.get(Calendar.YEAR)+"-"+(oCalendar.get(Calendar.MONTH) + 1)+"-01"); //시작일
		  statisticsEntity.setEndDate(oCalendar.get(Calendar.YEAR)+"-"+(oCalendar.get(Calendar.MONTH) + 1)+"-"+oCalendar.getActualMaximum(Calendar.DAY_OF_MONTH)); //종료일 
	  }
	  statisticsList = statisticsService.getJoinMemberReport(statisticsEntity);
	  statisticsList.setAccrueMember(statisticsList.getStatisticsList().get(0).getAccrueMember());
	  statisticsList.setAccrueCompany(statisticsList.getStatisticsList().get(0).getAccrueCompany());
	  statisticsList.setSumJoinMember(statisticsList.getStatisticsList().get(0).getSumJoinMember());
	  statisticsList.setSumJoinCompanyMember(statisticsList.getStatisticsList().get(0).getSumJoinCompanyMember());
	 
	} catch (Exception e) {
	  logger.error("ExcelController.joinMemberReport", e);
	}
	model.addAttribute("statisticsList", statisticsList);
	model.addAttribute("excelName", "joinMemberReport_"+statisticsEntity.getStartDate()+"~"+statisticsEntity.getEndDate());
	return "excel/joinMemberReport"; 
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
	try {
	  Calendar oCalendar = Calendar.getInstance( );
	  if(StringUtils.isEmpty(statisticsEntity.getSearchKey())) {
		  statisticsEntity.setSearchKey("1");
		  //처음 페이지 접속시 현재달의 날짜로 세팅
		  statisticsEntity.setStartDate(oCalendar.get(Calendar.YEAR)+"-"+(oCalendar.get(Calendar.MONTH) + 1)+"-01"); //시작일
		  statisticsEntity.setEndDate(oCalendar.get(Calendar.YEAR)+"-"+(oCalendar.get(Calendar.MONTH) + 1)+"-"+oCalendar.getActualMaximum(Calendar.DAY_OF_MONTH)); //종료일 
	  }
	  statisticsList = statisticsService.getLoginCountReport(statisticsEntity);
	  statisticsList.setSumLoginCount(statisticsList.getStatisticsList().get(0).getSumLoginCount());
	  statisticsList.setSumLoginCompanyCount(statisticsList.getStatisticsList().get(0).getSumLoginCompanyCount());
	} catch (Exception e) {
	  logger.error("ExcelController.joinMemberReport", e);
	}
	model.addAttribute("statisticsList", statisticsList);
	model.addAttribute("excelName", "loginCountReport_"+statisticsEntity.getStartDate()+"~"+statisticsEntity.getEndDate());
	return "excel/loginCountReport"; 
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
		logger.error("ExcelController.dropOutMemberReport", e);
	}
	model.addAttribute("dropOutList", statisticsEntity.getDropOutList());
	model.addAttribute("dropOutReasonList", statisticsEntity.getDropOutReasonList());
	model.addAttribute("excelName", "dropOutMemberReport_"+statisticsEntity.getSearchValue());
	return "excel/dropOutMemberReport";
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
	} catch (Exception e) {
  	  logger.error("ExcelController.mailReport" , e);
	}
	model.addAttribute("statisticsList", statisticsList);
	model.addAttribute("excelName", "mailReport_"+statisticsEntity.getSearchValue());
	return "excel/mailReport"; 
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
	} catch (Exception e) {
  	  logger.error("ExcelController.surveyReport" , e);
	}
	model.addAttribute("statisticsList", statisticsList);
	model.addAttribute("excelName", "surveyReport_"+statisticsEntity.getSearchValue());
	return "excel/surveyReport"; 
  }
  /**
   * 티켓 사용내역
   * @param ststisticEntity
   * @param model
   * @return
   */
  @RequestMapping("/usedTicketReport")
  public String usedTicketReport(StatisticsEntity statisticsEntity, Model model) {
	try {
	  statisticsService.getUsedTicketReport(statisticsEntity, model);
	} catch (Exception e) {
  	  logger.error("ExcelController.usedTicketReport" , e);
	}
	model.addAttribute("excelName", "usedTicketReport_"+statisticsEntity.getSearchValue());
	return "excel/usedTicketReport";
  }
  /**
   * 티켓/상품적용서비스
   * @param ststisticEntity
   * @param model
   * @return
   */
  @RequestMapping("/ticketProductReport")
  public String ticketProductReport(StatisticsEntity statisticsEntity, Model model) {
	try {
	   statisticsService.getTicketProductReport(statisticsEntity, model);
	} catch (Exception e) {
	  logger.error("ExcelController.ticketProductReport" , e);
	}
	model.addAttribute("excelName", "ticketProductReport_"+statisticsEntity.getSearchValue());
	return "excel/ticketProductReport";
  } 
  /**
   * 티켓/상품적용서비스
   * @param ststisticEntity
   * @param model
   * @return
   */
  @RequestMapping("/cableAdviceReprot")
  public String cableAdviceReprot(StatisticsEntity statisticsEntity, Model model) {
	try {
	   statisticsService.getCableAdviceReprot(statisticsEntity, model);
	} catch (Exception e) {
	  logger.error("ExcelController.cableAdviceReprot" , e);
	}
	model.addAttribute("excelName", "cableAdviceReprot"+statisticsEntity.getSearchValue());
	return "excel/cableAdviceReprot";
  }
  
  /**
   * 웹결제내역 통계
   * @param paymentEntity
   * @param model
   * @return
   */
  @RequestMapping("/paymentWebReport")
  public String paymentWebReport(PaymentEntity paymentEntity, Model model) {
	List<PaymentEntity> paymentDateList = null;
	List<PaymentEntity> paymentDeviceList = null;
	List<PaymentEntity> paymentTypeList = null;
	try {
	  Date d = new Date();
	  SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM");
	  if(StringUtils.isEmpty(paymentEntity.getSearchValue())) {
		  paymentEntity.setSearchValue(sdf.format(d));
	  }
	  paymentEntity.setSearchKey("date");
	  paymentDateList = paymentService.getPaymentWebReport(paymentEntity);
	  model.addAttribute("paymentDateList", paymentDateList);
	  
	  paymentEntity.setSearchKey("device");
	  paymentDeviceList = paymentService.getPaymentWebReport(paymentEntity);
	  model.addAttribute("paymentDeviceList", paymentDeviceList);
	  
	  paymentEntity.setSearchKey("type");
	  paymentTypeList = paymentService.getPaymentWebReport(paymentEntity);
	  model.addAttribute("paymentTypeList", paymentTypeList);
	} catch (Exception e) {
  	  logger.error("PaymentController.paymentWebReport" , e);
	}
		  
	model.addAttribute("excelName", "paymentWebReport"+paymentEntity.getSearchValue());
	return "excel/paymentWebReport";
  }
  
  /**
   * 웹결제내역 통계
   * @param paymentEntity
   * @param model
   * @return
   */
  @RequestMapping("/paymentContractReport")
  public String paymentContractReport(PaymentEntity paymentEntity, Model model) {
    List<PaymentEntity> paymentDateList = null;
	List<PaymentEntity> paymentDeviceList = null;
	List<PaymentEntity> paymentCompanyList = null;
	try {
	  Date d = new Date();
	  SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM");
	  if(StringUtils.isEmpty(paymentEntity.getSearchValue())) {
		  paymentEntity.setSearchValue(sdf.format(d));
	  }
	  paymentEntity.setSearchKey("date");
	  paymentDateList = paymentService.getPaymentContractReport(paymentEntity);
	  model.addAttribute("paymentDateList", paymentDateList);
	  
	  paymentEntity.setSearchKey("device");
	  paymentDeviceList = paymentService.getPaymentContractReport(paymentEntity);
	  model.addAttribute("paymentDeviceList", paymentDeviceList);
	  
	  paymentEntity.setSearchKey("company");
	  paymentCompanyList = paymentService.getPaymentContractReport(paymentEntity);
	  model.addAttribute("paymentCompanyList", paymentCompanyList);
	} catch (Exception e) {
  	  logger.error("PaymentController.paymentContractReport" , e);
	}
		  
	model.addAttribute("excelName", "paymentContractReport"+paymentEntity.getSearchValue());
	return "excel/paymentContractReport";
  }
}
