package kr.co.clapp.service.payment.impl;

import kr.co.clapp.constants.CommonCode;
import kr.co.clapp.dao.PaymentDAO;
import kr.co.clapp.dao.ProductDAO;
import kr.co.clapp.dao.TicketDAO;
import kr.co.clapp.entities.*;
import kr.co.clapp.service.mailing.MailingService;
import kr.co.clapp.service.payment.PaymentService;
import kr.co.clapp.utils.Utils;
import kr.co.digigroove.commons.utils.DateUtils;
import lgdacom.XPayClient.XPayClient;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;

/**
 * Created by sewoong-wi on 14. 12. 26..
 */
@Service
@Transactional(readOnly=true)
public class PaymentServiceImpl implements PaymentService {
    private static final Logger logger = LoggerFactory.getLogger(PaymentServiceImpl.class);

    @Autowired
    private PaymentDAO paymentDAO ;
    @Autowired
    private TicketDAO ticketDAO;
    @Autowired
    private ProductDAO productDAO;
    @Autowired
    private MailingService mailingService;
    @Autowired
    private PaymentService paymentService;

    @Value("#{pay_prop['configPath']}")
    private String configPath;
    @Value("#{pay_prop['mertKey']}")
    private String mertKey;

    @Override
    public PaymentEntity getPaymentWebList ( PaymentEntity paymentEntity ) {
        paymentEntity.setPageParams();
        paymentEntity.setPageSize( paymentEntity.PAGE_LIST_SIZE_PARAM, paymentEntity.PAGE_GROUP_SIZE_PARAM );
        paymentEntity.setDataSize( paymentDAO.getPaymentWebListCount( paymentEntity ) );
        paymentEntity.setPaymentList( paymentDAO.getPaymentWebList( paymentEntity ) );
        return paymentEntity;
    }

    @Override
    public PaymentEntity getSearchResult(PaymentEntity paymentEntity) {
        return paymentDAO.getSearchResult(paymentEntity);
    }

    @Override
    public PaymentEntity getPaymentWebDetail(PaymentEntity paymentEntity) {
        paymentEntity = paymentDAO.getPaymentWebDetail(paymentEntity);
        paymentEntity.setPaymentList(paymentDAO.getPaymentLogsList(paymentEntity));

        return paymentEntity;
    }

    @Override
    @Transactional(readOnly=false)
    public int cancelPayment(PaymentEntity paymentEntity) {
        int result = 0;
        TicketEntity ticketInfo = new TicketEntity();

        result = paymentDAO.cancelPayment(paymentEntity);
        if(result > CommonCode.ZERO){
            ticketInfo.setTargetKey(paymentEntity.getPaymentMasterKey());
            ticketInfo.setUserMasterKey(paymentEntity.getUserMasterKey());
            ticketInfo.setPaymentTid(paymentEntity.getPaymentTid());
            this.cancelUserTicket(ticketInfo);
        }
        return result;
    }

    /**
     * 결제 취소시 티켓 수정
     * @param ticketParam
     * @return
     */
    @Transactional(readOnly=false, rollbackFor=Throwable.class)
    private int cancelUserTicket(TicketEntity ticketParam) {
        int result = 0;
        //자신의 취소할 티켓 히스토리를 불러옴
        TicketEntity ticketHistoryInfo = ticketDAO.selectTicketHistory(ticketParam);
        //자신의 티켓정보를 불러옴
        //TicketEntity ticketInfo = ticketDAO.selectTicketInfo(ticketHistoryInfo);
        //자신이 취소할 티켓 히스토리의 다음 히스토리를 불러옴
        //TicketEntity nextTicketHistoryInfo = ticketDAO.nextTicketHistoryInfo(ticketInfo);

        //ticketParam.setUserMasterKey(ticketHistoryInfo.getUserMasterKey());
        //ticketParam.setProductName(nextTicketHistoryInfo.getProductName());

//        //취소할 티켓 다음 상품 정보가 Free일 경우
//        if("Free".equals(nextTicketHistoryInfo.getProductName())){
//            ticketParam.setTicketAmount(0);
//            ticketParam.setTicketAvilableAmount(0);
//            ticketParam.setTicketStartExpirationDate(nextTicketHistoryInfo.getTicketStartExpirationDate());
//            ticketParam.setTicketEndExpirationDate(nextTicketHistoryInfo.getTicketEndExpirationDate());
//        } else {
//            //자신의 티켓정보에서 취소할 티켓수만큼 뺌
//            int ticket = ticketInfo.getTicketAmount() - ticketHistoryInfo.getTicketAvilableAmount() ;
//            int avilableTicket = ticketInfo.getTicketAvilableAmount() - ticketHistoryInfo.getTicketAvilableAmount();
//            Date endDate = Utils.getAddNowDate(ticketInfo.getTicketEndExpirationDate(), (ticketHistoryInfo.getExpirationDate() * -1) -1);
//
//            ticketParam.setTicketAmount(ticket);
//            ticketParam.setTicketAvilableAmount(avilableTicket);
//            ticketParam.setTicketEndExpirationDate(endDate);
//        }
//        //취소할 히스토리 삭제
        ticketDAO.removeUserTicketHistory(ticketParam);


        ticketDAO.deleteUserTicketMaster(ticketParam);
        ticketParam.setUseYn("Y");
        result = ticketDAO.modifyUserTicketMasterUse(ticketParam);

        return result;
    }

    @Override
    @Transactional(readOnly=false)
    public int insertRequestBill(PaymentEntity paymentEntity) {
        return paymentDAO.insertRequestBill(paymentEntity);
    }

