package kr.co.clapp.controller.user.myClapp;


import kr.co.clapp.constants.CommonCode;
import kr.co.clapp.constants.ResultCode;
import kr.co.clapp.entities.*;
import kr.co.clapp.service.applyform.ApplyformService;
import kr.co.clapp.service.common.CommonService;
import kr.co.clapp.service.customer.CustomerService;
import kr.co.clapp.service.file.AdministrationFileService;
import kr.co.clapp.service.mailing.MailingService;
import kr.co.clapp.service.member.MemberService;
import kr.co.clapp.service.payment.PaymentService;
import kr.co.clapp.service.product.ProductService;
import kr.co.clapp.service.ticket.TicketService;
import kr.co.digigroove.commons.entities.SavedFileEntity;
import kr.co.digigroove.commons.messages.Messages;
import kr.co.digigroove.commons.utils.HashUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping(value="/myClapp/rest")
public class MyClappRestController {
	private static final Logger logger = LoggerFactory.getLogger( MyClappController.class );
	@Autowired
	private CommonService commonService;
	@Autowired
	private ProductService productService;
	@Autowired
	private PaymentService paymentService;
	@Autowired
	private MemberService memberService;
	@Autowired
	private CustomerService customerService;
	
	@Autowired
	private Messages messages;
	
	@Autowired
	private AdministrationFileService administrationFileService;
	@Autowired
	private MailingService mailingService;
    @Autowired
    private ApplyformService applyformService;
    @Autowired
    private TicketService ticketService;
	public MyClappRestController() {
	}
	
