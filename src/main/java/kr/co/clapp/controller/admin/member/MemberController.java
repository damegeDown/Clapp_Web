package kr.co.clapp.controller.admin.member;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.clapp.constants.CommonCode;
import kr.co.clapp.constants.CommonCode.Session;
import kr.co.clapp.constants.ResultCode;
import kr.co.clapp.entities.AdminEntity;
import kr.co.clapp.entities.CommonCodeEntity;
import kr.co.clapp.entities.DropOutUserEntity;
import kr.co.clapp.entities.MemberEntity; 
import kr.co.clapp.entities.ResponseEntity;
import kr.co.clapp.service.common.CommonService;
import kr.co.clapp.service.mailing.MailingService;
import kr.co.clapp.service.member.MemberService;
import kr.co.clapp.utils.Utils;
import kr.co.digigroove.commons.messages.Messages;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping(value = "/admin")
public class MemberController {
	private static final Logger logger = LoggerFactory
			.getLogger(MemberController.class);

	@Autowired
	private Messages messages;

	@Autowired
	private CommonService commonService;

	@Autowired
	private MemberService memberService;
	@Autowired
	private MailingService mailingService;

	HashMap<String, Object> commonCode = new HashMap<String, Object>();

	/**
	 * 관리자 로그인 페이지
	 * 
	 * @return
	 */
	@RequestMapping(value = { "/login", "/" ,""}, method = RequestMethod.GET)
	public String login(
			@RequestParam(required = false, value = "resultCode", defaultValue = "") String resultCode,
			@RequestParam(required = false, value = "chkGrant", defaultValue = "N") String chkGrant,
			Model model, HttpServletRequest request) throws Exception {
		
		String ip = Utils.getRomoteIp(request);
		String localIp = Utils.getLocalServerIp(request);
		 
		model.addAttribute("ipAddress", localIp);
		model.addAttribute("chkGrant", chkGrant); 
		model.addAttribute("resultCode", resultCode);
		return "adminLoginDef";
	}

	/**
	 * 관리자 회원정보 접속 로그인 페이지
	 * 
	 * @return
	 */
	@RequestMapping(value = "/reLogin", method = RequestMethod.GET)
	public String reLogin(
			@RequestParam(required = false, value = "resultCode", defaultValue = "") String resultCode,
			@RequestParam(required = false, value = "chkGrant", defaultValue = "N") String chkGrant,
			@RequestParam(required = false, value = "userMasterKey", defaultValue = "") String userMasterKey,
			@RequestParam(required = false, value = "userType", defaultValue = "1") String userType,
			Model model) throws Exception {
		
		model.addAttribute("chkGrant", chkGrant);
		model.addAttribute("userType", userType);
		model.addAttribute("userMasterKey", userMasterKey);
		model.addAttribute("resultCode", resultCode);
		return "adminReLogin";
	}

	/**
	 * 관리자 로그인
	 * 
	 * @param adminEntity
	 * @param session
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/doLogin", method = RequestMethod.POST)
	public ResponseEntity adminLogin(AdminEntity adminEntity,
			HttpSession session,
			HttpServletRequest request
			) {
		ResponseEntity result = new ResponseEntity();
		try {
			result = memberService.doLogin(adminEntity, result, session, request);
		} catch (Exception e) {
			logger.error("MemberController.adminLogin:Faild", e);
		}
		return result;
	}

	/**
	 * 관리자 로그아웃
	 * 
	 * @param adminEntity
	 * @param session
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/doLogout", method = RequestMethod.POST)
	public ResponseEntity adminLogout(HttpSession session,
			HttpServletResponse res) {
		ResponseEntity result = new ResponseEntity();
		AdminEntity adminInfo = (AdminEntity) session
				.getAttribute(Session.ADMIN_LOGIN_SESSION);
		try {
			if (adminInfo != null) {
				res.setHeader("Cache-Control", "no-cache");
				res.setDateHeader("Expires", 0);
				session.invalidate();
			}
			result.setResultCode(ResultCode.SUCCESS);
			result.setResultMSG(messages.getMessage("logout.success"));
		} catch (Exception e) {
			logger.error("MemberController.adminLogout:Faild", e);
		}
		return result;
	}

	/**
	 * 관리자 메인페이지
	 * 
	 * @return
	 */
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String main() {
//		 DropOutUserEntity dropOutUserEntity = new DropOutUserEntity();
//		 MemberEntity memberEntity = new MemberEntity();
//		 dropOutUserEntity.setDropOutUserId("dnltpdnd@naver.com");
//		 dropOutUserEntity.setUserName("위세웅");
//		 mailingService.sendDropOutMemberMail(dropOutUserEntity);
		return "admin/main";
	}

