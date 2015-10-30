package kr.co.clapp.controller;

import kr.co.clapp.constants.CommonCode;
import kr.co.clapp.constants.ResultCode;
import kr.co.clapp.dao.TicketDAO;
import kr.co.clapp.entities.*;
import kr.co.clapp.service.mailing.MailingService;
import kr.co.clapp.service.member.MemberService;
import kr.co.clapp.service.payment.PaymentService;
import kr.co.clapp.service.sms.SmsService;
import kr.co.clapp.service.ticket.TicketService;
import kr.co.clapp.utils.Utils;
import kr.co.digigroove.commons.messages.Messages;
import kr.co.digigroove.commons.utils.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;


@RestController
@RequestMapping(value="/api")
public class ApiController {
	private static final Logger logger = LoggerFactory.getLogger(ApiController.class);
	@Autowired
	private MemberService memberService;
	@Autowired
	private SmsService smsService;
	@Autowired
	private TicketService ticketService;
	@Autowired
	private PaymentService paymentService;
	@Autowired
	private MailingService mailingService;
	@Autowired
	private Messages messages;
    @Autowired
    private TicketDAO ticketDAO;
	/**
	 * 회원 로그인
	 * @param email
	 * @param password
	 * @return ApiEntity
	 */
	@RequestMapping(value="/doLogin" )
	public ApiEntity doLogin(
			HttpSession session,
			@RequestParam(required = false, value = "email") String email,
			@RequestParam(required = false, value = "password") String password,
			HttpServletRequest request
			) {
		ApiEntity apiEntity = new ApiEntity();
		ResponseEntity result = new ResponseEntity();
		MemberEntity memberEntity = new MemberEntity();
        TicketEntity ticketInfo = new TicketEntity();
		int ticketAmount = 0;
		try {
			memberEntity.setUserId(email);
			memberEntity.setUserPassword(password);
			
			result = memberService.doUserLogin(memberEntity, result, session);
			
			apiEntity.setResultState(result.getResultCode()); //로그인 결과

			if(result.getResultCode().equals(ResultCode.SUCCESS)) {
				memberEntity = (MemberEntity) session.getAttribute(CommonCode.Session.USER_LOGIN_SESSION);
				apiEntity.setUserMasterKey(memberEntity.getUserMasterKey());  
				apiEntity.setUserName(memberEntity.getUserName());
				/** 사용가능 티켓 불러오기 */
				ticketInfo = this.getTicketAvilableAmount(memberEntity.getUserMasterKey());
                ticketAmount = ticketInfo.getTicketAvilableAmount()*CommonCode.TICKET_TIME;
                apiEntity.setTicketAvilableAmount(ticketAmount);
			} else {
				apiEntity.setErrorMessage(result.getResultMSG());
			}
		} catch (Exception e) {
			logger.error("ApiController.doLogin:Faild" , e);
			apiEntity.setErrorData(e);
			apiEntity.setResultState(ResultCode.ERROR);
		}
		
 		return apiEntity;
	}
	
	/**
	 * 회원정보
	 * @param session
	 * @param user_id - 회원 키
	 * @return
	 */
	@RequestMapping(value="/getUserInfo")
	public ApiEntity getUserInfo(
		HttpSession session,
		@RequestParam(required = false, value = "user_id") int user_id
		) {
		ApiEntity apiEntity = new ApiEntity();
		MemberEntity memberEntity = new MemberEntity();
        TicketEntity ticketInfo = new TicketEntity();
		int ticketAmount = 0;
		try {
			memberEntity.setUserMasterKey(user_id);
			memberEntity = memberService.getUserInfo(memberEntity);
			if(!StringUtils.isEmpty(memberEntity)) {
				apiEntity.setResultState(ResultCode.SUCCESS);
				apiEntity.setUserName(memberEntity.getUserName());
				apiEntity.setUserId(memberEntity.getUserId());
				/** 사용가능 티켓 불러오기 */
                ticketInfo = this.getTicketAvilableAmount(memberEntity.getUserMasterKey());
                ticketAmount = ticketInfo.getTicketAvilableAmount();
				apiEntity.setTicketAvilableAmount(ticketAmount); 
			} else {
				apiEntity.setResultState(ResultCode.FAIL);
			}
		} catch (Exception e) {
			logger.error("ApiController.getUserInfo:Faild" , e);
			apiEntity.setErrorData(e);
			apiEntity.setResultState(ResultCode.ERROR);
		}
		return apiEntity;
	}
	
