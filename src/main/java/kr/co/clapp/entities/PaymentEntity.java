package kr.co.clapp.entities;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

/**
 * Created by sewoong-wi on 14. 12. 26..
 */
public class PaymentEntity extends PageEntity implements Serializable {

  private static final long serialVersionUID = -6193798899381297101L;

  public PaymentEntity () {
    super( serialVersionUID );
  }

  /* PaymentMaster */
  private int    paymentMasterKey;              //결제번호
  private String paymentOid;				//결제번호(주문번호)
  private String paymentTid;					//유플러스 결제번호
  private int 	userMasterKey;				//회원 키
  private int    paymentCount;              //결제건수
  private int paymentFinishCount;			//결제완료 건수
  private int PaymentWaitCount;			//결제 대기 건수
  private String    paymentState;               //결제상태
  private String paymentStateText;           //결제상태 텍스트
  private Date   paymentDate;                //결제일
  private String   paymentApprovalDate;        //결제 승인일
  private String    paymentType;                //결제 타입
  private String paymentTypeText;            //결제 타입 텍스트
  private String paymentName;                //결제자명
  private String paymentUserId;              //결제자 아이디
  private String paymentCompanyNumber;       //사업자번호
  private int productMasterKey;         //신청 상품 키
  private String paymentProductName;         //신청상품
  private int paymentProductPrice;           //신청금액
  private int paymentUseTime;           //사용가능시간
  private int paymentTicketAmount;           //티켓 수
  private int paymentNotVatTotalPrice;       //결제금액(vat미포함, 원)
  private int paymentTotalPrice;             //결제금액(vat포함, 원)
  private String paymentCancelReason;        //결제취소 사유
  private String paymentCancelPerson;        //결제 취소자
  private Date   paymentCancelDate;          //결제 취소일
  private String  userCompanyNumber;		 //사업자등록번호
  private Date paymentStartDate;				//사용기간 -시작 
  private Date paymentEndDate;				//사용기간 -종료
  
  /* PaymentDetail */
  private String paymentCardNumber;          //결제 카드번호
  private String    paymentInstallment;         //할부 계월수
  private String paymentCardCompanyCode;     //카드사 코드
  private String paymentCellphoneNumber;     //결제 핸드폰 번호
  private String paymentMobileAgency;        //통신사
  private String paymentAccountNumber;       //계좌번호
  private String paymentAccountHolder;       //예금주
  private String paymentBankCode;            //은행명
  private String paymentBankName;            //은행명
  private String paymentBillReceiptNumber;	//현금영수증 승인 번호
  private String paymentBillRequestState;    //현금영수증 신청상태 (1:미신청, 2:신청, 3:발생)
  private String paymentPurposeType;         //신청 사유 (1:소득공제, 2: 지출증빙)
  private Date   paymentBillRequestDate;     //현금영수증 신청일
  private Date   paymentBillPublicationDate; //현금영수증 발행일
  private String paymentBillEmail;           //현금영수증 신청 이메일
  private String paymentBillMemo;            //현금영수증 메모

  /* PaymentLogs */
  private String logsCode;                   //로그 코드
  private String logsMessage;                //로그 메시지
  private Date   insertLogsDate;             //로그 날짜

  /* ContractMaster*/
  private String contractTid;			 //계약번호
  private int contractMasterKey;			 //개별계약 키
  private Date contractStartDate;			 //계약 시작일
  private Date contractEndDate;				 //계약 종료일
  private Date contractBillPublicationDate;	 //세금계산서 발행일
  private int contractTotalPrice;			 //계약 총금액(vat포함)
  private int contractNotVatTotalPrice;		 //계약 총금액(vat미포함)
  private String contractPaymentMethod;		 //결제방법(TEXT 로입력)
  private String contractCompanyName;		 //회사명
  private String contractCompanyNumber;		 //사업자번호
  private String contractProductName;		 //상품이름
  private int contractTicketAmount;			 //티케숫
  private int contractExpirationDate;		 //유효기간(+일자)
  private int contractState;				 //이용타입(1:이용, 2:정지, 3:해지)
  private String contractStateText;			 //이용타입(1:이용, 2:정지, 3:해지)
  private String contractUseStopReason;      //이용 정지 사유
  private String contractUseCloseReason;     //이용 해지 사유
  private String contractOperatorName;       //담당자
  private Date	contractInsertDate;			 //등록일
  private Date	contractUseCloseDate;			 //종료일
  
