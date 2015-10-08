package kr.co.clapp.service.mailing.impl;

import kr.co.clapp.constants.CommonCode;
import kr.co.clapp.dao.EcrmDAO;
import kr.co.clapp.dao.MailingDAO;
import kr.co.clapp.dao.MemberDAO;
import kr.co.clapp.entities.DropOutUserEntity;
import kr.co.clapp.entities.EcrmEntity;
import kr.co.clapp.entities.MemberEntity;
import kr.co.clapp.entities.validation.FormRecruitInfoEntity;
import kr.co.clapp.service.mailing.MailingService;
import kr.co.clapp.service.member.MemberService;
import kr.co.digigroove.commons.entities.MailSendEntity;
import kr.co.digigroove.commons.utils.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.velocity.VelocityEngineFactory;

import javax.mail.MessagingException;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

@Service("MailingService")
@Transactional(readOnly=true)
public class MailingServiceImpl implements MailingService {
	private static final Logger logger = LoggerFactory.getLogger(MailingServiceImpl.class);
	private SimpleDateFormat sdf = new SimpleDateFormat(CommonCode.DatePattern.KOREAN, Locale.KOREAN);
	@Value("#{mailConfig['serviceUrl']}")
	private String serviceURL;
	@Value("#{mailConfig['emailSender']}")
	private String emailSender;
	@Value("#{mailConfig['recruitSender']}")
	private String recruitSender;
	@Value("#{mailConfig['emailSenderName']}")
	private String emailSenderName;
	@Value("#{mailConfig['emailForm']}")
	private String emailForm;
	@Value("#{mailConfig['emailTemp']}")
	private String emailTemp;
	@Value("#{mailConfig['testMail']}")
	private String testMail;
	@Value("#{mailConfig['apiEmailTemp']}")
	private String apiEmailTemp;

	@Autowired
	private JavaMailSender javaMailSender;
	@Autowired
	private VelocityEngineFactory velocityEngineFactory;

	@Autowired
	private MailingDAO mailingDAO;
	@Autowired
	private EcrmDAO ecrmDAO;
	@Autowired
	private MemberDAO memberDAO;
	@Autowired
	private MemberService memberService;
	/**
	 * 메일 템플릿을 불러온다
	 * @param ecrmEntity
	 * @return
	 */
	private EcrmEntity getMailTemp(EcrmEntity ecrmEntity) {
	  EcrmEntity result = new EcrmEntity();
	  result = ecrmDAO.getMailTemp(ecrmEntity);
	  return result;
	}
	/**
	 * 메일 전송
	 * @param mailSendInfo
	 * @param emailData
	 * @throws IOException
	 * @throws MessagingException
	 */
	@Transactional(readOnly=false, rollbackFor = Exception.class)
	private int sendMail(MailSendEntity mailSendInfo, Map<String, Object> emailData) throws IOException, MessagingException {
		int sendResult = CommonCode.ZERO;
		// Default Info
		mailSendInfo.setIsHtml(true);
		if( StringUtils.isEmpty(mailSendInfo.getSender())) {
			mailSendInfo.setSender(emailSender);
		}
		mailSendInfo.setSenderName(emailSenderName);
		// Default Data
//		SimpleDateFormat sdf = new SimpleDateFormat(CommonCode.DatePattern.KOREAN, Locale.KOREAN);
//		emailData.put("nowDate", sdf.format(new Date()));
		if(!StringUtils.isEmpty(emailData.get("masterKey"))){
			String masterKey = emailData.get("masterKey").toString();
			String action = serviceURL+"/admin/ecrm/mailCheck?mailMasterKey="+masterKey;
			emailData.put("action", action);
		}
		emailData.put("contextPath", serviceURL);
		// Send Mail 
		MailUtils mailUtils = new MailUtils();
		mailUtils.setMailSender(javaMailSender);
		mailUtils.setVelocityEngine(velocityEngineFactory);
		mailUtils.sendMail(mailSendInfo, emailData);
		return ++sendResult;
	}
	/**
	 * insert mail_master
	 * @param ecrmEntity
	 * @param mailSendInfo
	 * @return
	 */
	@Transactional(readOnly=false)
	public int setMailMaster(EcrmEntity ecrmEntity, MailSendEntity mailSendInfo) {
	  int result = 0;
      //메일 발신자 
      ecrmEntity.setMailSendAddress(emailSender);
      //메일 제목
      ecrmEntity.setMailTitle(mailSendInfo.getSubject());
      //메일 발송 완료 일자
      //String sendMailEndDate = DateUtils.getToday(CommonCode.DatePattern.KOREAN);
      Date sendMailEndDate = DateUtils.getDate();
      
      ecrmEntity.setMailSendEndDate(sendMailEndDate);  
      result = ecrmDAO.setMailMaster(ecrmEntity);
      if(result > CommonCode.ZERO) {
    	    result = ecrmDAO.setMailReception(ecrmEntity);
      }
      return ecrmEntity.getMailMasterKey();
	}
	/**
	 * 이메일 답변 
	 */
	@Override
	public int sendInquiryMail() {
		// TODO Auto-generated method stub
		return 0;
	}