	/**
	 * 회원 관리 목록
	 * 
	 * @param memberEntity
	 * @param model
	 * @return
	 */
	@RequestMapping("/member/memberList")
	public String memberList(MemberEntity memberEntity, Model model) {
		try {
			memberEntity.setUserType(CommonCode.USER_MEMBER);
			memberEntity = memberService.getMemberList(memberEntity);

			// 공통코드
			CommonCodeEntity commonCodeEntity = new CommonCodeEntity();
			// 공통코드 연령대별.
			commonCodeEntity.setCodeMasterCode(CommonCode.USER_AGE_GROUP);
			// 공통코드 연령대별 코드
			List<CommonCodeEntity> userAgeGroupCode = commonService
					.getCommonCodeList(commonCodeEntity);
			// 공통코드 직종.
			commonCodeEntity.setCodeMasterCode(CommonCode.USER_JOB_TYPE);
			// 공통코드 직종 코드
			List<CommonCodeEntity> userJobTypeCode = commonService
					.getCommonCodeList(commonCodeEntity);
			// 공통코드 탈퇴사유.
			commonCodeEntity.setCodeMasterCode(CommonCode.DROP_OUT_REASON);
			// 공통코드 탈퇴사유 코드
			List<CommonCodeEntity> dropOutReasonCode = commonService
					.getCommonCodeList(commonCodeEntity);

			int count = memberService
					.getMemberCountByType(CommonCode.USER_MEMBER);
			model.addAttribute("count", count); // 회원 목록
			model.addAttribute("memberEntity", memberEntity); // 회원 목록
			model.addAttribute("userAgeGroupCode", userAgeGroupCode); // 공통코드
																		// 연령대별
			model.addAttribute("userJobTypeCode", userJobTypeCode); // 공통코드 직종
			model.addAttribute("dropOutReasonCode", dropOutReasonCode); // 공통코드
																		// 탈퇴이유

			// 공통
			commonCode.put("navigation", "일반회원 관리");// 현재 페이지 네비게이션
			commonCode.put("mainMenu", "permissionUser"); // left main menu
			commonCode.put("subMenu", "member");
			model.addAttribute("CommonCode", commonCode);
		} catch (Exception e) {
			logger.error("MemberController.memberList:Faild", e);
		}
		return "admin/member/memberList";
	}

