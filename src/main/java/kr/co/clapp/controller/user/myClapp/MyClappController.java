package kr.co.clapp.controller.user.myClapp;


import java.security.NoSuchAlgorithmException;
import java.util.List;

import javax.servlet.http.HttpSession;

import kr.co.clapp.service.common.CommonService;
import kr.co.clapp.service.member.MemberService;
import kr.co.clapp.service.payment.PaymentService;
import kr.co.clapp.service.product.ProductService;
import kr.co.clapp.service.ticket.TicketService;
import kr.co.clapp.utils.ValidationResultUtils;
import kr.co.clapp.constants.CommonCode;
import kr.co.clapp.controller.CommonController;
import kr.co.clapp.entities.CommonCodeEntity;
import kr.co.clapp.entities.MemberEntity;
import kr.co.clapp.entities.PayLgdInfo;
import kr.co.clapp.entities.PaymentEntity;
import kr.co.clapp.entities.ProductEntity;
import kr.co.clapp.entities.ResponseEntity;
import kr.co.clapp.entities.ResultEntity;
import kr.co.clapp.entities.ServiceInquiryEntity;
import kr.co.clapp.entities.TicketEntity;
import kr.co.clapp.entities.validation.FormBindingResultEntity;
import kr.co.clapp.entities.validation.FormUserInfoEntity;
import kr.co.clapp.entities.validation.FormUserInfoEntity.ModifyPass;
import kr.co.digigroove.commons.utils.HashUtils;
import kr.co.digigroove.commons.utils.StringUtils;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping(value="/myClapp")
public class MyClappController {
	private static final Logger logger = LoggerFactory.getLogger( MyClappController.class );
	@Autowired
	private CommonController commonController;
	@Autowired
	private CommonService commonService;
	@Autowired
	private ProductService productService;
	@Autowired
	private MemberService memberService;
	@Autowired
	private PaymentService paymentService;
	@Autowired
	private TicketService ticketService;
	
	 @Value("#{pay_prop['mid']}")
	private String cstMid;
	 
	public MyClappController() {
	}
	/**
	 * 상품 결제
	 * @param productEntity
	 * @param productMasterKey
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping(value="/payment")
	public String payment(
			 ProductEntity productEntity,
			 @RequestParam(required = false, value = "productMasterKey") int productMasterKey,
			 Model model,
			 HttpSession session
			) {
		MemberEntity userInfo =  new MemberEntity();
		userInfo = (MemberEntity) session.getAttribute(CommonCode.Session.USER_LOGIN_SESSION);
		try {
			/*상품 정보*/
			productEntity.setProductMasterKey(productMasterKey);
			productEntity = productService.getProductInfo(productEntity);
			model.addAttribute("productInfo", productEntity);
//			productEntity = productService.getProductList(productEntity);
			/*공통코드*/
			CommonCodeEntity commonCodeEntity = new CommonCodeEntity();
			/*공통코드 핸드폰*/
	  	  	commonCodeEntity.setCodeMasterCode(CommonCode.CELL_PHONE_NUM);
	  	  	List<CommonCodeEntity> cellPhoneCode = commonService.getCommonCodeList(commonCodeEntity);
	  	  	model.addAttribute("cellPhoneCode", cellPhoneCode);	
	  	  	
