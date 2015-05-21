package kr.co.clapp.dao;

import kr.co.clapp.entities.PaymentEntity;

import java.util.List;

/**
 * Created by sewoong-wi on 14. 12. 26..
 */
public interface PaymentDAO {

  int getPaymentWebListCount ( PaymentEntity paymentEntityParam );

  List<PaymentEntity> getPaymentWebList ( PaymentEntity paymentEntityParam );

  PaymentEntity getPaymentWebDetail(PaymentEntity paymentEntity);

  List<PaymentEntity> getPaymentLogsList(PaymentEntity paymentEntity);

  int cancelPayment(PaymentEntity paymentEntity);

  int insertRequestBill(PaymentEntity paymentEntity);

  PaymentEntity getSearchResult(PaymentEntity paymentEntity);

  List<PaymentEntity> getPaymentContractList(PaymentEntity paymentEntity);

    PaymentEntity getPaymentContractListCount(PaymentEntity paymentEntity);
  
  PaymentEntity getSearchContractResult(PaymentEntity paymentEntity);

  int insertContract(PaymentEntity paymentEntity);

  int insertContractUser(PaymentEntity paymentEntity);

  PaymentEntity getPaymentContractDetail(PaymentEntity paymentEntity);

  List<PaymentEntity> getPaymentContractUserDetail(PaymentEntity paymentEntity);

  int modifyContract(PaymentEntity paymentEntity);
  
  int removeContractUser(PaymentEntity paymentEntity);

  int modifyContractState(PaymentEntity paymentEntity);

  List<PaymentEntity> getPaymentWebReport(PaymentEntity paymentEntity);

  List<PaymentEntity> getPaymentContractReport(PaymentEntity paymentEntity);

  int insertPayment(PaymentEntity paymentEntity);
  
  int insertPaymentDetail(PaymentEntity paymentEntity);

  PaymentEntity getPaymentInfo(PaymentEntity paymentEntity);

  int insPayment(PaymentEntity PaymentEntity);

  int updPayment(PaymentEntity paymentInfo);

  int updPaymentMaster(PaymentEntity paymentInfo);

  PaymentEntity getPaymentListCount(PaymentEntity paymentParam);

  List<PaymentEntity> getPaymentList(PaymentEntity paymentParam);

int getProductInfo(PaymentEntity paymentEntity);

List<PaymentEntity> getUserMasterKeyList(PaymentEntity paymentEntity);

PaymentEntity getContractInfo(PaymentEntity paymentEntity);
}
 