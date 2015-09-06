package kr.co.clapp.service.member.impl;

import kr.co.clapp.constants.CommonCode;
import kr.co.clapp.constants.ResultCode;
import kr.co.clapp.dao.DropOutUserDAO;
import kr.co.clapp.dao.MemberDAO;
import kr.co.clapp.dao.ProductDAO;
import kr.co.clapp.dao.TicketDAO;
import kr.co.clapp.entities.*;
import kr.co.clapp.entities.validation.FormUserInfoEntity;
import kr.co.clapp.service.member.MemberService;
import kr.co.clapp.utils.Utils;
import kr.co.digigroove.commons.messages.Messages;
import kr.co.digigroove.commons.utils.HashUtils;
import kr.co.digigroove.commons.utils.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

@Service
@Transactional(readOnly=true)
public class MemberServiceImpl implements MemberService {
  @Autowired
  private MemberDAO memberDAO;
  
  @Autowired
  private DropOutUserDAO dropOutUserDAO;

  @Autowired
  private Messages messages;
  
  @Autowired
  private ProductDAO productDAO;
  
  @Autowired
  private TicketDAO ticketDAO;

  /**
   * 관리자 로그인
   */
  @Override
  @Transactional(readOnly=false)
  public ResponseEntity doLogin(AdminEntity adminEntity, ResponseEntity result, HttpSession session,HttpServletRequest request) throws Exception {
    //관리자 정보 
	int checkFlag = 0;
	//adminEntity.setAdminPassword(HashUtils.encryptSHA256(adminEntity.getAdminPassword()));
	
	adminEntity.setAccessIpAddress(Utils.getRomoteIp(request));
//	System.out.println("==============localIp +" + Utils.getLocalServerIp(request));
//	System.out.println("==============remoteIp +" + Utils.getRomoteIp(request));
//	
	checkFlag = memberDAO.ipCheck(adminEntity);
	
	adminEntity.setAdminPassword(adminEntity.getAdminPassword());
    AdminEntity adminInfo = memberDAO.doLogin(adminEntity);
    
	 if(StringUtils.isEmpty(adminInfo)) { 
	  // 관리자 존재여부 확인
      result.setResultCode(ResultCode.NO_RESULT);
      result.setResultMSG(messages.getMessage("noResult"));
    } else if (!adminEntity.getAdminPassword().equals(adminInfo.getAdminPassword())) {
        result.setResultCode(ResultCode.ACCOUNT_NOT_EQUAL);
  	  result.setResultMSG(messages.getMessage("user.password.mismatched")); 
    } else if(checkFlag == 0) {
    	  // IP 접근권한이 없을경우
    	  result.setResultCode(ResultCode.NO_IP);
    	  result.setResultMSG(messages.getMessage("login.ipaddress.mismatched"));
    }else if(adminEntity.getAdminPassword().equals(adminInfo.getAdminPassword())) {
      //관리자 정보를 세션에 입력 
      session.setAttribute(CommonCode.Session.ADMIN_LOGIN_SESSION, adminInfo);
      result.setResultCode(ResultCode.SUCCESS);
      result.setResultMSG(messages.getMessage("login.success"));
      
      //개인정보 접근시 로그 저장
      if(!StringUtils.isEmpty(adminEntity.getAdminId())) {
    	  	 this.insertAccessLog(adminEntity);
      }
    } else {
      result.setResultCode(ResultCode.LOGIN_FAIL);
      result.setResultMSG(messages.getMessage("login.fail")); 
    }
    return result;
  }
  @Override
  @Transactional(readOnly=false)
  public int insertAccessLog(AdminEntity adminEntity) {
	  int result = 0;
	  result = memberDAO.insertAccessLog(adminEntity);
	  return result;
  }
  /**
   * 관리자 목록
   */
  @Override
  public AdminEntity getAdminList(AdminEntity adminEntity) throws Exception {
	adminEntity.setPageParams();
	adminEntity.setPageSize(PageEntity.PAGE_LIST_SIZE_PARAM, PageEntity.PAGE_GROUP_SIZE_PARAM);
	adminEntity.setDataSize(memberDAO.getAdminCount(adminEntity));
	List<AdminEntity> adminListResult = memberDAO.getAdminList(adminEntity);
	adminEntity.setAdminList(adminListResult);
    return adminEntity;
  } 
 
