package kr.co.clapp.controller.admin.payment;

import kr.co.clapp.constants.CommonCode;
import kr.co.clapp.entities.CommonCodeEntity;
import kr.co.clapp.entities.PaymentEntity;
import kr.co.clapp.entities.ProductEntity;
import kr.co.clapp.service.common.CommonService;
import kr.co.clapp.service.payment.PaymentService;
import kr.co.clapp.service.product.ProductService;
import kr.co.digigroove.commons.utils.StringUtils;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;


/**
 * Created by sewoong-wi on 14. 12. 24..
 */
@Controller
@RequestMapping(value = "/admin/payment")
public class PaymentController {

  private static final Logger logger = LoggerFactory.getLogger( PaymentRestController.class );
  
  @Autowired
  private CommonService commonService;
  
  @Autowired
  private PaymentService paymentService;

  @Autowired
  private ProductService productService;

  HashMap< String, Object > commonCode = new HashMap< String, Object >();

  /**
   * 웹결제ㅔ 리스트
   * @param paymentEntity
   * @param model
   * @return
   */
  @RequestMapping ( "/paymentWebList" )
  public String paymentWebList ( PaymentEntity paymentEntity, Model model ) {
	try{
	  PaymentEntity searchResult = new PaymentEntity();
	  List<String> searchValueArr = new ArrayList<String>(); 
	  Calendar oCalendar = Calendar.getInstance( );
	  if(StringUtils.isEmpty(paymentEntity.getSearchKey())) {
		  paymentEntity.setSearchKey("payment_approval_date");
		  //처음 페이지 접속시 현재달의 날짜로 세팅
		  paymentEntity.setStartDate(oCalendar.get(Calendar.YEAR)+"/"+(oCalendar.get(Calendar.MONTH) + 1)+"/01"); //시작일
		  paymentEntity.setEndDate(oCalendar.get(Calendar.YEAR)+"/"+(oCalendar.get(Calendar.MONTH) + 1)+"/"+oCalendar.getActualMaximum(Calendar.DAY_OF_MONTH)); //종료일 
		  paymentEntity.setSearchValue("1");
	  }
	  //신용카드, 핸드폰, 가상계좌의 검색값을 배열로 저장해서 넘긴다.
	  if(!StringUtils.isEmpty(paymentEntity.getSearchValue6())) {
		  searchValueArr.add(paymentEntity.getSearchValue6());
	  }
	  if(!StringUtils.isEmpty(paymentEntity.getSearchValue7())) { 
		  searchValueArr.add(paymentEntity.getSearchValue7());
	  }
	  if(!StringUtils.isEmpty(paymentEntity.getSearchValue8())) {
		  searchValueArr.add(paymentEntity.getSearchValue8());
	  }
	  
	  paymentEntity.setSearchValueArr(searchValueArr);
	  //웹결제 관리 리스트
      paymentService.getPaymentWebList( paymentEntity );
      //웹결제 관리 검색 합.
      searchResult = paymentService.getSearchResult( paymentEntity);
  	  int searchTotalPrice = 0;
  	  for(int i = 0; i < paymentEntity.getPaymentList().size();i++) {
   		searchTotalPrice += paymentEntity.getPaymentList().get(i).getPaymentNotVatTotalPrice();
   	  }
  	  ProductEntity productEntity = new ProductEntity();
  	  productEntity = productService.getProductList(productEntity);
      //공통
      commonCode.put( "navigation", "웹 결제 관리 (이 달의 결제 : <span class='colorSkyBlue'>"+searchResult.getSumCount()+"</span> 건 / <span class='colorSkyBlue'>"+searchResult.getSumTotalPrice()+"</span> 원 vat 별도)" );					// 현재 페이지 네비게이션
      commonCode.put("searchResult", "> 검색결과 : <span class='colorSkyBlue'>"+paymentEntity.getPaymentList().size()+"</span> 건 /  <span class='colorSkyBlue'>"+searchTotalPrice+"</span> vat 별도");   // 검색 결과
      commonCode.put( "mainMenu", "permissionPayment" );                      // left main menu
      commonCode.put( "subMenu", "paymentWeb" );                // left sub menu
      model.addAttribute( "CommonCode", commonCode );
      model.addAttribute( "productInfo", productEntity );
	} catch (Exception e) {
	  logger.error("PaymentController.paymentWebList", e);
	}
    return "admin/payment/paymentWebList";
  }
  /**
   * 웹결제 상세/등록
   * @param paymentEntity
   * @param model
   * @return
   */
  @RequestMapping("/paymentWebDetail")
  public String paymentWebDetail (PaymentEntity paymentEntity, Model model) {
	try{
	  PaymentEntity paymentInfo  = paymentService.getPaymentWebDetail( paymentEntity );
	  model.addAttribute("paymentInfo", paymentInfo);
	  //공통
      commonCode.put( "navigation", "웹 결제 관리 > 상세 보기" );			// 현재 페이지 네비게이션
      commonCode.put( "mainMenu", "permissionPayment" );                      // left main menu
      commonCode.put( "subMenu", "paymentWeb" );                // left sub menu
      model.addAttribute( "CommonCode", commonCode );
	} catch (Exception e) {
	  logger.error("PaymentController.paymentWebList", e);
	}
	return "admin/payment/paymentWebDetail";
  }
  /**
   * 계약 리스트
   * @param paymentEntity
   * @param model
   * @return
   */
  @RequestMapping("/paymentContractList")
  public String paymentContractList (PaymentEntity paymentEntity, Model model) {
    try{
	  PaymentEntity searchResult = new PaymentEntity();
	  Calendar oCalendar = Calendar.getInstance( );
	  if(StringUtils.isEmpty(paymentEntity.getSearchKey())) {
		  paymentEntity.setSearchKey("payment_approval_date");
		  //처음 페이지 접속시 현재달의 날짜로 세팅
		  paymentEntity.setStartDate(oCalendar.get(Calendar.YEAR)+"/"+(oCalendar.get(Calendar.MONTH) + 1)+"/01"); //시작일
		  paymentEntity.setEndDate(oCalendar.get(Calendar.YEAR)+"/"+(oCalendar.get(Calendar.MONTH) + 1)+"/"+oCalendar.getActualMaximum(Calendar.DAY_OF_MONTH)); //종료일 
	  }
	  
	  //개별 계약 관리 리스트
      paymentService.getPaymentContractList( paymentEntity );
      //개별 계약 관리 검색 합.
      searchResult = paymentService.getSearchContractResult( paymentEntity);
      
      //공통코드 
  	  CommonCodeEntity commonCodeEntity = new CommonCodeEntity();
  	  //공통코드 상품.
  	  commonCodeEntity.setCodeMasterCode(CommonCode.PRODUCT_TYPE);
  	  //공통코드 상품 코드
  	  List<CommonCodeEntity> productCode = commonService.getCommonCodeList(commonCodeEntity);
  	  //공통코드 계약 상태.
  	  commonCodeEntity.setCodeMasterCode(CommonCode.CONTRACT_STATE);
  	  //공통코드 계약상태 코드
  	  List<CommonCodeEntity> contractStateCode = commonService.getCommonCodeList(commonCodeEntity);
  	  model.addAttribute("productCode", productCode);
  	  model.addAttribute("contractStateCode", contractStateCode);
  	  int searchTotalPrice = 0;
  	  for(int i = 0; i < paymentEntity.getPaymentList().size();i++) {
  		searchTotalPrice += paymentEntity.getPaymentList().get(i).getSearchTotalPrice();
  	  }
      //공통
      commonCode.put( "navigation", "개별 계약 관리 (이 달의 매출 : <span class='colorSkyBlue'>"+searchResult.getSumCount()+"</span> 건 / <span class='colorSkyBlue'>"+String.format("%,d", searchResult.getSumTotalPrice()) + "</span> 원 vat 별도)");					// 현재 페이지 네비게이션
      commonCode.put("searchResult", "> 검색결과 : <span class='colorSkyBlue'>"+paymentEntity.getDataSize()+"</span> 건 /  <span class='colorSkyBlue'>"+String.format("%,d", searchTotalPrice)+"</span> vat 별도");   // 검색 결과
      commonCode.put( "mainMenu", "permissionPayment" );                      // left main menu
      commonCode.put( "subMenu", "paymentContract" );                // left sub menu
      model.addAttribute( "CommonCode", commonCode );
	} catch (Exception e) {
	  logger.error("PaymentController.paymentWebList", e);
	}
    return "admin/payment/paymentContractList";
  }
  /**
   * 계약 상세 / 등록
   * @param paymentEntity
   * @param model
   * @return
   */
  @RequestMapping(value = "/paymentContractDetail")
  public String paymentContractDetail(PaymentEntity paymentEntity, Model model) {
	
	List<PaymentEntity> userList = new ArrayList<PaymentEntity>();
	PaymentEntity paymentInfo = new PaymentEntity();
	//계약 상세
	paymentInfo = paymentService.getPaymentContractDetail(paymentEntity);
	model.addAttribute("paymentInfo", paymentInfo);
	//계약자 아이디
	userList = paymentService.getPaymentContractUserDetail(paymentEntity);
	model.addAttribute("userList", userList);
    //회사명
    List<String> companyNameList = commonService.searchCompanyName();
    //공통
	commonCode.put( "navigation", "개별 계약 관리 > 계약 상세" );					// 현재 페이지 네비게이션
    commonCode.put( "mainMenu", "permissionPayment" );                      // left main menu
    commonCode.put( "subMenu", "paymentContract" );                // left sub menu

    model.addAttribute( "CommonCode", commonCode );
    model.addAttribute( "companyNameList", companyNameList );
	return "admin/payment/paymentContractDetail";
  }
  /**
   * 계약 수정
   * @param paymentEntity
   * @param model
   * @return
   */
  @RequestMapping(value = "/paymentContractEdit")
  public String paymentContractEdit(PaymentEntity paymentEntity, Model model) {
	
	List<PaymentEntity> userList = new ArrayList<PaymentEntity>();
	PaymentEntity paymentInfo = new PaymentEntity();
	ProductEntity productInfo = new ProductEntity();
	//계약 상세
	paymentInfo = paymentService.getPaymentContractDetail(paymentEntity);
	model.addAttribute("paymentInfo", paymentInfo);
	//계약자 아이디
	userList = paymentService.getPaymentContractUserDetail(paymentEntity);
	model.addAttribute("userList", userList);
	//공통코드 
//	CommonCodeEntity commonCodeEntity = new CommonCodeEntity();
//    //공통코드 상품.
//    commonCodeEntity.setCodeMasterCode(CommonCode.PRODUCT_TYPE);
//    //공통코드 상품 코드
//    List<CommonCodeEntity> productCode = commonService.getCommonCodeList(commonCodeEntity);
   
    productInfo = productService.getProductList(productInfo);
    model.addAttribute("productInfo", productInfo);
    //회사명
    List<String> companyNameList = commonService.searchCompanyName();
    //공통
    String navigation = "개별 계약 관리 > 계약 등록";
    if(paymentEntity.getContractMasterKey() > CommonCode.ZERO) {
      navigation = "개별 계약 관리 > 계약 수정";
    }
	commonCode.put( "navigation", navigation);					// 현재 페이지 네비게이션
    commonCode.put( "mainMenu", "permissionPayment" );                      // left main menu
    commonCode.put( "subMenu", "paymentContract" );                // left sub menu

    model.addAttribute( "CommonCode", commonCode );
    model.addAttribute( "companyNameList", companyNameList );
	return "admin/payment/paymentContractEdit";
  }
  
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
	  
    //공통
    commonCode.put("navigation", "웹결제 통계");   // 현재 페이지 네비게이션
    commonCode.put("mainMenu", "permissionPayment");				// left main menu 
    commonCode.put("subMenu", "paymentWebReport");				// left sub menu
    model.addAttribute("CommonCode", commonCode);
	return "admin/payment/paymentWebReport"; 
  }
  
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
	  
    //공통
    commonCode.put("navigation", "개별 계약 통계");   // 현재 페이지 네비게이션
    commonCode.put("mainMenu", "permissionPayment");				// left main menu 
    commonCode.put("subMenu", "paymentContractReport");				// left sub menu
    model.addAttribute("CommonCode", commonCode);
	return "admin/payment/paymentContractReport"; 
  }
}
