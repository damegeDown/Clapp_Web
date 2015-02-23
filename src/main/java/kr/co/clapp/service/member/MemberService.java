package kr.co.clapp.service.member;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.co.clapp.entities.AdminEntity;
import kr.co.clapp.entities.DropOutUserEntity;
import kr.co.clapp.entities.MemberEntity;
import kr.co.clapp.entities.ResponseEntity;
import kr.co.clapp.entities.SmsEntity;
import kr.co.clapp.entities.TicketEntity;
import kr.co.clapp.entities.validation.FormUserInfoEntity;

public interface MemberService {
  /**
  * 관리자 로그인
  * @param adminEntity
  * @return
  * @throws Exception
  */
  ResponseEntity doLogin(AdminEntity adminEntity, ResponseEntity result, HttpSession session, HttpServletRequest request) throws Exception;
  /**
  * 관리자 목록 상세
  * @param adminEntity
  * @return
  * @throws Exception
  */
  AdminEntity getAdminDetail(AdminEntity adminEntity) throws Exception;

  /**
   * 관리자 리스트
   * @param adminEntity
   * @return
   * @throws Exception
   */
  AdminEntity getAdminList(AdminEntity adminEntity) throws Exception;
  
  /**
   * 관리자 등록
   * @param adminEntity
   * @return
   * @throws Exception
   */
  int insertAdmin(AdminEntity adminEntity) throws Exception;

  /**
   * 관리자 수정
   * @param adminEntity
   * @return
   * @throws Exception
   */
  int modifyAdmin(AdminEntity adminEntity) throws Exception;
  
  /**
   * 관리자 아이디 중복 체크
   * @param adminId
   */
  int doAdminIdCheck(String adminId) throws Exception;
 
  /**
   * 관리자 삭제
   * @param adminEntity
   * @return
   */
  int removeAdmin(AdminEntity adminEntity) throws Exception ;
  /**
   * 회원 목록
   * @param memberEntity
   * @return
   * @throws Exception
   */
  MemberEntity getMemberList(MemberEntity memberEntity) throws Exception;
  /**
   * 회원 상세
   * @param memberEntity
   * @return
   * @throws Exception
   */
  MemberEntity getMemberDetail(MemberEntity memberEntity) throws Exception;
  /**
   * 회원 수정
   * @param memberEntity
   * @return
   * @throws Exception
   */
  int modifyMember(MemberEntity memberEntity) throws Exception;
  /**
   * 회원 탈퇴
   * @param memberEntity
   * @return
   * @throws Exception
   */
//  int removeMember(MemberEntity memberEntity) throws Exception;
  
  /**	
   * 회원 탈퇴 목록
   * @param dropOutUserEntity
   * @return
   */
  DropOutUserEntity getDropOutUserList(DropOutUserEntity dropOutUserEntity) throws Exception;
  /**
   * 회원 탈퇴등록
   * @param memberEntity
   * @return
   * @throws Exception
   */
  int insertDropOutUser(DropOutUserEntity dropOutUserEntity) throws Exception;
  
  /**
   * 회원 아이디 검색
   * @param memberEntity
   * @return
   */
  List<MemberEntity> searchUserId(MemberEntity memberEntity);
  /**
   * 일반/ 기업,단체 타입별 누적 카운트
   */
  int getMemberCountByType(String memberTypeCode);
  /**
   * 탈퇴회원 누적 카운트
   */
  int getDropOutCount();
  
  String[] searchUserIdArr(MemberEntity memberEntity);
  /**
   * 관리자 일반회원 정보 접근시 로그 저장
   * @param adminEntity
   * @return
   */
  int insertAccessLog(AdminEntity adminEntity);
  /**
   * 사용자 회원 등록
   * @param memberEntity
   * @return
 * @throws Exception 
   */
  int insertMember(MemberEntity memberEntity) throws Exception;
  
  MemberEntity getUserInfo(MemberEntity memberEntity);
 
  /**
   * 회원 로그인
   * @param memberEntity
   * @param result
   * @param session
   * @return
 * @throws Exception 
   */
  ResponseEntity doUserLogin(MemberEntity memberEntity, ResponseEntity result,
		HttpSession session) throws Exception;
  
  int userLoginStateOff(MemberEntity memberEntity);
  MemberEntity passwordFind(MemberEntity memberEntity);
  /**
   * 비밀번호 변경
   * @param formUserInfoEntity
   * @return
   */
  int modifyPasswrod(FormUserInfoEntity formUserInfoEntity);
  /**
   * 회원 인증번호 생성후 입력
   * @param memberInfo
   */
  int setUserKey(MemberEntity memberInfo);
  /**
   * 회원가입을 위한 아이디 중복검사
   * @param memberEntity
   * @return
   */
int searchId(MemberEntity memberEntity);
/**
 * 휴대폰번호 중복검사
 * @param memberEntity
 * @return
 */
int searchPhoneNum(MemberEntity memberEntity);
/**
 * 아이디 찾기
 * @param memberEntity
 * @return
 */
MemberEntity userIdFind(MemberEntity memberEntity);
/**
 * 사용자 사용중인 상품정보 
 * @param userInfo
 * @return
 */
TicketEntity getUserProductInfo(MemberEntity userInfo);

  
}