  /* ContractUser */
  private String contractUserId;			 //계약자 아이디
  private List<?> contractUserIdArr;			 //계약자 아이디
  private List<?> userMasterKeyArr;			 //계약자 키

  
  private int searchCount;					 //겸색 갯수
  private int searchTotalPrice;				 //검색 금액
  private int sumCount;					     //누적 갯수
  private int sumTotalPrice;		 //계약 금액 총합
  private List<PaymentEntity> userIdList;	 //계약자 리스트
  private List<PaymentEntity> paymentList;   //DataList
  private int productExpirationDate;      //유효기간

  
  private int idx;				// 결제 인덱스
	private int paymentMasteKey;
	private String payStateCd;	// 결제 상태 코드
	private String payStateNm;	// 결제 상태명
	private String payTypeCd;		// 결제 타입 코드
	private String payTypeNm;		// 결제 타입명
	private String regDt;
	
	/**
	 * LG UPlus 결제 결과 응답 파라미터
	 */
	private String mid;				// LGD_MID.			LG UPlus에서 부여한 상점 ID
	private String oid;				// LGD_OID.			상점 거래번호
	private String tid;				// LGD_TID.			LG UPlus 거래번호
	private int amount;				// LGD_AMOUNT.		결제금액
	private String productInfo;	// LGD_PRODUCTINFO.	구매내역
	private String payType;		// LGD_PAYTYPE.		결제수단코드
	private String payDt;			// LGD_PAYDATE.		결제일시
	
	private String financeCode;	// LGD_FINANCECODE.	결제기관코드
	private String financeName;	// LGD_FINANCENAME.	결제기관명
	private String buyer;			// LGD_BUYER.		구매자명
	private String buyerId;		// LGD_BUYERID.		구매자 아이디
	private String buyerEmail;		// LGD_BUYEREMAIL.	구매자 이메일
	private String buyerPhone;		// LGD_BUYERPHONE.	구매자 휴대폰
	
	private String mertKey;		//상점키
	private String authData;
	/**
	 * 신용카드 추가 파라미터
	 */
	private String cardNum;				// LGD_CARDNUM.				신용카드번호(일반 가맹점은 *처리됨)
	private String isCardInterest;		// LGD_CARDNOINTYN.			신용카드 무이자여부(1:무이자, 0:일반)
	private String cardInstallMonth;		// LGD_CARDINSTALLMONTH.	신용카드할부개월
	private String cardAcquirer;			// LGD_CARDACQUIRER.		카드사 코드번호
	
	/**
	 * 현금영수증 추가 파라미터 (계좌이체, 무통장)
	 */
	private String cashReceiptSelfYn;	// LGD_CASHRECEIPTSelfYN.	현금영수증 자진발급제 유무
	private String cashReceiptKind;		// LGD_CASHRECEIPTKIND.		현금영수증 종류. (0: 소득공제용, 1: 지출증빙용)
	private String cashReceiptNum;		// LGD_CASHRECEIPTNUM.		현금영수증 승인번호(현금영수증 건이 아니거나 실패인경우 '0')
	
	/**
	 * 무통장 추가 파라미터
	 */
	private String payer;			    // LGD_PAYER.		입금자명
	private String accountNum;		// LGD_ACCOUNTNUM.	입금할 계좌번호
	private String casTamount;		// LGD_CASTAMOUNT.	입금누적금액
	private String casCamount;		// LGD_CASCAMOUNT.	현입금금액
	private String casFlag;		        // LGD_CASFLAG.		거래종류(R:할당, I:입금, C:취소)
	private String casSeqNo;		    // LGD_CASSEQNO.	가상계좌일련번호

	
  public int getPaymentMasterKey() {
	return paymentMasterKey;
 }

  public void setPaymentMasterKey(int paymentMasterKey) {
	this.paymentMasterKey = paymentMasterKey;
  }