	/**
	 * 포인트 차감
	 * @param session
	 * @param user_id - 회원키
	 * @param reservation_time - 사용시간
	 * @return
	 */
	@RequestMapping(value="doUsedTicket")
	public ApiEntity doUsedTicket (
			HttpSession session,
			@RequestParam(required = false, value = "user_id") int user_id,
			@RequestParam(required = false, value = "reservation_time") int reservation_time,
			HttpServletRequest request
			){

		ApiEntity apiEntity = new ApiEntity();
		MemberEntity memberEntity = new MemberEntity();
		TicketEntity ticketEntity = new TicketEntity();
        TicketEntity ticketInfo = new TicketEntity();
/////////////

        String useYn = ticketEntity.getUseYn();
        TicketEntity ticketParam = new TicketEntity();
        ticketParam = ticketEntity;


		List<TicketEntity> ticketList = null;
        int userMasterKey = ticketEntity.getUserMasterKey();
		int result = 0;
        int ticket = 0;
        int avilableTicket = 0;
		int reservationTicketAmount = 0;
		int usedTicketAmount = 0 ;
		int ticketAvilableAmount = 0;
		int i = 0;
		int ticketLen = 0;
        int userTicketMasterKey =0;
		
		try {
			/** 외부 아이피 접근시 차단 */
			if(!Utils.checkRemoteIp(request)) {
				apiEntity.setResultState(ResultCode.IP_NOT_EQUALS);
				//return apiEntity;
			}
		
			/** 사용우선순위가 위인 티켓 키를 가져온다 */
			memberEntity.setUserMasterKey(user_id);
			ticketList = ticketService.getPrioritieTicketKey(memberEntity);
			ticketLen = ticketList.size();

            //소유한 티켓 정보를 불러온다.
            ticketParam.setUserMasterKey(userMasterKey);
            ticketInfo = ticketDAO.selectTicketInfo(ticketParam);
            /** 티켓 설정. */
            ticket = ticketParam.getTicketAmount();
            avilableTicket = ticketParam.getTicketAvilableAmount();
            ticketParam.setTicketAmount(ticket);
            ticketParam.setTicketAvilableAmount(avilableTicket);




			/** 넘어온 예약시간을 티켓수로 환산한다.*/
			int amount = reservation_time % CommonCode.TICKET_TIME;
			/** 예약시간이 30분 단위로 떨어지지 않을시  30분단위 값으로 변경한다.*/
			/** 예약시간이 5분 단위로 떨어지지 않을시  5분단위 값으로 변경한다.*/
			if(amount > 0) {
				reservation_time += CommonCode.TICKET_TIME - amount;
			}
			reservationTicketAmount=  reservation_time / CommonCode.TICKET_TIME;
			if(!StringUtils.isEmpty(ticketList)) {
				for(; i < ticketLen; i ++) {
					/** 사용가능한 티켓 */
					ticketAvilableAmount = ticketList.get(i).getTicketAvilableAmount();
                    /** 차감상품 번호 */
                    userTicketMasterKey = ticketList.get(i).getUserTicketMasterKey();

					if(ticketAvilableAmount > CommonCode.ZERO) {
						/** 사용가능한 티켓에 사용티켓을 빼서 남은 티켓을 구한다. */
					    usedTicketAmount = ticketAvilableAmount - reservationTicketAmount;
//                        logger.debug("{}", "ticket master key = " + ticketList.get(i).getUserTicketMasterKey());

                        if(usedTicketAmount >= 0) {
							ticketEntity.setTicketAvilableAmount(usedTicketAmount);
							ticketEntity.setUserMasterKey(ticketList.get(i).getUserMasterKey());
                            ticketParam.setUserTicketMasterKey(userTicketMasterKey);//상품 타겟 추가
							/** 티켓차감 */
							if(ticketService.doUsedTicket(ticketEntity) > CommonCode.ZERO) {
								/**티켓 사용 히스토리
								ticketEntity.setHistoryUsedTicketAmount(reservationTicketAmount);
								ticketEntity.setUserMasterKey(user_id);
								ticketEntity.setDeviceKey(1);
								ticketService.insertUsedTicketHistory(ticketEntity);
								*/ 
								apiEntity.setResultState(ResultCode.SUCCESS);
								apiEntity.setUsedTicketAmount(reservationTicketAmount*CommonCode.TICKET_TIME);
								apiEntity.setTicketAvilableAmount(usedTicketAmount*CommonCode.TICKET_TIME);

                               if(usedTicketAmount==0) {
                                   /**티켓 모두 소진시 사용 종료 처리*/
                                   ticketParam.setUserTicketMasterKey(userTicketMasterKey);
                                   ticketParam.setUseYn("N");
                                   ticketDAO.modifyUserTicketMasterUse(ticketParam);
                               }
							} else {

                                apiEntity.setResultState(ResultCode.FAIL);
								apiEntity.setErrorMessage(messages.getMessage("ticket.used.fail"));
							}

					    } else {
					    	/** 사용가능 티켓이 부족한 경우 */
							apiEntity.setResultState(ResultCode.LOCK);

					    }

					    result++;
					}
				}
				if(result == 0) {
					/** 사용가능 티켓이 없는 경우 */
					apiEntity.setResultState(ResultCode.LOCK);
					apiEntity.setErrorMessage(messages.getMessage("ticket.used.fail.notTicket"));
				}
			} else {
				/** 사용가능 티켓이 없는 경우 */
				apiEntity.setResultState(ResultCode.LOCK);
				apiEntity.setErrorMessage(messages.getMessage("ticket.used.fail.notTicket"));
			}
			
		} catch(Exception e) {
			logger.error("ApiController.doUsedTicket:Faild" , e);
			apiEntity.setErrorData(e);
			apiEntity.setResultState(ResultCode.ERROR);
		}
		return apiEntity;
	}
	/**
	 * 포인트 반환
	 * @param session
	 * @param user_id
	 * @param reservation_time
     * @param reservation_id
	 * @return
	 */
	@RequestMapping(value="doReturnTicket")
	public ApiEntity doReturnTicket(
			HttpSession session,
			@RequestParam(required = false, value = "user_id") int user_id,
			@RequestParam(required = false, value = "reservation_time") int reservation_time,
            @RequestParam(required = false, value = "reservation_id") int reservation_id,
			HttpServletRequest request
			) {
		ApiEntity apiEntity = new ApiEntity();
		MemberEntity memberEntity = new MemberEntity();
		TicketEntity ticketEntity = new TicketEntity();
        TicketEntity ticketInfo = new TicketEntity();
		int reservationTicketAmount = 0;
		int ticketAvilableAmount = 0;
		int usedTicketAmount = 0;
        int timeDiff = 0;
		try {
			/** 외부 아이피 접근시 차단 */
			if(!Utils.checkRemoteIp(request)) {
				//apiEntity.setResultState(ResultCode.IP_NOT_EQUALS);
				//return apiEntity;
			}
            /** 예약아이디 유효성 체크 */
            if(ticketService.chkReservation(reservation_id) == 0) {
                apiEntity.setResultState(ResultCode.ERROR);
                apiEntity.setErrorMessage(messages.getMessage("Invalid reservation"));
            } else {
                memberEntity.setUserMasterKey(user_id);
                /** 현재 시간으로부터 예약 시작 시간과의 차를 불러온다 */
                timeDiff = ticketService.selectTimeDiff(reservation_id);
                /** 넘어온 예약시간을 티켓수로 환산한다.*/
//                if (timeDiff >= 72) {  // 72시간전 100% 반환
//                    reservationTicketAmount = (reservation_time / CommonCode.TICKET_TIME);   //리턴 티켓
//                } else
//
                if (timeDiff >= 24) { //24시간전 100% 반환
                    reservationTicketAmount = (reservation_time / CommonCode.TICKET_TIME);   //리턴 티켓
//                    logger.debug("DAO============================{}",reservationTicketAmount);
                } else if (timeDiff < 24) {  // 당일 불가
                    reservationTicketAmount = 0;
                }
                ticketInfo = this.getTicketAvilableAmount(memberEntity.getUserMasterKey());
                ticketAvilableAmount = ticketInfo.getTicketAvilableAmount();
                /** 사용가능한 티켓에 사용티켓을 더해서 사용가능 티켓을 구한다. */
                usedTicketAmount = ticketAvilableAmount + reservationTicketAmount;
                ticketEntity.setTicketAvilableAmount(usedTicketAmount);
                ticketEntity.setUserMasterKey(user_id);
                if(usedTicketAmount > CommonCode.ZERO)ticketEntity.setUseYn("YY");

                /** 티켓반환 */
                if (ticketService.doUsedTicket(ticketEntity) > CommonCode.ZERO) {
                    List<String> userIdArr = new ArrayList<String>();
                    userIdArr.add(String.valueOf(user_id));
                    ticketEntity.setUserIdArr(userIdArr);
                    ticketEntity.setServiceTargetType("4");
                    ticketEntity.setServiceTargetName("예약취소");
                    ticketEntity.setProductName(ticketInfo.getProductName());
                    ticketEntity.setServiceApplyTicketAmount(reservationTicketAmount);
                    ticketEntity.setServiceApplyTicketTotalAmount(reservationTicketAmount);
                    ticketEntity.setServiceApplyReason("8");
                    ticketEntity.setTicketStartExpirationDate(ticketInfo.getTicketStartExpirationDate());
                    ticketEntity.setTicketEndExpirationDate(ticketInfo.getTicketEndExpirationDate());
                    ticketEntity.setServiceApplyOperatorName("system");
                    //티켓 반환으로 저장
//                    if (reservationTicketAmount > 0) ticketService.insertTicketProductService(ticketEntity);
                    //ticketService.returnTicket(ticketEntity);

                    apiEntity.setResultState(ResultCode.SUCCESS);
                    apiEntity.setReturnTicketAmount(reservationTicketAmount*CommonCode.TICKET_TIME);
                    apiEntity.setTotalTicketAmount(usedTicketAmount*CommonCode.TICKET_TIME);
                } else {
                    apiEntity.setResultState(ResultCode.FAIL);
                    apiEntity.setErrorMessage(messages.getMessage("ticket.return.fail"));
                }
            }
		} catch (Exception e) {
			logger.error("ApiController.doReturnTicket:Faild" , e);
			apiEntity.setErrorData(e);
			apiEntity.setResultState(ResultCode.ERROR);
		}
		return apiEntity;
	}

