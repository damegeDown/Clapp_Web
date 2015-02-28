package kr.co.clapp.service.payment;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import kr.co.clapp.entities.PaymentEntity;
import kr.co.clapp.entities.ResponseEntity;

import org.springframework.ui.Model;

/**
 * Created by sewoong-wi on 14. 12. 26..
 */
public interface PaymentService {

  PaymentEntity getPaymentWebList (PaymentEntity paymentEntity);

  PaymentEntity getPaymentWebDetail(PaymentEntity paymentEntity);

  int cancelPayment(PaymentEntity paymentEntity);

  int insertRequestBill(PaymentEntity paymentEntity);

  PaymentEntity getSearchResult(PaymentEntity paymentEntity);

  PaymentEntity getPaymentContractList(PaymentEntity paymentEntity);

  PaymentEntity getSearchContractResult(PaymentEntity paymentEntity);

  int insertContract(PaymentEntity paymentEntity);
  
  int modifyContract(PaymentEntity paymentEntity);

  PaymentEntity getPaymentContractDetail(PaymentEntity paymentEntity);

  List<PaymentEntity> getPaymentContractUserDetail(PaymentEntity paymentEntity);

  int modifyContractState(PaymentEntity paymentEntity);

  List<PaymentEntity> getPaymentWebReport(PaymentEntity paymentEntity);

  List<PaymentEntity> getPaymentContractReport(PaymentEntity paymentEntity);

  ResponseEntity doPayment(HttpServletRequest request,PaymentEntity paymentEntity, Model model);

  ResponseEntity responseVirtualAcct(HttpServletRequest request);

  PaymentEntity getPaymentInfo(PaymentEntity paymentEntity);

  int getAvailableTicket(PaymentEntity paymentInfo);

  PaymentEntity getPaymentList(PaymentEntity paymentParam);

  int getProductInfo(PaymentEntity paymentEntity);

}