  /**
   * 관리자 목록 상세
   */
  @Override
  public AdminEntity getAdminDetail(AdminEntity adminEntity) throws Exception {
    AdminEntity adminInfo = memberDAO.getAdminDetail(adminEntity);
    return adminInfo;
  }
  
  /**
   * 관리자 등록
   */
  @Override
  @Transactional(readOnly=false)
  public int insertAdmin(AdminEntity adminEntity) throws Exception {
	int result = 0;
	//관리자 비밀번호 암호화
	//adminEntity.setAdminPassword(HashUtils.encryptSHA256(adminEntity.getAdminPassword()));
	adminEntity.setAdminPassword(adminEntity.getAdminPassword());
	result = memberDAO.insertAdmin(adminEntity);
	if(result > CommonCode.ZERO) {
		result = memberDAO.insertAdminPermission(adminEntity);
		if(result > CommonCode.ZERO) {
			//adminEntity.setAccessIpAddress(Utils.getRomoteIp());
			//if(memberDAO.ipCheck(adminEntity) == CommonCode.ZERO) {
				result = memberDAO.insertAccessIp(adminEntity);
			//}
		}
	}
	return result;
  }
  
  /**
   * 관리자 수정
   */
  @Override
  @Transactional(readOnly=false)
  public int modifyAdmin(AdminEntity adminEntity) throws Exception {
	int result = 0;
//	if(adminEntity.getPermissionMaster().equals(CommonCode.NO_MASTER)) {
//		adminEntity.setAdminMasterYn(CommonCode.NO_MASTER);
//	} else {
//		adminEntity.setAdminMasterYn(CommonCode.MASTER);
//	}
	result = memberDAO.modifyAdmin(adminEntity);
	if(result > CommonCode.ZERO) {
		result = memberDAO.modifyAdminPermission(adminEntity);
		if(result > CommonCode.ZERO) {
			//adminEntity.setAccessIpAddress(Utils.getRomoteIp());
			result = memberDAO.modifyAccessIp(adminEntity);
		}
	}
	return result;
  }
 
  /**
   * 관리자 아이디 중복확인
   */
  @Override
  public int doAdminIdCheck(String adminId) throws Exception {
	int result = 0;
	result = memberDAO.doAdminIdCheck(adminId);
	return result;
  }
  
  /**
   * 관리자 삭제
   */
  @Override
  @Transactional(readOnly=false)
  public int removeAdmin(AdminEntity adminEntity) throws Exception {
	int result = 0;
	result = memberDAO.removeAdmin(adminEntity);
	return result;
  }
  
  /**
   * 회원 목록
   */
  @Override
  public MemberEntity getMemberList(MemberEntity memberEntity) throws Exception {
	memberEntity.setPageParams();
	memberEntity.setPageSize(PageEntity.PAGE_LIST_SIZE_PARAM, PageEntity.PAGE_GROUP_SIZE_PARAM);
	memberEntity.setDataSize(memberDAO.getMemberCount(memberEntity));
	List<MemberEntity> memberListResult = memberDAO.getMemberList(memberEntity);
	memberEntity.setMemberList(memberListResult);
    return memberEntity;
  }
  