	/**
	 * 포인트 반환(시스템 오류시)
	 * @param session
	 * @param user_id
	 * @param reservation_time
	 * @return
	 */
	@RequestMapping(value="doRecoveryTicket")
	public ApiEntity doRecoveryTicket(
            HttpSession session,
            @RequestParam(required = false, value = "user_id") int user_id,
            @RequestParam(required = false, value = "reservation_time") int reservation_time,
            @RequestParam(required = false, value = "reservation_id") int reservation_id,
            HttpServletRequest request
			) {
        ApiEntity apiEntity = new ApiEntity();
        MemberEntity memberEntity = new MemberEntity();
        TicketEntity ticketEntity = new TicketEntity();
        TicketEntity ticketInfo = new TicketEntity();
        int reservationTicketAmount = 0;
        int ticketAvilableAmount = 0;
        int usedTicketAmount = 0;
        try {
            /** 외부 아이피 접근시 차단 */
            if(!Utils.checkRemoteIp(request)) {
                //apiEntity.setResultState(ResultCode.IP_NOT_EQUALS);
                //return apiEntity;
            }
            /** 예약아이디 유효성 체크 */
            if(ticketService.chkReservation(reservation_id) == 0) {
                apiEntity.setResultState(ResultCode.ERROR);
                apiEntity.setErrorMessage("Invalid reservation");
            } else {

                memberEntity.setUserMasterKey(user_id);
                /** 넘어온 예약시간을 티켓수로 환산한다.*/
                reservationTicketAmount = (reservation_time / CommonCode.TICKET_TIME);   //리턴 티켓
                ticketInfo = this.getTicketAvilableAmount(memberEntity.getUserMasterKey());
                ticketAvilableAmount = ticketInfo.getTicketAvilableAmount();
                /** 사용가능한 티켓에 사용티켓을 더해서 사용가능 티켓을 구한다. */
                usedTicketAmount = ticketAvilableAmount + reservationTicketAmount;
                ticketEntity.setTicketAvilableAmount(usedTicketAmount);
                ticketEntity.setUserMasterKey(user_id);
                /** 티켓반환 */
                if (ticketService.doUsedTicket(ticketEntity) > CommonCode.ZERO) {
                    List<String> userIdArr = new ArrayList<String>();
                    userIdArr.add(String.valueOf(user_id));
                    ticketEntity.setUserIdArr(userIdArr);
                    ticketEntity.setServiceTargetType("4");
                    ticketEntity.setServiceTargetName("서비스 장애");
                    ticketEntity.setProductName(ticketInfo.getProductName());
                    ticketEntity.setServiceApplyTicketAmount(reservationTicketAmount);
                    ticketEntity.setServiceApplyTicketTotalAmount(reservationTicketAmount);
                    ticketEntity.setServiceApplyReason("7");
                    ticketEntity.setTicketStartExpirationDate(ticketInfo.getTicketStartExpirationDate());
                    ticketEntity.setTicketEndExpirationDate(ticketInfo.getTicketEndExpirationDate());
                    ticketEntity.setServiceApplyOperatorName("system");
                    if (reservationTicketAmount > 0) //ticketService.insertTicketProductService(ticketEntity);
                        ticketService.returnTicket(ticketEntity);

                    apiEntity.setResultState(ResultCode.SUCCESS);
                    apiEntity.setReturnTicketAmount(reservationTicketAmount*CommonCode.TICKET_TIME);
                    apiEntity.setTotalTicketAmount(usedTicketAmount*CommonCode.TICKET_TIME);
                } else {
                    apiEntity.setResultState(ResultCode.FAIL);
                    apiEntity.setErrorMessage(messages.getMessage("ticket.return.fail"));
                }
            }
        } catch (Exception e) {
            logger.error("ApiController.doRecoveryTicket:Faild" , e);
            apiEntity.setErrorData(e);
            apiEntity.setResultState(ResultCode.ERROR);
        }
        return apiEntity;
	}
	/**
	 * 사용가능 티켓 
	 * @param userMasterKey
	 * @return
	 */
	public TicketEntity getTicketAvilableAmount(int userMasterKey) {
		TicketEntity ticketEntity = new TicketEntity();
		ticketEntity.setUserMasterKey(userMasterKey);
		return ticketService.getAvailableTicket(ticketEntity) ;
//		PaymentEntity paymentInfo = new PaymentEntity();
//		paymentInfo.setUserMasterKey(userMasterKey);
//		return paymentService.getAvailableTicket(paymentInfo);
	}
	/**
	 * 회원 인증번호 생성및 등록 
	 * @param userMasterKey
	 * @return
	 */
	@RequestMapping(value="setUserKey")
	public ResponseEntity setUserKey(
			@RequestParam(required=false, value="userMasterKey") int userMasterKey){
		ResponseEntity result = new ResponseEntity();
		MemberEntity memberInfo = new MemberEntity();
		String userKey = StringUtils.getRandomString(10);
		memberInfo.setUserMasterKey(userMasterKey);
		memberInfo.setUserKey(userKey);
		memberService.setUserKey(memberInfo);
		result.setResultDATA(userKey);
		return result;
	}
	