    @Override
    public PaymentEntity getPaymentContractList(PaymentEntity paymentEntity) {
        PaymentEntity paymentCount = new PaymentEntity();
        List<PaymentEntity> paymentList = null;
        paymentCount = paymentDAO.getPaymentContractListCount( paymentEntity );
        paymentEntity.setPageParams();
        paymentEntity.setPageSize(paymentEntity.PAGE_LIST_SIZE_PARAM, paymentEntity.PAGE_GROUP_SIZE_PARAM);
        paymentEntity.setDataSize(paymentCount.getDataSize());
        paymentList = paymentDAO.getPaymentContractList( paymentEntity );
        paymentEntity.setSumTotalPrice(paymentCount.getSumTotalPrice());
        paymentEntity.setPaymentList( paymentList );
        return paymentEntity;
    }

    @Override
    public PaymentEntity getSearchContractResult(PaymentEntity paymentEntity) {
        return paymentDAO.getSearchContractResult(paymentEntity);
    }

    /**
     * 개별 계약 등록
     */
    @Override
    @Transactional(readOnly=false)
    public int insertContract(PaymentEntity paymentEntity) {
        int result = CommonCode.ZERO;
        PayLgdInfo payLgdInfo = new PayLgdInfo();
        TicketEntity ticketInfo = new TicketEntity();
        String tid = payLgdInfo.createOrderNo();
        List<String> userIdArr = null;
        List<String> userKeyArr = null;
        paymentEntity.setContractTid(tid);

        /** 개별 계약 등록*/
        result = paymentDAO.insertContract(paymentEntity);

        if(result > CommonCode.ZERO) {
            /** 개별 계약 회원 등록*/
            userIdArr = (List<String>) paymentEntity.getContractUserIdArr();
            userKeyArr = (List<String>) paymentEntity.getUserMasterKeyArr();

            for(int i = 0; i < userIdArr.size(); i++) {
                paymentEntity.setContractUserId(userIdArr.get(i));
                paymentEntity.setUserMasterKey(Integer.parseInt(userKeyArr.get(i)));
                paymentEntity.setContractTid(tid);
                result = paymentDAO.insertContractUser(paymentEntity);

                /**티켓저장*/
                ticketInfo.setTargetKey(paymentEntity.getContractMasterKey());
                ticketInfo.setUserMasterKey(Integer.parseInt(userKeyArr.get(i)));
                ticketInfo.setProductMasterKey(paymentEntity.getProductMasterKey());	//상품키
                ticketInfo.setProductName(paymentEntity.getContractProductName());		//상품이름
                ticketInfo.setPaymentTid(tid);															//tid
                ticketInfo.setTicketAmount(paymentEntity.getContractTicketAmount());    //티켓수
                ticketInfo.setTicketAvilableAmount(paymentEntity.getContractTicketAmount()); //사용가능 티켓
                ticketInfo.setTicketStartExpirationDate(paymentEntity.getContractStartDate());	//사용가능기한-시작
                ticketInfo.setTicketEndExpirationDate(paymentEntity.getContractEndDate());	//사용가능기한-종료
                ticketInfo.setExpirationDate(paymentEntity.getContractExpirationDate());	//유효기간(일로 표시)
                ticketInfo.setTicketApplyDate(DateUtils.getDate());
                ticketInfo.setTicketStartExpirationDate(paymentEntity.getTicketStartExpirationDate());
                ticketInfo.setTicketEndExpirationDate(paymentEntity.getTicketEndExpirationDate());
                /** 티켓 히스토리에 저장*/
                ticketInfo.setUseYn("Y");
                this.insertUserTicketMaster(ticketInfo);
                //ticketDAO.insertUserTicketHistory(ticketInfo);

                /** 선택한 회원을 기업회원으로 변경 */
                ticketDAO.updateUserType(paymentEntity);
            }
        }
        return  result;
    }


    @Override
    public PaymentEntity getPaymentContractDetail(PaymentEntity paymentEntity) {
        return paymentDAO.getPaymentContractDetail(paymentEntity);
    }

