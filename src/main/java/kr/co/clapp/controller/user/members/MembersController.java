package kr.co.clapp.controller.user.members;


import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.clapp.constants.CommonCode;
import kr.co.clapp.constants.ResultCode;
import kr.co.clapp.constants.CommonCode.Session;
import kr.co.clapp.entities.CommonCodeEntity;
import kr.co.clapp.entities.MemberEntity;
import kr.co.clapp.entities.ResponseEntity;
import kr.co.clapp.service.common.CommonService;
import kr.co.clapp.service.member.MemberService;
import kr.co.digigroove.commons.messages.Messages;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping(value="/members")
public class MembersController {
	private static final Logger logger = LoggerFactory.getLogger( MembersController.class );

	@Autowired
	private Messages messages;
	
	@Autowired
	private CommonService commonService;
	
	@Autowired 
	private MemberService memberService;
	
	HashMap<String, Object> commonCode  = new HashMap<String, Object>();
	 private transient HttpSession session = null;
	/**
	 * 회원 가입 유형
	 * @return
	 */
    @RequestMapping(value = "/memberJoin")
    public String memberJoin(){
    	return "user/member/memberJoin";
    }
    /**
     * 회원 가입 약관 동의
     * @return
     */
	@RequestMapping(value = "/memberJoinTerms")
	public String memberJoinTerms(Model model, int userType) {
		model.addAttribute("userType", userType);
		return "user/member/memberJoinTerms";
	}
    /**
     * 일반 회원 가입 폼
     * @return
     */
    @RequestMapping(value = "/memberJoinForm")
    public String memberJoinForm(MemberEntity memberEntity, Model model){
	  String submitType = "등록";
	  String submitAction = "members/rest/insertMember";
	  MemberEntity memberInfo = null;
	  try {
		
		//공통코드 
		CommonCodeEntity commonCodeEntity = new CommonCodeEntity();
		//공통코드 핸드폰
  	  	commonCodeEntity.setCodeMasterCode(CommonCode.CELL_PHONE_NUM);
  	  	//공통코드 핸드폰 번호
  	  	List<CommonCodeEntity> cellPhoneCode = commonService.getCommonCodeList(commonCodeEntity);
  	  	//공통코드 지역.
		commonCodeEntity.setCodeMasterCode(CommonCode.AREA);
		//공통코드 지역 코드
		List<CommonCodeEntity> areaCode = commonService.getCommonCodeList(commonCodeEntity);
	    
  	  	commonCode.put("submitType", submitType);
	    commonCode.put("submitAction", submitAction);
	    
	    model.addAttribute("cellPhoneCode", cellPhoneCode);
	    model.addAttribute("areaCode", areaCode);
	    model.addAttribute("memberInfo", memberInfo);
	    model.addAttribute("CommonCode", commonCode);
	  } catch (Exception e) {
	    logger.error("MemberController.memberJoinForm:Faild" , e);
	  }
    	return "user/member/memberJoinForm";
    }
    
