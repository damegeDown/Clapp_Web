package kr.co.clapp.controller.user.introduction;

import kr.co.clapp.constants.CommonCode;
import kr.co.clapp.constants.ResultCode;
import kr.co.clapp.entities.AdministrationFileEntity;
import kr.co.clapp.entities.BoardEntity;
import kr.co.clapp.entities.ResponseEntity;
import kr.co.clapp.entities.ServiceInquiryEntity;
import kr.co.clapp.service.board.BoardService;
import kr.co.clapp.service.customer.CustomerService;
import kr.co.clapp.service.file.AdministrationFileService;
import kr.co.digigroove.commons.messages.Messages;
import org.apache.commons.fileupload.FileUploadException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
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
	 * 서비스별 문의 등록
	 * @param inquiryEntity
	 * @param req
	 * @return
	 */
	@RequestMapping(value = "/insertSupportInquire/{var}",  method = RequestMethod.POST)
	public ResponseEntity insertInquiry(@PathVariable String var, ServiceInquiryEntity inquiryEntity, MultipartHttpServletRequest req) {
		ResponseEntity result = new ResponseEntity();
		String resultMessage = messages.getMessage("insert.fail");
		String resultCode = ResultCode.FAIL;
		try {
			customerService.insertInquiry(inquiryEntity);
			if (req.getFileNames().hasNext()) {
				AdministrationFileEntity fileInfo = new AdministrationFileEntity();
				fileInfo.setFileTargetKey(inquiryEntity.getServiceInquiryKey());
				fileInfo.setFileTarget(CommonCode.FILE_TARGET_INQUIRY);
				fileInfo.setFileLimit(CommonCode.FileLimit.INQUIRE);
				fileInfo.setThumbYn(CommonCode.FILE_THUMB_N);
				administrationFileService.saveFileForFormData(req, fileInfo);
			}
			if ("myInquiry".equals(var)) result.setResultURL("/myClapp/myInquiryComplet");
			else result.setResultURL("/introduction/supportInquireComplete");
			resultMessage = messages.getMessage("insert.success");
			resultCode = ResultCode.SUCCESS;

		} catch (FileUploadException e) {
			resultMessage = messages.getMessage("file.size.over", new String[]{e.getMessage()});
			logger.error("IntroductionRestController.insertSupportInquire:fileSizeOver", e);
		} catch (Exception e) {
			logger.error("IntroductionRestController.insertSupportInquire:Failed", e);
		}
		result.setResultCode(resultCode);
		result.setResultMSG(resultMessage);
		return result;
	}
}