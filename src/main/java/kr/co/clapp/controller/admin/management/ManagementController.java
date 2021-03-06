package kr.co.clapp.controller.admin.management;


import kr.co.clapp.constants.CommonCode;
import kr.co.clapp.entities.AdminEntity;
import kr.co.clapp.entities.BannerEntity;
import kr.co.clapp.entities.CommonCodeEntity;
import kr.co.clapp.entities.PopupEntity;
import kr.co.clapp.service.banner.BannerService;
import kr.co.clapp.service.common.CommonService;
import kr.co.clapp.service.member.MemberService;
import kr.co.clapp.service.popup.PopupService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.HashMap;
import java.util.List;



@Controller
@RequestMapping("/admin/management")
public class ManagementController {
	
  private static final Logger logger = LoggerFactory.getLogger(ManagementRestController.class);
	
  @Autowired
  private MemberService memberService;
  @Autowired
  private PopupService popupService;
  // Banner Add Start
  @Autowired
  private BannerService bannerService;
  // Banner Add End
  @Autowired
  private CommonService commonService;

  
  HashMap<String, Object> commonCode  = new HashMap<String, Object>();
  /**
   * 관리자 설정 목록
   * @return
   */
  @RequestMapping("/adminList")
  public String adminList(AdminEntity adminEntity, Model model) {
	try {
		//관리자 목록
		adminEntity = memberService.getAdminList(adminEntity);

		//공통코드 
		CommonCodeEntity commonCodeEntity = new CommonCodeEntity();
		//공통코드 권한.
		commonCodeEntity.setCodeMasterCode(CommonCode.GRANT);
		//공통코드 권한 목록
		List<CommonCodeEntity> commonList = commonService.getCommonCodeList(commonCodeEntity);
		
		//관리자 목록
		model.addAttribute("adminEntity", adminEntity);
		//공통코드 권한 목록
		model.addAttribute("commonCodeEntity", commonList);
		
		//공통
		commonCode.put("navigation", "관리자 설정(총 <span class='colorSkyBlue'>"+adminEntity.getDataSize()+"</span> 명)");// 현재 페이지 네비게이션
		commonCode.put("mainMenu", "permissionMaster");									// left main menu 
		commonCode.put("subMenu", "admin");											// left sub menu
		model.addAttribute("CommonCode", commonCode);
	} catch (Exception e) {
		logger.error("ManagementController.adminList:Faild" , e);
	}
	return "admin/management/adminList";
  }
  
  /**
   * 관리자 상세 / 수정
   * @param adminEntity
   * @param model
   * @return
   */
  @RequestMapping("/adminDetail")
  public String adminDetail(AdminEntity adminEntity, Model model) {
	String navigation = "관리자 설정 > 상세";
	AdminEntity adminInfo = null;
	try {
	  //관리자 상세 - 관리자 키가 있을시에 수정.
	  if(adminEntity.getAdminMasterKey() > CommonCode.ZERO) {
		adminInfo = memberService.getAdminDetail(adminEntity);
	  }
	  model.addAttribute("adminDetail", adminInfo);
		
	  //공통
	  commonCode.put("navigation", navigation);	// 현재 페이지 네비게이션
	  commonCode.put("mainMenu", "permissionMaster"); // left main menu 
	  commonCode.put("subMenu", "admin");		// left sub menu
	  model.addAttribute("CommonCode", commonCode);
	} catch (Exception e) {
	  logger.error("ManagementController.adminList:Faild" , e);
	}
	model.addAttribute("navigation", navigation);
	return "admin/management/adminDetail";  
  }
  