    /**
     * 기업/단체 회원 가입 폼
     * @return
     */
    @RequestMapping(value = "/memberJoinFormCompany")
    public String memberJoinFormCompany(MemberEntity memberEntity, Model model){
	  String submitType = "등록";
	  String submitAction = "members/rest/insertMember";
	  MemberEntity memberInfo = null;
	  try {
		
		//공통코드 
		CommonCodeEntity commonCodeEntity = new CommonCodeEntity();
		//공통코드 핸드폰
  	  	commonCodeEntity.setCodeMasterCode(CommonCode.CELL_PHONE_NUM);
  	  	//공통코드 핸드폰 번호
  	  	List<CommonCodeEntity> cellPhoneCode = commonService.getCommonCodeList(commonCodeEntity);
  	  	//공통코드 지역.
		commonCodeEntity.setCodeMasterCode(CommonCode.AREA);
		//공통코드 지역 코드
		List<CommonCodeEntity> areaCode = commonService.getCommonCodeList(commonCodeEntity);
		 //회사명
	    List<String> companyNameList = commonService.searchCompanyName();
	    
  	  	commonCode.put("submitType", submitType);
	    commonCode.put("submitAction", submitAction);
	    
	    model.addAttribute("companyNameList", companyNameList);
	    model.addAttribute("cellPhoneCode", cellPhoneCode);
	    model.addAttribute("areaCode", areaCode);
	    model.addAttribute("memberInfo", memberInfo);
	    model.addAttribute("CommonCode", commonCode);
	  } catch (Exception e) {
	    logger.error("MemberController.memberJoinFormCompany:Faild" , e);
	  }
    	return "user/member/memberJoinFormCompany";
    }
    /**
     * 회원 가입 완료 
     * @return
     */
    @RequestMapping(value = "/memberJoinComplete")
    public String memberJoinComplete(String userName, Model model){
    	model.addAttribute("userName", userName);
    	return "user/member/memberJoinComplete";
    }
    /**
     * 로그인 페이지
     * @return
     */
    @RequestMapping(value ="/login")
    public String login(){
    	return "user/member/userLogin";
    }
    /**
     * 로그인
     * @param memberEntity
     * @param session
     * @return
     */
    @ResponseBody 
    @RequestMapping(value = "/doUserLogin", method = RequestMethod.POST)
    public ResponseEntity doUserLogin(MemberEntity memberEntity, HttpSession session, HttpServletRequest request){
    	ResponseEntity result = new ResponseEntity();
    	try{
    		result = memberService.doUserLogin(memberEntity, result, session);
    		//if(result.equals(ResultCode.SUCCESS)) { 
//    			SessionListener listener = new SessionListener(); 
//    			request.getSession().setAttribute(memberEntity.getUserId(), listener);
//    			session.setAttribute(CommonCode.Session.USER_LOGIN_SESSION, result.getResultDATA());
    		//}
    	} catch(Exception e){
    		logger.error("MembersController.userLogin:Faild" , e);
    	}
    	return result; 
    }
    /**
     * 로그아웃
     * @param session
     * @param res
     * @param memberEntity
     * @return
     */
	@ResponseBody
	@RequestMapping(value = "/doUserLogout", method = RequestMethod.POST)
	public ResponseEntity doUserLogout(HttpSession session,
			HttpServletResponse res, MemberEntity memberEntity) {
		ResponseEntity result = new ResponseEntity();
		MemberEntity userInfo = (MemberEntity) session
				.getAttribute(Session.USER_LOGIN_SESSION);
		try {
			if (userInfo != null) {
				int userLoginStateOff= memberService.userLoginStateOff(memberEntity);
				res.setHeader("Cache-Control", "no-cache");
				res.setDateHeader("Expires", 0);
				session.invalidate();
			}
			result.setResultCode(ResultCode.SUCCESS);
			result.setResultMSG(messages.getMessage("user.logout.success"));
		} catch (Exception e) {
			logger.error("MembersController.doUserLogout:Faild", e);
		}
		return result;
	}
	/**
	 * 비밀번호 찾기
	 * @return
	 */
	@RequestMapping(value = "/passwordFind")
	public String passwordFind() {
		return "user/member/passwordFind";
	}
	/**
	 * 비밀번화 찾기 완료
	 * @return
	 */
	@RequestMapping(value = "/passwordFindComplete")
	public String passwordFindComplete() {
		return "user/member/passwordFindComplete";
	}
	@RequestMapping(value="/idFind")
	public String idFind(Model model){
		try{
			//공통코드 
			CommonCodeEntity commonCodeEntity = new CommonCodeEntity();
			//공통코드 핸드폰
			commonCodeEntity.setCodeMasterCode(CommonCode.CELL_PHONE_NUM);
			//공통코드 핸드폰 번호
			List<CommonCodeEntity> cellPhoneCode = commonService.getCommonCodeList(commonCodeEntity);
			model.addAttribute("cellPhoneCode", cellPhoneCode);
		} catch (Exception e){
			logger.error("MembersController.idFind:Faild", e);
		}
		return "user/member/idFind";
	}
}
