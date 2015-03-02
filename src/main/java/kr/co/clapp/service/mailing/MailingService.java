package kr.co.clapp.service.mailing;

import javax.servlet.http.HttpServletRequest;

import kr.co.clapp.entities.DropOutUserEntity;
import kr.co.clapp.entities.EcrmEntity;
import kr.co.clapp.entities.MemberEntity;
import kr.co.clapp.entities.validation.FormRecruitInfoEntity;

public interface MailingService {
	
  /**
   * 이메일 답변
   * @return
   */
  int sendInquiryMail();
  
  /**
   * 일반회원 가입 
   * @return
   */
  int sendJoinMemberMail(MemberEntity memberEntity);
  
  /**
   * 기업/단체 회원 가입
   * @return
   */
  int sendJoinCompanyMemberMail(MemberEntity memberEntity);
  
  /**
   * 회원 탈퇴시
   * @return
   */
  int sendDropOutMemberMail(DropOutUserEntity dropOutUserEntity);
  
  /**
   * 임시비밀번호 발송시
   * @return
   */
  int sendTempPasswordMail(MemberEntity memberEntity);
  
  /**
   * 회원정보 열람 및 동의 메일
   * @return
   */
  int sendMemberAssentMail();
  
  /**
   * 유료서비스 결제시(신용카드, 핸드폰)
   * @return
   */
  int sendPaymentCardPhoneMail(EcrmEntity ecrmEntity);
  
  /**
   * 유료서비스 결제시(가상계좌)
   * @return
   */
  int sendPaymentVirtualMail();
  
  /**
   * 결제 취소
   * @return
   */
  int sendPaymentCancelMail();
  /**
   * 설문 발송
   * @param ecrmEntity
   * @return
   */

  int sendSurvey(EcrmEntity ecrmEntity, HttpServletRequest request);

  int sendApiMail(EcrmEntity ecrmEntity);
 
 
  
  /**
   * 공용메일
   * @return
   */
  int sendDefaultMail(FormRecruitInfoEntity formRecruitInfoEntity);
	/**
	 * 문의메일답변
	 * @param memberEntity
	 * @return
	 */
	int sendInquiryAnswerMail(MemberEntity memberEntity);
}