	/**
	 * 결제정보 해쉬데이터 암호화
	 * @param payInfo
	 * @return
	 */
	@RequestMapping("/encryptHashdata")
	public ResponseEntity encryptHashdata(PayLgdInfo payInfo) {
		ResponseEntity response = new ResponseEntity();
		try {
			response.setResultDATA(payInfo.encryptHashdata());
			response.setResultCode(ResultCode.SUCCESS);
		} catch(Exception e) {
			response.setResultCode(ResultCode.FAIL);
			 logger.error("MyClappRestController.encryptHashdata:Faild" , e);
		}
		return response;
	} 
	@RequestMapping("/doPayment")
	public ResponseEntity doPayment(HttpServletRequest request, PaymentEntity paymentEntity, Model model) {
		ResponseEntity resultMap = new ResponseEntity();
		try {
			int cnt = paymentService.getProductInfo(paymentEntity);
			if(paymentService.getProductInfo(paymentEntity) > CommonCode.ZERO) {
				resultMap = paymentService.doPayment(request, paymentEntity, model);
			} else { //사용중인 상품과 다른 상품 구매시도 시
				resultMap.setResultCode(CommonCode.FAIL);
				resultMap.setResultMSG(messages.getMessage("payment.insert.notused"));
			}
			
		} catch(Exception e) {
			resultMap.setResultCode(ResultCode.FAIL);
			logger.error("MyClappRestController.doPayment:Faild" , e);
		}
		return resultMap;
	}
	/**
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/responseVirtualAcct")
	public String responseVirtualAcct(HttpServletRequest request) {
		String result = "FAIL";
		ResponseEntity resultMap = new ResponseEntity();
		try {
			resultMap = paymentService.responseVirtualAcct(request);
			if(resultMap.getResultCode().equals(CommonCode.SUCCESS)) {
				result = "OK";
			}
		} catch (Exception e) {
			resultMap.setResultCode(ResultCode.FAIL);
			logger.error("MyClappRestController.responseVirtualAcct:Faild" , e);
		}
		return result;
	}
    /**
     * 태스팅 신청 등록
     * @param applyFormEntity
     * @return
     */
    @RequestMapping(value = "/insertApplyForm", method = RequestMethod.POST)
    public ResponseEntity insertApplyForm(
            ApplyFormEntity applyFormEntity,
            TicketEntity ticketEntity,
            TicketEntity ticketParam,
            ProductEntity productEntity,
            ProductEntity productParm,
            MemberEntity memberEntity,
            HttpSession session,MultipartHttpServletRequest req){

            ResponseEntity result= new ResponseEntity();
            AdministrationFileEntity administrationFileEntity = new AdministrationFileEntity();
            List<TicketEntity> ticketList = null;
            int ticketProductMasterKey = 0;
            String  productType= null;
        try {

            MemberEntity userInfo =  new MemberEntity();
            userInfo = (MemberEntity) session.getAttribute(CommonCode.Session.USER_LOGIN_SESSION);
            String resultMessage = messages.getMessage("insert.success");


            memberEntity.setUserMasterKey(userInfo.getUserMasterKey());//멤버키 설정
            ticketList = ticketService.getPrioritieTicketKey(memberEntity);//사용순위가 우선인 티켓 정보 가져온다
            if(ticketList.size() > CommonCode.FAIL_NO) {
                ticketProductMasterKey = ticketList.get(0).getProductMasterKey();//티켓 정보의 마스터 키 가져온다
                productParm.setProductMasterKey(ticketProductMasterKey); // 상품 정복에 마스터키 전달
                productEntity = productService.getProductInfo(productParm);//상품 정보 가져온다
                productType = productEntity.getProductType(); //상품 type 값을 가져온다
                applyFormEntity.setUserMasterKey(userInfo.getUserMasterKey()); //userMasterKey 값을 set
                applyFormEntity.setApplyType(productType);
                applyformService.insertApplyForm(applyFormEntity);

            }else{
                resultMessage = messages.getMessage("insert.faile.pay");
                result.setResultMSG(resultMessage);
                result.setResultURL("/myClapp/myTestRequest");
            }



            // 파일 업로드
            if(req.getFileNames().hasNext()) {
                administrationFileEntity.setFileTargetKey(applyFormEntity.getApplyFormKey());
                administrationFileEntity.setFileTarget(CommonCode.FILE_TARGET_APPLYFORM);
                administrationFileEntity.setThumbYn(CommonCode.FILE_THUMB_N);

                //파일 등록

                this.saveFileForFormData(req, administrationFileEntity);
//                this.removeFile(administrationFileEntity);
            }
            //result.setResultCode(resultCode);
            result.setResultMSG(resultMessage);
            result.setResultURL("/myClapp/myTestRequest");
        } catch (Exception e) {
            logger.error("MyClappRestController.insertApplyForm:Faild" , e);
            result.setResultCode(ResultCode.FAIL);
            result.setResultMSG(messages.getMessage("insert.fail"));
        }

        return result;
    }
	/**
	 * 1:1문의 등록
	 * @param inquiryEntity
	 * @return
	 */
	@RequestMapping(value = "/insertInquiry",  method = RequestMethod.POST)
	public ResponseEntity insertInquiry(ServiceInquiryEntity inquiryEntity, MultipartHttpServletRequest req) {
      ResponseEntity result = new ResponseEntity();
	  AdministrationFileEntity administrationFileEntity = new AdministrationFileEntity();
	  try {
		String resultCode = ResultCode.FAIL;
		String resultMessage = messages.getMessage("insert.fail");
//		if(customerService.insertInquiry(inquiryEntity) > CommonCode.ZERO) {
//		  resultCode = ResultCode.SUCCESS;
//		  resultMessage = messages.getMessage("insert.success"); 
//		  result.setResultURL("/myClapp/myInquiryComplet");
//		  // 파일 업로드
//		  if(req.getFileNames().hasNext()) {
//			  administrationFileEntity.setFileTargetKey(inquiryEntity.getServiceInquiryKey());
//			  administrationFileEntity.setFileTarget(CommonCode.FILE_TARGET_INQUIRY);
//			  administrationFileEntity.setThumbYn(CommonCode.FILE_THUMB_N);
//			  this.saveFileForFormData(req, administrationFileEntity);
//		  }
//		}
		result.setResultCode(resultCode);
		result.setResultMSG(resultMessage); 
	  } catch (Exception e) {
		logger.error("DeviceRestController.insertDevice:Faild" , e);
		result.setResultCode(ResultCode.FAIL);
		result.setResultMSG(messages.getMessage("insert.fail"));
	  }
	  return result;
	}
	/**
	 * 파일 저장
	 * @param req
	 * @param administrationFileEntity
	 * @return
	 */
	public List<SavedFileEntity> saveFileForFormData(MultipartHttpServletRequest req, AdministrationFileEntity administrationFileEntity) {
		List<SavedFileEntity> saveFileList = new ArrayList<SavedFileEntity>();
		try {
			administrationFileService.removeAdministrationFile(administrationFileEntity);
			saveFileList = administrationFileService.saveFileForFormData(req, administrationFileEntity);
		} catch (Exception e) {
			logger.error("MyClappRestController.saveFileForFormData" , e);
		}
		
		return saveFileList;
	}
	