	/**
	 * 회원 인증번호 초기화 
	 * @param userMasterKey
	 * @return
	 */
	@RequestMapping(value="removeUserKey")
	public ApiEntity removeUserKey(
			@RequestParam(required=false, value="userMasterKey") int userMasterKey){
		MemberEntity memberInfo = new MemberEntity(); 
		String userKey = null;
		ApiEntity apiEntity = new ApiEntity();
	try {
		memberInfo.setUserMasterKey(userMasterKey);
		memberInfo.setUserKey(userKey);
		if(memberService.setUserKey(memberInfo) > CommonCode.ZERO) {
			apiEntity.setResultState(ResultCode.SUCCESS);
		} else {
			apiEntity.setResultState(ResultCode.FAIL);
			apiEntity.setErrorMessage(messages.getMessage("api.remove.userKey.fail"));
		}
	} catch (Exception e) {
		logger.error("ApiController.removeUserKey" , e);
		apiEntity.setErrorData(e);
		apiEntity.setResultState(ResultCode.ERROR);
	}
		return apiEntity;
	}
	
	/**
	 * sms발송
	 * @param smsEntity
	 * @return
	 */
	@RequestMapping(value = "sendSms")
	public ApiEntity sendSms(SmsEntity smsEntity) {
		ApiEntity apiEntity = new ApiEntity();
		try {
			if(smsService.insertSms(smsEntity) > CommonCode.ZERO) {
				apiEntity.setResultState(ResultCode.SUCCESS);
			} else {
				apiEntity.setResultState(ResultCode.FAIL);
				apiEntity.setErrorMessage(messages.getMessage("api.remove.userKey.fail"));
			}
		} catch (Exception e) {
			logger.error("ApiController.sendSms" , e);
			apiEntity.setErrorData(e);
			apiEntity.setResultState(ResultCode.ERROR);
		}
		return apiEntity;
	}
	/**
	 * 이메일 발송
	 * @param ecrmEntity
	 * @return
	 */
	@RequestMapping(value = "sendEmail")
	public ApiEntity sendEmail(EcrmEntity ecrmEntity) {
		ApiEntity apiEntity = new ApiEntity();
		try {
			if(mailingService.sendApiMail(ecrmEntity) > CommonCode.ZERO) {
				apiEntity.setResultState(ResultCode.SUCCESS);
			} else {
				apiEntity.setResultState(ResultCode.FAIL);
				apiEntity.setErrorMessage(messages.getMessage("api.sendmail.fail"));
			}
		} catch (Exception e) {
			logger.error("ApiController.sendEmail" , e);
			apiEntity.setErrorData(e);
			apiEntity.setResultState(ResultCode.ERROR);
		}
		return apiEntity;
	}
	
	/**
	 * 로그인 여부 체크
	 * @param apiEntity
	 * @return apiEntity (true, false)
	 */
	@RequestMapping(value = "loginCheck")
	public ApiEntity loginCheck(ApiEntity apiEntity) {
		SessionListener listner = new SessionListener();
		apiEntity.setLoginChk(listner.isLogin(Integer.toString(apiEntity.getUserMasterKey())));
		return apiEntity;
	}
}