  public String getPaymentOid() {
	return paymentOid;
  }

  public void setPaymentOid(String paymentOid) {
	this.paymentOid = paymentOid;
  }

  public String getPaymentTid() {
	return paymentTid;
  }

  public void setPaymentTid(String paymentTid) {
	this.paymentTid = paymentTid;
  }
 
  public int getUserMasterKey() {
	return userMasterKey;
  }

  public void setUserMasterKey(int userMasterKey) {
	this.userMasterKey = userMasterKey;
  }

  public int getPaymentCount() {
	return paymentCount;
  }

  public void setPaymentCount(int paymentCount) {
	this.paymentCount = paymentCount;
  }

  public int getPaymentFinishCount() {
	return paymentFinishCount;
}

public void setPaymentFinishCount(int paymentFinishCount) {
	this.paymentFinishCount = paymentFinishCount;
}

public int getPaymentWaitCount() {
	return PaymentWaitCount;
  }

  public void setPaymentWaitCount(int paymentWaitCount) {
	PaymentWaitCount = paymentWaitCount;
  }

  public String getPaymentState () {
    return paymentState;
  }

  public void setPaymentState ( final String paymentStateParam ) {
    paymentState = paymentStateParam;
  }

  public String getPaymentStateText () {
    return paymentStateText;
  }

  public void setPaymentStateText ( final String paymentStateTextParam ) {
    paymentStateText = paymentStateTextParam;
  }

  public Date getPaymentDate () {
    return paymentDate;
  }

  public void setPaymentDate ( final Date paymentDateParam ) {
    paymentDate = paymentDateParam;
  }

  public String getPaymentApprovalDate () {
    return paymentApprovalDate;
  }

  public void setPaymentApprovalDate ( final String paymentApprovalDateParam ) {
    paymentApprovalDate = paymentApprovalDateParam;
  }

  public String getPaymentType () {
    return paymentType;
  }

  public void setPaymentType ( final String paymentTypeParam ) {
    paymentType = paymentTypeParam;
  }

  public String getPaymentTypeText () {
    return paymentTypeText;
  }

  public void setPaymentTypeText ( final String paymentTypeTextParam ) {
    paymentTypeText = paymentTypeTextParam;
  }

  public String getPaymentName () {
    return paymentName;
  }

  public void setPaymentName ( final String paymentNameParam ) {
    paymentName = paymentNameParam;
  }

  public String getPaymentUserId () {
    return paymentUserId;
  }

  public void setPaymentUserId ( final String paymentUserIdParam ) {
    paymentUserId = paymentUserIdParam;
  }

  public String getPaymentCompanyNumber () {
    return paymentCompanyNumber;
  }

  public void setPaymentCompanyNumber ( final String paymentCompanyNumberParam ) {
    paymentCompanyNumber = paymentCompanyNumberParam;
  }

  public int getProductMasterKey() {
	return productMasterKey;
}

public void setProductMasterKey(int productMasterKey) {
	this.productMasterKey = productMasterKey;
}

public String getPaymentProductName () {
    return paymentProductName;
  }

  public void setPaymentProductName ( final String paymentProductNameParam ) {
    paymentProductName = paymentProductNameParam;
  }

  public int getPaymentProductPrice () {
    return paymentProductPrice;
  }

  public void setPaymentProductPrice ( final int paymentProductPrice ) {
	  this.paymentProductPrice = paymentProductPrice;
  }

  public int getPaymentUseTime() {
	return paymentUseTime;
}

public void setPaymentUseTime(int paymentUseTime) {
	this.paymentUseTime = paymentUseTime;
}

public int getPaymentTicketAmount () {
    return paymentTicketAmount;
  }

  public void setPaymentTicketAmount ( final int paymentTicketAmountParam ) {
    paymentTicketAmount = paymentTicketAmountParam;
  }

  public Number getPaymentTotalPrice () {
    return paymentTotalPrice;
  }

  public void setPaymentTotalPrice ( final int paymentTotalPrice ) {
    this.paymentTotalPrice = paymentTotalPrice;
  }

  
  public int getPaymentNotVatTotalPrice() {
	return paymentNotVatTotalPrice;
  }