  /**
   * 회원 상세
   */
  @Override
  public MemberEntity getMemberDetail(MemberEntity memberEntity){
	  MemberEntity memberInfo = memberDAO.getMemberDetail(memberEntity);
	  return memberInfo;
  }
  /**
   * 회원 수정
   */
  @Override
  @Transactional(readOnly = false, rollbackFor = Exception.class)
  public int modifyMember(MemberEntity memberEntity) throws Exception{
	  int result = 0;
	  if(!StringUtils.isEmpty(memberEntity.getUserPassword())) {
		  memberEntity.setUserPassword(HashUtils.encryptSHA256(memberEntity.getUserPassword()));
	  }
	  if(StringUtils.isEmpty(memberEntity.getUserMailReceptionYn())) {
		 memberEntity.setUserMailReceptionYn("N"); 
	  }
	  result = memberDAO.modifyMember(memberEntity);
	  return result;
  } 
  /**
   * 회원 탈퇴 목록
   */
  @Override
  public DropOutUserEntity getDropOutUserList(DropOutUserEntity dropOutUserEntity) throws Exception {
	  dropOutUserEntity.setPageParams();
	  dropOutUserEntity.setPageSize(PageEntity.PAGE_LIST_SIZE_PARAM, PageEntity.PAGE_GROUP_SIZE_PARAM);
	  dropOutUserEntity.setDataSize(dropOutUserDAO.getDropOutUserSearchCount(dropOutUserEntity));
	List<DropOutUserEntity> dropOutUserListResult = dropOutUserDAO.getDropOutUserList(dropOutUserEntity);
	dropOutUserEntity.setDropOutUserList(dropOutUserListResult);
    return dropOutUserEntity;
  }
  
  /**
   * 회원 탈퇴등록/ 탈퇴처리
   */
  @Override
  @Transactional(readOnly = false, rollbackFor = Exception.class)
  public int insertDropOutUser(DropOutUserEntity dropOutUserEntity) throws Exception{
	  int deleteResult = 0;
	  int result = dropOutUserDAO.insertDropOutUser(dropOutUserEntity);
	  if (result > 0) {
		  MemberEntity memberEntity = new MemberEntity();
		  memberEntity.setUserMasterKey(dropOutUserEntity.getUserMasterKey());
		  deleteResult = memberDAO.removeMember(memberEntity);
	  }
	  return  result > 0 ? deleteResult : result;
  }

  /**
   * 회원 아이디 검색
 * @return 
   */ 
  @Override
  public List<MemberEntity> searchUserId(MemberEntity memberEntity) {
	List<MemberEntity> result = memberDAO.searchUserId(memberEntity);
	return result; 
  }
  /**
   * 일반/ 기업,단체 타입별 누적 카운트
   */
  @Override
  public int getMemberCountByType(String memberTypeCode) {
	return memberDAO.getMemberCountByType(memberTypeCode);
  }
  /**
   * 탈퇴 회원 누적 카운트
   */
  @Override
  public int getDropOutUserCount() {
	return dropOutUserDAO.getDropOutUserCount();
  }