	/**
	 * 일반회원 수정
	 * 
	 * @param memberEntity
	 * @param model
	 * @return
	 */
	@RequestMapping("/member/memberModify")
	public String memberModify(MemberEntity memberEntity, Model model,
			HttpSession session) {
		String navigation = "";
		String submitType = "";
		String submitAction = "";
		MemberEntity memberInfo = null;
		try {
			AdminEntity adminInfo = (AdminEntity) session
					.getAttribute(Session.ADMIN_LOGIN_SESSION);
			adminInfo.setLogsAccessReason("회원 수정");
			memberService.insertAccessLog(adminInfo);
			// 공통코드
			CommonCodeEntity commonCodeEntity = new CommonCodeEntity();
			// 공통코드 연령대별.
			commonCodeEntity.setCodeMasterCode(CommonCode.USER_AGE_GROUP);
			// 공통코드 연령대별 코드
			List<CommonCodeEntity> userAgeGroupCode = commonService
					.getCommonCodeList(commonCodeEntity);
			// 공통코드 직종.
			commonCodeEntity.setCodeMasterCode(CommonCode.USER_JOB_TYPE);
			// 공통코드 직종 코드
			List<CommonCodeEntity> userJobTypeCode = commonService
					.getCommonCodeList(commonCodeEntity);
			// 공통코드 지역.
			commonCodeEntity.setCodeMasterCode(CommonCode.AREA);
			// 공통코드 지역 코드
			List<CommonCodeEntity> areaCode = commonService
					.getCommonCodeList(commonCodeEntity);
			// 공통코드 핸드폰
			commonCodeEntity.setCodeMasterCode(CommonCode.CELL_PHONE_NUM);
			// 공통코드 핸드폰 번호
			List<CommonCodeEntity> cellPhoneCode = commonService
					.getCommonCodeList(commonCodeEntity);
			// 공통코드 전화번호
			commonCodeEntity.setCodeMasterCode(CommonCode.TELE_PHONE_NUM);
			// 공통코드 전화번호
			List<CommonCodeEntity> telePhoneCode = commonService
					.getCommonCodeList(commonCodeEntity);
			// 회원 상세
			if (memberEntity.getUserMasterKey() > CommonCode.ZERO) {
				navigation = "일반회원 관리 > 수정";
				submitType = "수정";
				submitAction = "admin/member/rest/modifyMember?userType=1";
				memberInfo = memberService.getMemberDetail(memberEntity);
			}
			model.addAttribute("memberDetail", memberInfo);

			// 공통
			commonCode.put("navigation", navigation);
			commonCode.put("submitType", submitType);
			commonCode.put("submitAction", submitAction);
			commonCode.put("mainMenu", "permissionUser"); // left main menu
			commonCode.put("subMenu", "member"); // left sub menu
			model.addAttribute("CommonCode", commonCode);
			model.addAttribute("userAgeGroupCode", userAgeGroupCode);
			model.addAttribute("userJobTypeCode", userJobTypeCode); // 공통코드 직종
			model.addAttribute("areaCode", areaCode); // 지역 직종
			model.addAttribute("cellPhoneCode", cellPhoneCode); // 핸드폰
			model.addAttribute("telePhoneCode", telePhoneCode); // 전화번호
		} catch (Exception e) {
			logger.error("MemberController.memberModify:Faild", e);
		}
		model.addAttribute("navigation", navigation);
		return "admin/member/memberModify";
	}

	/**
	 * 일반회원 상세
	 * 
	 * @param memberEntity
	 * @param model
	 * @return
	 */
	@RequestMapping("/member/memberDetail")
	public String memberDetail(MemberEntity memberEntity, Model model) {
		String navigation = "";
		MemberEntity memberInfo = null;
		try {
			// 회원 상세
			if (memberEntity.getUserMasterKey() > CommonCode.ZERO) {
				navigation = "일반회원 관리 > 상세";
				memberInfo = memberService.getMemberDetail(memberEntity);
			}
			model.addAttribute("memberDetail", memberInfo);

			// 공통코드
			CommonCodeEntity commonCodeEntity = new CommonCodeEntity();
			// 공통코드 탈퇴사유.
			commonCodeEntity.setCodeMasterCode(CommonCode.DROP_OUT_REASON);
			// 공통코드 탈퇴사유 코드
			List<CommonCodeEntity> dropOutReasonCode = commonService
					.getCommonCodeList(commonCodeEntity);

			// 공통
			commonCode.put("navigation", navigation);
			commonCode.put("mainMenu", "permissionUser"); // left main menu
			commonCode.put("subMenu", "member"); // left sub menu
			model.addAttribute("CommonCode", commonCode);

			model.addAttribute("dropOutReasonCode", dropOutReasonCode); // 공통코드
																		// 탈퇴이유
		} catch (Exception e) {
			logger.error("MemberController.memberDetail:Faild", e);
		}
		model.addAttribute("navigation", navigation);
		return "admin/member/memberDetail";
	}

