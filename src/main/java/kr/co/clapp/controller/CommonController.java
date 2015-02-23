package kr.co.clapp.controller;

import kr.co.clapp.constants.CommonCode;
import kr.co.clapp.controller.admin.member.MemberRestController;
import kr.co.clapp.entities.CommonCodeEntity;
import kr.co.clapp.entities.MemberEntity;
import kr.co.clapp.entities.PayLgdInfo;
import kr.co.clapp.entities.PopupEntity;
import kr.co.clapp.entities.ResponseEntity;
import kr.co.clapp.entities.ResultEntity;
import kr.co.clapp.entities.SmsEntity;
import kr.co.clapp.service.common.CommonService;
import kr.co.clapp.service.popup.PopupService;
import kr.co.clapp.service.sms.SmsService;
import kr.co.digigroove.commons.utils.NumberUtils;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.File;
import java.util.List;

/**
 * Created by bearhj on 14. 11. 26.
 */
@Controller
public class CommonController {
  private static final Logger logger = LoggerFactory.getLogger(MemberRestController.class);
  @Autowired
  private CommonService commonService;
  @Autowired
  private SmsService smsService;
  @Autowired
  private PopupService popupService;
  @Value("#{smsConfig['sendNo']}")
  private String sendNo;
  @Value("#{fileConfig['filePath']}")
  private String filePath;
  /** 전자결제 설정 프로퍼티 */
  @Value("#{pay_prop['platform']}")
  private String cstPlatform;
  @Value("#{pay_prop['mid']}")
  private String cstMid;
  @Value("#{pay_prop['mertKey']}")
  private String mertKey;
  @Value("#{pay_prop['casnoteUrl']}")
  private String casnoteUrl;

  /**
   * 에러 페이지
   * @param resultCode
   * @param redirect
   * @param isAdmin
   * @param model
   * @return
   * @throws Exception
   */
  @RequestMapping(value = "/common/error", method = RequestMethod.GET)
  public String userError(@RequestParam(required = false, value = "resultCode") String resultCode,
		  @RequestParam(required = false, value = "redirect") String redirect,
		  @RequestParam(required = false, value = "isAdmin") int isAdmin,
		  Model model ) throws Exception {
	 model.addAttribute("resultCode", resultCode);
	 model.addAttribute("redirect", redirect);
     model.addAttribute("isAdmin", isAdmin);
     return "error";
  }

  /**
   * ajax 에러 페이지
   * @param resultCode
   * @param redirect
   * @param type
   * @return
   * @throws Exception
   */
  @RequestMapping(value = "/common/errorAjax", method = RequestMethod.GET)
  @ResponseBody
  public ResultEntity userErrorAjax(@RequestParam(required = false, value = "resultCode") String resultCode,
		  @RequestParam(required = false, value = "redirect") String redirect,
		  @RequestParam(required = false, value = "type") String type) throws Exception {
	ResultEntity result = new ResultEntity();
	result.setRedirect(redirect);
	result.setType(type);
	result.setCode(resultCode);
	return result;
  }

  /**
   * ip 승인 안된 회원
   
   */
  @RequestMapping(value = "/common/noIp", method = RequestMethod.GET)
  public String noIp() throws Exception {
	
	return "noIp";
  }
  /**
   * 파일 다운로드
   * @param model
   * @param path
   * @param orgFileName
   * @return
   * @throws Exception
   */
  @RequestMapping("/common/fileDownload")
  public String fileDownload(Model model
		  , @RequestParam(required = false, value = "path") String path
		  , @RequestParam(value = "orgFileName", required = true) String orgFileName) throws Exception {
	model.addAttribute("downloadFile", new File(filePath + path +"/"+orgFileName));
    model.addAttribute("orgFileName", orgFileName);
    return "downloadView"; 
  }

  /** 
   * 이미지 뷰
   * @param model
   * @param path
   * @return
   * @throws Exception
   */
  @RequestMapping(value="/common/imgView")
	public String imageView(Model model, 
			@RequestParam(required=true, value="fileName") String fileName, 
			@RequestParam(required=false, value="fileType") String fileType,
			@RequestParam(required=false, value="isThumb", defaultValue="false") String isThumb) {
		
		String uploadPath = filePath;
		String viewFileName = fileName;
		String downloadFile;
		File file;
		//uploadPath = uploadPath + "/";
		downloadFile = uploadPath + fileType  + "/" + viewFileName;	
		file = new File(downloadFile);
		if(!file.isFile()) {
			downloadFile = uploadPath  + "/no-img/no-image.png";			
		}
		
		model.addAttribute("isThumb", isThumb);
		model.addAttribute("fileName", fileName);
		model.addAttribute("filePath", downloadFile);
		return "imageView";
	}
  