    @Override
    public List<PaymentEntity> getPaymentContractUserDetail(PaymentEntity paymentEntity) {
        return paymentDAO.getPaymentContractUserDetail(paymentEntity);
    }
    /**
     * 개별 계약 수정
     */
    @Override
    @Transactional(readOnly=false)
    public int modifyContract(PaymentEntity paymentEntity) {
        int result = CommonCode.ZERO;
        TicketEntity ticketInfo = new TicketEntity();
        PaymentEntity paymentParam = paymentEntity;
        List<String> userIdArr = null;
        List<String> userKeyArr = null;
        userIdArr = (List<String>) paymentEntity.getContractUserIdArr();
        userKeyArr = (List<String>) paymentEntity.getUserMasterKeyArr();

        /** 상품에 묶여있는 기존 회원들의 티켓 마스터의 값을 삭제한다. */
        this.removeUserTicketMaster(paymentParam);
        result = paymentDAO.modifyContract(paymentParam);
        if(result > CommonCode.ZERO) {


            /** 상품에 묶여있는 회원 삭제*/
            if(paymentDAO.removeContractUser(paymentEntity) > CommonCode.ZERO) {
                for(int i = 0; i < userIdArr.size(); i++) {
                    paymentEntity.setContractUserId(userIdArr.get(i));
                    paymentEntity.setUserMasterKey(Integer.parseInt(userKeyArr.get(i)));
                    result = paymentDAO.insertContractUser(paymentEntity);

                    /**티켓수정*/
                    ticketInfo.setTargetKey(paymentEntity.getContractMasterKey());
                    ticketInfo.setUserMasterKey(Integer.parseInt(userKeyArr.get(i)));
                    ticketInfo.setProductMasterKey(paymentEntity.getProductMasterKey());	//상품키
                    ticketInfo.setProductName(paymentEntity.getContractProductName());		//상품이름
                    ticketInfo.setTicketAmount(paymentEntity.getContractTicketAmount());    //티켓수
//                    ticketInfo.setPaymentTid(paymentEntity.getContractTid());															//tid
//                    ticketInfo.setTicketAvilableAmount(paymentEntity.getContractTicketAmount()); //사용가능 티켓
                    ticketInfo.setTicketStartExpirationDate(paymentEntity.getContractStartDate());	//사용가능기한-시작
                    ticketInfo.setTicketEndExpirationDate(paymentEntity.getContractEndDate());	//사용가능기한-종료
                    ticketInfo.setExpirationDate(paymentEntity.getContractExpirationDate());	//유효기간(일로 표시)
                    ticketInfo.setTicketApplyDate(DateUtils.getDate());
                    ticketInfo.setTicketStartExpirationDate(paymentEntity.getTicketStartExpirationDate());
                    ticketInfo.setTicketEndExpirationDate(paymentEntity.getTicketEndExpirationDate());

                    /** 사용순위가 우선인 티겟 정보**/
                    int priUserMasterKey =0;
                    int priAmountTicket =0;
                    int ticketLen=0;
                    List<TicketEntity> ticketList = null;
                    MemberEntity aprioritieTicketKey = new MemberEntity();
                    aprioritieTicketKey.setUserMasterKey(paymentEntity.getUserMasterKey());
                    ticketList=ticketDAO.getPrioritieTicketKey(aprioritieTicketKey);
                    ticketLen = ticketList.size();
                    if(ticketLen > CommonCode.ZERO) {
                        /** 기존 가용한 티켓 사용종료 처리*/
                        priUserMasterKey = ticketList.get(0).getUserTicketMasterKey();//사용순위가 우선인 티켓 마스터 키
                        priAmountTicket = ticketList.get(0).getTicketAvilableAmount();//사용순위가 우선인 사용가능 티켓
                        TicketEntity ticketParam2 = new TicketEntity();
                        ticketParam2.setUserTicketMasterKey(priUserMasterKey);
                        ticketParam2.setUserMasterKey(paymentEntity.getUserMasterKey());
                        ticketParam2.setUseYn("N");
                        ticketParam2.setTicketAvilableAmount(CommonCode.ZERO);
                        ticketDAO.modifyUserTicketMasterUse(ticketParam2);
                    }
                    /** 저장될 티켓 수**/
                    ticketInfo.setTicketAmount(paymentEntity.getPaymentTicketAmount());//구입시간
                    ticketInfo.setTicketAvilableAmount(paymentEntity.getPaymentTicketAmount() + priAmountTicket);//사용가능

                    /** 티켓에 업데이트*/
                    ticketInfo.setUseYn("Y");
                    this.insertUserTicketMaster(ticketInfo);
                    /** 티켓 히스토리에 저장*/
                    if(paymentParam.getContractState() == 1) {
                        ticketInfo.setUseYn("Y");
                    }else{
                        ticketInfo.setUseYn("N");
                    }
                    this.insertUserTicketMaster(ticketInfo);
                       //  ticketDAO.insertUserTicketHistory(ticketInfo);
                }
            }
        }
        return  result;
    }

    @Override
    @Transactional(readOnly=false)
    public int modifyContractState(PaymentEntity paymentEntity) {
        return paymentDAO.modifyContractState(paymentEntity);
    }

    @Override
    public List<PaymentEntity> getPaymentWebReport(PaymentEntity paymentEntity) {
        List<PaymentEntity> result = paymentDAO.getPaymentWebReport(paymentEntity);
        return result;
    }

    @Override
    public List<PaymentEntity> getPaymentContractReport(PaymentEntity paymentEntity) {
        List<PaymentEntity> result = paymentDAO.getPaymentContractReport(paymentEntity);
        return result;
    }