  @RequestMapping("/adminModify")
  public String adminModify(AdminEntity adminEntity, Model model) {
	String navigation = "관리자 설정 > 등록";
	String submitType = "등록";
	String submitAction = "admin/management/rest/insertAdmin";
	String delBtn = "";
	AdminEntity adminInfo = null;
	try {
	  //관리자 상세 - 관리자 키가 있을시에 수정.
	  if(adminEntity.getAdminMasterKey() > CommonCode.ZERO) {
		navigation = "관리자 설정 > 수정";
		submitType = "수정";
		submitAction = "admin/management/rest/modifyAdmin";
		adminInfo = memberService.getAdminDetail(adminEntity);
	  }
	  model.addAttribute("adminDetail", adminInfo);
		
	  //공통
	  commonCode.put("navigation", navigation);	// 현재 페이지 네비게이션
	  commonCode.put("submitType", submitType);
	  commonCode.put("submitAction", submitAction);
	  commonCode.put("mainMenu", "permissionMaster"); // left main menu 
	  commonCode.put("subMenu", "admin");		// left sub menu
	  commonCode.put("delBtn", delBtn);
	  model.addAttribute("CommonCode", commonCode);
	} catch (Exception e) {
	  logger.error("ManagementController.adminList:Faild" , e);
	}
	model.addAttribute("navigation", navigation);
	return "admin/management/adminModify";  
  }
  /**
   * 팝업 목록
   * @return
   */
  @RequestMapping("/popupList")
  public String mainPopup(PopupEntity popupEntity, Model model) {
	  try{
		popupEntity = popupService.getPopupList(popupEntity);
		//공통코드
		CommonCodeEntity commonCodeEntity = new CommonCodeEntity();
		//공통코드 팝업 진행여부
		commonCodeEntity.setCodeMasterCode(CommonCode.POPUP_OPEN);
		//공통코드 팝업 진행여부 코드
		List<CommonCodeEntity> popupOpen = commonService.getCommonCodeList(commonCodeEntity);
		
		model.addAttribute("popupEntity", popupEntity);
		model.addAttribute("popupOpen", popupOpen);
			
		//공통
		commonCode.put("navigation", "메인 팝업 관리");// 현재 페이지 네비게이션
		commonCode.put("mainMenu", "permissionMain");									// left main menu
		commonCode.put("subMenu", "popup");											// left sub menu
		model.addAttribute("CommonCode", commonCode);
		  
	  } catch (Exception e) {
		  logger.error("ManagementController.mainPopup:Faild" , e);
	  }
    return "admin/management/popupList";
  }
  /**
   * 팝업 상세
   * @param popupEntity
   * @param model
   * @return
   */
  @RequestMapping("/popupDetail")
  public String popupDetail(PopupEntity popupEntity, Model model){
	  	String navigation = "메인 팝업 관리 > 상세";
		PopupEntity popupInfo = null;
		try {
		  //팝업 상세
		  if(popupEntity.getPopupKey() > CommonCode.ZERO) {
			popupInfo = popupService.getPopupDetail(popupEntity);
		  }
		  model.addAttribute("popupDetail", popupInfo);
			
		  //공통
		  commonCode.put("navigation", navigation);	// 현재 페이지 네비게이션
		  commonCode.put("mainMenu", "permissionMaster"); // left main menu 
		  commonCode.put("subMenu", "popup");		// left sub menu
		  model.addAttribute("CommonCode", commonCode);
		} catch (Exception e) {
		  logger.error("ManagementController.popupList:Faild" , e);
		}
		model.addAttribute("navigation", navigation);
	  return "admin/management/popupDetail";
  }
  /**
   * 팝업 수정
   * @param popupEntity
   * @param model
   * @return
   */
  @RequestMapping("/popupModify")
  public String popupModify(PopupEntity popupEntity, Model model){
	  	String navigation = "메인 팝업 관리 > 등록";
		String submitType = "등록";
		String submitAction = "admin/management/rest/insertPopup";
		PopupEntity popupInfo = null;
		try {
		  //팝업 상세
		  if(popupEntity.getPopupKey() > CommonCode.ZERO) {
			navigation = "메인 팝업 관리 > 수정";
			submitType = "수정";
			submitAction = "admin/management/rest/modifyPopup";
			popupInfo = popupService.getPopupDetail(popupEntity);
		  }
		  model.addAttribute("popupDetail", popupInfo);
			
		  //공통
		  commonCode.put("navigation", navigation);	// 현재 페이지 네비게이션
		  commonCode.put("submitType", submitType);
		  commonCode.put("submitAction", submitAction);
		  commonCode.put("mainMenu", "permissionMaster"); // left main menu 
		  commonCode.put("subMenu", "popup");		// left sub menu
		  model.addAttribute("CommonCode", commonCode);
		} catch (Exception e) {
		  logger.error("ManagementController.popupList:Faild" , e);
		}
		model.addAttribute("navigation", navigation);
	  return "admin/management/popupModify";
  }

  // Banner Add Start

