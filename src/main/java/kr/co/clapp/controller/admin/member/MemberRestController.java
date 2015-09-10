package kr.co.clapp.controller.admin.member;

import java.util.HashMap;
import java.util.Map;


import kr.co.clapp.constants.CommonCode;
import kr.co.clapp.constants.ResultCode;
import kr.co.clapp.entities.*;
import kr.co.clapp.service.mailing.MailingService;
import kr.co.clapp.service.member.MemberService;
import kr.co.clapp.service.ticket.TicketService;
import kr.co.digigroove.commons.messages.Messages;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/admin/member/rest")
public class MemberRestController {
	
  private static final Logger logger = LoggerFactory.getLogger(MemberRestController.class);

  @Autowired
  private Messages messages;

  @Autowired
  private MemberService memberService;

  @Autowired
  private MailingService mailingService;

     @Autowired
     private TicketService ticketService;

  /**
   * 회원 수정
   * @param memberEntity
   * @return
   */
  @RequestMapping(value = "/modifyMember",  method = RequestMethod.POST)
  public ResponseEntity modifyMember(MemberEntity memberEntity) {
	ResponseEntity result = new ResponseEntity();
	try {
	  String resultCode = ResultCode.FAIL;
	  String resultMessage = messages.getMessage("modify.fail");
	  if(memberService.modifyMember(memberEntity) > CommonCode.ZERO) {
	    resultCode = ResultCode.SUCCESS;
	    resultMessage = messages.getMessage("modify.success");
	  }
	  result.setResultCode(resultCode);
	  result.setResultMSG(resultMessage);
	  if(CommonCode.USER_MEMBER.equals(memberEntity.getUserType())) {
		result.setResultURL("/admin/member/memberList");
	  } else {
		result.setResultURL("/admin/member/companyList");
	  }
	
	} catch (Exception e) {
	  logger.error("MemberRestController.modifyMember:Faild" , e);
	  result.setResultCode(ResultCode.FAIL);
	  result.setResultMSG(messages.getMessage("modify.fail"));
	}
	return result;
  }
  /**
   * 회원 탈퇴/등록
   * @param dropOutUserEntity
   * @return
   */
  @RequestMapping(value = "/insertDropOut",  method = RequestMethod.POST)
  public ResponseEntity insertDropOut(DropOutUserEntity dropOutUserEntity,
		@RequestParam(required = false, value = "userType", defaultValue="1") String userType) {
	ResponseEntity result = new ResponseEntity();
	EcrmEntity ecrmEntity = new EcrmEntity();
	try {
	  String resultCode = ResultCode.FAIL;
	  String resultMessage = messages.getMessage("insert.fail");
	  if(memberService.insertDropOutUser(dropOutUserEntity) > CommonCode.ZERO) {
	    resultCode = ResultCode.SUCCESS;
	    resultMessage = messages.getMessage("dropout.member.success");
	    if(CommonCode.USER_MEMBER.equals(userType)) {
	      result.setResultURL("/admin/member/memberList");
		} else {
		  result.setResultURL("/admin/member/companyList");
		}
	    if(mailingService.sendDropOutMemberMail(dropOutUserEntity) > CommonCode.ZERO) { 
  	    	  // 메일 발송 성공
	      ecrmEntity.setMailState(CommonCode.SUCCESS_NO);
	    } else {
	    	  //메일 발송 실패
	      ecrmEntity.setMailState(CommonCode.FAIL_NO);
	    }
	  }
	  result.setResultCode(resultCode);
	  result.setResultMSG(resultMessage);
	} catch(MailException e) {
		logger.error("MemberRestController.insertDropOut:MailException" , e);
	} catch (Exception e) {
	   logger.error("MemberRestController.insertDropOut:Faild" , e);
	   result.setResultCode(ResultCode.FAIL);
	   result.setResultMSG(messages.getMessage("insert.fail"));
    }
	return result;
  }
  /**
   * 회원 아이디 검색 
   * @param memberEntity
   * @return
   */
  @RequestMapping(value = "/searchUserId", method = RequestMethod.POST)
  public Map<String, Object> searchUserId(MemberEntity memberEntity) {
	Map<String, Object> result = new HashMap<String, Object>();
	try { 
		result.put("dataList", memberService.searchUserId(memberEntity));
	} catch (Exception e) {
	  logger.error("MemberRestController.insertDropOut:Faild" , e);
    }
	return result;
  }
 

    /**
     * 상품 목록 출력
     * @param ticketEntity
     * @return
     */
    @RequestMapping(value = "/selectProductList", method = RequestMethod.POST)
    public Map<String, Object> getUserTicketProductList(TicketEntity ticketEntity) {
        Map<String, Object> result = new HashMap<String, Object>();
        try {
            result.put("dataList", ticketService.getUserTicketProductList(ticketEntity));
        } catch (Exception e) {
            logger.error("MemberRestController.listOut:Faild" , e);
        }
        return result;
    }

}
