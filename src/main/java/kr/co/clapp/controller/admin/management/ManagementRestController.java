package kr.co.clapp.controller.admin.management;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.co.clapp.constants.CommonCode;
import kr.co.clapp.constants.ResultCode;
import kr.co.clapp.entities.AdminEntity;
import kr.co.clapp.entities.AdministrationFileEntity;
import kr.co.clapp.entities.BannerEntity;
import kr.co.clapp.entities.PopupEntity;
import kr.co.clapp.entities.ResponseEntity;
import kr.co.clapp.service.banner.BannerService;
import kr.co.clapp.service.file.AdministrationFileService;
import kr.co.clapp.service.member.MemberService;
import kr.co.clapp.service.popup.PopupService;
import kr.co.digigroove.commons.entities.SavedFileEntity;
import kr.co.digigroove.commons.messages.Messages;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

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

	// Banner Add Start
	@Autowired
	private BannerService bannerService;

	@Autowired
	AdministrationFileService administrationFileService;
	// Banner Add End


	/**
	 * 관리자 등록
	 * @param adminEntity
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
	 * @RequestParam int
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
	
	// Banner Add Start

	/**
	 * 배너 등록
	 * @param bannerEntity
	 * @return
	 */
	@RequestMapping(value = "/insertBanner",  method = RequestMethod.POST)
	public ResponseEntity insertBanner(BannerEntity bannerEntity, HttpSession session, MultipartHttpServletRequest req) {
		ResponseEntity result = new ResponseEntity();
		AdministrationFileEntity administrationFileEntity = new AdministrationFileEntity();
	  try {
		String resultCode = ResultCode.FAIL;
		String resultMessage = messages.getMessage("insert.fail");
		
		Object entity = session.getAttribute(CommonCode.Session.ADMIN_LOGIN_SESSION);
		if (null != entity) {
			AdminEntity admin = (AdminEntity)entity;
			bannerEntity.setBannerInsertName(admin.getAdminName());
		} else {
			bannerEntity.setBannerInsertName("no name");
		}
		
		if(bannerService.insertBanner(bannerEntity) > CommonCode.ZERO) {
		  resultCode = ResultCode.SUCCESS;
		  resultMessage = messages.getMessage("insert.success"); 
		  result.setResultURL("/admin/management/bannerList");
		// 파일 업로드
		  if(req.getFileNames().hasNext()) {
			  administrationFileEntity.setFileTargetKey(bannerEntity.getBannerInquiryKey());
			  administrationFileEntity.setFileTarget(CommonCode.FILE_TARGET_BANNER);
			  administrationFileEntity.setThumbYn(CommonCode.FILE_THUMB_N);
			  //기존 파일 삭제 
			  //this.removeFile(administrationFileEntity);
			  this.saveFileForFormData(req, administrationFileEntity);
		  }
		}
		result.setResultCode(resultCode);
		result.setResultMSG(resultMessage); 
	  } catch (Exception e) {
		logger.error("ManagementRestController.insertBanner:Faild" , e);
		result.setResultCode(ResultCode.FAIL);
		result.setResultMSG(messages.getMessage("insert.fail"));
	  }
	  
	  return result;
	}
	
	public List<SavedFileEntity> saveFileForFormData(MultipartHttpServletRequest req, AdministrationFileEntity administrationFileEntity) {
		List<SavedFileEntity> saveFileList = new ArrayList<SavedFileEntity>();
		try {
			administrationFileService.removeAdministrationFile(administrationFileEntity);
			saveFileList = administrationFileService.saveFileForFormData(req, administrationFileEntity);
		} catch (Exception e) {
			logger.error("DeviceRestController.saveFileForFormData" , e);
		}
		
		return saveFileList;
	}

	public void removeFile(AdministrationFileEntity administrationFileEntity) {
		try {
			administrationFileService.removeFile(administrationFileEntity);
		} catch (Exception e) {
			logger.error("DeviceRestController.removeFile" , e);
		}
		
	}
	/**
	 * 배너 수정
	 * @param bannerEntity
	 * @return
	 */
	@RequestMapping(value = "/modifyBanner",  method = RequestMethod.POST)
	public ResponseEntity modifyBanner(BannerEntity bannerEntity, MultipartHttpServletRequest req) {
		ResponseEntity result = new ResponseEntity();
		AdministrationFileEntity administrationFileEntity = new AdministrationFileEntity();
	  try {
		String resultCode = ResultCode.FAIL;
		String resultMessage = messages.getMessage("modify.fail");
		if(bannerService.modifyBanner(bannerEntity) > CommonCode.ZERO) {
		  resultCode = ResultCode.SUCCESS;
		  resultMessage = messages.getMessage("modify.success");
		  
		// 파일 업로드
		  if(req.getFileNames().hasNext()) {
			  administrationFileEntity.setFileTargetKey(bannerEntity.getBannerInquiryKey());
			  administrationFileEntity.setFileTarget(CommonCode.FILE_TARGET_BANNER);
			  administrationFileEntity.setThumbYn(CommonCode.FILE_THUMB_N);
			  //기존 파일 삭제 
			  this.removeFile(administrationFileEntity);
			  this.saveFileForFormData(req, administrationFileEntity);
		  }
		}
		result.setResultCode(resultCode);
		result.setResultMSG(resultMessage);
		result.setResultURL("/admin/management/bannerList");
	  } catch (Exception e) {
		logger.error("ManagementRestController.modifyBanner:Faild" , e);
		result.setResultCode(ResultCode.FAIL);
		result.setResultMSG(messages.getMessage("modify.fail"));
	  }
	  return result;
	}
	
	/**
	 * 배너 종료
	 * @param bannerEntity
	 * @return
	 */
	@RequestMapping(value = "/endBanner",  method = RequestMethod.POST)
	public ResponseEntity endBanner(BannerEntity bannerEntity) {
	ResponseEntity result = new ResponseEntity();
	  try {
		String resultCode = ResultCode.FAIL;
		String resultMessage = messages.getMessage("end.fail");
		if(bannerService.endBanner(bannerEntity) > CommonCode.ZERO) {
			resultCode = ResultCode.SUCCESS;
			resultMessage = messages.getMessage("end.success"); 
		}
		result.setResultCode(resultCode);
		result.setResultMSG(resultMessage); 
		result.setResultURL("/admin/management/bannerList");
	  } catch (Exception e) {
		logger.error("ManagementRestController.endBanner:Faild" , e);
		result.setResultCode(ResultCode.FAIL);
		result.setResultMSG(messages.getMessage("end.fail"));
	  }
	  return result;
	}

	/**
	 * 배너 노출
	 * @param bannerEntity
	 * @return
	 */
	@RequestMapping(value = "/bannerViewOn", method = RequestMethod.POST, consumes = "application/json", produces = "application/json")
	public ResponseEntity bannerViewOn(@RequestBody BannerEntity bannerEntity) {
		ResponseEntity result = new ResponseEntity();
		try {
			String resultCode = ResultCode.FAIL;
			String resultMessage = messages.getMessage("insert.fail");


			if(bannerService.bannerViewOn(bannerEntity) > CommonCode.ZERO) {
				resultCode = ResultCode.SUCCESS;
				resultMessage = messages.getMessage("insert.success");
				result.setResultURL("/admin/management/bannerList");
			}


			result.setResultCode(resultCode);
			result.setResultMSG(resultMessage);
		} catch (Exception e) {
			logger.error("ManagementRestController.bannerViewOn:Failed" , e);
			result.setResultCode(ResultCode.FAIL);
			result.setResultMSG(messages.getMessage("insert.fail"));
		}
		return result;
	}

	/**
	 * 배너 비 노출
	 * @param bannerEntity
	 * @return
	 */
	@RequestMapping(value = "/bannerViewOff", method = RequestMethod.POST, consumes = "application/json", produces = "application/json")
	public ResponseEntity bannerViewOff(@RequestBody BannerEntity bannerEntity) {
		ResponseEntity result = new ResponseEntity();
		try {
			String resultCode = ResultCode.FAIL;
			String resultMessage = messages.getMessage("insert.fail");


			if(bannerService.bannerViewOff(bannerEntity) > CommonCode.ZERO) {
				resultCode = ResultCode.SUCCESS;
				resultMessage = messages.getMessage("insert.success");
				result.setResultURL("/admin/management/bannerList");
			}


			result.setResultCode(resultCode);
			result.setResultMSG(resultMessage);
		} catch (Exception e) {
			logger.error("ManagementRestController.bannerViewOff:Failed" , e);
			result.setResultCode(ResultCode.FAIL);
			result.setResultMSG(messages.getMessage("insert.fail"));
		}
		return result;
	}


	/**
	 * 배너 노출 업
	 * @param bannerEntity
	 * @return
	 */
	@RequestMapping(value = "/bannerViewUp", method = RequestMethod.POST, consumes = "application/json", produces = "application/json")
	public ResponseEntity bannerViewUp(@RequestBody BannerEntity bannerEntity) {
		ResponseEntity result = new ResponseEntity();
		try {

			System.out.println("BannerViewUp.... Start...");

			String resultCode = ResultCode.FAIL;
			String resultMessage = messages.getMessage("insert.fail");

			if(bannerService.bannerViewUp(bannerEntity) > CommonCode.ZERO) {
				resultCode = ResultCode.SUCCESS;
				resultMessage = messages.getMessage("insert.success");
				result.setResultURL("/admin/management/bannerList");
			}
			result.setResultCode(resultCode);
			result.setResultMSG(resultMessage);
		} catch (Exception e) {
			logger.error("ManagementRestController.bannerViewUp:Failed" , e);
			result.setResultCode(ResultCode.FAIL);
			result.setResultMSG(messages.getMessage("insert.fail"));
		}
		return result;
	}

	/**
	 * 배너 노출 다운
	 * @param bannerEntity
	 * @return
	 */
	@RequestMapping(value = "/bannerViewDown", method = RequestMethod.POST, consumes = "application/json", produces = "application/json")
	public ResponseEntity bannerViewDown(@RequestBody BannerEntity bannerEntity) {
		ResponseEntity result = new ResponseEntity();
		try {
			String resultCode = ResultCode.FAIL;
			String resultMessage = messages.getMessage("insert.fail");


			if(bannerService.bannerViewDown(bannerEntity) > CommonCode.ZERO) {
				resultCode = ResultCode.SUCCESS;
				resultMessage = messages.getMessage("insert.success");
				result.setResultURL("/admin/management/bannerList");
			}


			result.setResultCode(resultCode);
			result.setResultMSG(resultMessage);
		} catch (Exception e) {
			logger.error("ManagementRestController.bannerViewDown:Failed" , e);
			result.setResultCode(ResultCode.FAIL);
			result.setResultMSG(messages.getMessage("insert.fail"));
		}
		return result;
	}

	// Banner Add End

}