	/**
	 * 일반 회원가입
	 */
	@Override
	@Transactional(readOnly=false)
	public int sendJoinMemberMail(MemberEntity memberEntity) {
	  MailSendEntity mailSendInfo = new MailSendEntity();
	  Map<String, Object> emailData = new ConcurrentHashMap<String,Object>();
	  EcrmEntity ecrmEntity = new EcrmEntity();
	  int result = CommonCode.ZERO;
	  try {
		String sendMailStartDates = DateUtils.getToday(CommonCode.DatePattern.DASH_TIME);
		Date mailSendStartDate = DateUtils.getDate(sendMailStartDates, CommonCode.DatePattern.DASH_TIME);
	    // Info
	    mailSendInfo.setSubject("[Clapp] 회원 가입(일반회원)을 축하드립니다.");
	    mailSendInfo.setEmailForm(emailTemp);
	   // String[] recipient = {memberEntity.getUserId()};
	    String[] recipient = {memberEntity.getUserId()};
	    mailSendInfo.setRecipient(recipient);
		String userName = memberEntity.getUserName(); 
		
	    ecrmEntity.setMailType(CommonCode.MailType.MAIL_JOIN_MEMBER);
		String mailContents = this.getMailTemp(ecrmEntity)
										.getMailTempContents()
											.replace("$userName", userName)
											.replace("$userId", recipient[0])
											.replace("$nowDate", sdf.format(new Date()))
											.replace("$contextPath", serviceURL);
		
	    ecrmEntity = this.getMailTemp(ecrmEntity);
	    //ecrmEntity
  		ecrmEntity.setMailSendStartDate(mailSendStartDate); 
  		ecrmEntity.setMailContent(mailContents);
      	ecrmEntity.setMailState(CommonCode.SUCCESS_NO);
        ecrmEntity.setMailReceptionAddress(mailSendInfo.getRecipient()[0]);
        ecrmEntity.setMailSection(CommonCode.MailType.MAIL_ANY_TIME); 
        ecrmEntity.setMailSort(CommonCode.MailType.MAIL_SORT_MEMBER);
        ecrmEntity.setMailType(CommonCode.MailType.MAIL_JOIN_MEMBER);
        ecrmEntity.setMailTarget(CommonCode.MailTarget.MAIL_TARGET_NULL);
        //insert mail_master
        int masterKey = this.setMailMaster(ecrmEntity, mailSendInfo);
        mailContents = mailContents.replace("$masterKey" , String.valueOf(masterKey));
		// Data
        emailData.put("userId", recipient[0]);
        emailData.put("userName", userName);
        emailData.put("contents", ecrmEntity);
        emailData.put("masterKey", masterKey);
		result =  sendMail(mailSendInfo, emailData);
        
	  } catch (IOException e) {
	    logger.error("MailingServiceImpl.insertDropOut:Faild" , e);
	  } catch (MessagingException e) {
	    logger.error("MailingServiceImpl.insertDropOut:Faild" , e);
	  } catch (Exception e) {
		logger.error("MailingServiceImpl.insertDropOut:Faild" , e);
	  } 
	  return result;
	}
	/**
	 * 기업/단체 회원 가입
	 */ 
	@Override
	@Transactional(readOnly=false)
	public int sendJoinCompanyMemberMail(MemberEntity memberEntity) {
		  MailSendEntity mailSendInfo = new MailSendEntity();
		  Map<String, Object> emailData = new ConcurrentHashMap<String,Object>();
		  EcrmEntity ecrmEntity = new EcrmEntity();
		  int result = CommonCode.ZERO;
		  try {
			String sendMailStartDates = DateUtils.getToday(CommonCode.DatePattern.DASH_TIME);
			Date mailSendStartDate = DateUtils.getDate(sendMailStartDates, CommonCode.DatePattern.DASH_TIME);
		    // Info
		    mailSendInfo.setSubject("[Clapp] 회원 가입(기업/단체)을 축하드립니다.");
		    mailSendInfo.setEmailForm(emailTemp);
		   // String[] recipient = {memberEntity.getUserId()};
		    String[] recipient = {memberEntity.getUserId()};
		    mailSendInfo.setRecipient(recipient);
			String userName = memberEntity.getUserCompanyName(); 
			
		    ecrmEntity.setMailType(CommonCode.MailType.MAIL_JOIN_COMPANY);
			String mailContents = this.getMailTemp(ecrmEntity)
											.getMailTempContents()
												.replace("$userName", userName)
												.replace("$userId", recipient[0])
												.replace("$nowDate", sdf.format(new Date()))
												.replace("$contextPath", serviceURL);
			
		    ecrmEntity = this.getMailTemp(ecrmEntity);
		    //ecrmEntity
	  		ecrmEntity.setMailSendStartDate(mailSendStartDate); 
	  		ecrmEntity.setMailContent(mailContents);
	      	ecrmEntity.setMailState(CommonCode.SUCCESS_NO);
	        ecrmEntity.setMailReceptionAddress(mailSendInfo.getRecipient()[0]);
	        ecrmEntity.setMailSection(CommonCode.MailType.MAIL_ANY_TIME); 
	        ecrmEntity.setMailSort(CommonCode.MailType.MAIL_SORT_MEMBER);
	        ecrmEntity.setMailType(CommonCode.MailType.MAIL_JOIN_COMPANY);
	        ecrmEntity.setMailTarget(CommonCode.MailTarget.MAIL_TARGET_NULL);
	        //insert mail_master
	        int masterKey = this.setMailMaster(ecrmEntity, mailSendInfo);
	        mailContents = mailContents.replace("$masterKey" , String.valueOf(masterKey));
			// Data
	        emailData.put("userId", recipient[0]);
	        emailData.put("userName", userName);
	        emailData.put("contents", ecrmEntity);
	 		emailData.put("action", "/admin/ecrm/mailCheck");
	        emailData.put("masterKey", masterKey);
			result =  sendMail(mailSendInfo, emailData);
	        
		  } catch (IOException e) {
		    logger.error("MemberRestController.insertDropOut:Faild" , e);
		  } catch (MessagingException e) {
		    logger.error("MemberRestController.insertDropOut:Faild" , e);
		  } catch (Exception e) {
			logger.error("MemberRestController.insertDropOut:Faild" , e);
		  } 
		  return result;
	}

