package kr.co.clapp.controller.admin.customer;

import kr.co.clapp.constants.CommonCode;
import kr.co.clapp.entities.*;
import kr.co.clapp.service.common.CommonService;
import kr.co.clapp.service.customer.CustomerService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

@Controller
@RequestMapping(value="/admin/customer")
public class CustomerController {
  private static final Logger logger = LoggerFactory.getLogger( CustomerController.class );

  @Autowired
  private CommonService commonService;
  
  @Autowired 
  private CustomerService customerService;

  HashMap<String, Object> commonCode  = new HashMap<String, Object>();
  
  CommonCodeEntity commonCodeEntity = new CommonCodeEntity();

  public CustomerController() {

  }
  /**
   * 이메일 문의 목록
   * @param serviceInquiryEntity
   * @param model
   * @return
   */
  @RequestMapping("/serviceInquiryList")
  public String serviceInquiryList(ServiceInquiryEntity serviceInquiryEntity, Model model){
  	try{
  	  //공통코드 
  	  CommonCodeEntity commonCodeEntity = new CommonCodeEntity();
  	  //공통코드 이메일답변 분류 
  	  commonCodeEntity.setCodeMasterCode(CommonCode.INQUIRY_CATEGORY);
  	  //공통코드 이메일답변 분류 코드
  	  List<CommonCodeEntity> inquiryCategoryCode = commonService.getCommonCodeList(commonCodeEntity);
  	  //공통코드 이메일답변처리 여부 
  	  commonCodeEntity.setCodeMasterCode(CommonCode.ANSWER_INSERT_YN);
  	  //공통코드 이메일답변처리 여부 코드
  	  List<CommonCodeEntity> answerInsertYnCode = commonService.getCommonCodeList(commonCodeEntity);
  	  //공통코드 10개,20개,50개,100개씩보기
  	  commonCodeEntity.setCodeMasterCode(CommonCode.SORT_LIST_SIZE);
  	  //공통코드 10개,20개,50개,100개씩보기 코드
  	  List<CommonCodeEntity> sortListSizeCode = commonService.getCommonCodeList(commonCodeEntity);
  	  serviceInquiryEntity = customerService.getServiceInquiryList(serviceInquiryEntity);
  	  
  	  ServiceInquiryEntity inquiryCount  = customerService.getInquiryCount(serviceInquiryEntity);					// 이메일 답변 누적 카운트
  	  ServiceInquiryEntity inquirySearchCount  = customerService.getInquirySearchCount(serviceInquiryEntity);		// 이메일 답변 검색 카운트
  	  model.addAttribute("inquiryCount", inquiryCount);
  	  model.addAttribute("inquirySearchCount", inquirySearchCount);
  	  model.addAttribute("serviceInquiryEntity", serviceInquiryEntity);
  	  model.addAttribute("inquiryCategoryCode", inquiryCategoryCode);					//이메일답변 분류 코드
  	  model.addAttribute("answerInsertYnCode", answerInsertYnCode);						//이메일답변처리 여부 코드
  	  model.addAttribute("sortListSizeCode", sortListSizeCode);							//10개,20개,50개,100개씩보기 코드
  	  //공통
  	  commonCode.put("navigation", "이메일 문의/답변 관리");									// 현재 페이지 네비게이션
  	  commonCode.put("mainMenu", "permissionCustomer");									// left main menu 
  	  commonCode.put("subMenu", "serviceInquiry");
  	  model.addAttribute("CommonCode", commonCode);
  	} catch (Exception e) {
  	  logger.error("CustomerController.serviceInquiryList:Failed" , e);
  	}
  	return "admin/customer/serviceInquiryList";
  }
  /**
   * 이메일 문의 상세
   * @param serviceInquiryEntity
   * @param model
   * @return
   */
  @RequestMapping("/serviceInquiryDetail")
  public String serviceInquiryDetail(ServiceInquiryEntity serviceInquiryEntity, Model model){
  	String navigation = "이메일 문의/답변 관리 > 문의 내용 및 답변 달기";
  	String submitType = "답변완료";
  	String submitAction = "admin/customer/rest/insertServiceInquiryAnswer";
  	ServiceInquiryEntity serviceInquiryInfo = null;
	try {
	  serviceInquiryEntity.setFileTarget(CommonCode.FILE_TARGET_INQUIRY);
	  serviceInquiryInfo = customerService.getServiceInquiryDetail(serviceInquiryEntity);
	  serviceInquiryEntity = customerService.getServiceInquiryAnswerList(serviceInquiryEntity);
	  model.addAttribute("serviceInquiryDetail", serviceInquiryInfo);
	  model.addAttribute("serviceInquiryEntity", serviceInquiryEntity);
	  //공통
	  commonCode.put("navigation", navigation);										// 현재 페이지 네비게이션
	  commonCode.put("submitType", submitType);
	  commonCode.put("submitAction", submitAction);
	  commonCode.put("mainMenu", "permissionCustomer");								// left main menu 
	  model.addAttribute("CommonCode", commonCode);
	} catch (Exception e) {
	  logger.error("CustomerController.serviceInquiryDetail:Failed" , e);
	}
	model.addAttribute("navigation", navigation);
	return "admin/customer/serviceInquiryDetail";
  }
  /**
   * 유선 상담 내역 목록
   * @param cabledAdviceEntity
   * @param model
   * @return
   */
  @RequestMapping("/cabledAdviceList")
  public String cabledAdviceList(CabledAdviceEntity cabledAdviceEntity, Model model){
  	try{
  	  //공통코드 
  	  CommonCodeEntity commonCodeEntity = new CommonCodeEntity();
  	  //공통코드 유선상담 분류 
  	  commonCodeEntity.setCodeMasterCode(CommonCode.CABLED_ADVICE);
  	  //공통코드 유선상담 분류 코드
  	  List<CommonCodeEntity> cabledAdviceCode = commonService.getCommonCodeList(commonCodeEntity);
  	  //공통코드 10개,20개,50개,100개씩보기
  	  commonCodeEntity.setCodeMasterCode(CommonCode.SORT_LIST_SIZE);
  	  //공통코드 10개,20개,50개,100개씩보기 코드
  	  List<CommonCodeEntity> sortListSizeCode = commonService.getCommonCodeList(commonCodeEntity);
  	  cabledAdviceEntity = customerService.getCabledAdviceList(cabledAdviceEntity);
  	  
  	  int adviceCount = customerService.getAdviceCount();										//유선 상담 누적 카운트
  	  
  	  model.addAttribute("adviceCount", adviceCount);
  	  model.addAttribute("cabledAdviceEntity", cabledAdviceEntity);
  	  model.addAttribute("cabledAdviceCode", cabledAdviceCode);									//유선상담 분류 코드
  	  model.addAttribute("sortListSizeCode", sortListSizeCode);									//10개,20개,50개,100개씩보기 코드
  	  //공통
  	  commonCode.put("navigation", "유선 상담내역 관리");											// 현재 페이지 네비게이션
  	  commonCode.put("mainMenu", "permissionCustomer");											// left main menu 
  	  commonCode.put("subMenu", "cabledAdvice");
  	  model.addAttribute("CommonCode", commonCode);
  	} catch (Exception e) {
  	  logger.error("CustomerController.cabledAdviceList:Failed" , e);
  	}
  	return "admin/customer/cabledAdviceList";
  }
  /**
   * 유선 상담 내역 상세
   * @param cabledAdviceEntity
   * @param model
   * @return
   */
  @RequestMapping("/cabledAdviceDetail")
  public String cabledAdviceDetail(CabledAdviceEntity cabledAdviceEntity, Model model){
  	String navigation = "유선 상담내역 관리 > 상세 보기";
  	CabledAdviceEntity cabledAdviceInfo = null;
	try {
	  cabledAdviceInfo = customerService.getCabledAdviceDetail(cabledAdviceEntity);
	  model.addAttribute("cabledAdviceDetail", cabledAdviceInfo);
	  //공통
	  commonCode.put("navigation", navigation);													// 현재 페이지 네비게이션
	  commonCode.put("mainMenu", "permissionCustomer"); 										// left main menu 
	  model.addAttribute("CommonCode", commonCode);
	} catch (Exception e) {
	  logger.error("CustomerController.cabledAdviceDetail:Failed" , e);
	}
	model.addAttribute("navigation", navigation);
	return "admin/customer/cabledAdviceDetail";
  }
  /**
   * 유선 상담 내역 등록/수정
   * @param cabledAdviceEntity
   * @param model
   * @return
   */
  @RequestMapping("/cabledAdviceForm")
  public String cabledAdviceForm(CabledAdviceEntity cabledAdviceEntity, Model model){
  	String navigation = "유선 상담내역 관리 > 상담 등록";
	String submitType = "상담 접수";
	String submitAction = "admin/customer/rest/insertCabledAdvice";
	CabledAdviceEntity cabledAdviceInfo = null;
	DateFormat sdFormat = new SimpleDateFormat(CommonCode.DatePattern.DASH_TIME);
	Date nowDate = new Date();
	String tempDate = sdFormat.format(nowDate);
	try {
	  //공통코드 
	  CommonCodeEntity commonCodeEntity = new CommonCodeEntity();
	  //공통코드 유선상담 분류
	  commonCodeEntity.setCodeMasterCode(CommonCode.CABLED_ADVICE);
	  //공통코드 유선상담 분류 코드
	  List<CommonCodeEntity> cabledAdviceCode = commonService.getCommonCodeList(commonCodeEntity);
	  if(cabledAdviceEntity.getCabledAdviceKey() > CommonCode.ZERO) {
		submitType = "상담 완료";
		submitAction = "admin/customer/rest/modifyCabledAdvice";
		cabledAdviceInfo = customerService.getCabledAdviceDetail(cabledAdviceEntity);
		cabledAdviceInfo.setAdviceContents(cabledAdviceInfo.getAdviceContents()+"\n\n"+tempDate);
	  } else {
		cabledAdviceEntity.setAdviceContents(tempDate);
		cabledAdviceInfo = cabledAdviceEntity;
	  }
	  model.addAttribute("cabledAdviceDetail", cabledAdviceInfo);
	  model.addAttribute("cabledAdviceCode", cabledAdviceCode);									//유선상담 분류 코드
	  //공통
	  commonCode.put("navigation", navigation);													// 현재 페이지 네비게이션
	  commonCode.put("submitType", submitType);
	  commonCode.put("submitAction", submitAction);
	  commonCode.put("mainMenu", "permissionCustomer"); 										// left main menu 
	  model.addAttribute("CommonCode", commonCode);
	} catch (Exception e) {
	  logger.error("CustomerController.cabledAdviceForm:Failed" , e);
	}
	model.addAttribute("navigation", navigation);
	return "admin/customer/cabledAdviceForm";
  }
  /**
   * 공지사항 목록
   * @param boardNoticeEntity
   * @param model
   * @return
   */
  @RequestMapping("/boardNoticeList")
  public String boardNoticeList(BoardNoticeEntity boardNoticeEntity, Model model){
  	try{
  	  //공통코드 
  	  CommonCodeEntity commonCodeEntity = new CommonCodeEntity();
  	  //공통코드 공지사항 노출 여부
  	  commonCodeEntity.setCodeMasterCode(CommonCode.NOTICE_OPEN);
  	  //공통코드 공지사항 노출 여부 코드
  	  List<CommonCodeEntity> noticeOpenCode = commonService.getCommonCodeList(commonCodeEntity);
  	  //공통코드 10개,20개,50개,100개씩보기
  	  commonCodeEntity.setCodeMasterCode(CommonCode.SORT_LIST_SIZE);
  	  //공통코드 10개,20개,50개,100개씩보기 코드
  	  List<CommonCodeEntity> sortListSizeCode = commonService.getCommonCodeList(commonCodeEntity);
  	  boardNoticeEntity = customerService.getBoardNoticeList(boardNoticeEntity);
	
  	  model.addAttribute("boardNoticeEntity", boardNoticeEntity);
  	  model.addAttribute("noticeOpenCode", noticeOpenCode);										// 공지사항 노출 여부 코드
  	  model.addAttribute("sortListSizeCode", sortListSizeCode);									// 10개,20개,50개,100개씩보기 코드
  	  //공통
  	  commonCode.put("navigation", "공지사항 관리");												// 현재 페이지 네비게이션
  	  commonCode.put("mainMenu", "permissionCustomer");											// left main menu 
  	  commonCode.put("subMenu", "boardNotice");
  	  model.addAttribute("CommonCode", commonCode);
  	} catch (Exception e) {
  	  logger.error("CustomerController.boardNoticeList:Failed" , e);
  	}
  	return "admin/customer/boardNoticeList";
  }
  /**
   * 공지사항 상세
   * @param boardNoticeEntity
   * @param model
   * @return
   */
  @RequestMapping("/boardNoticeDetail")
  public String boardNoticeDetail(BoardNoticeEntity boardNoticeEntity, Model model){
  	String navigation = "공지사항 관리 > 공지 상세";
	BoardNoticeEntity boardNoticeInfo = null;
//	Date d = new Date();
	try {
	  if(boardNoticeEntity.getBoardNoticeKey() > CommonCode.ZERO) {
		boardNoticeInfo = customerService.getBoardNoticeDetail(boardNoticeEntity);
	  } 
	  else {
		boardNoticeInfo = new BoardNoticeEntity();
//		boardNoticeInfo.setNoticeOpenDate(d);
	  }
	  model.addAttribute("boardNoticeDetail", boardNoticeInfo);
	  //공통
	  commonCode.put("navigation", navigation);												// 현재 페이지 네비게이션
	  commonCode.put("mainMenu", "permissionCustomer");										 // left main menu 
	  model.addAttribute("CommonCode", commonCode);
	} catch (Exception e) {
	  logger.error("CustomerController.boardNoticeDetail:Failed" , e);
	}
	model.addAttribute("navigation", navigation);
	return "admin/customer/boardNoticeDetail";
  }
  /**
   * 공지사항 상세
   * @param boardNoticeEntity
   * @param model
   * @return
   */
  @RequestMapping("/boardNoticeModify")
  public String boardNoticeModify(BoardNoticeEntity boardNoticeEntity, Model model){
  	String navigation = "공지사항 관리 > 공지 등록";
	String submitType = "등록";
	String submitAction = "admin/customer/rest/insertBoardNotice";
	BoardNoticeEntity boardNoticeInfo = null;
//	Date d = new Date();
	try {
	  if(boardNoticeEntity.getBoardNoticeKey() > CommonCode.ZERO) {
		navigation = "공지사항 관리 > 공지 수정";
		submitType = "수정";
		submitAction = "admin/customer/rest/modifyBoardNotice";
		boardNoticeInfo = customerService.getBoardNoticeDetail(boardNoticeEntity);
	  } 
	  else {
		boardNoticeInfo = new BoardNoticeEntity();
//		boardNoticeInfo.setNoticeOpenDate(d);
	  }
	  model.addAttribute("boardNoticeDetail", boardNoticeInfo);
	  //공통
	  commonCode.put("navigation", navigation);												// 현재 페이지 네비게이션
	  commonCode.put("submitType", submitType);
	  commonCode.put("submitAction", submitAction);
	  commonCode.put("mainMenu", "permissionCustomer");										 // left main menu 
	  model.addAttribute("CommonCode", commonCode);
	} catch (Exception e) {
	  logger.error("CustomerController.boardNoticeDetail:Failed" , e);
	}
	model.addAttribute("navigation", navigation);
	return "admin/customer/boardNoticeModify";
  }
  /**
   * 도움말 관리 목록
   * @param boardQnaEntity
   * @param model
   * @return
   */
  @RequestMapping("/boardQnaList")
  public String boardQnaList(BoardQnaEntity boardQnaEntity, Model model){
  	try{
	  //공통코드 
	  CommonCodeEntity commonCodeEntity = new CommonCodeEntity();
	  //공통코드 이메일답변 분류 
	  commonCodeEntity.setCodeMasterCode(CommonCode.QNA_CATEGORY);
	  //공통코드 이메일답변 분류 코드
	  List<CommonCodeEntity> qnaCategoryCode = commonService.getCommonCodeList(commonCodeEntity);
  	  //공통코드 10개,20개,50개,100개씩보기
  	  commonCodeEntity.setCodeMasterCode(CommonCode.SORT_LIST_SIZE);
  	  //공통코드 10개,20개,50개,100개씩보기 코드
  	  List<CommonCodeEntity> sortListSizeCode = commonService.getCommonCodeList(commonCodeEntity);
	  boardQnaEntity = customerService.getBoardQnaList(boardQnaEntity);
	
  	  model.addAttribute("boardQnaEntity", boardQnaEntity);									
  	  model.addAttribute("qnaCategoryCode", qnaCategoryCode);									
  	  model.addAttribute("sortListSizeCode", sortListSizeCode);									
	
  	  //공통
  	  commonCode.put("navigation", "도움말 관리");												// 현재 페이지 네비게이션
  	  commonCode.put("mainMenu", "permissionCustomer");											// left main menu 
  	  commonCode.put("subMenu", "boardQna");
  	  model.addAttribute("CommonCode", commonCode);
  	} catch (Exception e) {
  	  logger.error("CustomerController.boardQnaList:Failed" , e);
  	}
  	return "admin/customer/boardQnaList";
  }
  /**
   * 도움말 관리 상세
   * @param boardQnaEntity
   * @param model
   * @return
   */
  @RequestMapping("/boardQnaDetail")
  public String boardQnaDetail(BoardQnaEntity boardQnaEntity, Model model){
  	String navigation = "도움말 관리 > 도움말 상세";
	BoardQnaEntity boardQnaInfo = null;
	try {
	  if(boardQnaEntity.getBoardQnaKey() > CommonCode.ZERO) {
			boardQnaInfo = customerService.getBoardQnaDetail(boardQnaEntity);
		  }
	  model.addAttribute("boardQnaDetail", boardQnaInfo);
	  int countExposedBoardQna = customerService.getCountExposedBoardQna();
	  model.addAttribute("countExposedBoardQna", countExposedBoardQna);
	  //공통
	  commonCode.put("navigation", navigation);												// 현재 페이지 네비게이션
	  commonCode.put("mainMenu", "permissionCustomer");										 // left main menu 
	  model.addAttribute("CommonCode", commonCode);
	} catch (Exception e) {
	  logger.error("CustomerController.boardQnaDetail:Failed" , e);
	}
	model.addAttribute("navigation", navigation);
	return "admin/customer/boardQnaDetail";
  }
  /**
   * 도움말 관리 등록/수정
   * @param boardQnaEntity
   * @param model
   * @return
   */
  @RequestMapping("/boardQnaModify")
  public String boardQnaModify(BoardQnaEntity boardQnaEntity, Model model){
  	String navigation = "도움말 관리 > 도움말 등록";
	String submitType = "등록";
	String submitAction = "admin/customer/rest/insertBoardQna";
	BoardQnaEntity boardQnaInfo = null;
	try {
	  //공통코드 
	  CommonCodeEntity commonCodeEntity = new CommonCodeEntity();
	  //공통코드 유선상담 분류
	  commonCodeEntity.setCodeMasterCode(CommonCode.QNA_CATEGORY);
	  //공통코드 유선상담 분류 코드
	  List<CommonCodeEntity> qnaCategoryCode = commonService.getCommonCodeList(commonCodeEntity);
	  if(boardQnaEntity.getBoardQnaKey() > CommonCode.ZERO) {
			navigation = "도움말 관리 > 도움말 수정";
			submitType = "수정";
			submitAction = "admin/customer/rest/modifyBoardQna";
			boardQnaInfo = customerService.getBoardQnaDetail(boardQnaEntity);
		  }
	  model.addAttribute("boardQnaDetail", boardQnaInfo);
	  model.addAttribute("qnaCategoryCode", qnaCategoryCode);
	  int countExposedBoardQna = customerService.getCountExposedBoardQna();
	  model.addAttribute("countExposedBoardQna", countExposedBoardQna);
	  //공통
	  commonCode.put("navigation", navigation);												// 현재 페이지 네비게이션
	  commonCode.put("submitType", submitType);
	  commonCode.put("submitAction", submitAction);
	  commonCode.put("mainMenu", "permissionCustomer");										 // left main menu 
	  model.addAttribute("CommonCode", commonCode);
	} catch (Exception e) {
	  logger.error("CustomerController.boardQnaDetail:Failed" , e);
	}
	model.addAttribute("navigation", navigation);
	return "admin/customer/boardQnaModify";
  }
    /**
     * 테스트 대행 신청 목록
     * @param applyFormEntity
     * @param model
     * @return
     */
    @RequestMapping("/testRequestList")
    public String testRequestList(ApplyFormEntity applyFormEntity, Model model){
        try{
            //공통코드
            CommonCodeEntity commonCodeEntity = new CommonCodeEntity();
            //공통코드 10개,20개,50개,100개씩보기
            commonCodeEntity.setCodeMasterCode(CommonCode.SORT_LIST_SIZE);
            //공통코드 10개,20개,50개,100개씩보기 코드
            List<CommonCodeEntity> sortListSizeCode = commonService.getCommonCodeList(commonCodeEntity);


            model.addAttribute("sortListSizeCode", sortListSizeCode);							//10개,20개,50개,100개씩보기 코드
            //공통
            commonCode.put("navigation", "테스팅 대행 신청관리");									// 현재 페이지 네비게이션
            commonCode.put("mainMenu", "permissionCustomer");									// left main menu
            commonCode.put("subMenu", "testRequestList");
            model.addAttribute("CommonCode", commonCode);
        } catch (Exception e) {
            logger.error("CustomerController.serviceInquiryList:Failed" , e);
        }
        return "admin/customer/testRequestList";
    }
}