	/**
	 * 기업/단체회원 관리 목록
	 * 
	 * @param memberEntity
	 * @param model
	 * @return
	 */
	@RequestMapping("/member/companyList")
	public String companyList(MemberEntity memberEntity, Model model) {
		try {
			memberEntity.setUserType(CommonCode.USER_COMPANY);
			// 공통코드
			CommonCodeEntity commonCodeEntity = new CommonCodeEntity();
			// 공통코드 탈퇴사유.
			commonCodeEntity.setCodeMasterCode(CommonCode.DROP_OUT_REASON);
			// 공통코드 탈퇴사유 코드
			List<CommonCodeEntity> dropOutReasonCode = commonService
					.getCommonCodeList(commonCodeEntity);
			// 공통코드 기업/단체구분
			commonCodeEntity
					.setCodeMasterCode(CommonCode.USER_COMPANY_GROUP_TYPE);
			// 공통코드 기업/단체 구분코드
			List<CommonCodeEntity> userCompanyGroupTypeCode = commonService
					.getCommonCodeList(commonCodeEntity);
			// 공통코드 업종
			commonCodeEntity
					.setCodeMasterCode(CommonCode.USER_COMPANY_BUSINESS_TYPE);
			// 공통코드 업종 코드
			List<CommonCodeEntity> userCompanyBusinessTypeCode = commonService
					.getCommonCodeList(commonCodeEntity);
			memberEntity = memberService.getMemberList(memberEntity);

			int count = memberService
					.getMemberCountByType(CommonCode.USER_COMPANY);
			model.addAttribute("count", count);
			model.addAttribute("memberEntity", memberEntity); // 회원 목록
			model.addAttribute("dropOutReasonCode", dropOutReasonCode); // 공통코드
																		// 탈퇴이유
			model.addAttribute("userCompanyGroupTypeCode",
					userCompanyGroupTypeCode); // 공통코드 기업/단체 구분
			model.addAttribute("userCompanyBusinessTypeCode",
					userCompanyBusinessTypeCode); // 공통코드 업종

			// 공통
			commonCode.put("navigation", "기업 / 단체회원 관리");// 현재 페이지 네비게이션
			commonCode.put("mainMenu", "permissionUser"); // left main menu
			commonCode.put("subMenu", "company");
			model.addAttribute("CommonCode", commonCode);
		} catch (Exception e) {
			logger.error("MemberController.companyList:Faild", e);
		}
		return "admin/member/companyList";
	}

	/**
	 * 기업/단체회원 상세, 수정
	 * 
	 * @param memberEntity
	 * @param model
	 * @return
	 */
	@RequestMapping("/member/companyDetail")
	public String companyDetail(MemberEntity memberEntity, Model model) {
		String navigation = "";
		String submitType = "";
		String submitAction = "";
		MemberEntity companyInfo = null;
		try {
			// 회원 상세
			if (memberEntity.getUserMasterKey() > CommonCode.ZERO) {
				navigation = "기업/단체회원 > 상세";
				submitType = "상세";
				submitAction = "admin/member/rest/modifyMember?userType=2";
				companyInfo = memberService.getMemberDetail(memberEntity);
			}
			model.addAttribute("companyDetail", companyInfo);
			// 공통코드
			CommonCodeEntity commonCodeEntity = new CommonCodeEntity();
			// 공통코드 탈퇴사유.
			commonCodeEntity.setCodeMasterCode(CommonCode.DROP_OUT_REASON);
			// 공통코드 탈퇴사유 코드
			List<CommonCodeEntity> dropOutReasonCode = commonService
					.getCommonCodeList(commonCodeEntity);

			// 공통
			commonCode.put("navigation", navigation);
			commonCode.put("submitType", submitType);
			commonCode.put("submitAction", submitAction);
			commonCode.put("mainMenu", "permissionUser"); // left main menu
			commonCode.put("subMenu", "company"); // left sub menu
			model.addAttribute("CommonCode", commonCode);
			model.addAttribute("dropOutReasonCode", dropOutReasonCode); // 공통코드
																		// 탈퇴이유
		} catch (Exception e) {
			logger.error("MemberController.companyDetail:Faild", e);
		}
		model.addAttribute("navigation", navigation);
		return "admin/member/companyDetail";
	}