	/**
	 * 회원 탈퇴
	 */
	@Override
	@Transactional(readOnly=false)
	public int sendDropOutMemberMail(DropOutUserEntity dropOutUserEntity) {
	  MailSendEntity mailSendInfo = new MailSendEntity();
	  Map<String, Object> emailData = new ConcurrentHashMap<String,Object>();
	  EcrmEntity ecrmEntity = new EcrmEntity();
	  int result = CommonCode.ZERO;
	  try { 
		String sendMailStartDates = DateUtils.getToday(CommonCode.DatePattern.DASH_TIME);
	    Date mailSendStartDate = DateUtils.getDate(sendMailStartDates, CommonCode.DatePattern.DASH_TIME);
		// Info 
	    mailSendInfo.setSubject("[Clapp] 회원탈퇴 되었습니다.");
		mailSendInfo.setEmailForm(emailTemp);
		String[] recipient = {dropOutUserEntity.getDropOutUserId()};
//		String[] recipient = {"hijin0115@naver.com"};
		mailSendInfo.setRecipient(recipient);
		String userName = dropOutUserEntity.getUserName(); 
//		String userName = "엄성재";

		ecrmEntity.setMailType(CommonCode.MailType.MAIL_DROPOUT_MEMBER);
		String mailContents = this.getMailTemp(ecrmEntity)
										.getMailTempContents()
											.replace("$userName", userName)
											.replace("$userId", recipient[0])
											.replace("$nowDate", sdf.format(new Date()))
											.replace("$contextPath", serviceURL);
		ecrmEntity = this.getMailTemp(ecrmEntity);
		//ecrmEntity
		ecrmEntity.setMailSendStartDate(mailSendStartDate); 
		ecrmEntity.setMailContent(mailContents);
    	ecrmEntity.setMailState(CommonCode.SUCCESS_NO);
        ecrmEntity.setMailReceptionAddress(mailSendInfo.getRecipient()[0]);
        ecrmEntity.setMailSection(CommonCode.MailType.MAIL_ANY_TIME); 
        ecrmEntity.setMailSort(CommonCode.MailType.MAIL_SORT_MEMBER);
        ecrmEntity.setMailType(CommonCode.MailType.MAIL_DROPOUT_MEMBER);
        ecrmEntity.setMailTarget(CommonCode.MailTarget.MAIL_TARGET_NULL);
        //insert mail_master
        int masterKey = this.setMailMaster(ecrmEntity, mailSendInfo);
        mailContents = mailContents.replace("$masterKey" , String.valueOf(masterKey));
        // Data
        emailData.put("userId", recipient[0]);
        emailData.put("userName", userName);
        emailData.put("contents", ecrmEntity);
        emailData.put("masterKey", masterKey);
		result =  sendMail(mailSendInfo, emailData);
	  } catch (IOException e) {
		logger.error("MailingServiceImpl.insertDropOut:IOException:Faild" , e);
	  } catch (MessagingException e) {
		logger.error("MailingServiceImpl.insertDropOut:MessagingException:Faild" , e);
	  } catch (ParseException e) {
		logger.error("MailingServiceImpl.insertDropOut:ParseException:Faild" , e);
	  }
	  return result;
	}
	/**
	 * 설문 발송
	 */
	@Override
	public int sendSurvey(EcrmEntity ecrmEntity) {
	  MemberEntity memberEntity = new MemberEntity(); 
	  MailSendEntity mailSendInfo = new MailSendEntity();
	  Map<String, Object> emailData = new ConcurrentHashMap<String,Object>();
	  int result = CommonCode.ZERO;
	  String[] recipientArr = null;
	  try { 
		String sendMailStartDates = DateUtils.getToday(CommonCode.DatePattern.DASH_TIME);
	    Date mailSendStartDate = DateUtils.getDate(sendMailStartDates, CommonCode.DatePattern.DASH_TIME);
	    memberEntity.setUserType(String.valueOf(ecrmEntity.getTargetType() - 1));
	    recipientArr = memberService.searchUserIdArr(memberEntity);
		// Info 
		mailSendInfo.setSubject(ecrmEntity.getSurveyTitle());
		mailSendInfo.setEmailForm(emailForm);
		mailSendInfo.setRecipient(recipientArr);
		if(ecrmEntity.getSurveySendType() == 2) {
		  mailSendStartDate = ecrmEntity.getSurveySendDate();
		}
		mailSendInfo.setSentDate(mailSendStartDate);

		ecrmEntity.setMailContent("<a href='"+serviceURL+"/surveyAnswerForm?surveyMasterKey="+ecrmEntity.getSurveyMasterKey()+"'>설문 하러가기</a>");
		 
        // Data 
 		emailData.put("contents", ecrmEntity); 
 		emailData.put("surveyMasterKey", ecrmEntity.getSurveyMasterKey());
 		//emailData.put("action", serviceURL+"/admin/ecrm/rest/insertSurveyAnswer");
		result =  sendMail(mailSendInfo, emailData);
	  } catch (IOException e) {
		logger.error("MailingServiceImpl.insertDropOut:IOException:Faild" , e);
	  } catch (MessagingException e) {
		logger.error("MailingServiceImpl.insertDropOut:MessagingException:Faild" , e);
	  } catch (ParseException e) {
		logger.error("MailingServiceImpl.insertDropOut:ParseException:Faild" , e);
	  }
	  
	  return result;
	}
	/**
	 * 임시비밀번호 발송
	 */
	@Override
	@Transactional(readOnly=false)
	public int sendTempPasswordMail(MemberEntity memberEntity) {
		  MailSendEntity mailSendInfo = new MailSendEntity();
		  Map<String, Object> emailData = new ConcurrentHashMap<String,Object>();
		  EcrmEntity ecrmEntity = new EcrmEntity();
		  int result = CommonCode.ZERO;
		  try {
			String sendMailStartDates = DateUtils.getToday(CommonCode.DatePattern.DASH_TIME);
			Date mailSendStartDate = DateUtils.getDate(sendMailStartDates, CommonCode.DatePattern.DASH_TIME);
		    // Info
		    mailSendInfo.setSubject("[Clapp] 임시 비밀번호를 알려 드립니다.");
		    mailSendInfo.setEmailForm(emailTemp);
		    String[] recipient = {memberEntity.getUserId()};
		    mailSendInfo.setRecipient(recipient);
			String userName = memberEntity.getUserName();
			String userPassword = 
					StringUtils.getRandomString(2)+NumberUtils.getRandomNumber(Integer.class, 3)+
					StringUtils.getRandomString(2);
			memberEntity.setUserPassword(HashUtils.encryptSHA256(userPassword));
			result = memberDAO.passwordGenerate(memberEntity);
			
		    ecrmEntity.setMailType(CommonCode.MailType.MAIL_TEMP_PASSWORD);
			String mailContents = this.getMailTemp(ecrmEntity)
											.getMailTempContents()
												.replace("$userName", userName)
												.replace("$userPassword", userPassword)
												.replace("$contextPath", serviceURL);
			
		    ecrmEntity = this.getMailTemp(ecrmEntity);
		    //ecrmEntity
	  		ecrmEntity.setMailSendStartDate(mailSendStartDate); 
	  		ecrmEntity.setMailContent(mailContents);
	      	ecrmEntity.setMailState(CommonCode.SUCCESS_NO);
	        ecrmEntity.setMailReceptionAddress(mailSendInfo.getRecipient()[0]);
	        ecrmEntity.setMailSection(CommonCode.MailType.MAIL_ANY_TIME); 
	        ecrmEntity.setMailSort(CommonCode.MailType.MAIL_SORT_MEMBER);
	        ecrmEntity.setMailType(CommonCode.MailType.MAIL_TEMP_PASSWORD);
	        ecrmEntity.setMailTarget(CommonCode.MailTarget.MAIL_TARGET_NULL);
	        //insert mail_master
	        int masterKey = this.setMailMaster(ecrmEntity, mailSendInfo);
	        mailContents = mailContents.replace("$masterKey" , String.valueOf(masterKey));
			// Data
	        emailData.put("userId", recipient[0]);
	        emailData.put("userName", userName);
	        emailData.put("contents", ecrmEntity);
	 		emailData.put("action", "/admin/ecrm/mailCheck");
	        emailData.put("masterKey", masterKey);
			result =  sendMail(mailSendInfo, emailData);
	        
		  } catch (IOException e) {
		    logger.error("MemberRestController.insertDropOut:Faild" , e);
		  } catch (MessagingException e) {
		    logger.error("MemberRestController.insertDropOut:Faild" , e);
		  } catch (Exception e) {
			logger.error("MemberRestController.insertDropOut:Faild" , e);
		  } 
		  return result;
	}

