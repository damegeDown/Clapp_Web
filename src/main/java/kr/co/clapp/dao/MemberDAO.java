package kr.co.clapp.dao;

import kr.co.clapp.entities.AdminEntity;
import kr.co.clapp.entities.MemberEntity;
import kr.co.clapp.entities.TicketEntity;
import kr.co.clapp.entities.validation.FormUserInfoEntity;

import java.util.List;

public interface MemberDAO {
  /**
  * 로그인
  * @param adminEntity
  * @return
  * @throws Exception
  */
  AdminEntity doLogin(AdminEntity adminEntity);
  
  /**
  * 관리자 목록 상세
  * @param adminEntity
  * @return
  * @throws Exception
  */
  AdminEntity getAdminDetail(AdminEntity adminEntity);

  /**
   * 관리자 목록 카운트
   * @param adminEntity
   * @return
   */
  int getAdminCount(AdminEntity adminEntity);
  
  /**
   * 관리자 목록
   * @param adminEntity
   * @return
   */
  List<AdminEntity> getAdminList(AdminEntity adminEntity);
  
  /**
   * 관리자 등록
   * @param adminEntity
   * @return
   */
  int insertAdmin(AdminEntity adminEntity);

  /**
   * 관리자 권한 등록
   * @param adminEntity
   * @return
   */
  int insertAdminPermission(AdminEntity adminEntity);

  /**
   * 관리자 수정
   * @param adminEntity
   * @return
   */
  int modifyAdmin(AdminEntity adminEntity);

  /**
   * 관리자 권한 수정
   * @param adminEntity
   * @return
   */
  int modifyAdminPermission(AdminEntity adminEntity);

  /**
   * 관리자 아이디 중복 체크
   * @param adminId
   * @return
   */
  int doAdminIdCheck(String adminId);

  /**
   * 관리자 삭제
   * @param adminEntity
   * @return
   */
  int removeAdmin(AdminEntity adminEntity);
  
  /**
   * 일반회원 목록
   * @param memberEntity
   * @return
   */
  List<MemberEntity> getMemberList(MemberEntity memberEntity);
  /**
   * 일반회원 목록 카운트
   * @param memberEntity
   * @return
   */
  int getMemberCount(MemberEntity memberEntity);
  /**
   * 일반회원 상세
   * @param memberEntity
   * @return
   */
  MemberEntity getMemberDetail(MemberEntity memberEntity);
  
  /**
   * 일반회원 수정
   * @param memberEntity
   * @return
   */
  int modifyMember(MemberEntity memberEntity);
  /**
   * 일반회원 탈퇴
   * @param memberEntity
   * @return
   */
  int removeMember(MemberEntity memberEntity);
  /**
   * 기업/단체회원 목록
   * @param memberEntity
   * @return
   */
  List<MemberEntity> getCompanyList(MemberEntity memberEntity);
  /**
   * 기업/단체회원 카운트
   * @param memberEntity
   * @return
   */
  int getCompanyCount(MemberEntity memberEntity);
  /**
   * 기업/단체회원 수정
   * @param memberEntity
   * @return
   */
  int modifyCompany(MemberEntity memberEntity);
  /**
   * 기업/단체회원 상세
   * @param memberEntity
   * @return
   */
  MemberEntity getCompanyDetail(MemberEntity memberEntity);
  /**
   * 기업/단체회원 탈퇴
   * @param memberEntity
   * @return
   */
  int removeCompany(MemberEntity memberEntity);
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


  String[] searchUserIdArr(MemberEntity memberEntity);
  /**
   * 개인정보 접근 로그 저장
   * @param adminEntity
   * @return
   */
  int insertAccessLog(AdminEntity adminEntity);

  /**
   * 관리자 접근 허용 아이피
   * @param adminEntity
   * @return
   */
  int ipCheck(AdminEntity adminEntity);

  /**
   * 관리자 접근 허용 아이피 등록
   * @param adminEntity
   * @return
   */
  int insertAccessIp(AdminEntity adminEntity);

  /**
   * 관리자 접근 허용 아이피 수정
   * @param adminEntity
   * @return
   */
  int modifyAccessIp(AdminEntity adminEntity);
 /**
  * 회원 등록
  * @param memberEntity
  * @return
  */
  int insertMember(MemberEntity memberEntity);
  /**
   * 회원 디테일 등록
   * @param memberEntity
   * @return
   */
  int insertMemberDetail(MemberEntity memberEntity);

  /**
   * 회원 정보
   * @param memberEntity
   * @return
   */
  MemberEntity getUserInfo(MemberEntity memberEntity);
  /**
   * 회원 로그인
   * @param memberEntity
   * @return
   */
  MemberEntity doUserLogin(MemberEntity memberEntity);

  int userLoginState(MemberEntity memberEntity);

  int userLoginStateOff(MemberEntity memberEntity);
	
  MemberEntity passwordFind(MemberEntity memberEntity);
	
  int modifyPassword(FormUserInfoEntity formUserInfoEntity);
  /**
   * 회원 인증번호 입력 
   * @param memberInfo
   * @return
   */
  int setUserKey(MemberEntity memberInfo);

int searchId(MemberEntity memberEntity);

int searchPhoneNum(MemberEntity memberEntity);

MemberEntity userIdFind(MemberEntity memberEntity);

int passwordGenerate(MemberEntity memberEntity);

int redundancyCheck(MemberEntity memberEntity);
/**
 * 사용자 사용중인 상품 정보
 * @param userInfo
 * @return
 */
TicketEntity getUserProductInfo(MemberEntity userInfo);

MemberEntity getUserInfoId(MemberEntity memberEntity);

/**
 * 최종 로그인일시
 * @param memberEntity
 * @return
 */
int userLastLoginDate(MemberEntity memberEntity);
}