  public void setPaymentNotVatTotalPrice(int paymentNotVatTotalPrice) {
	this.paymentNotVatTotalPrice = paymentNotVatTotalPrice;
  }

  public String getPaymentCancelReason () {
    return paymentCancelReason;
  }

  public void setPaymentCancelReason ( final String paymentCancelReasonParam ) {
    paymentCancelReason = paymentCancelReasonParam;
  }

  public String getPaymentCancelPerson () {
    return paymentCancelPerson;
  }

  public void setPaymentCancelPerson ( final String paymentCancelPersonParam ) {
    paymentCancelPerson = paymentCancelPersonParam;
  }

  public Date getPaymentCancelDate () {
    return paymentCancelDate;
  }

  public void setPaymentCancelDate ( final Date paymentCancelDateParam ) {
    paymentCancelDate = paymentCancelDateParam;
  }

  public String getPaymentCardNumber () {
    return paymentCardNumber;
  }

  public void setPaymentCardNumber ( final String paymentCardNumberParam ) {
    paymentCardNumber = paymentCardNumberParam;
  }

  public String getPaymentInstallment () {
    return paymentInstallment;
  }

  public void setPaymentInstallment ( final String paymentInstallmentParam ) {
    paymentInstallment = paymentInstallmentParam;
  }

  public String getPaymentCardCompanyCode () {
    return paymentCardCompanyCode;
  }

  public void setPaymentCardCompanyCode ( final String paymentCardCompanyCodeParam ) {
    paymentCardCompanyCode = paymentCardCompanyCodeParam;
  }

  public String getPaymentCellphoneNumber () {
    return paymentCellphoneNumber;
  }

  public void setPaymentCellphoneNumber ( final String paymentCellphoneNumberParam ) {
    paymentCellphoneNumber = paymentCellphoneNumberParam;
  }

  public String getPaymentMobileAgency () {
    return paymentMobileAgency;
  }

  public void setPaymentMobileAgency ( final String paymentMobileAgencyParam ) {
    paymentMobileAgency = paymentMobileAgencyParam;
  }

  public String getPaymentAccountNumber () {
    return paymentAccountNumber;
  }

  public void setPaymentAccountNumber ( final String paymentAccountNumberParam ) {
    paymentAccountNumber = paymentAccountNumberParam;
  }

  public String getPaymentAccountHolder () {
    return paymentAccountHolder;
  }

  public void setPaymentAccountHolder ( final String paymentAccountHolderParam ) {
    paymentAccountHolder = paymentAccountHolderParam;
  }

  public String getPaymentBankCode () {
    return paymentBankCode;
  }

  public void setPaymentBankCode ( final String paymentBankCodeParam ) {
    paymentBankCode = paymentBankCodeParam;
  }

  public String getPaymentBankName() {
	return paymentBankName;
}

public void setPaymentBankName(String paymentBankName) {
	this.paymentBankName = paymentBankName;
}

public String getPaymentBillReceiptNumber() {
	return paymentBillReceiptNumber;
}

public void setPaymentBillReceiptNumber(String paymentBillReceiptNumber) {
	paymentBillReceiptNumber = paymentBillReceiptNumber;
}

public String getPaymentBillRequestState () {
    return paymentBillRequestState;
  }

  public void setPaymentBillRequestState ( final String paymentBillRequestStateParam ) {
    paymentBillRequestState = paymentBillRequestStateParam;
  }

  public String getPaymentPurposeType () {
    return paymentPurposeType;
  }

  public void setPaymentPurposeType ( final String paymentPurposeTypeParam ) {
    paymentPurposeType = paymentPurposeTypeParam;
  }

  public Date getPaymentBillRequestDate () {
    return paymentBillRequestDate;
  }

  public void setPaymentBillRequestDate ( final Date paymentBillRequestDateParam ) {
    paymentBillRequestDate = paymentBillRequestDateParam;
  }

  public Date getPaymentBillPublicationDate () {
    return paymentBillPublicationDate;
  }

  public void setPaymentBillPublicationDate ( final Date paymentBillPublicationDateParam ) {
    paymentBillPublicationDate = paymentBillPublicationDateParam;
  }