  /**
   * 공통코드 지역 
   * @param model
   * @param commonCodeEntity
   * @return
   */
  @RequestMapping(value="/common/commonCodeList")
  @ResponseBody
  public List<CommonCodeEntity> getCommonCodeList(Model model, CommonCodeEntity commonCodeEntity) {
	List<CommonCodeEntity> result = null;
	try {
		result = commonService.getCommonCodeList(commonCodeEntity);
		//model.addAttribute("commonCodeList", commonCodeList);
	} catch (Exception e) {
		logger.error("CommonController.getArea:Faild" , e);
	}
	return result;
  }

  public PayLgdInfo initPayInfo(MemberEntity userInfo) {
    PayLgdInfo payLgdInfo = new PayLgdInfo();
	payLgdInfo.setCST_PLATFORM(cstPlatform);
	payLgdInfo.setCST_MID(cstMid);
	payLgdInfo.setLGD_MERTKEY(mertKey);
	
	payLgdInfo.setLGD_MID();									// 상점아이디 (자동생성)
	payLgdInfo.setLGD_TIMESTAMP(payLgdInfo.getTimestamp(0));	// 현재 시간
	payLgdInfo.setLGD_OID(payLgdInfo.createOrderNo());			// 주문 번호
	payLgdInfo.setLGD_BUYER(userInfo.getUserName());				// 주문자명
	payLgdInfo.setLGD_BUYEREMAIL(userInfo.getUserId());			// 주문자 이메일
	payLgdInfo.setLGD_BUYERPHONE(userInfo.getUserCellPhoneNumber());			// 주문자 휴대폰
	payLgdInfo.setLGD_BUYERID(userInfo.getUserId());				// 주문자 아이디
	
	// 무통장입금(가상계좌) 결제 처리용
	payLgdInfo.setLGD_CASNOTEURL(casnoteUrl);					// 무통장 수신결과 처리 페이지
	payLgdInfo.setLGD_CLOSEDATE(payLgdInfo.getTimestamp(CommonCode.Policy.DEPOSIT_CLOSE_DATE));	// 무통장 입금 마감기한 (7일)
	
	return payLgdInfo;
  }
   
  @RequestMapping(value="/common/sendCertificationNum")
  @ResponseBody
  public int endCertificationNum(MemberEntity memberEntity,
		  @RequestParam(required=false, value="userCellPhoneNumber") String userCellPhoneNumber) {
	  int certificationNum = NumberUtils.getRandomNumber(Integer.class, 6);
	  try {
		  String msgBody = "(클앱) 휴대폰 인증번호 안내 - "+certificationNum;
		  SmsEntity smsEntity = new SmsEntity();
		  smsEntity.setMsg_type(0);
		  smsEntity.setDest_phone(userCellPhoneNumber);
		  smsEntity.setSend_phone(sendNo);
		  smsEntity.setMsg_body(msgBody);
		  smsService.insertSms(smsEntity);
	 } catch (Exception e) {
		 logger.error("CommonController.endCertificationNum" , e);
	}
	return certificationNum;
	  
   }
  
  @RequestMapping(value = "/common/sendMail")
  public String sendMail() {
	  return "mailDef";
  }
  @RequestMapping(value="/common/searchCompanyNumber",  method = RequestMethod.POST)
  @ResponseBody
  public ResultEntity searchCompanyNumber(@RequestParam(required = false, value="companyName") String companyName) {
	ResultEntity result = new ResultEntity();
	MemberEntity memberEntity = new MemberEntity();
	try {
	  memberEntity.setUserCompanyName(companyName);
	  String companyNumber = commonService.searchCompanyNumber(memberEntity);
	  
	  result.setData(companyNumber);
	} catch (Exception e) {
      logger.error("PaymentRestController.modifyContractState:Faild" , e);
	}
    
    return result;
  }
  /**
   * 팝업 목록
   * @return
   */ 
  @RequestMapping("/common/popupList")
  @ResponseBody
  public List<PopupEntity> mainPopup(PopupEntity popupEntity, Model model) {
	  List<PopupEntity> result = null;
	  try{
		  result = popupService.getPopupMain(popupEntity);
	  } catch (Exception e) {
		  logger.error("CommonController.mainPopup:Faild" , e);
	  }
    return result;
  }
 }