  /**
   * 배너 목록
   * @return
   */
  @RequestMapping("/bannerList")
  public String bannerList(BannerEntity bannerEntity, Model model) {
	  try{
		bannerEntity = bannerService.getBannerList(bannerEntity);
		//공통코드
		CommonCodeEntity commonCodeEntity = new CommonCodeEntity();
		//공통코드 배너 진행여부
		commonCodeEntity.setCodeMasterCode(CommonCode.BANNER_STATUS);
		//공통코드 배너 진행여부 코드
		List<CommonCodeEntity> bannerStatus = commonService.getCommonCodeList(commonCodeEntity);
		
		model.addAttribute("bannerEntity", bannerEntity);
		model.addAttribute("bannerStatus", bannerStatus);

		int bannnerViewCount = 0;

		for (BannerEntity entity : bannerEntity.getBannerList() ) {
			if ("노출".equals(entity.getBannerStatus())) {
				bannnerViewCount++;
			}
		}


		//공통
		commonCode.put("navigation", "배너 관리 (노출 <span class='colorSkyBlue'> "+bannnerViewCount+"</span> 건)");	// 현재 페이지 네비게이션
		commonCode.put("mainMenu", "permissionMain");									// left main menu
		commonCode.put("subMenu", "banner");											// left sub menu
		model.addAttribute("CommonCode", commonCode);
		  
	  } catch (Exception e) {
		  logger.error("ManagementController.bannerList:Faild" , e);
	  }
    return "admin/management/bannerList";
  }
  /**
   * 배너 상세
   * @param bannerEntity
   * @param model
   * @return
   */
  @RequestMapping("/bannerDetail")
  public String bannerDetail(BannerEntity bannerEntity, Model model){
	  	String navigation = "배너 관리 > 상세화면";
	  	BannerEntity bannerInfo = null;
		try {
		  //배너 상세
		  if(bannerEntity.getBannerInquiryKey() > CommonCode.ZERO) {
			  bannerInfo = bannerService.getBannerDetail(bannerEntity);
		  }
		  model.addAttribute("bannerDetail", bannerInfo);
			
		  //공통
		  commonCode.put("navigation", navigation);	// 현재 페이지 네비게이션
		  commonCode.put("mainMenu", "permissionMaster"); // left main menu 
		  commonCode.put("subMenu", "banner");		// left sub menu
		  model.addAttribute("CommonCode", commonCode);
		} catch (Exception e) {
		  logger.error("ManagementController.bannerDetail:Faild" , e);
		}
		model.addAttribute("navigation", navigation);
	  return "admin/management/bannerDetail";
  }
  /**
   * 배너 수정
   * @param bannerEntity
   * @param model
   * @return
   */
  @RequestMapping("/bannerModify")
  public String bannerModify(BannerEntity bannerEntity, Model model){
	  	String navigation = "배너 관리 > 등록";
		String submitType = "등록";
		String submitAction = "admin/management/rest/insertBanner";
		BannerEntity bannerInfo = null;
		try {
		  //배너 상세
		  if(bannerEntity.getBannerInquiryKey() > CommonCode.ZERO) {
			navigation = "배너 관리 > 수정";
			submitType = "수정";
			submitAction = "admin/management/rest/modifyBanner";
			bannerInfo = bannerService.getBannerDetail(bannerEntity);
		  }
		  model.addAttribute("bannerDetail", bannerInfo);
		  
			//공통코드
			CommonCodeEntity commonCodeEntity = new CommonCodeEntity();
			//공통코드 배너 상태
			commonCodeEntity.setCodeMasterCode(CommonCode.BANNER_STATUS);
			//공통코드 배너 진행여부 코드
			List<CommonCodeEntity> bannerStatus = commonService.getCommonCodeList(commonCodeEntity);
			model.addAttribute("bannerStatus", bannerStatus);
			
			//공통코드 배너 진행여부
			commonCodeEntity.setCodeMasterCode(CommonCode.BANNER_LINK_TYPE);
			//공통코드 배너 진행여부 코드
			List<CommonCodeEntity> bannerLinkType = commonService.getCommonCodeList(commonCodeEntity);
			model.addAttribute("bannerLinkType", bannerLinkType);
			
		  //공통
		  commonCode.put("navigation", navigation);	// 현재 페이지 네비게이션
		  commonCode.put("submitType", submitType);
		  commonCode.put("submitAction", submitAction);
		  commonCode.put("mainMenu", "permissionMaster"); // left main menu 
		  commonCode.put("subMenu", "banner");		// left sub menu
		  model.addAttribute("CommonCode", commonCode);
		} catch (Exception e) {
		  logger.error("ManagementController.bannerList:Faild" , e);
		}
		model.addAttribute("navigation", navigation);
	  return "admin/management/bannerModify";
  }
  // Banner Add End
}
