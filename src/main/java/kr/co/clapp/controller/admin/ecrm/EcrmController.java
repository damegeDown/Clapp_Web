package kr.co.clapp.controller.admin.ecrm;

import kr.co.clapp.constants.CommonCode;
import kr.co.clapp.entities.CommonCodeEntity;
import kr.co.clapp.entities.EcrmEntity;
import kr.co.clapp.service.common.CommonService;
import kr.co.clapp.service.ecrm.EcrmService;
import kr.co.digigroove.commons.messages.Messages;
import kr.co.digigroove.commons.utils.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

@Controller
@RequestMapping("/admin/ecrm")
public class EcrmController {
	
  private static final Logger logger = LoggerFactory.getLogger(EcrmController.class);
  @Autowired
  private EcrmService ecrmService;
  @Autowired
  private CommonService commonService;
  @Autowired
  private Messages messages;
  
  HashMap<String, Object> commonCode  = new HashMap<String, Object>();
  /**
   * 수시 발송용 메일
   * @return
   */
  @RequestMapping("/mailReport")
  public String mailReport(EcrmEntity ecrmEntity, Model model) {
	try {
	  ecrmEntity.setMailSection(CommonCode.MailType.MAIL_ANY_TIME);
	  ecrmService.getMailReport(ecrmEntity);
	  //공통
	  commonCode.put("navigation", "eCRM > 수시 발송용 메일");		// 현재 페이지 네비게이션
	  commonCode.put("mainMenu", "ecrm");						// left main menu 
	  commonCode.put("subMenu", "anyMailReport");				// left sub menu
	  model.addAttribute("CommonCode", commonCode);
	} catch (Exception e) {
	  logger.error("EcrmController.mailReport:Faild" , e);
	}
	return "admin/ecrm/mailReport";
  }
  /**
   * 타겟 발송메일
   * @param ecrmEntity
   * @param model
   * @return
   */
  @RequestMapping("/targetMailReport")
  public String targetMailReport(EcrmEntity ecrmEntity, Model model) {
	try {
	  Date d = new Date();
	  SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM");
	  if(StringUtils.isEmpty(ecrmEntity.getSearchValue())) {
		ecrmEntity.setSearchValue(sdf.format(d));
	  }
	  if(StringUtils.isEmpty(ecrmEntity.getSearchKey())) {
		ecrmEntity.setSearchKey("mail_send_date");
	  }
	  ecrmEntity.setMailSection(CommonCode.MailType.MAIL_TARGET);
	  ecrmService.getMailReport(ecrmEntity);
	  //공통 
	  commonCode.put("navigation", "eCRM > 타켓 메일");		// 현재 페이지 네비게이션
	  commonCode.put("mainMenu", "ecrm");						// left main menu 
	  commonCode.put("subMenu", "targetMailReport");				// left sub menu
	  commonCode.put("searchResult", "> 검색결과 : 타켓 메일 : <span class='colorSkyBlue'>"+ecrmEntity.getEcrmList().size()+"</span> 건");				// left sub menu
	  model.addAttribute("CommonCode", commonCode);
    } catch (Exception e) {
	  logger.error("EcrmController.targetMailReport:Faild" , e);
	}
	  return "admin/ecrm/targetMailReport";
  }
  /**
   * 설문 리스트
   * @param ecrmEntity
   * @param model
   * @return
   */
  @RequestMapping("/surveyList")
  public String surveyList(EcrmEntity ecrmEntity, Model model) {
    try {
    	  Calendar oCalendar = Calendar.getInstance( );
   	  int year = oCalendar.get(Calendar.YEAR);
   	  model.addAttribute("year", year);
   	  if(StringUtils.isEmpty(ecrmEntity.getSearchValue())){
		  //년도를 문자형으로
   		ecrmEntity.setSearchValue(String.valueOf(year));
	  }
	  ecrmService.getSurveyList(ecrmEntity);
	  //공통 
	  commonCode.put("navigation", "eCRM > 설문관리(수시)");		// 현재 페이지 네비게이션
	  commonCode.put("mainMenu", "ecrm");				// left main menu 
	  commonCode.put("subMenu", "survey");				// left sub menu
	  commonCode.put("searchResult", "> 검색결과 : 총 : <span class='colorSkyBlue'>"+ecrmEntity.getEcrmList().size()+"</span> 건");				// left sub menu
	  model.addAttribute("CommonCode", commonCode);
    } catch (Exception e) {
	  logger.error("EcrmController.surveyList:Faild" , e);
	}
	return "admin/ecrm/surveyList";
  }
  /**
   * 설문 상세
   * @param ecrmEntity
   * @param model
   * @return
   */
  @RequestMapping("/surveyDetail")
  public String surveyDetail(EcrmEntity ecrmEntity, Model model) {
    try{
    	  ecrmEntity = ecrmService.getSurveyDetail(ecrmEntity, model);
    	  model.addAttribute("ecrmEntity", ecrmEntity);
    	  
    	  //공통코드 
    	  CommonCodeEntity commonCodeEntity = new CommonCodeEntity();
    	  commonCodeEntity.setCodeMasterCode(CommonCode.POINT_TEXT);
      //공통코드 목록
    	  List<CommonCodeEntity> textPoint = commonService.getCommonCodeList(commonCodeEntity);
    	  
    	  model.addAttribute("textPoint", textPoint);
    	  //공통 
      commonCode.put("navigation", "설문 내용 및 결과 보기");		// 현재 페이지 네비게이션
      commonCode.put("mainMenu", "ecrm");						// left main menu 
      commonCode.put("subMenu", "survey");				// left sub menu
      model.addAttribute("CommonCode", commonCode);
    } catch (Exception e) {
	  logger.error("EcrmController.surveyDetail:Faild" , e);
	}
    return "admin/ecrm/surveyDetail";
  }
  /**
   * 설문 폼
   * @param ecrmEntity
   * @param model
   * @return
   */
  @RequestMapping("/surveyAnswerForm")
  public String surveyAnswerForm(EcrmEntity ecrmEntity, Model model) {
	try{
	  //공통코드 
  	  CommonCodeEntity commonCodeEntity = new CommonCodeEntity();
  	  commonCodeEntity.setCodeMasterCode(CommonCode.POINT_TEXT);
  	  //공통코드 목록
  	  List<CommonCodeEntity> textPoint = commonService.getCommonCodeList(commonCodeEntity);
  	  
  	  model.addAttribute("textPoint", textPoint);
    	  ecrmEntity = ecrmService.getSurveyDetail(ecrmEntity, model);
    	  model.addAttribute("ecrmEntity", ecrmEntity);
    } catch (Exception e) {
	  logger.error("EcrmController.surveyDetail:Faild" , e);
	} 
	return "surveyAnswerForm";
  }
  /**
   * 메일 확인
   * @param statisticeEntity
   * @return
   */
  @RequestMapping(value = {"/mailcheck", "/mailCheck"}, method = RequestMethod.GET)
  public void mailCheck(
		  EcrmEntity ecrmEntity,
		  @RequestParam(required=true, value="mailmasterkey") int mailmasterkey
		  ) {
	  ecrmEntity.setMailMasterKey(mailmasterkey);
	  ecrmService.setMailOpen(ecrmEntity);
  }
  
