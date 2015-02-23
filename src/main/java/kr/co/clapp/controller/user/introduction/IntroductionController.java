package kr.co.clapp.controller.user.introduction;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import kr.co.clapp.constants.CommonCode;
import kr.co.clapp.constants.ResultCode;
import kr.co.clapp.entities.AdministrationFileEntity;
import kr.co.clapp.entities.BoardEntity;
import kr.co.clapp.entities.BoardNoticeEntity;
import kr.co.clapp.entities.BoardQnaEntity;
import kr.co.clapp.entities.CommonCodeEntity;
import kr.co.clapp.entities.EcrmEntity;
import kr.co.clapp.entities.ResponseEntity;
import kr.co.clapp.entities.ServiceInquiryEntity;
import kr.co.clapp.entities.validation.FormBindingResultEntity;
import kr.co.clapp.entities.validation.FormInquireInfoEntity;
import kr.co.clapp.entities.validation.FormInquireInfoEntity.InquiryPass;
import kr.co.clapp.entities.validation.FormRecruitInfoEntity.RecruitPass;
import kr.co.clapp.entities.validation.FormRecruitInfoEntity;
import kr.co.clapp.service.board.BoardService;
import kr.co.clapp.service.common.CommonService;
import kr.co.clapp.service.customer.CustomerService;
import kr.co.clapp.service.file.AdministrationFileService;
import kr.co.clapp.service.mailing.MailingService;
import kr.co.clapp.utils.ValidationResultUtils;
import kr.co.digigroove.commons.entities.SavedFileEntity;
import kr.co.digigroove.commons.messages.Messages;
import kr.co.digigroove.commons.utils.FileUtils;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Controller
@RequestMapping(value="/introduction")
public class IntroductionController {
	private static final Logger logger = LoggerFactory.getLogger(IntroductionController.class);
	@Autowired
	private Messages messages;
	@Autowired
	private BoardService boardService;
	@Autowired
	private AdministrationFileService administrationFileService;
	@Autowired 
	private CustomerService customerService;
	@Autowired
	private MailingService mailingService;
	@Autowired
	private CommonService commonService;
	
	@Value("#{fileConfig['filePath']}")
	private String filePath;
	
	
	HashMap<String, Object> commonCode  = new HashMap<String, Object>();
	  
	CommonCodeEntity commonCodeEntity = new CommonCodeEntity();
	