  public String getPaymentBillEmail () {
    return paymentBillEmail;
  }

  public void setPaymentBillEmail ( final String paymentBillEmailParam ) {
    paymentBillEmail = paymentBillEmailParam;
  }

  public String getPaymentBillMemo () {
    return paymentBillMemo;
  }

  public void setPaymentBillMemo ( final String paymentBillMemoParam ) {
    paymentBillMemo = paymentBillMemoParam;
  }

  public String getLogsCode () {
    return logsCode;
  }

  public void setLogsCode ( final String logsCodeParam ) {
    logsCode = logsCodeParam;
  }

  public String getLogsMessage () {
    return logsMessage;
  }

  public void setLogsMessage ( final String logsMessageParam ) {
    logsMessage = logsMessageParam;
  }

  public Date getInsertLogsDate () {
    return insertLogsDate;
  }

  public void setInsertLogsDate ( final Date insertLogsDateParam ) {
    insertLogsDate = insertLogsDateParam;
  }

  public List< PaymentEntity > getPaymentList () {
    return paymentList;
  }

  public void setPaymentList ( final List< PaymentEntity > paymentListParam ) {
    paymentList = paymentListParam;
  }

  public String getUserCompanyNumber() {
	return userCompanyNumber;
  }

  public void setUserCompanyNumber(String userCompanyNumber) {
	this.userCompanyNumber = userCompanyNumber;
  }


  public Date getPaymentStartDate() {
	return paymentStartDate;
} 

public void setPaymentStartDate(Date paymentStartDate) {
	this.paymentStartDate = paymentStartDate;
}

public Date getPaymentEndDate() {
	return paymentEndDate;
}

public void setPaymentEndDate(Date paymentEndDate) {
	this.paymentEndDate = paymentEndDate;
}

public int getSearchCount() {
	return searchCount;
  }

  public void setSearchCount(int searchCount) {
	this.searchCount = searchCount;
  }

  public String getContractTid() {
	return contractTid;
}

public void setContractTid(String contractTid) {
	this.contractTid = contractTid;
}

public int getContractMasterKey() {
	return contractMasterKey;
  }
	
  public void setContractMasterKey(int contractMasterKey) {
	this.contractMasterKey = contractMasterKey;
  }
	
  public Date getContractStartDate() {
	return contractStartDate;
  }
	
  public void setContractStartDate(Date contractStartDate) {
	this.contractStartDate = contractStartDate;
  }
	
  public Date getContractEndDate() {
	return contractEndDate;
  }
	
  public void setContractEndDate(Date contractEndDate) {
	this.contractEndDate = contractEndDate;
  }
	
  public Date getContractBillPublicationDate() {
	return contractBillPublicationDate;
  }
	
  public void setContractBillPublicationDate(Date contractBillPublicationDate) {
	this.contractBillPublicationDate = contractBillPublicationDate;
  }
	
  public int getContractTotalPrice() {
	return contractTotalPrice;
  }
	
  public void setContractTotalPrice(int contractTotalPrice) {
	this.contractTotalPrice = contractTotalPrice;
  }
  

  public int getContractNotVatTotalPrice() {
	return contractNotVatTotalPrice;
  }
	
  public void setContractNotVatTotalPrice(int contractNotVatTotalPrice) {
	this.contractNotVatTotalPrice = contractNotVatTotalPrice;
  }
	
  public String getContractPaymentMethod() {
	return contractPaymentMethod;
  }
	
  public void setContractPaymentMethod(String contractPaymentMethod) {
	this.contractPaymentMethod = contractPaymentMethod;
  }
	
  public String getContractCompanyName() {
	return contractCompanyName;
  }
	
  public void setContractCompanyName(String contractCompanyName) {
	this.contractCompanyName = contractCompanyName;
  }
	
  public String getContractCompanyNumber() {
	return contractCompanyNumber;
  }
	
  public void setContractCompanyNumber(String contractCompanyNumber) {
	this.contractCompanyNumber = contractCompanyNumber;
  }
	
  public String getContractProductName() {
	return contractProductName;
  }
	
  public void setContractProductName(String contractProductName) {
	this.contractProductName = contractProductName;
  }
	