  /** 
   * 설문 등록 페이지
   * @param ecrmEneity
   * @param model
   * @return
   */
  @RequestMapping(value = "/insertSurvey")
  public String insertSurvey(EcrmEntity ecrmEneity, Model model) {
	Date d = new Date();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
	model.addAttribute("now", sdf.format(d));
	//공통 
    commonCode.put("navigation", "설문 등록");		// 현재 페이지 네비게이션
    commonCode.put("mainMenu", "ecrm");						// left main menu 
    commonCode.put("subMenu", "survey");				// left sub menu
    model.addAttribute("CommonCode", commonCode);  
	return "admin/ecrm/insertSurvey";
  }
  /**
   * 설문 답변(메일로 폼이 발송됬을시 실행되는 함수)
   * @param ecrmEntity
   * @return
   */
  @RequestMapping(value="/insertSurveyAnswer", method=RequestMethod.POST)
  public String insertSurveyAnswer(EcrmEntity ecrmEntity, Model model) {
	try{
	  int[] surveyQuestionKeyArr = ecrmEntity.getSurveyQuestionKeyArr();
	  int[] surveyPointTypeArr = ecrmEntity.getSurveyPointTypeArr();
	  String[] surveyAnswerArr = ecrmEntity.getSurveyAnswerArr();
	  for(int i = 0; i < surveyQuestionKeyArr.length;i++) {
		  ecrmEntity.setSurveyQuestionKey(surveyQuestionKeyArr[i]);
		  if(surveyPointTypeArr[i] == 1) {
			  ecrmEntity.setSurveyAnswerPoint(Integer.parseInt(surveyAnswerArr[i]));
		  } else {
			  ecrmEntity.setSurveyAnswerContents(surveyAnswerArr[i]);
		  }
		  ecrmEntity.setSurveyPointType(surveyPointTypeArr[i]);
		  //ecrmEntity.setUserId("test");
		  ecrmService.insertSurveyAnswer(ecrmEntity);
	  }
	} catch (Exception e) {
	  logger.error("EcrmController.insertSurveyAnswer:Faild" , e);
	}
	return "answerSuccess";
  }
}