	/**
	 * 브랜드 클앱 메인
	 */
	@RequestMapping(value="introductionMain")
	public String CompanyIntroduction(){
		return "user/introduction/introductionMain";
	}
	@RequestMapping(value="newsArticleList")
	public String newsArticleList(BoardEntity boardEntity, Model model){
		try{
		boardEntity = boardService.getBoardSocialBlogUserList(boardEntity);
		model.addAttribute("boardEntity", boardEntity);
		}catch (Exception e){
			logger.debug("IntroductionController.newsArticleList:fail : "+e);
		}
		return "user/introduction/newsArticleList";
	}
	@RequestMapping(value="newsArticleDetail")
	public String newsArticleDetail(BoardEntity boardEntity, Model model){
		BoardEntity newsArticleInfo = null;
		newsArticleInfo = boardService.getSocialBlogDetail(boardEntity);
		model.addAttribute("newsArticleDetail", newsArticleInfo);
		return "user/introduction/newsArticleDetail";
	}
	/**
	 * 인재 채용
	 */
	@RequestMapping(value="personRecruit")
	public String personRecruit(){
		return "user/introduction/personRecruit";
	}
	/**
	 * 입사 지원
	 * @return
	 */
	@RequestMapping(value="popup/companyApplication")
	public String companyApplication(){
		return "introduction/popup/companyApplication";
	}
	/**
	 * 입사 지원 성공
	 * @return
	 */
	@RequestMapping(value="popup/companyApplicationComplete")
	public String companyApplicationComplete(){
		return "introduction/popup/companyApplicationComplete";
	}
	/**
	 * 고객 협력사
	 */
	@RequestMapping(value="cooperation")
	public String cooperation(){
		return "user/introduction/cooperation";
	}
	/**
	 * 고객지원 메인 (공지사항)
	 */
	@RequestMapping(value="supportCustomerList")
	public String supportCustomerList(BoardNoticeEntity boardNoticeEntity, Model model){
		try{
			boardNoticeEntity = customerService.getBoardNoticeUserList(boardNoticeEntity);
			model.addAttribute("boardNoticeEntity", boardNoticeEntity);
		}catch(Exception e){
			logger.error("IntroductionController.supportCustomerList:Faild" , e);	
		}
		return "user/introduction/supportCustomerList";
	}
	/**
	 * 공지사항 상세
	 * @param boardNoticeEntity
	 * @param model
	 * @return
	 */
	@RequestMapping(value="supportCustomerDetail")
	public String supportCustomerDetail(BoardNoticeEntity boardNoticeEntity, Model model){
		BoardNoticeEntity boardNoticeInfo = null;
		try {
			boardNoticeInfo = customerService.getBoardNoticeUserDetail(boardNoticeEntity);
			model.addAttribute("supportCustomerDetail", boardNoticeInfo);
		} catch (Exception e) {
			logger.error("IntroductionController.supportCustomerDetail:Faild" , e);	
		}
		return "user/introduction/supportCustomerDetail";
	}
	/**
	 * 고객지원 (도움말)
	 */
	@RequestMapping(value="supportQnaList")
	public String supportQnaList(BoardQnaEntity boardQnaEntity, Model model){
		try{
			CommonCodeEntity commonCodeEntity = new CommonCodeEntity();
			commonCodeEntity.setCodeMasterCode(CommonCode.INQUIRY_CATEGORY);
			List<CommonCodeEntity> qnaCategoryCode = commonService.getCommonCodeList(commonCodeEntity);
			boardQnaEntity = customerService.getBoardQnaUserList(boardQnaEntity);
			model.addAttribute("boardQnaEntity", boardQnaEntity);
			model.addAttribute("qnaCategoryCode", qnaCategoryCode);
			model.addAttribute("CommonCode", commonCode);
		} catch (Exception e){
			logger.error("IntroductionController.supportQnaList:Faild" , e);	
		}
		return "user/introduction/supportQnaList";
	}
	/**
	 * 고객지원 (서비스 별 문의)
	 */ 
	@RequestMapping(value="supportInquire")
	public String supportInquire(ServiceInquiryEntity inquiryEntity, Model model){
		try{
		/*공통코드*/
		CommonCodeEntity commonCodeEntity = new CommonCodeEntity();
		/*공통코드 핸드폰*/
  	  	commonCodeEntity.setCodeMasterCode(CommonCode.CELL_PHONE_NUM);
  	  	List<CommonCodeEntity> cellPhoneCode = commonService.getCommonCodeList(commonCodeEntity);
  	  	model.addAttribute("cellPhoneCode", cellPhoneCode);	
		} catch (Exception e){
			logger.error("IntroductionController.supportInquire:Faild" , e);
		}
  	  	model.addAttribute("inquiryInfo", inquiryEntity);
		return "user/introduction/supportInquire";
	}
	/**
	 * 서비스별 문의 완료
	 * @param model
	 * @return
	 */
	@RequestMapping(value="supportInquireComplete")
	public String supportInquireComplete(Model model){
		return "user/introduction/supportInquireComplete";
	}
	
	@RequestMapping(value="popup/map")
	public String map(){
		return "introduction/popup/map";
	}
	