	/**
	 * 회원정보 열람 및 동의 메일
	 */
	@Override
	public int sendMemberAssentMail() {
		// TODO Auto-generated method stub
		return 0;
	}

	/**
	 * 유료서비스 카드/핸드폰 결제
	 */
	@Override
	public int sendPaymentCardPhoneMail(EcrmEntity ecrmEntity) {
		MailSendEntity mailSendInfo = new MailSendEntity();
		  Map<String, Object> emailData = new ConcurrentHashMap<String,Object>();
		  int result = CommonCode.ZERO;
		  try {
			String sendMailStartDates = DateUtils.getToday(CommonCode.DatePattern.DASH_TIME);
			Date mailSendStartDate = DateUtils.getDate(sendMailStartDates, CommonCode.DatePattern.DASH_TIME);
		    // Info
		    mailSendInfo.setSubject(ecrmEntity.getMailTitle());
		    mailSendInfo.setEmailForm("mailSubTemp.jsp");
		    String[] recipient = {ecrmEntity.getUserId()};
		    mailSendInfo.setRecipient(recipient); //받는사람
		    mailSendInfo.setSender(emailSender);//보내는 사람
		    
			String userName = ecrmEntity.getUserName();
			String productName = ecrmEntity.getProductName();
			int ticketAmount = ecrmEntity.getTicketAmount();
			Date expirationDate = ecrmEntity.getExpirationDate();
			Date paymentDate = ecrmEntity.getPaymentDate();
			int paymentAmount = ecrmEntity.getPaymentAmount();
			
			ecrmEntity.setMailType(CommonCode.MailType.MAIL_PAYMENT_CARD);
			String mailContents = this.getMailTemp(ecrmEntity)
											.getMailTempContents()
												.replace("$userName", userName)
												.replace("$userId", recipient[0])
												.replace("$productName", productName)
												.replace("$ticketAmount", String.valueOf(ticketAmount*5))
												.replace("$expirationDate", sdf.format(expirationDate))
												.replace("$paymentDate", sdf.format(new Date()))
												.replace("$paymentAmount", String.valueOf(paymentAmount))
												.replace("$contextPath", serviceURL);
//			if(!StringUtils.isEmpty(formRecruitInfoEntity.getFileName())) {
//				mailContents.replace("$file",  formRecruitInfoEntity.getFileName());
//			}
			//ecrmEntity
			ecrmEntity.setMailSendStartDate(mailSendStartDate); 
			ecrmEntity.setMailContent(mailContents);
	    	ecrmEntity.setMailState(CommonCode.SUCCESS_NO);
	        ecrmEntity.setMailReceptionAddress(mailSendInfo.getRecipient()[0]);
	        ecrmEntity.setMailSection(CommonCode.MailType.MAIL_ANY_TIME); 
	        ecrmEntity.setMailSort(CommonCode.MailType.MAIL_SORT_PAYMENT);
	        ecrmEntity.setMailTarget(CommonCode.MailTarget.MAIL_TARGET_NULL);
	        //insert mail_master
	        int masterKey = this.setMailMaster(ecrmEntity, mailSendInfo);
	        mailContents = mailContents.replace("$masterKey" , String.valueOf(masterKey));
	        
			 // Data
	        emailData.put("userId", recipient[0]);
	        emailData.put("userName", userName);
	        emailData.put("contents", ecrmEntity);
	        emailData.put("masterKey", masterKey);
			result =  sendMail(mailSendInfo, emailData);
			
		  } catch (IOException e) {
		    logger.error("MailingServiceImpl.insertDropOut:Faild" , e);
		  } catch (MessagingException e) {
		    logger.error("MailingServiceImpl.insertDropOut:Faild" , e);
		  } catch (Exception e) {
			logger.error("MailingServiceImpl.insertDropOut:Faild" , e);
		  } 
		  return result;
	}

