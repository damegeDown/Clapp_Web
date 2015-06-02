package kr.co.clapp.controller.admin.customer;


import kr.co.clapp.constants.CommonCode;
import kr.co.clapp.constants.ResultCode;
import kr.co.clapp.entities.*;
import kr.co.clapp.service.customer.CustomerService;
import kr.co.clapp.service.file.AdministrationFileService;
import kr.co.clapp.service.mailing.MailingService;
import kr.co.digigroove.commons.entities.SavedFileEntity;
import kr.co.digigroove.commons.messages.Messages;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import java.util.ArrayList;
import java.util.List;


@RestController
@RequestMapping("/admin/customer/rest")
public class CustomerRestController {
	
	private static final Logger logger = LoggerFactory.getLogger(CustomerRestController.class);
	
	@Autowired
	private Messages messages;
	
	@Autowired 
	 private CustomerService customerService;
	
	@Autowired
	private MailingService mailingService;

	@Autowired
	AdministrationFileService administrationFileService;
	
	/**
	 * 이메일 문의 답변 등록
	 * @param serviceInquiryEntity
	 * @return
	 */
	@RequestMapping(value = "/insertServiceInquiryAnswer",  method = RequestMethod.POST)
	public ResponseEntity insertServiceInquiryAnswer(ServiceInquiryEntity serviceInquiryEntity) {
      ResponseEntity result = new ResponseEntity();
      MemberEntity memberEntity = new MemberEntity();
	  try {
		String resultCode = ResultCode.FAIL;
		String resultMessage = messages.getMessage("insert.fail");
		if(customerService.insertServiceInquiryAnswer(serviceInquiryEntity) > CommonCode.ZERO) {
		  resultCode = ResultCode.SUCCESS;
		  resultMessage = messages.getMessage("insert.success");  
		  result.setResultURL("/admin/customer/serviceInquiryList"); 
		  memberEntity.setUserId(serviceInquiryEntity.getInquiryEmail());
		  memberEntity.setUserName(serviceInquiryEntity.getInquiryName()); 
		  memberEntity.setInquiryContents(serviceInquiryEntity.getInquiryContents()); 
		  memberEntity.setAnswerContents(serviceInquiryEntity.getAnswerContents()); 
		  if(mailingService.sendInquiryAnswerMail(memberEntity) > CommonCode.ZERO) {
	    		// 메일 발송 성공
	    		//ecrmEntity.setMailState(CommonCode.SUCCESS_NO);
	    	} else {
	    		// 메일 발송 실패
	    		//ecrmEntity.setMailState(CommonCode.FAIL_NO);
	    	}
		}
		result.setResultCode(resultCode);
		result.setResultMSG(resultMessage); 
	  } catch (Exception e) {
		logger.error("CustomerRestController.insertServiceInquiryAnswer:Failed" , e);
		result.setResultCode(ResultCode.FAIL);
		result.setResultMSG(messages.getMessage("insert.fail"));
	  }
	  return result;
	}
	/**
	 * 유선 상담 등록
	 * @param cabledAdviceEntity
	 * @return
	 */
	@RequestMapping(value = "/insertCabledAdvice",  method = RequestMethod.POST)
	public ResponseEntity insertCabledAdvice(CabledAdviceEntity cabledAdviceEntity ) {
      ResponseEntity result = new ResponseEntity();
	  try {
		String resultCode = ResultCode.FAIL;
		String resultMessage = messages.getMessage("insert.fail");
		if(customerService.insertCabledAdvice(cabledAdviceEntity) > CommonCode.ZERO) {
		  resultCode = ResultCode.SUCCESS;
		  resultMessage = messages.getMessage("insert.success"); 
		  result.setResultURL("/admin/customer/cabledAdviceDetail?cabledAdviceKey="+cabledAdviceEntity.getCabledAdviceKey());
		}
		result.setResultCode(resultCode);
		result.setResultMSG(resultMessage); 
	  } catch (Exception e) {
		logger.error("CustomerRestController.insertCabledAdvice:Failed" , e);
		result.setResultCode(ResultCode.FAIL);
		result.setResultMSG(messages.getMessage("insert.fail"));
	  }
	  return result;
	}
	/**
	 * 유선 상담 등록 완료
	 * @param cabledAdviceEntity
	 * @return
	 */
	@RequestMapping(value = "/modifyCabledAdvice",  method = RequestMethod.POST)
	public ResponseEntity modifyCabledAdvice(CabledAdviceEntity cabledAdviceEntity) {
	  ResponseEntity result = new ResponseEntity();
	  try {
		String resultCode = ResultCode.FAIL;
		String resultMessage = messages.getMessage("modify.fail");
		//수정 성공시
		if(customerService.modifyCabledAdvice(cabledAdviceEntity) > CommonCode.ZERO) {
		  resultCode = ResultCode.SUCCESS;
		  resultMessage = messages.getMessage("modify.success");
		}
		result.setResultCode(resultCode);
		result.setResultMSG(resultMessage);
		result.setResultURL("/admin/customer/cabledAdviceList");
	  } catch (Exception e) {
		logger.error("CustomerRestController.modifyCabledAdvice:Failed" , e);
		result.setResultCode(ResultCode.FAIL);
		result.setResultMSG(messages.getMessage("modify.fail"));
	  }
	  return result;
	}
	/**
	 * 공지사항 등록
	 * @param boardNoticeEntity
	 * @return
	 */
	@RequestMapping(value = "/insertBoardNotice",  method = RequestMethod.POST)
	public ResponseEntity insertBoardNotice(BoardNoticeEntity boardNoticeEntity, MultipartHttpServletRequest req) {
      ResponseEntity result = new ResponseEntity();
      AdministrationFileEntity administrationFileEntity = new AdministrationFileEntity();
	  try {
		String resultCode = ResultCode.FAIL;
		String resultMessage = messages.getMessage("insert.fail");
		if(customerService.insertBoardNotice(boardNoticeEntity) > CommonCode.ZERO) {
		  resultCode = ResultCode.SUCCESS;
		  resultMessage = messages.getMessage("insert.success"); 
		  result.setResultURL("/admin/customer/boardNoticeList");
		  // 파일 업로드
		  if(req.getFileNames().hasNext()) {
			  administrationFileEntity.setFileTargetKey(boardNoticeEntity.getBoardNoticeKey());
			  administrationFileEntity.setFileTarget(CommonCode.FILE_TARGET_NOTICE);
			  administrationFileEntity.setThumbYn(CommonCode.FILE_THUMB_N);
			  this.saveFileForFormData(req, administrationFileEntity);
		  }
		}
		result.setResultCode(resultCode);
		result.setResultMSG(resultMessage); 
	  } catch (Exception e) {
		logger.error("CustomerRestController.insertBoardNotice:Failed" , e);
		result.setResultCode(ResultCode.FAIL);
		result.setResultMSG(messages.getMessage("insert.fail"));
	  }
	  return result;
	}
	/**
	 * 공지사항 수정
	 * @param boardNoticeEntity
	 * @return
	 */
	@RequestMapping(value = "/modifyBoardNotice",  method = RequestMethod.POST)
	public ResponseEntity modifyBoardNotice(BoardNoticeEntity boardNoticeEntity, MultipartHttpServletRequest req) {
      ResponseEntity result = new ResponseEntity();
      AdministrationFileEntity administrationFileEntity = new AdministrationFileEntity();
	  try {
		String resultCode = ResultCode.FAIL;
		String resultMessage = messages.getMessage("modify.fail");
		if(customerService.modifyBoardNotice(boardNoticeEntity) > CommonCode.ZERO) {
		  resultCode = ResultCode.SUCCESS;
		  resultMessage = messages.getMessage("modify.success"); 
		  result.setResultURL("/admin/customer/boardNoticeList");
		  // 파일 업로드
		  if(req.getFileNames().hasNext()) {
			  administrationFileEntity.setFileTargetKey(boardNoticeEntity.getBoardNoticeKey());
			  administrationFileEntity.setFileTarget(CommonCode.FILE_TARGET_NOTICE);
			  administrationFileEntity.setThumbYn(CommonCode.FILE_THUMB_N);
			  boardNoticeEntity.setFileTarget(CommonCode.FILE_TARGET_NOTICE);
			  boardNoticeEntity.setThumbYn(CommonCode.FILE_THUMB_N);
			  //기존 파일 삭제 
			  this.removeFile(boardNoticeEntity);
			  //파일 등록
			  this.saveFileForFormData(req, administrationFileEntity);
		  }
		}
		result.setResultCode(resultCode);
		result.setResultMSG(resultMessage); 
	  } catch (Exception e) {
		logger.error("CustomerRestController.modifyBoardNotice:Failed" , e);
		result.setResultCode(ResultCode.FAIL);
		result.setResultMSG(messages.getMessage("modify.fail"));
	  }
	  return result;
	}
	/**
	 * 공지사항 삭제
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/removeBoardNotice",  method = RequestMethod.POST)
	public ResponseEntity removeBoardNotice(@RequestParam int id) {
		ResponseEntity result = new ResponseEntity();
	  try {
	    BoardNoticeEntity boardNoticeEntity = new BoardNoticeEntity();
	    boardNoticeEntity.setBoardNoticeKey(id);
		String resultCode = ResultCode.FAIL;
		String resultMessage = messages.getMessage("remove.fail");
		
		if(customerService.removeBoardNotice(boardNoticeEntity) > CommonCode.ZERO) {	
		  resultCode = ResultCode.SUCCESS;
		  resultMessage = messages.getMessage("remove.success"); 
		  result.setResultURL("/admin/customer/boardNoticeList");
		}
		result.setResultCode(resultCode);
		result.setResultMSG(resultMessage); 
	  } catch (Exception e) {
		logger.error("CustomerRestController.removeBoardNotice:Failed" , e);
		result.setResultCode(ResultCode.FAIL);
		result.setResultMSG(messages.getMessage("remove.fail"));
	  }
	  return result;
	}
	/**
	 * 도움말 등록
	 * @param boardQnaEntity
	 * @return
	 */
	@RequestMapping(value = "/insertBoardQna",  method = RequestMethod.POST)
	public ResponseEntity insertBoardQna(BoardQnaEntity boardQnaEntity, MultipartHttpServletRequest req) {
      ResponseEntity result = new ResponseEntity();
      AdministrationFileEntity administrationFileEntity = new AdministrationFileEntity();
	  try {
		String resultCode = ResultCode.FAIL;
		String resultMessage = messages.getMessage("insert.fail");
		if(customerService.insertBoardQna(boardQnaEntity) > CommonCode.ZERO) {
		  resultCode = ResultCode.SUCCESS;
		  resultMessage = messages.getMessage("insert.success"); 
		  result.setResultURL("/admin/customer/boardQnaList");
		  // 파일 업로드
		  if(req.getFileNames().hasNext()) {
			  administrationFileEntity.setFileTargetKey(boardQnaEntity.getBoardQnaKey());
			  administrationFileEntity.setFileTarget(CommonCode.FILE_TARGET_QNA);
			  administrationFileEntity.setThumbYn(CommonCode.FILE_THUMB_N);
			  this.saveFileForFormData(req, administrationFileEntity);
		  }
		}
		result.setResultCode(resultCode);
		result.setResultMSG(resultMessage); 
	  } catch (Exception e) {
		logger.error("CustomerRestController.insertBoardQna:Failed" , e);
		result.setResultCode(ResultCode.FAIL);
		result.setResultMSG(messages.getMessage("insert.fail"));
	  }
	  return result;
	}
	/**
	 * 도움말 수정
	 * @param boardQnaEntity
	 * @return
	 */
	@RequestMapping(value = "/modifyBoardQna",  method = RequestMethod.POST)
	public ResponseEntity modifyBoardQna(BoardQnaEntity boardQnaEntity, MultipartHttpServletRequest req) {
      ResponseEntity result = new ResponseEntity();
      AdministrationFileEntity administrationFileEntity = new AdministrationFileEntity();
	  try {
		String resultCode = ResultCode.FAIL;
		String resultMessage = messages.getMessage("modify.fail");
		if(customerService.modifyBoardQna(boardQnaEntity) > CommonCode.ZERO) {
		  resultCode = ResultCode.SUCCESS;
		  resultMessage = messages.getMessage("modify.success"); 
		  result.setResultURL("/admin/customer/boardQnaList");
		  // 파일 업로드
		  if(req.getFileNames().hasNext()) {
			  administrationFileEntity.setFileTargetKey(boardQnaEntity.getBoardQnaKey());
			  administrationFileEntity.setFileTarget(CommonCode.FILE_TARGET_QNA);
			  administrationFileEntity.setThumbYn(CommonCode.FILE_THUMB_N);
			  boardQnaEntity.setFileTarget(CommonCode.FILE_TARGET_QNA);
			  boardQnaEntity.setThumbYn(CommonCode.FILE_THUMB_N);
			  //기존 파일 삭제 
			  this.removeFile(boardQnaEntity);
			  //파일 등록
			  this.saveFileForFormData(req, administrationFileEntity);
		  }
		}
		result.setResultCode(resultCode);
		result.setResultMSG(resultMessage); 
	  } catch (Exception e) {
		logger.error("CustomerRestController.modifyBoardQna:Failed" , e);
		result.setResultCode(ResultCode.FAIL);
		result.setResultMSG(messages.getMessage("modify.fail"));
	  }
	  return result;
	}
	/**
	 * 도움말 삭제
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/removeBoardQna",  method = RequestMethod.POST)
	public ResponseEntity removeBoardQna(@RequestParam int id) {
		ResponseEntity result = new ResponseEntity();
	  try {
		BoardQnaEntity boardQnaEntity = new BoardQnaEntity();
		boardQnaEntity.setBoardQnaKey(id);
		String resultCode = ResultCode.FAIL;
		String resultMessage = messages.getMessage("remove.fail");
		
		if(customerService.removeBoardQna(boardQnaEntity) > CommonCode.ZERO) {	
		  resultCode = ResultCode.SUCCESS;
		  resultMessage = messages.getMessage("remove.success"); 
		  result.setResultURL("/admin/customer/boardQnaList");
		}
		result.setResultCode(resultCode);
		result.setResultMSG(resultMessage); 
	  } catch (Exception e) {
		logger.error("CustomerRestController.removeBoardQna:Failed" , e);
		result.setResultCode(ResultCode.FAIL);
		result.setResultMSG(messages.getMessage("remove.fail"));
	  }
	  return result;
	}
	/**
	 * 도움말 상위 노출
	 * @param boardQnaEntity
	 * @return
	 */
	@RequestMapping(value = "/qnaTop10Open",  method = RequestMethod.POST, consumes = "application/json", produces = "application/json")
	public ResponseEntity qnaTop10Open(@RequestBody BoardQnaEntity boardQnaEntity) {
		ResponseEntity result = new ResponseEntity();
	  try {
		String resultCode = ResultCode.FAIL;
		String resultMessage = messages.getMessage("qnaTop10open.fail");
		if(customerService.qnaTop10Open(boardQnaEntity) > CommonCode.ZERO) {
		  resultCode = ResultCode.SUCCESS;
		  resultMessage = messages.getMessage("qnaTop10open.success"); 
		  result.setResultURL("/admin/customer/boardQnaList");
		}
		result.setResultCode(resultCode);
		result.setResultMSG(resultMessage); 
	  } catch (Exception e) {
		logger.error("CustomerRestController.qnaTop10Open:Failed" , e);
		result.setResultCode(ResultCode.FAIL);
		result.setResultMSG(messages.getMessage("qnaTop10open.fail"));
	  }
	  return result;
	}
	/**
	 * 도움말 상위 노출 해제
	 * @param boardQnaEntity
	 * @return
	 */
	@RequestMapping(value = "/qnaTop10Close",  method = RequestMethod.POST, consumes = "application/json", produces = "application/json")
	public ResponseEntity qnaTop10Close(@RequestBody BoardQnaEntity boardQnaEntity) {
		ResponseEntity result = new ResponseEntity();
	  try {
		String resultCode = ResultCode.FAIL;
		String resultMessage = messages.getMessage("qnaTop10close.fail");
		if(customerService.qnaTop10Close(boardQnaEntity) > CommonCode.ZERO) {
		  resultCode = ResultCode.SUCCESS;
		  resultMessage = messages.getMessage("qnaTop10close.success"); 
		  result.setResultURL("/admin/customer/boardQnaList");
		}
		result.setResultCode(resultCode);
		result.setResultMSG(resultMessage); 
	  } catch (Exception e) {
		logger.error("CustomerRestController.qnaTop10Close:Failed" , e);
		result.setResultCode(ResultCode.FAIL);
		result.setResultMSG(messages.getMessage("qnaTop10close.fail"));
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
			logger.error("DeviceRestController.saveFileForFormData" , e);
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
			logger.error("DeviceRestController.removeFile" , e);
		}
		
	}
}