	/**
	 * 서비스별 문의 등록
	 * @param inquiryEntity
	 * @param req
	 * @return
	 */
	@RequestMapping(value = "/insertSupportInquire",  method = RequestMethod.POST)
	public String insertInquiry(
			@ModelAttribute("formInquireInfoEntity") @Validated(InquiryPass.class) FormInquireInfoEntity formInquireInfoEntity,
			BindingResult bindingResult,Model model,
			ServiceInquiryEntity inquiryEntity, MultipartHttpServletRequest req) {
      ResponseEntity result = new ResponseEntity();
	  AdministrationFileEntity administrationFileEntity = new AdministrationFileEntity();
	  FormBindingResultEntity resultEntity = new FormBindingResultEntity();
	  String returnUrl = "user/introduction/supportInquire";
	  try {
		 /*공통코드*/
		CommonCodeEntity commonCodeEntity = new CommonCodeEntity();
		/*공통코드 핸드폰*/
  	  	commonCodeEntity.setCodeMasterCode(CommonCode.CELL_PHONE_NUM);
  	  	List<CommonCodeEntity> cellPhoneCode = commonService.getCommonCodeList(commonCodeEntity);
  	  	model.addAttribute("cellPhoneCode", cellPhoneCode);	
		String resultCode = ResultCode.FAIL;
		String resultMessage = messages.getMessage("insert.fail");
		resultEntity.setResultEntity(ValidationResultUtils.formValidationResult(formInquireInfoEntity, InquiryPass.class));
		if(resultEntity.getCode().equals(CommonCode.SUCCESS)) {
			if(customerService.insertInquiry(inquiryEntity) > CommonCode.ZERO) {
			  resultCode = ResultCode.SUCCESS; 
			  resultMessage = messages.getMessage("insert.success"); 
			  result.setResultURL("/introduction/supportInquireComplete");
			  returnUrl = "user/introduction/supportInquireComplete";
			  // 파일 업로드
			  if(req.getFileNames().hasNext()) { 
				  administrationFileEntity.setFileTargetKey(inquiryEntity.getServiceInquiryKey());
				  administrationFileEntity.setFileTarget(CommonCode.FILE_TARGET_INQUIRY);
				  administrationFileEntity.setThumbYn(CommonCode.FILE_THUMB_N);
				  this.saveFileForFormData(req, administrationFileEntity);
			  }
			}
		}
//		result.setResultCode(resultCode);
//		result.setResultMSG(resultMessage);  
	  } catch (Exception e) {
		logger.error("IntroductionRestController.insertSupportInquire:Faild" , e);
		result.setResultCode(ResultCode.FAIL);
		result.setResultMSG(messages.getMessage("insert.fail"));
	  }
	  return returnUrl;
	}
	/**
	 * 파일 저장
	 * @param req
	 * @param administrationFileEntity
	 * @return
	 */
	public List<SavedFileEntity> saveFileForFormData(MultipartHttpServletRequest req, AdministrationFileEntity administrationFileEntity) {
		List<SavedFileEntity> saveFileList = new ArrayList<SavedFileEntity>();
		try {
			administrationFileService.removeAdministrationFile(administrationFileEntity);
			saveFileList = administrationFileService.saveFileForFormData(req, administrationFileEntity);
		} catch (Exception e) {
			logger.error("IntroductionRestController.saveFileForFormData" , e);
		}
		
		return saveFileList;
	}
	
	/**
	 * 입사지원
	 * @param inquiryEntity
	 * @param req
	 * @return
	 */
	@RequestMapping(value = "/sendRequit",  method = RequestMethod.POST)
	public String sendRequit(
			@ModelAttribute("formRecruitInfoEntity") @Validated(RecruitPass.class) FormRecruitInfoEntity formRecruitInfoEntity,
			BindingResult bindingResult,  
			MultipartHttpServletRequest req) {
	  FormBindingResultEntity resultEntity = new FormBindingResultEntity();
	  String returnUrl = "introduction/popup/companyApplication";
	  try { 
		resultEntity.setResultEntity(ValidationResultUtils.formValidationResult(formRecruitInfoEntity, RecruitPass.class));
		if(resultEntity.getCode().equals(CommonCode.SUCCESS)) {
			// 파일 업로드
			if(req.getFileNames().hasNext()) {
				//파일 저장 정보 
				List<SavedFileEntity> savedFileList = new ArrayList<SavedFileEntity>();
				//넘어온 이미지를 저장.  
				List<MultipartFile> fileList = new ArrayList<MultipartFile>();
				
				//파일 경로
				String path = filePath + "reqruit";
				Iterator<String> itr = req.getFileNames();
				int i = 0;
				while (itr.hasNext()) { fileList.add(req.getFile(itr.next())); }
				if (fileList != null) {
					for (MultipartFile file : fileList) {
						savedFileList.add(FileUtils.saveFile(path, file));
					}
				}
				String uploadFileName = savedFileList.get(0).getSavedFileName() ; 
				formRecruitInfoEntity.setFileName(path + "/" + uploadFileName);
			}
			
			 mailingService.sendDefaultMail(formRecruitInfoEntity);
			 
			 returnUrl = "introduction/popup/companyApplicationComplete";
		}
	  } catch (Exception e) {
		logger.error("IntroductionRestController.insertSupportInquire:Faild" , e);
	  }
	  return returnUrl;
	}
}