  public int getContractTicketAmount() {
	return contractTicketAmount;
  }
	
  public void setContractTicketAmount(int contractTicketAmount) {
	this.contractTicketAmount = contractTicketAmount;
  }
	
  public int getContractExpirationDate() {
	return contractExpirationDate;
  }
	
  public void setContractExpirationDate(int contractExpirationDate) {
	this.contractExpirationDate = contractExpirationDate;
  }
	
  public int getContractState() {
	return contractState;
  }
	
  public void setContractState(int contractState) {
	this.contractState = contractState;
  }

  public String getContractStateText() {
	return contractStateText;
  }

  public void setContractStateText(String contractStateText) {
	this.contractStateText = contractStateText;
  }

  public String getContractUseStopReason() {
	return contractUseStopReason;
  }

  public void setContractUseStopReason(String contractUseStopReason) {
	this.contractUseStopReason = contractUseStopReason;
  }

  public String getContractUseCloseReason() {
	return contractUseCloseReason;
  }

  public void setContractUseCloseReason(String contractUseCloseReason) {
	this.contractUseCloseReason = contractUseCloseReason;
  }

  public String getContractOperatorName() {
	return contractOperatorName;
  }
	
  public void setContractOperatorName(String contractOperatorName) {
	this.contractOperatorName = contractOperatorName;
  }
	
  public Date getContractInsertDate() {
	return contractInsertDate;
  }
	
  public void setContractInsertDate(Date contractInsertDate) {
	this.contractInsertDate = contractInsertDate;
  }
	
  public Date getContractUseCloseDate() {
	return contractUseCloseDate;
  }

  public void setContractUseCloseDate(Date contractUseCloseDate) {
	this.contractUseCloseDate = contractUseCloseDate;
  }

  public String getContractUserId() {
	return contractUserId;
  }
	
  public void setContractUserId(String contractUserId) {
	this.contractUserId = contractUserId;
  }
	
  public List<PaymentEntity> getUserIdList() {
	return userIdList;
  }
	
  public void setUserIdList(List<PaymentEntity> userIdList) {
	this.userIdList = userIdList;
  }

  public int getSearchTotalPrice() {
	return searchTotalPrice;
  }

  public void setSearchTotalPrice(int searchTotalPrice) {
	this.searchTotalPrice = searchTotalPrice;
  }

  public int getSumCount() {
	return sumCount;
  }

  public void setSumCount(int sumCount) {
	this.sumCount = sumCount;
  }

  public int getSumTotalPrice() {
	return sumTotalPrice;
  }

  public void setSumTotalPrice(int sumTotalPrice) {
	this.sumTotalPrice = sumTotalPrice;
  }

  public List<?> getContractUserIdArr() {
	return contractUserIdArr;
  }

  public void setContractUserIdArr(List<?> contractUserIdArr) {
	this.contractUserIdArr = contractUserIdArr;
  }

	public List<?> getUserMasterKeyArr() {
	return userMasterKeyArr;
}

public void setUserMasterKeyArr(List<?> userMasterKeyArr) {
	this.userMasterKeyArr = userMasterKeyArr;
}

	public int getProductExpirationDate() {
		return productExpirationDate;
	}
	
