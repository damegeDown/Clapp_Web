package kr.co.clapp.controller.admin.management;

import kr.co.clapp.constants.CommonCode;
import kr.co.clapp.constants.ResultCode;
import kr.co.clapp.entities.AdminEntity;
import kr.co.clapp.entities.PopupEntity;
import kr.co.clapp.entities.ResponseEntity;
import kr.co.clapp.service.member.MemberService;
import kr.co.clapp.service.popup.PopupService;
import kr.co.digigroove.commons.messages.Messages;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/admin/management/rest")
public class ManagementRestController {
	
	private static final Logger logger = LoggerFactory.getLogger(ManagementRestController.class);
	
	@Autowired
	private Messages messages;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private PopupService popupService;
	/**
	 * 관리자 등록
	 * @param adminEntity
	 * @param session
	 * @param req
	 * @param res
	 * @return
	 */
	@RequestMapping(value = "/insertAdmin")
	public ResponseEntity insertAdmin(AdminEntity adminEntity) {
	  ResponseEntity result = new ResponseEntity();
	  try { 
		String resultCode = ResultCode.FAIL;
		String resultMessage = messages.getMessage("insert.fail");
		if(memberService.doAdminIdCheck(adminEntity.getAdminId()) > CommonCode.ZERO) { //아이디 중복 체크
		  resultCode = ResultCode.OVERLAP_ID;
		  resultMessage = messages.getMessage("insert.overlapId");
		  
		} else if(memberService.insertAdmin(adminEntity) > CommonCode.ZERO) {	//등록 성공
		  resultCode = ResultCode.SUCCESS;
		  resultMessage = messages.getMessage("insert.admin.success"); 
		  result.setResultURL("/admin/management/adminList");
		}
		result.setResultCode(resultCode);
		result.setResultMSG(resultMessage);
	  } catch (Exception e) {
		logger.error("ManagementRestController.insertAdmin:Faild" , e);
		result.setResultCode(ResultCode.FAIL);
		result.setResultMSG(messages.getMessage("insert.fail"));
	  }
	  return result;
	}
	
	/**
	 * 관리자 수정
	 * @param adminEntity
	 * @return
	 */
	@RequestMapping(value = "/modifyAdmin",  method = RequestMethod.POST)
	public ResponseEntity modifyAdmin(AdminEntity adminEntity) {
	  ResponseEntity result = new ResponseEntity();
	  try {
		String resultCode = ResultCode.FAIL;
		String resultMessage = messages.getMessage("modify.fail");
		//등록 성공일시
		if(memberService.modifyAdmin(adminEntity) > CommonCode.ZERO) {
		  resultCode = ResultCode.SUCCESS;
		  resultMessage = messages.getMessage("modify.admin.success");
		}
		result.setResultCode(resultCode);
		result.setResultMSG(resultMessage); 
		result.setResultURL("/admin/management/adminList");
	  } catch (Exception e) { 
		logger.error("ManagementRestController.modifyAdmin:Faild" , e);
		result.setResultCode(ResultCode.FAIL);
		result.setResultMSG(messages.getMessage("modify.fail"));
	  }
	  return result;
	}
	
	/**
	 * 관리자 삭제
	 * @param adminEntity
	 * @return
	 */
	@RequestMapping(value = "/removeAdmin",  method = RequestMethod.POST)
	public ResponseEntity removeAdmin(@RequestParam int id) {
	  ResponseEntity result = new ResponseEntity();
	  try {
		AdminEntity adminEntity = new AdminEntity();
		adminEntity.setAdminMasterKey(id);
		String resultCode = ResultCode.FAIL;
		String resultMessage = messages.getMessage("remove.fail");
		//삭제 성공일시
		if(memberService.removeAdmin(adminEntity) > CommonCode.ZERO) {
		  resultCode = ResultCode.SUCCESS;
		  resultMessage = messages.getMessage("remove.admin.success");
		}
		result.setResultCode(resultCode);
		result.setResultMSG(resultMessage); 
		result.setResultURL("/admin/management/adminList");
	  } catch (Exception e) { 
		logger.error("ManagementRestController.removeAdmin:Faild" , e);
		result.setResultCode(ResultCode.FAIL);
		result.setResultMSG(messages.getMessage("remove.fail"));
	  }
	  return result;
	}
	/**
	 * 팝업 등록
	 * @param popupEntity
	 * @return
	 */
	@RequestMapping(value = "/insertPopup",  method = RequestMethod.POST)
	public ResponseEntity insertPopup(PopupEntity popupEntity) {
		ResponseEntity result = new ResponseEntity();
	  try {
		String resultCode = ResultCode.FAIL;
		String resultMessage = messages.getMessage("insert.fail");
		if(popupService.insertPopup(popupEntity) > CommonCode.ZERO) {
		  resultCode = ResultCode.SUCCESS;
		  resultMessage = messages.getMessage("insert.success"); 
		  result.setResultURL("/admin/management/popupList");
		}
		result.setResultCode(resultCode);
		result.setResultMSG(resultMessage); 
	  } catch (Exception e) {
		logger.error("ManagementRestController.insertPopup:Faild" , e);
		result.setResultCode(ResultCode.FAIL);
		result.setResultMSG(messages.getMessage("insert.fail"));
	  }
	  return result;
	}
	/**
	 * 팝업 수정
	 * @param popupEntity
	 * @return
	 */
	@RequestMapping(value = "/modifyPopup",  method = RequestMethod.POST)
	public ResponseEntity modifyPopup(PopupEntity popupEntity) {
		ResponseEntity result = new ResponseEntity();
	  try {
		String resultCode = ResultCode.FAIL;
		String resultMessage = messages.getMessage("modify.fail");
		if(popupService.modifyPopup(popupEntity) > CommonCode.ZERO) {
		  resultCode = ResultCode.SUCCESS;
		  resultMessage = messages.getMessage("modify.success");
		}
		result.setResultCode(resultCode);
		result.setResultMSG(resultMessage);
		result.setResultURL("/admin/management/popupList");
	  } catch (Exception e) {
		logger.error("ManagementRestController.modifyPopup:Faild" , e);
		result.setResultCode(ResultCode.FAIL);
		result.setResultMSG(messages.getMessage("modify.fail"));
	  }
	  return result;
	}
	
	/**
	 * 팝업 종료
	 * @param popupEntity
	 * @return
	 */
	@RequestMapping(value = "/endPopup",  method = RequestMethod.POST)
	public ResponseEntity endPopup(PopupEntity popupEntity) {
	ResponseEntity result = new ResponseEntity();
	  try {
		String resultCode = ResultCode.FAIL;
		String resultMessage = messages.getMessage("end.fail");
		if(popupService.endPopup(popupEntity) > CommonCode.ZERO) {
			resultCode = ResultCode.SUCCESS;
			resultMessage = messages.getMessage("end.success"); 
		}
		result.setResultCode(resultCode);
		result.setResultMSG(resultMessage); 
		result.setResultURL("/admin/management/popupList");
	  } catch (Exception e) {
		logger.error("ManagementRestController.endPopup:Faild" , e);
		result.setResultCode(ResultCode.FAIL);
		result.setResultMSG(messages.getMessage("end.fail"));
	  }
	  return result;
	}
}