    /**
     * 주문 결제 처리
     */
    @Transactional(readOnly=false, rollbackFor=Throwable.class)
    @Override
    public ResponseEntity doPayment(HttpServletRequest request, PaymentEntity paymentParam, Model model) {

        ResponseEntity resultMap = new ResponseEntity();

        String resultMsg = "";	// 결과 메시지

        /**
         * 1.최종결제 요청 - BEGIN
         */
        String CST_PLATFORM	  = request.getParameter("CST_PLATFORM");
        String CST_MID		  = request.getParameter("CST_MID");
        String LGD_MID		  = ("test".equals(CST_PLATFORM.trim())?"t":"") + CST_MID;
        String LGD_USABLEPAY  = request.getParameter("LGD_CUSTOM_USABLEPAY");
        String LGD_PAYKEY	  = request.getParameter("LGD_PAYKEY");

        logger.info("주문결제 Service Start");

        //해당 API를 사용하기 위해 WEB-INF/lib/XPayClient.jar 를 Classpath 로 등록하셔야 합니다.
        XPayClient xpay = new XPayClient();
        boolean isInitOK = xpay.Init(configPath, CST_PLATFORM);
        if( isInitOK ) {
            try {
                /***  1.최종결제 요청(수정하지 마세요) - END */
                xpay.Init_TX(LGD_MID);
                xpay.Set("LGD_TXNAME", "PaymentByKey");
                xpay.Set("LGD_PAYKEY", LGD_PAYKEY);
                //금액을 체크하시기 원하는 경우 아래 주석을 풀어서 이용하십시요.
                //String DB_AMOUNT = "DB나 세션에서 가져온 금액"; //반드시 위변조가 불가능한 곳(DB나 세션)에서 금액을 가져오십시요.
                //xpay.Set("LGD_AMOUNTCHECKYN", "Y");
                //xpay.Set("LGD_AMOUNT", DB_AMOUNT);
                xpay.Set("LGD_DISPLAY_BUYEREMAIL", "N");
            } catch(Exception e) {
                resultMsg = "LG유플러스 제공 API를 사용할 수 없습니다. 환경파일 설정을 확인해 주시기 바랍니다.";
                resultMap.setResultCode(resultMsg);
                logger.debug(resultMsg);
                throw new RuntimeException(resultMsg);
            }
        } else {
            //API 초기화 실패 화면처리
            resultMsg = "결제요청 초기화 실패. LG유플러스에서 제공한 환경파일이 정상적으로 설치 되었는지 확인하시기 바랍니다.";
            resultMap.setResultCode(resultMsg);
            logger.debug(resultMsg);
            throw new RuntimeException(resultMsg);
        }

        if ( xpay.TX() && "0000".equals(xpay.m_szResCode)) {
            //최종결제요청 결과 성공 DB처리 실패시 Rollback 처리
//			boolean isDBOK = true; //DB처리 실패시 false로 변경해 주세요.
            try {
                //최종결제요청 결과 성공 DB처리
                PaymentEntity paymentEntity = new PaymentEntity();
                //paymentInfo.setMid(xpay.Response("LGD_MID",0));	//상점아이디
                paymentEntity.setPaymentOid(xpay.Response("LGD_OID",0));	//상점 거래번호(주문번호)
                paymentEntity.setPaymentTid(xpay.Response("LGD_TID",0));  //유플러스 거래번호
                paymentEntity.setUserMasterKey(paymentParam.getUserMasterKey());		//회원 키
                paymentEntity.setPaymentType(xpay.Response("LGD_PAYTYPE",0)); //결제수단코드
                String paydate = xpay.Response("LGD_PAYDATE",0);
                Date paymentDate = DateUtils.getDate(paydate, CommonCode.DatePattern.FULL);
                paymentEntity.setPaymentDate(paymentDate); //결제일시
                paymentEntity.setPaymentTotalPrice(Integer.parseInt(xpay.Response("LGD_AMOUNT",0)));//결제금액
                paymentEntity.setProductMasterKey(paymentParam.getProductMasterKey());		//구매상품 키
                paymentEntity.setPaymentProductName(xpay.Response("LGD_PRODUCTINFO",0));		//구매내역
                paymentEntity.setPaymentName(xpay.Response("LGD_BUYER",0));
                paymentEntity.setPaymentUserId(paymentParam.getPaymentUserId());			//구매자 이메일
                paymentEntity.setPaymentUseTime(paymentParam.getPaymentUseTime());			//사용가능시간
                paymentEntity.setPaymentTicketAmount(paymentParam.getPaymentTicketAmount());			//티켓수
                paymentEntity.setPaymentProductPrice(paymentParam.getPaymentProductPrice());			//상품당 가격(vat포함)

                paymentEntity.setMid(xpay.Response("LGD_MID",0));
                paymentEntity.setOid(xpay.Response("LGD_OID",0));
                paymentEntity.setTid(xpay.Response("LGD_TID",0));
                paymentEntity.setPayType(xpay.Response("LGD_PAYTYPE",0));
                paymentEntity.setPayDt(xpay.Response("LGD_PAYDATE",0));
                paymentEntity.setAmount(Integer.parseInt(xpay.Response("LGD_AMOUNT",0)));
                paymentEntity.setProductInfo(xpay.Response("LGD_PRODUCTINFO",0));
                paymentEntity.setFinanceCode(xpay.Response("LGD_FINANCECODE",0));
                paymentEntity.setFinanceName(xpay.Response("LGD_FINANCENAME",0));
                paymentEntity.setBuyer(xpay.Response("LGD_BUYER",0));
                paymentEntity.setBuyerId(xpay.Response("LGD_BUYERID",0));
                paymentEntity.setBuyerEmail(xpay.Response("LGD_BUYEREMAIL",0));
                paymentEntity.setBuyerPhone(xpay.Response("LGD_BUYERPHONE",0));
                Date endDate = Utils.getAddNowDate(paymentParam.getProductExpirationDate());
                paymentEntity.setPaymentStartDate(paymentDate);
                paymentEntity.setPaymentEndDate(endDate);
                // 신용카드
                if( "SC0010".equals(LGD_USABLEPAY) ) {
                    paymentEntity.setPaymentState(CommonCode.PayState.COMPLET);
                    paymentEntity.setPayTypeCd("SC0010");		// 결제 타입 코드
                    paymentEntity.setPayTypeNm("신용카드");		// 결제 타입명

                    paymentEntity.setCardNum(xpay.Response("LGD_CARDNUM",0));
                    paymentEntity.setCardAcquirer(xpay.Response("LGD_CARDACQUIRER",0));
                    paymentEntity.setIsCardInterest(xpay.Response("LGD_CARDNOINTYN",0));
                    paymentEntity.setCardInstallMonth(xpay.Response("LGD_CARDINSTALLMONTH",0));
                }
                // 무통장 입금
                else if( "SC0040".equals(LGD_USABLEPAY) ) {
                    paymentEntity.setPaymentState(CommonCode.PayState.WAIT);
                    paymentEntity.setPayTypeCd("SC0040");
                    paymentEntity.setPayTypeNm("무통장입금");
                    paymentEntity.setPayDt(null);
                    paymentEntity.setCashReceiptNum(xpay.Response("LGD_CASHRECEIPTNUM",0));
                    paymentEntity.setCashReceiptSelfYn(xpay.Response("LGD_CASHRECEIPTSELFYN",0));
                    paymentEntity.setCashReceiptKind(xpay.Response("LGD_CASHRECEIPTKIND",0));
                    paymentEntity.setPayer(xpay.Response("LGD_Payer",0));
                    paymentEntity.setAccountNum(xpay.Response("LGD_ACCOUNTNUM",0));
                    paymentEntity.setCasTamount(xpay.Response("LGD_CASTAMOUNT",0));
                    paymentEntity.setCasCamount(xpay.Response("LGD_CASCAMOUNT",0));
                    paymentEntity.setCasFlag(xpay.Response("LGD_CASFLAG",0));
                    paymentEntity.setCasSeqNo(xpay.Response("LGD_CASSEQNO",0));
                }
                /** Payment 정보 DB 저장 **/
                int masterKey = this.insertPayment(paymentEntity);

                if(masterKey > CommonCode.ZERO) {
                    if( !"SC0040".equals(LGD_USABLEPAY) ) {
                        /** 티켓 저장*/
                        Date startDate = DateUtils.getDate();
                        TicketEntity ticketInfo = new TicketEntity();
                        ticketInfo.setTargetKey(masterKey);
                        ticketInfo.setUserMasterKey(paymentEntity.getUserMasterKey());
                        ticketInfo.setProductMasterKey(paymentEntity.getProductMasterKey());
                        ticketInfo.setProductName(paymentEntity.getPaymentProductName());
                        ticketInfo.setPaymentTid(paymentEntity.getPaymentTid());

                        if(paymentEntity.getProductExpirationDate() > 0) {
                            endDate = Utils.getAddNowDate(paymentParam.getProductExpirationDate());
                            ticketInfo.setTicketEndExpirationDate(endDate);
                        }
                        int expirationDate = paymentParam.getProductExpirationDate();
                        ticketInfo.setExpirationDate(expirationDate);
                        ticketInfo.setTicketStartExpirationDate(startDate);
                        ticketInfo.setTicketApplyDate(startDate);

                        /** 티켓 히스토리에 저장*/
                        //ticketDAO.insertUserTicketHistory(ticketInfo);

                        /** 사용순위가 우선인 티겟 정보**/
                        int priUserMasterKey =0;
                        int priAmountTicket =0;
                        int ticketLen=0;
                        List<TicketEntity> ticketList = null;
                        MemberEntity aprioritieTicketKey = new MemberEntity();
                        aprioritieTicketKey.setUserMasterKey(paymentEntity.getUserMasterKey());
                        ticketList=ticketDAO.getPrioritieTicketKey(aprioritieTicketKey);
                        ticketLen = ticketList.size();
                        if(ticketLen > CommonCode.ZERO) {
                            /** 기존 가용한 티켓 사용종료 처리*/
                            priUserMasterKey = ticketList.get(0).getUserTicketMasterKey();//사용순위가 우선인 티켓 마스터 키
                            priAmountTicket = ticketList.get(0).getTicketAvilableAmount();//사용순위가 우선인 사용가능 티켓
                            TicketEntity ticketParam2 = new TicketEntity();
                            ticketParam2.setUserTicketMasterKey(priUserMasterKey);
                            ticketParam2.setUserMasterKey(paymentEntity.getUserMasterKey());
                            ticketParam2.setUseYn("N");
                            ticketParam2.setTicketAvilableAmount(CommonCode.ZERO);
                            ticketDAO.modifyUserTicketMasterUse(ticketParam2);
                        }
                        /** 저장될 티켓 수**/
                        ticketInfo.setTicketAmount(paymentEntity.getPaymentTicketAmount());//구입시간
                        ticketInfo.setTicketAvilableAmount(paymentEntity.getPaymentTicketAmount() + priAmountTicket);//사용가능

                        /** 티켓에 업데이트*/
                        ticketInfo.setUseYn("Y");
                        this.insertUserTicketMaster(ticketInfo);

                        /** 메일 발송 */
                        EcrmEntity ecrmEntity = new EcrmEntity();
                        ecrmEntity.setMailTitle("[Clapp] 결제가 정상적으로 완료되었습니다.");
                        ecrmEntity.setUserId(paymentEntity.getPaymentUserId());
                        ecrmEntity.setUserName(paymentEntity.getPaymentName());
                        ecrmEntity.setProductName(paymentEntity.getPaymentProductName());
                        ecrmEntity.setTicketAmount(paymentEntity.getPaymentTicketAmount());
                        ecrmEntity.setExpirationDate(endDate);
                        ecrmEntity.setPaymentAmount(paymentParam.getPaymentProductPrice());
                        mailingService.sendPaymentCardPhoneMail(ecrmEntity);
                    }else {
                        /**가상계좌 메일 발송 */
                        EcrmEntity ecrmEntity = new EcrmEntity();
                        ecrmEntity.setMailTitle("[Clapp] 결제가 정상적으로 완료되었습니다.");
                        ecrmEntity.setUserId(paymentEntity.getPaymentUserId());
                        ecrmEntity.setUserName(paymentEntity.getPaymentName());
                        ecrmEntity.setProductName(paymentEntity.getPaymentProductName());
                        ecrmEntity.setTicketAmount(paymentEntity.getPaymentTicketAmount());
                        ecrmEntity.setExpirationDate(endDate);
                        ecrmEntity.setPaymentAmount(paymentParam.getPaymentProductPrice());
                        PaymentEntity paymentEcrm = new PaymentEntity();
                        //입금정보 GET
                        paymentEcrm.setPaymentMasterKey(masterKey);
                        /*결제 정보*/
                        PaymentEntity paymentInfo = paymentDAO.getPaymentInfo(paymentEcrm);

                        ecrmEntity.setAccountNum(paymentInfo.getAccountNum());
                        ecrmEntity.setFinanceName(paymentInfo.getFinanceName());
                        mailingService.sendPaymentVirtualMail(ecrmEntity);
                    }
                    resultMap.setResultDATA(masterKey);
                    resultMap.setResultCode(CommonCode.SUCCESS);
                }
            } catch (Exception e) {
                //최종결제요청 결과 성공 DB처리 실패시 Rollback 처리
                xpay.Rollback("상점 DB처리 실패로 인하여 Rollback 처리 [TID:" + xpay.Response("LGD_TID",0)+", MID:" + xpay.Response("LGD_MID",0)+", OID:" + xpay.Response("LGD_OID",0) + "]");
                logger.debug("TX Rollback Response_code = " + xpay.Response("LGD_RESPCODE",0));
                logger.debug("TX Rollback Response_msg = " + xpay.Response("LGD_RESPMSG",0));

                if("0000".equals( xpay.m_szResCode)) {
                    resultMsg = "자동취소가 정상적으로 완료 되었습니다.";
                } else {
                    resultMsg = "자동취소가 정상적으로 처리되지 않았습니다.";
                }
                resultMap.setResultMSG(resultMsg);
                return resultMap;
                //throw new RuntimeException(resultMsg);
            }
        } else {
            //2)API 요청실패 화면처리
            //최종결제요청 결과 실패 DB처리
            resultMsg = "결제요청이 실패하였습니다. (" + xpay.m_szResMsg + ")";
            resultMap.setResultMSG(resultMsg);
            logger.debug(resultMsg);
            //throw new RuntimeException(resultMsg);
        }
        // 메일 수신 여부와 포인트결제(product_sum eq 0) 이외의 주문인지 확인
        //if(userDao.getMailingFlag(orderInfo.getUser_idx()) && orderInfo.getProduct_sum() > 0) {
        //	mailingService.sendOrder(orderInfo);
        //}
        return resultMap;
    }
    /**
     * 결제 등록
     * @param paymentEntity
     * @return
     */
    @Transactional(readOnly=false, rollbackFor=Throwable.class)
    public int insertPayment (PaymentEntity paymentEntity) {
        int result = 0;
        if(paymentDAO.insertPayment(paymentEntity) > CommonCode.ZERO) {
            result = paymentEntity.getPaymentMasterKey();
            paymentEntity.setPaymentMasteKey(result);
            //paymentDAO.insertPaymentDetail(paymentEntity);
            paymentDAO.insPayment(paymentEntity);
        }

        return result;
    }