	/**
	 * 유료서비스 가상계좌 결제
	 */
	@Override
	public int sendPaymentVirtualMail(EcrmEntity ecrmEntity) {
        MailSendEntity mailSendInfo = new MailSendEntity();
        Map<String, Object> emailData = new ConcurrentHashMap<String,Object>();
        int result = CommonCode.ZERO;
        try {
            String sendMailStartDates = DateUtils.getToday(CommonCode.DatePattern.DASH_TIME);
            Date mailSendStartDate = DateUtils.getDate(sendMailStartDates, CommonCode.DatePattern.DASH_TIME);
            // Info
            mailSendInfo.setSubject(ecrmEntity.getMailTitle());
            mailSendInfo.setEmailForm("mailSubTemp.jsp");
            String[] recipient = {ecrmEntity.getUserId()};
            mailSendInfo.setRecipient(recipient); //받는사람
            mailSendInfo.setSender(emailSender);//보내는 사람

            String userName = ecrmEntity.getUserName();
            String productName = ecrmEntity.getProductName();
            int ticketAmount = ecrmEntity.getTicketAmount();
            Date expirationDate = ecrmEntity.getExpirationDate();
            Date paymentDate = ecrmEntity.getPaymentDate();
            int paymentAmount = ecrmEntity.getPaymentAmount();
            String accountNum = ecrmEntity.getAccountNum(); //입금계좌번호
            String financeName = ecrmEntity.getFinanceName();//입금은행
            ecrmEntity.setMailType(CommonCode.MailType.MAIL_PAYMENT_VIRTUAL);
            String mailContents = this.getMailTemp(ecrmEntity)
                    .getMailTempContents()
                    .replace("$userName", userName)
                    .replace("$userId", recipient[0])
                    .replace("$productName", productName)
                    .replace("$ticketAmount", String.valueOf(ticketAmount*5))
                    .replace("$expirationDate", sdf.format(expirationDate))
                    .replace("$paymentDate", sdf.format(new Date()))
                    .replace("$paymentAmount", String.valueOf(paymentAmount))
                    .replace("$contextPath", serviceURL)
                    .replace("$accountNum", accountNum)
                    .replace("$financeName", financeName);
//			if(!StringUtils.isEmpty(formRecruitInfoEntity.getFileName())) {
//				mailContents.replace("$file",  formRecruitInfoEntity.getFileName());
//			}
                                    //ecrmEntity
                                    ecrmEntity.setMailSendStartDate(mailSendStartDate);
            ecrmEntity.setMailContent(mailContents);
            ecrmEntity.setMailState(CommonCode.SUCCESS_NO);
            ecrmEntity.setMailReceptionAddress(mailSendInfo.getRecipient()[0]);
            ecrmEntity.setMailSection(CommonCode.MailType.MAIL_ANY_TIME);
            ecrmEntity.setMailSort(CommonCode.MailType.MAIL_SORT_PAYMENT);
            ecrmEntity.setMailTarget(CommonCode.MailTarget.MAIL_TARGET_NULL);
            //insert mail_master
            int masterKey = this.setMailMaster(ecrmEntity, mailSendInfo);
            mailContents = mailContents.replace("$masterKey" , String.valueOf(masterKey));

            // Data
            emailData.put("userId", recipient[0]);
            emailData.put("userName", userName);
            emailData.put("contents", ecrmEntity);
            emailData.put("masterKey", masterKey);
            result =  sendMail(mailSendInfo, emailData);

        } catch (IOException e) {
            logger.error("MailingServiceImpl.insertDropOut:Faild" , e);
        } catch (MessagingException e) {
            logger.error("MailingServiceImpl.insertDropOut:Faild" , e);
        } catch (Exception e) {
            logger.error("MailingServiceImpl.insertDropOut:Faild" , e);
        }
        return result;
	}