	/**
	 * 기업/단체회원 수정
	 * 
	 * @param memberEntity
	 * @param model
	 * @return
	 */
	@RequestMapping("/member/companyModify")
	public String companyModify(MemberEntity memberEntity, Model model) {
		String navigation = "";
		String submitType = "";
		String submitAction = "";
		MemberEntity companyInfo = null;
		try {
			// 공통코드
			CommonCodeEntity commonCodeEntity = new CommonCodeEntity();
			// 공통코드 업종
			commonCodeEntity
					.setCodeMasterCode(CommonCode.USER_COMPANY_BUSINESS_TYPE);
			// 공통코드 업종 코드
			List<CommonCodeEntity> userCompanyBusinessTypeCode = commonService
					.getCommonCodeList(commonCodeEntity);
			// 공통코드 핸드폰
			commonCodeEntity.setCodeMasterCode(CommonCode.CELL_PHONE_NUM);
			// 공통코드 핸드폰 번호
			List<CommonCodeEntity> cellPhoneCode = commonService
					.getCommonCodeList(commonCodeEntity);
			// 공통코드 전화번호
			commonCodeEntity.setCodeMasterCode(CommonCode.TELE_PHONE_NUM);
			// 공통코드 전화번호
			List<CommonCodeEntity> telePhoneCode = commonService
					.getCommonCodeList(commonCodeEntity);
			// 회원 상세
			if (memberEntity.getUserMasterKey() > CommonCode.ZERO) {
				navigation = "기업/단체회원 > 수정";
				submitType = "수정";
				submitAction = "admin/member/rest/modifyMember?userType=2";
				companyInfo = memberService.getMemberDetail(memberEntity);
			}
			model.addAttribute("companyDetail", companyInfo);

			// 공통
			commonCode.put("navigation", navigation);
			commonCode.put("submitType", submitType);
			commonCode.put("submitAction", submitAction);
			commonCode.put("mainMenu", "permissionUser"); // left main menu
			commonCode.put("subMenu", "company"); // left sub menu
			model.addAttribute("CommonCode", commonCode);
			model.addAttribute("userCompanyBusinessTypeCode",
					userCompanyBusinessTypeCode);
			model.addAttribute("cellPhoneCode", cellPhoneCode); // 핸드폰
			model.addAttribute("telePhoneCode", telePhoneCode); // 전화번호
		} catch (Exception e) {
			logger.error("MemberController.companyDetail:Faild", e);
		}
		model.addAttribute("navigation", navigation);
		return "admin/member/companyModify";
	}

	/**
	 * 탈퇴 회원 목록
	 * 
	 * @param memberEntity
	 * @param model
	 * @return
	 */
	@RequestMapping("/member/dropOutUserList")
	public String dropOutUserList(DropOutUserEntity dropOutUserEntity,
			Model model) {
		try {
			// 공통코드
			CommonCodeEntity commonCodeEntity = new CommonCodeEntity();
			// 공통코드 탈퇴사유
			commonCodeEntity.setCodeMasterCode(CommonCode.DROP_OUT_REASON);
			// 공통코드 탈퇴사유 코드
			List<CommonCodeEntity> dropOutReasonCode = commonService
					.getCommonCodeList(commonCodeEntity);
			dropOutUserEntity = memberService
					.getDropOutUserList(dropOutUserEntity);
			int dropOutCount = memberService.getDropOutCount();

			model.addAttribute("dropOutCount", dropOutCount);
			model.addAttribute("dropOutUserEntity", dropOutUserEntity);
			model.addAttribute("dropOutReasonCode", dropOutReasonCode);

			// 공통
			commonCode.put("navigation", "탈퇴계정 관리");// 현재 페이지 네비게이션
			commonCode.put("mainMenu", "permissionUser"); // left main menu
			commonCode.put("subMenu", "dropOutUser");
			model.addAttribute("CommonCode", commonCode);
		} catch (Exception e) {
			logger.error("MemberController.memberList:Faild", e);
		}
		return "admin/member/dropOutUserList";
	}
}
