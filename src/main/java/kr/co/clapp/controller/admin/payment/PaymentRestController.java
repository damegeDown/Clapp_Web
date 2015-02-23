package kr.co.clapp.controller.admin.payment;

import kr.co.clapp.constants.CommonCode;
import kr.co.clapp.constants.ResultCode;
import kr.co.clapp.entities.MemberEntity;
import kr.co.clapp.entities.PaymentEntity;
import kr.co.clapp.entities.ResponseEntity;
import kr.co.clapp.entities.ResultEntity;
import kr.co.clapp.service.common.CommonService;
import kr.co.clapp.service.payment.PaymentService;
import kr.co.digigroove.commons.messages.Messages;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 * Created by sewoong-wi on 14. 12. 24..
 */
@RestController
@RequestMapping (value = "/admin/payment/rest")
public class PaymentRestController {
  private static final Logger logger = LoggerFactory.getLogger( PaymentRestController.class );
	
  @Autowired
  private PaymentService paymentService;
  @Autowired
  private CommonService commonService;
  @Autowired
  private Messages messages;
	
  /**
   * 결제 취소
   * @param paymentEntity
   * @return
   */
  @RequestMapping(value="/cancelPayment")
  public ResponseEntity cancelPayment(PaymentEntity paymentEntity) {
	ResponseEntity result = new ResponseEntity();
	try {
	  String resultCode = ResultCode.FAIL; 
	  String resultMessage = messages.getMessage("cancelPaymet.fail");
	  if(paymentService.cancelPayment(paymentEntity) > CommonCode.ZERO) {
		resultCode = ResultCode.SUCCESS;
		resultMessage = messages.getMessage("cancelPaymet.success"); 
		result.setResultURL("/admin/payment/paymentWebList");
	  }
	  result.setResultCode(resultCode);
	  result.setResultMSG(resultMessage);
	} catch (Exception e) {
	  logger.error("PaymentRestController.cancelPayment:Faild" , e);
	}
		
	return result;
  }
  /**
   * 현금영수증 신청
   * @param id
   * @return
   */
  @RequestMapping(value="/insertRequestBill")
  public ResponseEntity insertRequestBill(@RequestParam(required = false, value = "id") int id) {
    ResponseEntity result = new ResponseEntity();
    PaymentEntity paymentEntity = new PaymentEntity();
    String resultCode = ResultCode.FAIL; 
    String resultMessage = messages.getMessage("requestBill.fail");
    try {
      paymentEntity.setPaymentMasterKey(id);
      if(paymentService.insertRequestBill(paymentEntity) > CommonCode.ZERO) {
        resultCode = ResultCode.SUCCESS;
        resultMessage = messages.getMessage("requestBill.success"); 
        result.setResultURL("/admin/payment/paymentWebDetail?paymentMasterKey="+id);
      }
    } catch (Exception e) {
	  logger.error("PaymentRestController.insertRequestBill:Faild" , e);
	  resultCode = ResultCode.FAIL; 
      resultMessage = messages.getMessage("requestBill.fail");
    }
    result.setResultCode(resultCode); 
    result.setResultMSG(resultMessage);
    return result;
  }
  /**
   * 계약등록
   * @param paymentEntity
   * @return
   */
  @RequestMapping(value="/insertContract")
  public ResponseEntity insertContract(PaymentEntity paymentEntity) {
	ResponseEntity result = new ResponseEntity();
	String resultCode = ResultCode.FAIL;
	String resultMessage = messages.getMessage("contract.insret.fail");
	String resultURL = "";
	try {
	  if(paymentService.insertContract(paymentEntity) > CommonCode.ZERO) {
		resultCode = ResultCode.SUCCESS;
	    resultMessage = messages.getMessage("contract.insret.success");
	    resultURL = "/admin/payment/paymentContractList";
	  }
	} catch (Exception e) {
      logger.error("PaymentRestController.insertContract:Faild" , e);
	}
	result.setResultCode(resultCode);
    result.setResultMSG(resultMessage);
    result.setResultURL(resultURL);
	return result; 
  }
  /**
   * 계약 수정
   * @param paymentEntity
   * @return
   */
  @RequestMapping(value="/modifyContract")
  public ResponseEntity modifyContract(PaymentEntity paymentEntity) {
	ResponseEntity result = new ResponseEntity();
	String resultCode = ResultCode.FAIL;
	String resultMessage = messages.getMessage("contract.modify.fail");
	String resultURL = "";
	try {
	  if(paymentService.modifyContract(paymentEntity) > CommonCode.ZERO) {
		resultCode = ResultCode.SUCCESS;
		resultMessage = messages.getMessage("contract.modify.success");
		resultURL = "/admin/payment/paymentContractList";
	  }
	} catch (Exception e) {
      logger.error("PaymentRestController.modifyContract:Faild" , e);
	}
	result.setResultCode(resultCode);
	result.setResultMSG(resultMessage);
	result.setResultURL(resultURL);
	return result; 
  }
  
  /**
   * 계약 상태 수정
   * @param paymentEntity
   * @return
   */
  @RequestMapping(value="/modifyContractState")
  public ResponseEntity modifyContractState(@RequestParam(required = false, value = "id") int contractMasterKey) {
	ResponseEntity result = new ResponseEntity();
	PaymentEntity paymentEntity = new PaymentEntity();
	String resultCode = ResultCode.FAIL;
	String resultMessage = messages.getMessage("contract.close.fail");
	String resultURL = "";
	try {
	  paymentEntity.setContractMasterKey(contractMasterKey);
	  if(paymentService.modifyContractState(paymentEntity) > CommonCode.ZERO) {
		resultCode = ResultCode.SUCCESS;
		resultMessage = messages.getMessage("contract.close.success");
		resultURL = "/admin/payment/paymentContractList";
	  }
	} catch (Exception e) {
      logger.error("PaymentRestController.modifyContractState:Faild" , e);
	}
	result.setResultCode(resultCode);
	result.setResultMSG(resultMessage);
	result.setResultURL(resultURL);
	return result; 
  }
  
}