  @Override
  public  String[] searchUserIdArr(MemberEntity memberEntity) {
	String[] result = memberDAO.searchUserIdArr(memberEntity);
	return result; 
  }
  /**
   * 회원 가입
   */
  @Override
  @Transactional(readOnly=false)
  public int insertMember(MemberEntity memberEntity) throws Exception {
	int insertResult = 0;
	memberEntity.setUserPassword(HashUtils.encryptSHA256(memberEntity.getUserPassword()));
	int result = memberDAO.insertMember(memberEntity);
	if (result > 0) {
		insertResult = memberDAO.insertMemberDetail(memberEntity);
		/** 티켓 저장*/
		if(insertResult > 0){
			ProductEntity productEntity = new ProductEntity();
			TicketEntity ticketEntity = new TicketEntity();
			productEntity.setProductType("1");
			productEntity = productDAO.getProductTypeInfo(productEntity);
			ticketEntity.setUserMasterKey(memberEntity.getUserMasterKey());
			ticketEntity.setProductMasterKey(productEntity.getProductMasterKey());
			ticketEntity.setProductName(productEntity.getProductName());
			ticketEntity.setTicketAmount(12);
			ticketEntity.setTicketAvilableAmount(12);
			
			Date d = new Date();
			ticketEntity.setTicketStartExpirationDate(d);
			ticketEntity.setTicketEndExpirationDate(Utils.getAddNowDate(30));
			ticketEntity.setTicketApplyDate(d);
            ticketEntity.setUseYn("Y");
			int ticketResult = ticketDAO.insertUserTicketMaster(ticketEntity);
			/** 티켓 히스토리에 저장*/
			ticketDAO.insertUserTicketHistory(ticketEntity);
		}
	}
	return  result > 0 ? insertResult : result;
  }
  /**
   * 회원 정보
   */
  @Override
  public MemberEntity getUserInfo(MemberEntity memberEntity) {
	return memberDAO.getUserInfo(memberEntity);
  }
  /**
   * 회원 로그인
   * @param memberEntity
   * @param result
   * @param session
   * @return
   */
  @Override
  @Transactional(readOnly=false)
  public ResponseEntity doUserLogin(MemberEntity memberEntity, ResponseEntity result, HttpSession session) throws Exception {
	  memberEntity.setUserPassword(HashUtils.encryptSHA256(memberEntity.getUserPassword()));
	  
	  MemberEntity userInfo = memberDAO.doUserLogin(memberEntity);
//	  if(userInfo.getUserLoginState() == 0){
		  //정보 미존재
      if(StringUtils.isEmpty(userInfo)){
          result.setResultCode(ResultCode.NO_RESULT);
          result.setResultMSG(messages.getMessage("notFound"));
          //로그인 성공
      } else if(memberEntity.getUserPassword().equals(userInfo.getUserPassword())){
              int userLoginState = memberDAO.userLoginState(memberEntity);
              int userLastLoginDate = memberDAO.userLastLoginDate(memberEntity);
			  result.setResultDATA(userInfo);
			  session.setAttribute(CommonCode.Session.USER_LOGIN_SESSION, userInfo);
		      result.setResultCode(ResultCode.SUCCESS);
		      result.setResultMSG(messages.getMessage("login.success"));
		  //비밀번호 불일치   
		  } else if (!memberEntity.getUserPassword().equals(userInfo.getUserPassword())) {
		      result.setResultCode(ResultCode.ACCOUNT_NOT_EQUAL);
			  result.setResultMSG(messages.getMessage("id.password.mismatched")); 
		  //로그인 실패
		  } else {
			  result.setResultCode(ResultCode.FAIL);
		      result.setResultMSG(messages.getMessage("login.fail"));
		  }
//	  } else{
//		  result.setResultCode(ResultCode.FAIL);
//	      result.setResultMSG(messages.getMessage("login.fail2"));
//	  }
	  return result;
  }
  /**
   * 회원 접속상태 Off
   */
	@Override
	@Transactional(readOnly=false)
	public int userLoginStateOff(MemberEntity memberEntity) {
		int userLoginStateOff = memberDAO.userLoginStateOff(memberEntity);
		return userLoginStateOff;
	}
	/**
	 * 비밀번호 찾기
	 */
	@Override
	@Transactional(readOnly=false)
	public MemberEntity passwordFind(MemberEntity memberEntity) {
		return memberDAO.passwordFind(memberEntity);
	}

	@Override
	@Transactional(readOnly=false)
	public int modifyPasswrod(FormUserInfoEntity formUserInfoEntity) {
		return memberDAO.modifyPassword(formUserInfoEntity);
	}
	@Override
	@Transactional(readOnly=false)
	public int setUserKey(MemberEntity memberInfo) {
		return memberDAO.setUserKey(memberInfo);
	}
	/**
	 * 아이디 중복검사
	 */
	@Override
	@Transactional(readOnly=false)
	public int searchId(MemberEntity memberEntity) {
		return memberDAO.redundancyCheck(memberEntity);
	}
	/**
	 * 전화번호 중복검사
	 */
	@Override
	public int searchPhoneNum(MemberEntity memberEntity) {
		return memberDAO.searchPhoneNum(memberEntity);
	}
	/**
	 * 아이디 찾기
	 */
	@Override
	public MemberEntity userIdFind(MemberEntity memberEntity) {
		return memberDAO.userIdFind(memberEntity) ;
	}
	@Override
	public TicketEntity getUserProductInfo(MemberEntity userInfo) {
		return memberDAO.getUserProductInfo(userInfo);
		
	}
}