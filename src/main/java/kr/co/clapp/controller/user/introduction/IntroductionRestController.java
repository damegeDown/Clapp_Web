package kr.co.clapp.controller.user.introduction;

import java.util.ArrayList;
import java.util.List;

import kr.co.clapp.constants.CommonCode;
import kr.co.clapp.constants.ResultCode;
import kr.co.clapp.entities.AdministrationFileEntity;
import kr.co.clapp.entities.BoardEntity;
import kr.co.clapp.entities.MemberEntity;
import kr.co.clapp.entities.ResponseEntity;
import kr.co.clapp.entities.ServiceInquiryEntity;
import kr.co.clapp.service.board.BoardService;
import kr.co.clapp.service.customer.CustomerService;
import kr.co.clapp.service.file.AdministrationFileService;
import kr.co.clapp.service.mailing.MailingService;
import kr.co.digigroove.commons.entities.SavedFileEntity;
import kr.co.digigroove.commons.messages.Messages;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartHttpServletRequest;


@RestController
@RequestMapping("/introduction/rest")
public class IntroductionRestController {
	
	private static final Logger logger = LoggerFactory.getLogger(IntroductionRestController.class);
	
	@Autowired
	private Messages messages;
	
	@Autowired
	private BoardService boardService;
	
	@Autowired
	private CustomerService customerService;
	
	@Autowired
	private AdministrationFileService administrationFileService;
	
	@Autowired
	private MailingService mailingService;
	
	/**
	 * 언론기사 더보기
	 * @param boardEntity
	 * @return
	 */
	@RequestMapping(value = "/socialList", method = RequestMethod.GET)
	public ResponseEntity getTrandReview(BoardEntity boardEntity){
		ResponseEntity result = new ResponseEntity();
		try{
			String resultCode = ResultCode.FAIL;
			String resultMessage = messages.getMessage("nextPage.fail");
			
			if(boardService.getBoardSocialBlogUserList(boardEntity) != null ){
				resultCode = ResultCode.SUCCESS;
				resultMessage = messages.getMessage("nextPage.success"); 
			}
			result.setResultDATA(boardEntity);
			result.setResultCode(resultCode);
			result.setResultMSG(resultMessage);
	} catch (Exception e) {
		logger.error("IntroductionRestController.getTrandReview:Faild" , e);
		result.setResultCode(ResultCode.FAIL);
		result.setResultMSG(messages.getMessage("nextPage.fail"));
	}
		return result;
	}
	/**
	 * 입사지원 등록
	 * @param memberEntity
	 * @param req
	 * @return
	 */
	@RequestMapping(value = "/insertCompanyApplication",  method = RequestMethod.POST)
	public ResponseEntity insertCompanyApplication(MemberEntity memberEntity) {
      ResponseEntity result = new ResponseEntity();
//	  AdministrationFileEntity administrationFileEntity = new AdministrationFileEntity();
	  try {
		String resultCode = ResultCode.FAIL;
		String resultMessage = messages.getMessage("insert.fail");
//		if(customerService.insertInquiry(inquiryEntity) > CommonCode.ZERO) {
//		  resultCode = ResultCode.SUCCESS;
//		  resultMessage = messages.getMessage("insert.success"); 
//		  result.setResultURL("introduction/popup/companyApplicationComplete");
//		  // 파일 업로드
//		  if(req.getFileNames().hasNext()) {
//			  administrationFileEntity.setFileTargetKey(inquiryEntity.getServiceInquiryKey());
//			  administrationFileEntity.setFileTarget(CommonCode.FILE_TARGET_INQUIRY);
//			  administrationFileEntity.setThumbYn(CommonCode.FILE_THUMB_N);
//			  this.saveFileForFormData(req, administrationFileEntity);
//		  }
//		}
		result.setResultCode(resultCode);
		result.setResultMSG(resultMessage); 
	  } catch (Exception e) {
		logger.error("IntroductionRestController.insertCompanyApplication:Faild" , e);
		result.setResultCode(ResultCode.FAIL);
		result.setResultMSG(messages.getMessage("insert.fail"));
	  }
	  return result;
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
	 * 파일 저장
	 * @param req
	 * @param administrationFileEntity
	 * @return
	 */
	public void removeFile(AdministrationFileEntity administrationFileEntity) {
		try {
			administrationFileService.removeFile(administrationFileEntity);
		} catch (Exception e) {
			logger.error("IntroductionRestController.removeFile" , e);
		}
		
	}
	/**
	 * 서비스별 문의 등록
	 * @param inquiryEntity
	 * @param req
	 * @return
	 */
	@RequestMapping(value = "/insertSupportInquire",  method = RequestMethod.POST)
	public ResponseEntity insertInquiry(ServiceInquiryEntity inquiryEntity, MultipartHttpServletRequest req) {
      ResponseEntity result = new ResponseEntity();
	  AdministrationFileEntity administrationFileEntity = new AdministrationFileEntity();
	  try {
		String resultCode = ResultCode.FAIL;
		String resultMessage = messages.getMessage("insert.fail");  
		if(customerService.insertInquiry(inquiryEntity) > CommonCode.ZERO) {
		  resultCode = ResultCode.SUCCESS; 
		  resultMessage = messages.getMessage("insert.success"); 
		  result.setResultURL("/introduction/supportInquireComplete");
		  // 파일 업로드
		  if(req.getFileNames().hasNext()) { 
			  administrationFileEntity.setFileTargetKey(inquiryEntity.getServiceInquiryKey());
			  administrationFileEntity.setFileTarget(CommonCode.FILE_TARGET_INQUIRY);
			  administrationFileEntity.setThumbYn(CommonCode.FILE_THUMB_N);
			  this.saveFileForFormData(req, administrationFileEntity);
		  }
		}
		result.setResultCode(resultCode);
		result.setResultMSG(resultMessage); 
	  } catch (Exception e) {
		logger.error("IntroductionRestController.insertSupportInquire:Faild" , e);
		result.setResultCode(ResultCode.FAIL);
		result.setResultMSG(messages.getMessage("insert.fail"));
	  }
	  return result;
	}	
}