	  	  	// 결제 인증요청 초기값 설정
			PayLgdInfo payLgdInfo = commonController.initPayInfo(userInfo);
			payLgdInfo.setLGD_PRODUCTINFO(productEntity.getProductName());		// 상품 정보
			model.addAttribute("payLgdInfo", payLgdInfo);
			model.addAttribute("userInfo", userInfo);
		} catch  (Exception e) {
			  logger.error("MyClappController.payment:Faild" , e);
		}
		return "user/myClapp/payment";
	}
	/**
	 * 상품 결제 성공
	 * @param paymentEntity
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/paymentComplete")
	public String paymentComplete(PaymentEntity paymentEntity, Model model) {
		try {
			/*결제 정보*/
			PaymentEntity paymentInfo = paymentService.getPaymentInfo(paymentEntity);
			model.addAttribute("paymentInfo",paymentInfo);
			/*결제 회원 정보*/
			MemberEntity memberEntity = new MemberEntity();
			memberEntity.setUserMasterKey(paymentInfo.getUserMasterKey());
			MemberEntity memberInfo = memberService.getUserInfo(memberEntity);
			model.addAttribute("memberInfo",memberInfo);
		} catch  (Exception e) {
			  logger.error("MyClappController.paymentComplete:Faild" , e);
		}
		return "user/myClapp/paymentComplete";
	}
	/**
	 *  상품 결제 실패
	 * @param paymentEntity
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/paymentFail")
	public String paymentFail(PaymentEntity paymentEntity, Model model) {
		try {
	  	  
		} catch  (Exception e) {
			  logger.error("MyClappController.paymentFail:Faild" , e);
		}
		return "user/myClapp/paymentFail";
	}
	
	/**
	 * 이용현황
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/myTicket")
	public String myTicket(TicketEntity ticketParam, Model model, HttpSession session) {
		MemberEntity memberSession = (MemberEntity) session.getAttribute(CommonCode.Session.USER_LOGIN_SESSION);
		TicketEntity ticketInfo = new TicketEntity();
		TicketEntity ticketHistoryInfo = new TicketEntity();
		TicketEntity ticketSearchCount = new TicketEntity();
        ProductEntity productEntity = new ProductEntity();
		try {
			/** 티켓정보 */
			ticketParam.setUserMasterKey(memberSession.getUserMasterKey());
			ticketInfo = ticketService.selectTicketInfo(ticketParam);
		  	/** 예약내역 */
            ticketParam.setSearchValue3(ticketParam.getSearchValue3().replace("<br/>",""));
			ticketHistoryInfo = ticketService.selectTicketUsedHistory(ticketParam);
			/** 공통코드*/
			CommonCodeEntity commonCodeEntity = new CommonCodeEntity();
			/** 예약상태*/
	  	  	commonCodeEntity.setCodeMasterCode(CommonCode.RESERVATION_STATUS);
	  	  	List<CommonCodeEntity> reservationStatus = commonService.getCommonCodeList(commonCodeEntity);
	  	  	model.addAttribute("reservationStatus", reservationStatus);
	  	  	/** 제조사목록*/
	  	  	List<TicketEntity> makerList = commonService.getMobileMaker();
	  	    model.addAttribute("makerList", makerList);
	  	    /** 디바이스목록*/
	  	  	List<TicketEntity> deviceList = commonService.getDevice();
            /** 상품 목록 */
            productEntity = productService.getProductList(productEntity);

            model.addAttribute("deviceList", deviceList);
            model.addAttribute("productList", productEntity.getProductList());
		} catch  (Exception e) {
			logger.error("MyClappController.myTicket:Faild" , e);
		}
		model.addAttribute("ticketInfo", ticketInfo);
		model.addAttribute("ticketHistoryInfo", ticketHistoryInfo);
		return "user/myClapp/myTicket";
	}
	
	/**
	 * 티켓 적립/차감
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/myHistory")
	public String myHistory(TicketEntity ticketParam,HttpSession session, Model model) {
		MemberEntity userInfo =  new MemberEntity();
		userInfo = (MemberEntity) session.getAttribute(CommonCode.Session.USER_LOGIN_SESSION);
		TicketEntity ticketInfo = new TicketEntity();
        ProductEntity productEntity = new ProductEntity();
		try {
			ticketParam.setUserMasterKey(userInfo.getUserMasterKey());
            /** 적립/차감 리스트 */
            if(!StringUtils.isEmpty(ticketParam.getSearchValue2())){
                ticketParam.setSearchValue2(ticketParam.getSearchValue2().replace("<br/>",""));
            }
			ticketInfo = ticketService.getMyHistory(ticketParam);

            /** 상품 목록 */
            productEntity = productService.getProductList(productEntity);
            model.addAttribute("productList", productEntity.getProductList());
		} catch  (Exception e) {
			  logger.error("MyClappController.myHistory:Faild" , e);
		}
		model.addAttribute("ticketHistoryInfo", ticketInfo);
		return "user/myClapp/myHistory";
	}
	
	/**
	 * 결제 내역
	 * @param model
	 * @return
	 * @throws NoSuchAlgorithmException 
	 */
	@RequestMapping(value="/myPayment")
	public String myPayment(PaymentEntity paymentParam, Model model, HttpSession session) throws NoSuchAlgorithmException {
		MemberEntity userInfo =  new MemberEntity();
		userInfo = (MemberEntity) session.getAttribute(CommonCode.Session.USER_LOGIN_SESSION);
		PayLgdInfo payLgdInfo = commonController.initPayInfo(userInfo);
		try {
			/** 공통코드*/
			CommonCodeEntity commonCodeEntity = new CommonCodeEntity();
			/** 결제방법*/
	  	  	commonCodeEntity.setCodeMasterCode(CommonCode.PAYMENT_TYPE);
	  	  	List<CommonCodeEntity> paymentType = commonService.getCommonCodeList(commonCodeEntity);
	  	  	model.addAttribute("paymentType", paymentType);
	  	  	/** 상품목록*/
	  	  	List<ProductEntity> productList = commonService.getProduct();
	  	  	model.addAttribute("productList", productList);
	  	  	/** 결제 목록 */
	  	  	paymentParam.setUserMasterKey(userInfo.getUserMasterKey());
	  	    paymentParam = paymentService.getPaymentList(paymentParam);
	  	    if(!StringUtils.isEmpty(paymentParam.getPaymentList())) {
		  	    for(int i = 0; i < paymentParam.getPaymentList().size(); i++) {
		  	    	PaymentEntity payments = paymentParam.getPaymentList().get(i);
		  	    	String mid = payLgdInfo.getLGD_MID();
		  			String tid = payments.getPaymentTid();
		  			String mertkey = payLgdInfo.getLGD_MERTKEY();
		  			String authData = payLgdInfo.encryptHashdata(mid, tid, mertkey);
	
		  			paymentParam.setMid(mid);
		  			paymentParam.getPaymentList().get(i).setPaymentTid(tid); 
		  			paymentParam.setMertKey(mertkey);
		  			paymentParam.getPaymentList().get(i).setAuthData(authData);
		  	    }
	  	    }
		} catch  (Exception e) {
			  logger.error("MyClappController.myPayment:Faild" , e);
		}
		
		model.addAttribute("paymentInfo", paymentParam);
		return "user/myClapp/myPayment";
	}
	
	/**
	 * 1:1 문의
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/myInquiry")
	public String myInquiry(ServiceInquiryEntity inquiryEntity, Model model) {
		try {
			/*공통코드*/
			CommonCodeEntity commonCodeEntity = new CommonCodeEntity();
			/*공통코드 핸드폰*/
	  	  	commonCodeEntity.setCodeMasterCode(CommonCode.CELL_PHONE_NUM);
	  	  	List<CommonCodeEntity> cellPhoneCode = commonService.getCommonCodeList(commonCodeEntity);
	  	  	model.addAttribute("cellPhoneCode", cellPhoneCode);	
		} catch  (Exception e) {
			  logger.error("MyClappController.myInquiry:Faild" , e);
		}
		model.addAttribute("inquiryInfo", inquiryEntity);
		return "user/myClapp/myInquiry";
	}
	/**
	 * 1:1 문의 성공
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/myInquiryComplet")
	public String myInquiryComplet(ServiceInquiryEntity inquiryEntity, Model model) {
		return "user/myClapp/myInquiryComplet";
	}
	/**
	 * 비밀번호 확인
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/passwordConfirm")
	public String passwordConfirm(Model model) {
		try {
			
		} catch  (Exception e) {
			logger.error("MyClappController.myInfo:Faild" , e);
		}
		return "user/myClapp/passwordConfirm";
	}
	/**
	 * 정보 수정/확인
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/myInfo")
	public String myInfo(Model model, HttpSession session) {
		MemberEntity userInfo =  new MemberEntity();
		userInfo = (MemberEntity) session.getAttribute(CommonCode.Session.USER_LOGIN_SESSION);
		try {
			/*공통코드*/
			CommonCodeEntity commonCodeEntity = new CommonCodeEntity();
			/*공통코드 핸드폰*/
	  	  	commonCodeEntity.setCodeMasterCode(CommonCode.CELL_PHONE_NUM);
	  	  	List<CommonCodeEntity> cellPhoneCode = commonService.getCommonCodeList(commonCodeEntity);
	  	  	model.addAttribute("cellPhoneCode", cellPhoneCode);	
	  	  	/**회원 정보*/
	  	  	userInfo = memberService.getMemberDetail(userInfo);
		} catch  (Exception e) {
			logger.error("MyClappController.myInfo:Faild" , e);
		}
		model.addAttribute("userInfo",  userInfo);
		return "user/myClapp/myInfo";
	}
	/**
	 * 비밀번호 확인
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/modifyPassword")
	public String modifyPassword(Model model) {
		try {
			
		} catch  (Exception e) {
			logger.error("MyClappController.modifyPassword:Faild" , e);
		}
		return "user/myClapp/modifyPassword";
	}
	@RequestMapping(value="/doModifyPassword", method=RequestMethod.POST)
	public String modifyPassword(
			@ModelAttribute("formUsreInfoEntity") @Validated(ModifyPass.class) FormUserInfoEntity formUserInfoEntity, 
			BindingResult bindingResult,
			HttpSession session) {
		MemberEntity userInfo =  new MemberEntity();
		userInfo = (MemberEntity) session.getAttribute(CommonCode.Session.USER_LOGIN_SESSION);
		FormBindingResultEntity resultEntity = new FormBindingResultEntity();
		String returnUrl = "user/myClapp/modifyPassword";
		try {
			resultEntity.setResultEntity(ValidationResultUtils.formValidationResult(formUserInfoEntity, ModifyPass.class));
			if(resultEntity.getCode().equals(CommonCode.SUCCESS)) {
				formUserInfoEntity.setUserMasterKey(userInfo.getUserMasterKey());
				formUserInfoEntity.setUserPassword(HashUtils.encryptSHA256(formUserInfoEntity.getUserPassword()));
				memberService.modifyPasswrod(formUserInfoEntity);
				session.invalidate();
				returnUrl = "user/myClapp/modifyPasswordComplet";
			}
		} catch (Exception e ) {
			logger.error("MyClappController.modifyPassword:Faild" , e);
		}
		
		return returnUrl;
	}
	/**
	 * 회원탈퇴
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/dropOut")
	public String dropOut(Model model) {
		try {
			
		} catch  (Exception e) {
			logger.error("MyClappController.dropOut:Faild" , e);
		}
		return "user/myClapp/dropOut";
	}
	/**
	 * 회원탈퇴
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/dropOutComplet")
	public String dropOutComplet(Model model , HttpSession session) {
		try {
			session.invalidate();
		} catch  (Exception e) {
			logger.error("MyClappController.dropOut:Faild" , e);
		}
		return "user/myClapp/dropOutComplet";
	}
}