    /**
     * 회원 티켓 저장
     * @param ticketEntity
     * @return
     */
    @Transactional(readOnly=false, rollbackFor=Throwable.class)
    public int insertUserTicketMaster(TicketEntity ticketEntity){
        int result = 0;
        int ticket = 0;
        int avilableTicket = 0;
        int oriTicket = ticketEntity.getTicketAmount();
        int oriAvilableTicket = ticketEntity.getTicketAvilableAmount();
        int addDate = 0;
        int userMasterKey = ticketEntity.getUserMasterKey();
        String useYn = ticketEntity.getUseYn();
        Date startDate = null;
        Date endDate = null;
        TicketEntity ticketInfo = new TicketEntity();
        TicketEntity ticketParam = new TicketEntity();
        ticketParam = ticketEntity;
        //소유한 티켓 정보를 불러온다.
        ticketParam.setUserMasterKey(userMasterKey);
        ticketInfo = ticketDAO.selectTicketInfo(ticketParam);
        /** 유효기간 설정. 유효기간을 설정 안한 상태로 넘어왔을시에 설정해준다 */
        if(StringUtils.isEmpty(ticketParam.getTicketStartExpirationDate())) {
            startDate = DateUtils.getDate();
            ticketParam.setTicketStartExpirationDate(startDate);
        }
        if(StringUtils.isEmpty(ticketParam.getTicketEndExpirationDate())) {
            endDate = Utils.getAddNowDate(DateUtils.getDate(), ticketParam.getExpirationDate());
            ticketParam.setTicketEndExpirationDate(endDate);
        }
        /** 티켓 설정. */
        ticket = ticketParam.getTicketAmount();
        avilableTicket = ticketParam.getTicketAvilableAmount();
        ticketParam.setTicketAmount(ticket);
        ticketParam.setTicketAvilableAmount(avilableTicket);

        /** 5/12 티켓 마스터 수정 형식에서 전체적으로 추가하는 방식으로 변경 */
        /** 기존 사용하던 티켓은 미사용으로 변경
         * 새로 저장일 때만 기존 마스터 사용여부를 N 으로 변경한다
         * */
		 /*2015-08-14 기존 일괄 사용종료 처리하던 방식에서 시간사용자인경우 추가로 결제해도 일괄 종료되지 않도록 변경*/
       /*
		if(!useYn.equals("N")) {
            ticketParam.setUseYn("N");
        } else {
            ticketParam.setUseYn("Y");
        }
		*/
        ticketDAO.modifyUserTicketMasterUse(ticketParam);

        ticketParam.setUseYn(useYn);
        result = ticketDAO.insertUserTicketMaster(ticketParam);

        /** 티켓 히스토리에 저장 */
        if(result > CommonCode.ZERO) {
            // if(ticketEntity.getUseYn().equals("Y")) {
                ticketParam.setTicketAmount(oriTicket);
                ticketParam.setTicketAvilableAmount(oriAvilableTicket);
                if (StringUtils.isEmpty(ticketParam.getTicketStartExpirationDate())) {
                    ticketEntity.setTicketStartExpirationDate(startDate);
                }
                if (StringUtils.isEmpty(ticketParam.getTicketEndExpirationDate())) {
                    ticketEntity.setTicketEndExpirationDate(endDate);
                }
                ticketDAO.insertUserTicketHistory(ticketEntity);
        //    }
        }
        return result;
    }


