package kr.co.clapp.controller.admin.ticket;


import kr.co.clapp.constants.CommonCode;
import kr.co.clapp.entities.CommonCodeEntity;
import kr.co.clapp.entities.ProductEntity;
import kr.co.clapp.entities.TicketEntity;
import kr.co.clapp.service.common.CommonService;
import kr.co.clapp.service.product.ProductService;
import kr.co.clapp.service.ticket.TicketService;
import kr.co.digigroove.commons.utils.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Calendar;
import java.util.HashMap;
import java.util.List;

@Controller
@RequestMapping(value="/admin")
public class TicketController {
  private static final Logger logger = LoggerFactory.getLogger( TicketController.class );
  
  
  @Autowired
  private TicketService ticketService;
  @Autowired
  private ProductService productService;
  
  @Autowired
  private CommonService commonService;
  
  
  HashMap<String, Object> commonCode  = new HashMap<String, Object>();
  /**
   * 티켓사용내역 목록
   * @param ticketEntity
   * @param model
   * @return
   */
  @RequestMapping("/ticket/userTicketUsedList")
  public String userTicketUsedList(TicketEntity ticketEntity, Model model){
	  	try{
            java.util.Calendar cal = java.util.Calendar.getInstance();
			//처음 페이지 접속시 현재달의 날짜로 세팅
		  	if(StringUtils.isEmpty(ticketEntity.getStartDate())) {
                ticketEntity.setStartDate(String.valueOf(cal.get(cal.YEAR)+"/")+String.valueOf(cal.get(cal.MONTH)+1)+"/01"); //시작일
                ticketEntity.setEndDate(String.valueOf(cal.get(cal.YEAR) + "/") + String.valueOf(cal.get(cal.MONTH) + 1) + "/" + String.valueOf(cal.get(cal.DATE))); //종료일

		  	}
	  		//공통코드 
			CommonCodeEntity commonCodeEntity = new CommonCodeEntity();
			//공통코드 유저 일반,기업/단체 구분
			commonCodeEntity.setCodeMasterCode(CommonCode.USER_TYPE);
			//공통코드 유저 일반,기업/단체 구분 코드
			List<CommonCodeEntity> userTypeCode = commonService.getCommonCodeList(commonCodeEntity);
			//공통코드 디바이스 제조사
			commonCodeEntity.setCodeMasterCode(CommonCode.DEVICE_MAKER_CODE);
			//공통코드 디바이스 제조사 코드
			List<CommonCodeEntity> deviceMakerCodeNum = commonService.getCommonCodeList(commonCodeEntity);
			//공통코드 10개,20개,50개,100개씩보기
			commonCodeEntity.setCodeMasterCode(CommonCode.SORT_LIST_SIZE);
			//공통코드 10개,20개,50개,100개씩보기 코드
			List<CommonCodeEntity> sortListSizeCode = commonService.getCommonCodeList(commonCodeEntity);
			ticketEntity = ticketService.getUserTicketUsedList(ticketEntity);
			TicketEntity ticketSum	= ticketService.getTicketSum(ticketEntity);
			
	  		model.addAttribute("ticketSum", ticketSum);
	  		model.addAttribute("ticketEntity", ticketEntity);
	  		model.addAttribute("userTypeCode", userTypeCode);
	  		model.addAttribute("deviceMakerCodeNum", deviceMakerCodeNum);
	  		model.addAttribute("sortListSizeCode", sortListSizeCode);
			//공통
			commonCode.put("navigation", "티켓 사용 내역 관리 ");									// 현재 페이지 네비게이션
			commonCode.put("mainMenu", "permissionProduct");									// left main menu 
			commonCode.put("subMenu", "userTicketUsed");
			model.addAttribute("CommonCode", commonCode);
	  	} catch (Exception e) {
			logger.error("TicketController.userTicketUsedList:Faild" , e);	
	  	}
	  return "admin/ticket/userTicketUsedList";
  }
  /**
   * 티켓 적용 서비스 목록
   * @param ticketEntity
   * @param model
   * @return
   */
  @RequestMapping("/ticket/ticketProductServiceList")
  public String ticketProductServiceList(TicketEntity ticketEntity, Model model){
	  	try{
		  	Calendar oCalendar = Calendar.getInstance( );
			//처음 페이지 접속시 현재달의 날짜로 세팅
		  	if(StringUtils.isEmpty(ticketEntity.getStartDate())) {
				ticketEntity.setStartDate(oCalendar.get(Calendar.YEAR)+"/"+(oCalendar.get(Calendar.MONTH) + 1)+"/01"); //시작일
				ticketEntity.setEndDate(oCalendar.get(Calendar.YEAR)+"/"+(oCalendar.get(Calendar.MONTH) + 1)+"/"+oCalendar.getActualMaximum(Calendar.DAY_OF_MONTH)); //종료일
		  	}
	  		//공통코드 
			CommonCodeEntity commonCodeEntity = new CommonCodeEntity();
			//공통코드 유저 일반,기업/단체 구분
			commonCodeEntity.setCodeMasterCode(CommonCode.SERVICE_TARGET_TYPE);
			//공통코드 유저 일반,기업/단체 구분 코드
			List<CommonCodeEntity> serviceTargetTypeCode = commonService.getCommonCodeList(commonCodeEntity);
			//공통코드 티켓 적용 사유
			commonCodeEntity.setCodeMasterCode(CommonCode.SERVICE_APPLY_REASON);
			//공통코드 티켓 적용 사유 코드
			List<CommonCodeEntity> serviceApplyReasonCode = commonService.getCommonCodeList(commonCodeEntity);
			//공통코드 상품 타입
			commonCodeEntity.setCodeMasterCode(CommonCode.PRODUCT_TYPE);
			//공통코드 상품 타입 코드
			List<CommonCodeEntity> productTypeCode = commonService.getCommonCodeList(commonCodeEntity);
			//공통코드 10개,20개,50개,100개씩보기
			commonCodeEntity.setCodeMasterCode(CommonCode.SORT_LIST_SIZE);
			//공통코드 10개,20개,50개,100개씩보기 코드
			List<CommonCodeEntity> sortListSizeCode = commonService.getCommonCodeList(commonCodeEntity);
			ticketEntity = ticketService.getTicketProductServiceList(ticketEntity);
			
	  		model.addAttribute("ticketEntity", ticketEntity);
	  		model.addAttribute("serviceTargetTypeCode", serviceTargetTypeCode);									//공통코드 유저 일반,기업/단체 구분 코드
	  		model.addAttribute("serviceApplyReasonCode", serviceApplyReasonCode);				//공통코드 티켓 적용 사유 코드
	  		model.addAttribute("productTypeCode", productTypeCode);								//공통코드 상품 타입 코드
	  		model.addAttribute("sortListSizeCode", sortListSizeCode);								//공통코드 상품 타입 코드
			//공통
			commonCode.put("navigation", "티켓 상품 적용 서비스 ");									// 현재 페이지 네비게이션
			commonCode.put("mainMenu", "permissionProduct");									// left main menu 
			commonCode.put("subMenu", "ticketProductService");
			model.addAttribute("CommonCode", commonCode);
	  	} catch (Exception e) {
			logger.error("TicketController.ticketProductServiceList:Faild" , e);	
	  	}
	  return "admin/ticket/ticketProductServiceList";
  }
  /**
   * 티켓 적용 서비스 상세폼
   * @param ticketEntity
   * @param model
   * @return
   */
  @RequestMapping("/ticket/ticketProductServiceForm")
  public String ticketProductServiceForm(TicketEntity ticketEntity, Model model){
	  	String navigation = "티켓 / 상품 적용 서비스 > 신규 적용";
		String submitType = "등록";
		String submitAction = "admin/ticket/rest/insertTicketProductService";
		ProductEntity productInfo = new ProductEntity();
        List<TicketEntity> ticketProductList = null;
		try {
			//공통코드 
			CommonCodeEntity commonCodeEntity = new CommonCodeEntity();
			//공통코드 유저 일반,기업/단체 구분
			commonCodeEntity.setCodeMasterCode(CommonCode.USER_TYPE);
			//공통코드 유저 일반,기업/단체 구분 코드
			List<CommonCodeEntity> userTypeCode = commonService.getCommonCodeList(commonCodeEntity);
			//공통코드 티켓 적용 사유
			commonCodeEntity.setCodeMasterCode(CommonCode.SERVICE_APPLY_REASON);
			//공통코드 티켓 적용 사유 코드
			List<CommonCodeEntity> serviceApplyReasonCode = commonService.getCommonCodeList(commonCodeEntity);
			//공통코드 상품 타입
			commonCodeEntity.setCodeMasterCode(CommonCode.PRODUCT_TYPE);
			//공통코드 상품 타입 코드
			List<CommonCodeEntity> productTypeCode = commonService.getCommonCodeList(commonCodeEntity);
			//상품정보
			productInfo = productService.getProductList(productInfo);
			//보유상품 리스트
//            int userMasterKey = 0; //선택되 회원의 userMasterKey 값을 받아온다
//            ticketEntity.setUserMasterKey(userMasterKey);
//            ticketProductList=ticketService.getUserTicketProductList(ticketEntity);
			model.addAttribute("productInfo", productInfo);
			model.addAttribute("ticketEntity", ticketEntity);														
			model.addAttribute("userTypeCode", userTypeCode);														//공통코드 유저 일반,기업/단체 구분 코드
			model.addAttribute("serviceApplyReasonCode", serviceApplyReasonCode);									//공통코드 티켓 적용 사유 코드
			model.addAttribute("productTypeCode", productTypeCode);												//공통코드 상품 타입 코드
			//공통
			commonCode.put("navigation", navigation);																// 현재 페이지 네비게이션
			commonCode.put("submitType", submitType);
			commonCode.put("submitAction", submitAction);
			commonCode.put("mainMenu", "permissionProduct"); 														// left main menu 
			model.addAttribute("CommonCode", commonCode);
		} catch (Exception e) {
		  logger.error("TicketController.deviceList:Faild" , e);
		}
		model.addAttribute("navigation", navigation);
	  return "admin/ticket/ticketProductServiceForm";
  }
}
