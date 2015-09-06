package kr.co.clapp.controller.user.members;



import kr.co.clapp.constants.CommonCode;
import kr.co.clapp.constants.ResultCode;
import kr.co.clapp.entities.EcrmEntity;
import kr.co.clapp.entities.MemberEntity;
import kr.co.clapp.entities.ResponseEntity;
import kr.co.clapp.entities.SmsEntity;
import kr.co.clapp.service.mailing.MailingService;
import kr.co.clapp.service.member.MemberService;
import kr.co.clapp.service.sms.SmsService;
import kr.co.digigroove.commons.messages.Messages;
import kr.co.digigroove.commons.utils.NumberUtils;
import kr.co.digigroove.commons.utils.StringUtils;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;


@RestController
@RequestMapping(value="members/rest")
public class MembersRestController {
	private static final Logger logger = LoggerFactory.getLogger( MembersRestController.class );
	
	@Value("#{smsConfig['sendNo']}")
	private String sendNo;
	
	@Autowired
	private Messages messages;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private SmsService smsService;
	
	@Autowired
	private MailingService mailingService;
	/**
	 * 회원 등록
	 * @param memberEntity
	 * @return
	 */
    @RequestMapping(value = "/insertMember",  method = RequestMethod.POST)
    public ResponseEntity insertMember(MemberEntity memberEntity) {
  	ResponseEntity result = new ResponseEntity();
  	EcrmEntity ecrmEntity = new EcrmEntity();
  	try {
  	  String resultCode = ResultCode.FAIL;
  	  String resultMessage = messages.getMessage("insert.fail");
  	  if(memberService.insertMember(memberEntity) > CommonCode.ZERO) {
  	    resultCode = ResultCode.SUCCESS;
          logger.debug("{}",resultCode);
  	    if(memberEntity.getUserType().equals(CommonCode.USER_MEMBER)){
  	    	result.setResultURL("/members/memberJoinComplete?userName=" + memberEntity.getUserName());
  	    	if(mailingService.sendJoinMemberMail(memberEntity) > CommonCode.ZERO) {
  	    		// 메일 발송 성공
  	    		ecrmEntity.setMailState(CommonCode.SUCCESS_NO);
  	    	} else {
  	    		// 메일 발송 실패
  	    		ecrmEntity.setMailState(CommonCode.FAIL_NO);
  	    		result.setResultMSG(resultMessage);
  	    	}
  	    } else {
  	    	result.setResultURL("/members/memberJoinComplete?userName=" + memberEntity.getUserCompanyName());
  	    	if(mailingService.sendJoinCompanyMemberMail(memberEntity) > CommonCode.ZERO) {
  	    		// 메일 발송 성공
  	    		ecrmEntity.setMailState(CommonCode.SUCCESS_NO);
  	    	} else {
  	    		// 메일 발송 실패
  	    		ecrmEntity.setMailState(CommonCode.FAIL_NO);
  	    		result.setResultMSG(resultMessage);
  	    	}
  	    }
  	  }
  	  result.setResultCode(resultCode);
  	
  	} catch (Exception e) {
  	  logger.error("MembersRestController.insertMember:Faild" , e);
  	  result.setResultCode(ResultCode.FAIL);
  	  result.setResultMSG(messages.getMessage("insert.fail"));
  	}
  	return result;
    }
    /**
     * 비밀번호 찾기
     * @param memberEntity
     * @return
     */
    @RequestMapping(value = "/passwordFind",  method = RequestMethod.POST)
    public ResponseEntity passwordFind(MemberEntity memberEntity ) {
  	ResponseEntity result = new ResponseEntity();
  	EcrmEntity ecrmEntity = new EcrmEntity();
  	try {
  	  String resultCode = ResultCode.NO_RESULT;
  	  String resultMessage = messages.getMessage("notFound2");
  	  memberEntity = memberService.passwordFind(memberEntity); 
  	  if(!StringUtils.isEmpty(memberEntity)){
	    	if(mailingService.sendTempPasswordMail(memberEntity) > CommonCode.ZERO) {
  	    		// 메일 발송 성공
  	    		ecrmEntity.setMailState(CommonCode.SUCCESS_NO);
  	    		resultCode = ResultCode.SUCCESS;
  	    		resultMessage = messages.getMessage("insert.success");
  	    	} else {
  	    		// 메일 발송 실패
  	    		ecrmEntity.setMailState(CommonCode.FAIL_NO);
  	    	}
  	  }
  	  result.setResultCode(resultCode);
  	  result.setResultMSG(resultMessage);
  	
  	} catch (Exception e) {
  	  logger.error("MembersRestController.userIdFind:Faild" , e);
  	  result.setResultCode(ResultCode.NO_RESULT);
  	  result.setResultMSG(messages.getMessage("notFound2"));
  	}
  	return result;
    }
    /**
     * 아이디 중복 검사
     * @param memberEntity
     * @return
     */
    @RequestMapping(value = "/searchId",  method = RequestMethod.POST)
    public ResponseEntity searchId(MemberEntity memberEntity ) {
  	ResponseEntity result = new ResponseEntity();
  	try {
  	  String resultCode = ResultCode.NO_RESULT;
  	  String resultMessage = messages.getMessage("notFound");
  	  int checkResult = memberService.searchId(memberEntity);
  	  if(checkResult > CommonCode.ZERO) {
  	    resultCode = ResultCode.SUCCESS;
  	    resultMessage = messages.getMessage("insert.success");
  	  }
  	  result.setResultCode(resultCode);
  	  result.setResultDATA(memberEntity);
  	  result.setResultMSG(resultMessage);
  	
  	} catch (Exception e) {
  	  logger.error("MembersRestController.userIdFind:Faild" , e);
  	  result.setResultCode(ResultCode.NO_RESULT);
  	  result.setResultMSG(messages.getMessage("notFound"));
  	}
  	return result;
    }
    /**
     * 인증번호 전송
     * @param smsEntity
     * @param memberEntity
     * @return
     */
    @RequestMapping(value = "/authentication",  method = RequestMethod.POST)
    public ResponseEntity authentication(SmsEntity smsEntity, MemberEntity memberEntity) {
  	ResponseEntity result = new ResponseEntity();
  	try {
  	  String resultCode = ResultCode.NO_RESULT;
  	  String resultMessage = messages.getMessage("notFound");
  	  int resultNum = 0;
	  int checkResult = memberService.searchPhoneNum(memberEntity);
	  if(checkResult > CommonCode.ZERO) {
	      resultCode = ResultCode.SUCCESS;
	    } else {
	 	resultNum = NumberUtils.getRandomNumber(Integer.class, 6);
	  	String resultStringNum = "(클앱) 회원가입 인증번호 안내 - " + String.valueOf(resultNum);
	  	smsEntity.setSend_phone(sendNo);
	  	smsEntity.setMsg_body(resultStringNum);
	  	if(smsService.insertSms(smsEntity) > CommonCode.ZERO ) {
	  		resultCode = ResultCode.NO_RESULT;
	  		resultMessage = messages.getMessage("insert.success");
	  		}
	  	}
  	  result.setResultDATA(resultNum);
  	  result.setResultCode(resultCode);
  	  result.setResultMSG(resultMessage);
  	
  	} catch (Exception e) {
  	  logger.error("MembersRestController.userIdFind:Faild" , e);
  	  result.setResultCode(ResultCode.NO_RESULT);
  	  result.setResultMSG(messages.getMessage("notFound"));
  	}
  	return result;
    }
    /**
     * 아이디 찾기
     * @param memberEntity
     * @return
     */
    @RequestMapping(value="userIdFind")
    public ResponseEntity userIdFind(MemberEntity memberEntity){
    	ResponseEntity result = new ResponseEntity();
    	try{
    		String resultCode = ResultCode.NO_RESULT;
    		String resultMessage = messages.getMessage("find.fail");
    		memberEntity = memberService.userIdFind(memberEntity);
    	  	  if(!StringUtils.isEmpty(memberEntity)) {
	    	    resultCode = ResultCode.SUCCESS;
	    	    resultMessage = messages.getMessage("find.success");
	    	  }
    	  	  	
    	  	  	result.setResultDATA(memberEntity);
	    	    result.setResultCode(resultCode);
	    	    result.setResultMSG(resultMessage);
    	} catch (Exception e){
    		logger.error("MembersRestController.userIdFind:Faild" , e);
    		result.setResultCode(ResultCode.NO_RESULT);
    		result.setResultMSG(messages.getMessage("find.fail"));
    	}
    	return result;
    }
    @RequestMapping(value="searchPhoneNum")
    public ResponseEntity searchPhoneNum(@RequestParam(required=false, value="userCellPhoneNumber") String userCellPhoneNumber) {
    	ResponseEntity result = new ResponseEntity();
    	MemberEntity memberEntity = new MemberEntity();
    	try{
    		String resultCode = ResultCode.FAIL;
    		String resultMessage = messages.getMessage("find.cellNumber.used");
    		memberEntity.setUserCellPhoneNumber(userCellPhoneNumber);
    	  	  if(memberService.searchPhoneNum(memberEntity) < CommonCode.ONE) {
	    	    resultCode = ResultCode.SUCCESS;
	    	    resultMessage = messages.getMessage("find.success");
	    	  }
	    	    result.setResultCode(resultCode);
	    	    result.setResultMSG(resultMessage);
    	} catch (Exception e){
    		logger.error("MembersRestController.searchPhoneNum" , e);
    		result.setResultCode(ResultCode.NO_RESULT);
    		result.setResultMSG(messages.getMessage("find.fail"));
    	}
    	return result;
    }
}