	/**
	 * 결제 취소
	 */
	@Override
	public int sendPaymentCancelMail() {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	@Transactional(readOnly=false)
	public int sendApiMail(EcrmEntity ecrmEntity) {
		MailSendEntity mailSendInfo = new MailSendEntity();
		  Map<String, Object> emailData = new ConcurrentHashMap<String,Object>();
		  int result = CommonCode.ZERO;
		  try {
			String sendMailStartDates = DateUtils.getToday(CommonCode.DatePattern.DASH_TIME);
			Date mailSendStartDate = DateUtils.getDate(sendMailStartDates, CommonCode.DatePattern.DASH_TIME);
		    // Info
		    mailSendInfo.setSubject(ecrmEntity.getMailTitle());
		    mailSendInfo.setEmailForm(emailTemp);
		    String[] recipient = ecrmEntity.getMailReceptionAddress().split(",");
		    mailSendInfo.setRecipient(recipient);  
		    mailSendInfo.setSentDate(ecrmEntity.getMailSendDate());
		    String userName = ecrmEntity.getUserName(); 
			String fromEmail = ecrmEntity.getFromEmail(); 
			String prodName = ecrmEntity.getProdName();  
			String fileUrl = ecrmEntity.getFileUrl(); 
			String memo = ecrmEntity.getMemo(); 
			String startDttm = ecrmEntity.getStartDttm(); 
			String testName = ecrmEntity.getTestName(); 
			String serverUrl = ecrmEntity.getServerUrl(); 
			String mailContent = ecrmEntity.getMailContent();
			
			ecrmEntity.setMailType(ecrmEntity.getMailType());
			String mailContents = this.getMailTemp(ecrmEntity)
											.getMailTempContents()
												.replace("$fromEmail", fromEmail)
												.replace("$prodName", prodName)
												.replace("$fileUrl", fileUrl)
												.replace("$startDttm", startDttm)
												.replace("$testName", testName)
												.replace("$serverUrl", serverUrl)
												.replace("$mailContent", mailContent)
												.replace("$memo", memo);
			//ecrmEntity
			ecrmEntity.setMailSendStartDate(mailSendStartDate); 
			ecrmEntity.setMailContent(mailContents);
	    	ecrmEntity.setMailState(CommonCode.SUCCESS_NO);
	        ecrmEntity.setMailReceptionAddress(mailSendInfo.getRecipient()[0]);
	        ecrmEntity.setMailSection(CommonCode.MailType.MAIL_ANY_TIME); 
	        ecrmEntity.setMailSort(CommonCode.MailType.MAIL_SORT_JNLP);
	        ecrmEntity.setMailTarget(CommonCode.MailTarget.MAIL_TARGET_NULL);
	        //insert mail_master
	        int masterKey = this.setMailMaster(ecrmEntity, mailSendInfo);
	        mailContents = mailContents.replace("$masterKey" , String.valueOf(masterKey));
	        
			 // Data
	        emailData.put("userId", recipient[0]);
	        emailData.put("userName", userName);
	        emailData.put("contents", ecrmEntity);
	        emailData.put("masterKey", masterKey);
			result =  sendMail(mailSendInfo, emailData);
			
		  } catch (IOException e) {
		    logger.error("MailingServiceImpl.insertDropOut:Faild" , e);
		  } catch (MessagingException e) {
		    logger.error("MailingServiceImpl.insertDropOut:Faild" , e);
		  } catch (Exception e) {
			logger.error("MailingServiceImpl.insertDropOut:Faild" , e);
		  } 
		  return result;
	}
	@Override
	@Transactional(readOnly=false)
	public int sendDefaultMail(FormRecruitInfoEntity formRecruitInfoEntity) {
		MailSendEntity mailSendInfo = new MailSendEntity();
		  Map<String, Object> emailData = new ConcurrentHashMap<String,Object>();
		  int result = CommonCode.ZERO;
		  EcrmEntity ecrmEntity = new EcrmEntity();
		  try {
			String sendMailStartDates = DateUtils.getToday(CommonCode.DatePattern.DASH_TIME);
			Date mailSendStartDate = DateUtils.getDate(sendMailStartDates, CommonCode.DatePattern.DASH_TIME);
		    // Info
		    mailSendInfo.setSubject(formRecruitInfoEntity.getName()+"_이력서");
		    mailSendInfo.setEmailForm("mailSubTemp.jsp");
		    String[] recipient = {recruitSender};
		    mailSendInfo.setRecipient(recipient); //받는사람
		    mailSendInfo.setSender(formRecruitInfoEntity.getEmail());//보내는 사람
		    mailSendInfo.setFile(formRecruitInfoEntity.getFileName());
		    mailSendInfo.setFileName("이력서");
		    
			String userName = "클앱담당자"; 
			
			ecrmEntity.setMailType(CommonCode.MailType.MAIL_RECRUIT);
			String mailContents = this.getMailTemp(ecrmEntity)
											.getMailTempContents()
												.replace("$name", formRecruitInfoEntity.getName())
												.replace("$email", recipient[0])
												.replace("$tel", formRecruitInfoEntity.getTel())
												.replace("$depart", formRecruitInfoEntity.getDepart()) 
												.replace("$nowDate", sdf.format(new Date()));
//			if(!StringUtils.isEmpty(formRecruitInfoEntity.getFileName())) {
//				mailContents.replace("$file",  formRecruitInfoEntity.getFileName());
//			}
			//ecrmEntity
			ecrmEntity.setMailSendStartDate(mailSendStartDate); 
			ecrmEntity.setMailContent(mailContents);
	    	ecrmEntity.setMailState(CommonCode.SUCCESS_NO);
	        ecrmEntity.setMailReceptionAddress(mailSendInfo.getRecipient()[0]);
	        ecrmEntity.setMailSection(CommonCode.MailType.MAIL_ANY_TIME); 
	        ecrmEntity.setMailSort(CommonCode.MailType.MAIL_SORT_CUSTOMER);
	        ecrmEntity.setMailTarget(CommonCode.MailTarget.MAIL_TARGET_NULL);
	        //insert mail_master
	        int masterKey = this.setMailMaster(ecrmEntity, mailSendInfo);
	        mailContents = mailContents.replace("$masterKey" , String.valueOf(masterKey));
	        
			 // Data
	        emailData.put("userId", recipient[0]);
	        emailData.put("userName", userName);
	        emailData.put("contents", ecrmEntity);
	        emailData.put("masterKey", masterKey);
			result =  sendMail(mailSendInfo, emailData);
			
		  } catch (IOException e) {
		    logger.error("MailingServiceImpl.insertDropOut:Faild" , e);
		  } catch (MessagingException e) {
		    logger.error("MailingServiceImpl.insertDropOut:Faild" , e);
		  } catch (Exception e) {
			logger.error("MailingServiceImpl.insertDropOut:Faild" , e);
		  } 
		  return result;
	}
	@Override
	@Transactional(readOnly=false)
	public int sendInquiryAnswerMail(MemberEntity memberEntity) {
		 MailSendEntity mailSendInfo = new MailSendEntity();
		  Map<String, Object> emailData = new ConcurrentHashMap<String,Object>();
		  EcrmEntity ecrmEntity = new EcrmEntity();
		  int result = CommonCode.ZERO;
		  try {
			String sendMailStartDates = DateUtils.getToday(CommonCode.DatePattern.DASH_TIME);
			Date mailSendStartDate = DateUtils.getDate(sendMailStartDates, CommonCode.DatePattern.DASH_TIME);
		    // Info
		    mailSendInfo.setSubject("[Clapp] 고객문의 답변 메일입니다..");
		    mailSendInfo.setEmailForm(emailTemp);
		    //String[] recipient = {emailSender};
		    String[] recipient = {memberEntity.getUserId()}; 
		    mailSendInfo.setRecipient(recipient); //받는사람
		    mailSendInfo.setSender(emailSender);//보내는 사람
			String userName = memberEntity.getUserName(); 
			String inquiry = memberEntity.getInquiryContents();
			String answer = memberEntity.getAnswerContents();
		    ecrmEntity.setMailType(CommonCode.MailType.MAIL_INQUIRY);
			String mailContents = this.getMailTemp(ecrmEntity)
											.getMailTempContents()
												.replace("$userName", userName)
												.replace("$userId", recipient[0])
												.replace("$nowDate", sdf.format(new Date()))
												.replace("$contextPath", serviceURL)
												.replace("$inquiry", inquiry)
												.replace("$answer", answer);
			
		    ecrmEntity = this.getMailTemp(ecrmEntity);
		    //ecrmEntity
	  		ecrmEntity.setMailSendStartDate(mailSendStartDate); 
	  		ecrmEntity.setMailContent(mailContents);
	      	ecrmEntity.setMailState(CommonCode.SUCCESS_NO);
	        ecrmEntity.setMailReceptionAddress(mailSendInfo.getRecipient()[0]);
	        ecrmEntity.setMailSection(CommonCode.MailType.MAIL_ANY_TIME); 
	        ecrmEntity.setMailSort(CommonCode.MailType.MAIL_SORT_CUSTOMER);
	        ecrmEntity.setMailType(CommonCode.MailType.MAIL_INQUIRY);
	        ecrmEntity.setMailTarget(CommonCode.MailTarget.MAIL_TARGET_NULL);
	        //insert mail_master
	        int masterKey = this.setMailMaster(ecrmEntity, mailSendInfo);
	        mailContents = mailContents.replace("$masterKey" , String.valueOf(masterKey));
			// Data
	        emailData.put("userId", recipient[0]);
	        emailData.put("userName", userName);
	        emailData.put("contents", ecrmEntity);
	        emailData.put("masterKey", masterKey);
			result =  sendMail(mailSendInfo, emailData);
	        
		  } catch (IOException e) {
		    logger.error("MailingServiceImpl.insertDropOut:Faild" , e);
		  } catch (MessagingException e) {
		    logger.error("MailingServiceImpl.insertDropOut:Faild" , e);
		  } catch (Exception e) {
			logger.error("MailingServiceImpl.insertDropOut:Faild" , e);
		  } 
		  return result;
	}
	 
}