	public void setProductExpirationDate(int productExpirationDate) {
		this.productExpirationDate = productExpirationDate;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public int getPaymentMasteKey() {
		return paymentMasteKey;
	}

	public void setPaymentMasteKey(int paymentMasteKey) {
		this.paymentMasteKey = paymentMasteKey;
	}

	public String getPayStateCd() {
		return payStateCd;
	}

	public void setPayStateCd(String payStateCd) {
		this.payStateCd = payStateCd;
	}

	public String getPayStateNm() {
		return payStateNm;
	}

	public void setPayStateNm(String payStateNm) {
		this.payStateNm = payStateNm;
	}

	public String getPayTypeCd() {
		return payTypeCd;
	}

	public void setPayTypeCd(String payTypeCd) {
		this.payTypeCd = payTypeCd;
	}

	public String getPayTypeNm() {
		return payTypeNm;
	}

	public void setPayTypeNm(String payTypeNm) {
		this.payTypeNm = payTypeNm;
	}

	public String getRegDt() {
		return regDt;
	}

	public void setRegDt(String regDt) {
		this.regDt = regDt;
	}

	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

	public String getOid() {
		return oid;
	}

	public void setOid(String oid) {
		this.oid = oid;
	}

	public String getTid() {
		return tid;
	}

	public void setTid(String tid) {
		this.tid = tid;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public String getProductInfo() {
		return productInfo;
	}

	public void setProductInfo(String productInfo) {
		this.productInfo = productInfo;
	}

	public String getPayType() {
		return payType;
	}

	public void setPayType(String payType) {
		this.payType = payType;
	}

	public String getPayDt() {
		return payDt;
	}

	public void setPayDt(String payDt) {
		this.payDt = payDt;
	}

	public String getFinanceCode() {
		return financeCode;
	}

	public void setFinanceCode(String financeCode) {
		this.financeCode = financeCode;
	}

	public String getFinanceName() {
		return financeName;
	}

	public void setFinanceName(String financeName) {
		this.financeName = financeName;
	}

	public String getBuyer() {
		return buyer;
	}

	public void setBuyer(String buyer) {
		this.buyer = buyer;
	}

	public String getBuyerId() {
		return buyerId;
	}

	public void setBuyerId(String buyerId) {
		this.buyerId = buyerId;
	}

	public String getBuyerEmail() {
		return buyerEmail;
	}

	public void setBuyerEmail(String buyerEmail) {
		this.buyerEmail = buyerEmail;
	}

	public String getBuyerPhone() {
		return buyerPhone;
	}

	public void setBuyerPhone(String buyerPhone) {
		this.buyerPhone = buyerPhone;
	}

	public String getCardNum() {
		return cardNum;
	}

	public void setCardNum(String cardNum) {
		this.cardNum = cardNum;
	}

	public String getIsCardInterest() {
		return isCardInterest;
	}

	public void setIsCardInterest(String isCardInterest) {
		this.isCardInterest = isCardInterest;
	}

	public String getCardInstallMonth() {
		return cardInstallMonth;
	}

	public void setCardInstallMonth(String cardInstallMonth) {
		this.cardInstallMonth = cardInstallMonth;
	}

	public String getCardAcquirer() {
		return cardAcquirer;
	}

	public void setCardAcquirer(String cardAcquirer) {
		this.cardAcquirer = cardAcquirer;
	}

	public String getCashReceiptSelfYn() {
		return cashReceiptSelfYn;
	}

	public void setCashReceiptSelfYn(String cashReceiptSelfYn) {
		this.cashReceiptSelfYn = cashReceiptSelfYn;
	}

	public String getCashReceiptKind() {
		return cashReceiptKind;
	}

	public void setCashReceiptKind(String cashReceiptKind) {
		this.cashReceiptKind = cashReceiptKind;
	}

	public String getCashReceiptNum() {
		return cashReceiptNum;
	}

	public void setCashReceiptNum(String cashReceiptNum) {
		this.cashReceiptNum = cashReceiptNum;
	}

	public String getPayer() {
		return payer;
	}

	public void setPayer(String payer) {
		this.payer = payer;
	}

	public String getAccountNum() {
		return accountNum;
	}

	public void setAccountNum(String accountNum) {
		this.accountNum = accountNum;
	}

	public String getCasTamount() {
		return casTamount;
	}

	public void setCasTamount(String casTamount) {
		this.casTamount = casTamount;
	}

	public String getCasCamount() {
		return casCamount;
	}

	public void setCasCamount(String casCamount) {
		this.casCamount = casCamount;
	}

	public String getCasFlag() {
		return casFlag;
	}

	public void setCasFlag(String casFlag) {
		this.casFlag = casFlag;
	}

	public String getCasSeqNo() {
		return casSeqNo;
	}

	public void setCasSeqNo(String casSeqNo) {
		this.casSeqNo = casSeqNo;
	}

	public String getMertKey() {
		return mertKey;
	}

	public void setMertKey(String mertKey) {
		this.mertKey = mertKey;
	}

	public String getAuthData() {
		return authData;
	}

	public void setAuthData(String authData) {
		this.authData = authData;
	}

	
}