    /**
     * 회원 티켓 삭제
     * @param paymentEntity
     * @return
     */
    @Transactional(readOnly=false, rollbackFor=Throwable.class)
    public int removeUserTicketMaster(PaymentEntity paymentEntity){
        int result = 0;
        int ticket = 0;
        int avilableTicket = 0;
        Date endDate = null;
        TicketEntity ticketInfo = new TicketEntity();
        TicketEntity ticketParam = new TicketEntity();
        PaymentEntity paymentInfo = new PaymentEntity();
        paymentInfo = paymentDAO.getContractInfo(paymentEntity);

        ticketParam.setTicketAmount(paymentInfo.getContractTicketAmount());    //티켓수
        ticketParam.setProductMasterKey(paymentInfo.getProductMasterKey());    //상품 명
        ticketParam.setProductName(paymentInfo.getContractProductName());    //상품 명
        ticketParam.setPaymentTid(paymentInfo.getContractTid());    //tid
        ticketParam.setTicketAvilableAmount(paymentInfo.getContractTicketAmount()); //사용가능 티켓
        ticketParam.setExpirationDate(paymentInfo.getContractExpirationDate());	//유효기간(일로 표시)
        ticketParam.setTicketApplyDate(paymentInfo.getContractInsertDate());
        /** 상품에 묶인 회원 키를 불러온다*/
        List<PaymentEntity> userMasterKey = paymentDAO.getUserMasterKeyList(paymentEntity);

        if(userMasterKey.size() > CommonCode.ZERO) {
            for(int i = 0; i < userMasterKey.size(); i++) {
                ticketParam.setUserMasterKey(userMasterKey.get(i).getUserMasterKey());

                ticketDAO.deleteUserTicketMaster(ticketParam);
                //ticketParam.setUseYn("Y");
                //result = ticketDAO.modifyUserTicketMasterUse(ticketParam);
            }

            /** 히스토리 삭제 */
            ticketParam.setTargetKey(paymentEntity.getContractMasterKey());
            result = ticketDAO.removeUserTicketHistory(ticketParam);
        }
        return result;
    }
    @Transactional(readOnly=false, rollbackFor=Throwable.class)
    @Override
    public ResponseEntity responseVirtualAcct(HttpServletRequest request) {

        logger.info("무통장입금처리 : Service Start");
        ResponseEntity resultMap = new ResponseEntity();

        PayLgdInfo payLgdInfo = new PayLgdInfo();
        payLgdInfo.setLGD_MERTKEY(mertKey);
        payLgdInfo.setLGD_RESPCODE(request.getParameter("LGD_RESPCODE"));	 // 응답코드: 0000(성공) 그외 실패
        payLgdInfo.setLGD_RESPMSG(request.getParameter("LGD_RESPMSG"));		 // 응답메세지
        payLgdInfo.setLGD_MID(request.getParameter("LGD_MID"));				 // 상점아이디
        payLgdInfo.setLGD_OID(request.getParameter("LGD_OID"));				 // 주문번호
        payLgdInfo.setLGD_TID(request.getParameter("LGD_TID"));				 // 거래번호
        payLgdInfo.setLGD_AMOUNT(request.getParameter("LGD_AMOUNT"));		 // 거래금액
        payLgdInfo.setLGD_TIMESTAMP(request.getParameter("LGD_TIMESTAMP"));	 // 타임스탬프
        payLgdInfo.setLGD_HASHDATA(request.getParameter("LGD_HASHDATA"));

        String LGD_RESPCODE = request.getParameter("LGD_RESPCODE");
        String LGD_CASFLAG = request.getParameter("LGD_CASFLAG");
        String LGD_HASHDATA = payLgdInfo.getLGD_HASHDATA();
        String LGD_HASHDATA2 = payLgdInfo.getLGD_HASHDATA2();

        PaymentEntity paymentEntity = new PaymentEntity();
        paymentEntity.setCasFlag(LGD_CASFLAG);								 // 무통장입금 플래그(무통장입금) - 'R':계좌할당, 'I':입금, 'C':입금취소
        paymentEntity.setPayer(request.getParameter("LGD_PAYER"));			 // 입금자명
        paymentEntity.setPayDt(request.getParameter("LGD_PAYDATE"));			 // 결제일자
        paymentEntity.setCasTamount(request.getParameter("LGD_CASTAMOUNT"));	 // 입금총액(무통장입금)
        paymentEntity.setCasCamount(request.getParameter("LGD_CASCAMOUNT"));	 // 현입금액(무통장입금)
        paymentEntity.setCasSeqNo(request.getParameter("LGD_CASSEQNO"));	 // 입금순서(무통장입금)
        paymentEntity.setCashReceiptNum(request.getParameter("LGD_CASHRECEIPTNUM"));		 // 현금영수증 승인번호
        paymentEntity.setCashReceiptKind(request.getParameter("LGD_CASHRECEIPTKIND"));		 // 현금영수증 종류 0: 소득공제용 , 1: 지출증빙용
        paymentEntity.setCashReceiptSelfYn(request.getParameter("LGD_CASHRECEIPTSELFYN"));	 // 현금영수증자진발급제유무 Y: 자진발급제 적용, 그외 : 미적용
        paymentEntity.setOid(payLgdInfo.getLGD_OID());
        paymentEntity.setTid(payLgdInfo.getLGD_TID());

        /** 상점 처리결과 리턴메세지
         * OK  : 상점 처리결과 성공
         * 그외 : 상점 처리결과 실패
         * ※ 주의사항 : 성공시 'OK' 문자이외의 다른문자열이 포함되면 실패처리 되오니 주의하시기 바랍니다.
         **/
        String resultMsg = "결제결과 상점 DB처리(LGD_CASNOTEURL) 결과값을 입력해 주시기 바랍니다.";
        String resultCode = CommonCode.FAIL;
        if (LGD_HASHDATA2.trim().equals(LGD_HASHDATA)) { //해쉬값 검증이 성공이면
            if ( ("0000".equals(LGD_RESPCODE.trim())) ){ //결제가 성공이면
                if( "R".equals( LGD_CASFLAG.trim() ) ) {
                    // if( 무통장 할당 성공 상점처리결과 성공 )
                    resultMsg = "OK";
                    resultCode = CommonCode.SUCCESS;
                } else if( "I".equals( LGD_CASFLAG.trim() ) ) {
                    // if( 무통장 입금 성공 상점처리결과 성공 )
                    paymentEntity.setPayStateCd(CommonCode.PayState.COMPLET);
                    paymentDAO.updPayment(paymentEntity);
                    paymentDAO.updPaymentMaster(paymentEntity);
                    /** 티켓 저장*/
                    PaymentEntity paymentInfo = new PaymentEntity();
                    paymentInfo = paymentDAO.getPaymentInfo(paymentEntity);
                    ProductEntity productInfo = new ProductEntity();
                    productInfo.setProductMasterKey(paymentInfo.getProductMasterKey());
                    productInfo = productDAO.getProductInfo(productInfo);
                    int expirationDate = productInfo.getProductExpirationDate();
                    Date startDate = DateUtils.getDate();
                    Date endDate = null;
                    TicketEntity ticketInfo = new TicketEntity();
                    ticketInfo.setTargetKey(paymentInfo.getPaymentMasterKey());
                    ticketInfo.setUserMasterKey(paymentInfo.getUserMasterKey());
                    ticketInfo.setProductMasterKey(paymentInfo.getProductMasterKey());
                    ticketInfo.setProductName(paymentInfo.getPaymentProductName());
                    ticketInfo.setPaymentTid(paymentInfo.getPaymentTid());
                    ticketInfo.setTicketAmount(paymentInfo.getPaymentTicketAmount());
                    ticketInfo.setTicketAvilableAmount(paymentInfo.getPaymentTicketAmount());
                    if(paymentEntity.getProductExpirationDate() > 0) {
                        endDate = Utils.getAddNowDate(expirationDate);
                        ticketInfo.setTicketEndExpirationDate(endDate);
                    }
                    ticketInfo.setExpirationDate(expirationDate);
                    ticketInfo.setTicketStartExpirationDate(startDate);
                    ticketInfo.setTicketApplyDate(startDate);

                    /** 티켓 히스토리에 저장*/
                    //ticketDAO.insertUserTicketHistory(ticketInfo);
                    ticketInfo.setUseYn("Y");
                    int resultInt = this.insertUserTicketMaster(ticketInfo);
                    if(resultInt > CommonCode.ZERO) {
                        resultMsg = "OK";
                        resultCode = CommonCode.SUCCESS;
                    }
                } else if( "C".equals( LGD_CASFLAG.trim() ) ) {
                    // if( 무통장 입금취소 성공 상점처리결과 성공 )
                    paymentEntity.setPayStateCd(CommonCode.PayState.CANCEL);
                    paymentDAO.updPayment(paymentEntity);
                    paymentDAO.updPaymentMaster(paymentEntity);
                    resultMsg = "OK";
                }
            } else { // 결제가 실패이면
                // if( 결제실패 상점처리결과 성공 )
                resultMsg = "무통장 결제 실패";
            }
            logger.info("무통장입금처리 : " + resultMsg);
            resultMap.setResultMSG(resultMsg);
            resultMap.setResultCode(resultCode);

        } else { // 해쉬값이 검증이 실패이면
            // HASHDATA 검증 실패 로그를 처리하시기 바랍니다.
            resultMsg = "결제결과 상점 DB처리(LGD_CASNOTEURL) 해쉬값 검증이 실패하였습니다.";
            logger.info("무통장입금처리 : " + resultMsg);
            throw new RuntimeException(resultMsg);
        }
        logger.info("무통장입금처리 : Service End");
        return resultMap;
    }
    /**
     * 결제 내용 불러오기
     */
    @Override
    public PaymentEntity getPaymentInfo(PaymentEntity paymentEntity) {
        paymentEntity = paymentDAO.getPaymentInfo(paymentEntity);
        return paymentEntity;
    }

    @Override
    public int getAvailableTicket(PaymentEntity paymentInfo) {
        // TODO Auto-generated method stub
        return 0;
    }

    @Override
    public PaymentEntity getPaymentList(PaymentEntity paymentParam) {
        PaymentEntity paymentInfo = new PaymentEntity();
        paymentInfo = paymentDAO.getPaymentListCount(paymentParam);
        paymentParam.setPageParams();
        paymentParam.setPageSize(paymentParam.getSearchListSize(), PageEntity.PAGE_GROUP_SIZE_PARAM);
        paymentParam.setDataSize(paymentInfo.getPaymentCount());
        paymentParam.setPaymentFinishCount(paymentInfo.getPaymentFinishCount());
        paymentParam.setPaymentWaitCount(paymentInfo.getPaymentWaitCount());
        paymentParam.setPaymentCancelCount(paymentInfo.getPaymentCancelCount());
        if(CommonCode.ZERO < paymentParam.getDataSize()) {
            paymentParam.setPaymentList(paymentDAO.getPaymentList(paymentParam));
        }
        return paymentParam;
    }

    @Override
    public int getProductInfo(PaymentEntity paymentEntity) {
        int cnt = paymentDAO.getProductInfo(paymentEntity) ;
        return cnt;
    }
}