	/**
	 * 파일 저장
	 * @param administrationFileEntity
	 * @param administrationFileEntity
	 * @return
	 */
	public void removeFile(AdministrationFileEntity administrationFileEntity) {
		try {
			administrationFileService.removeFile(administrationFileEntity);
		} catch (Exception e) {
			logger.error("MyClappRestController.removeFile" , e);
		}
		
	}
	
	/**
	 * 1:1문의 등록
	 * @param memberEntity
	 * @return
	 */
	@RequestMapping(value = "/doPasswordConfirm",  method = RequestMethod.POST)
	public ResponseEntity doPasswordConfirm(MemberEntity memberEntity, HttpSession session) {
		MemberEntity userInfo =  new MemberEntity();
		userInfo = (MemberEntity) session.getAttribute(CommonCode.Session.USER_LOGIN_SESSION);
		ResponseEntity result = new ResponseEntity();
		try {
			String passParam = HashUtils.encryptSHA256(memberEntity.getUserPassword());
			String passSession = userInfo.getUserPassword();
			if(passParam.equals(passSession)) {
				result.setResultURL("/myClapp/myInfo");
			} else {
				result.setResultMSG("비밀번호를 확인해주세요.");
			}
		} catch (Exception e) {
			logger.error("MyClappRestController.doPasswordConfirm" , e);
		}
		return result;
	}
	
	@RequestMapping(value="/modifyUserInfo", method = RequestMethod.POST)
	public ResponseEntity modifyUsreInfo(MemberEntity memberEntity, HttpSession session) {
		MemberEntity userInfo =  new MemberEntity();
		userInfo = (MemberEntity) session.getAttribute(CommonCode.Session.USER_LOGIN_SESSION);
		memberEntity.setUserMasterKey(userInfo.getUserMasterKey());
		ResponseEntity result = new ResponseEntity();
		try {
			if(memberService.modifyMember(memberEntity) > CommonCode.ZERO) {
				result.setResultCode(CommonCode.SUCCESS);
				result.setResultMSG(messages.getMessage("modify.success"));
				result.setResultURL("/myClapp/myInfo");
			} else { 
				result.setResultCode(CommonCode.FAIL);
				result.setResultMSG(messages.getMessage("modify.fail"));
			}
		} catch (Exception e) {
			logger.error("MyClappRestController.modifyUsreInfo" , e);
		}
		return result;
		
	}
	
	/**
	 * 회원 탈퇴
	 * @param dropOutUserEntity
	 * @param session
	 * @return
	 */
	@RequestMapping(value="/doDropOut", method = RequestMethod.POST)
	public ResponseEntity doDropOut(DropOutUserEntity dropOutUserEntity, HttpSession session) {
		ResponseEntity result = new ResponseEntity();
		MemberEntity userInfo =  new MemberEntity();
		userInfo = (MemberEntity) session.getAttribute(CommonCode.Session.USER_LOGIN_SESSION);
		EcrmEntity ecrmEntity = new EcrmEntity();
		try {
			if(userInfo.getUserType().equals(CommonCode.USER_MEMBER)){
				dropOutUserEntity.setUserName(userInfo.getUserName());
			} else {
				dropOutUserEntity.setUserName(userInfo.getUserCompanyName());
			}
			dropOutUserEntity.setUserMasterKey(userInfo.getUserMasterKey());
			dropOutUserEntity.setDropOutUserId(userInfo.getUserId());
			dropOutUserEntity.setDropOutReason("-");
			dropOutUserEntity.setDropOutReasonCode("6");
			dropOutUserEntity.setDropOutPerson("본인");
			result.setResultCode(CommonCode.FAIL);
			result.setResultMSG(messages.getMessage("dropout.member.fail"));
			if(memberService.insertDropOutUser(dropOutUserEntity) > CommonCode.ZERO){
				result.setResultCode(CommonCode.SUCCESS);
				result.setResultURL("/myClapp/dropOutComplet");
//				session.invalidate();
				if(mailingService.sendDropOutMemberMail(dropOutUserEntity) > CommonCode.ZERO) { 
		  	    	  // 메일 발송 성공
			      ecrmEntity.setMailState(CommonCode.SUCCESS_NO);
			    } else {
			    	  //메일 발송 실패
			      ecrmEntity.setMailState(CommonCode.FAIL_NO);
			    }
			}
		} catch (Exception e) {
			result.setResultCode(CommonCode.FAIL);
			result.setResultMSG(messages.getMessage("dropout.member.fail"));
			logger.error("MyClappRestController.doDropOut" , e);
		}
		return result;
	}
}
