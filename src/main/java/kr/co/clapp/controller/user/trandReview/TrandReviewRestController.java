package kr.co.clapp.controller.user.trandReview;

import kr.co.clapp.constants.ResultCode;
import kr.co.clapp.entities.BoardEntity;
import kr.co.clapp.entities.ResponseEntity;
import kr.co.clapp.service.board.BoardService;
import kr.co.digigroove.commons.messages.Messages;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;


@RestController
@RequestMapping("/trandReview/rest")
public class TrandReviewRestController {
	
	private static final Logger logger = LoggerFactory.getLogger(TrandReviewRestController.class);
	
	@Autowired
	private Messages messages;
	
	@Autowired
	private BoardService boardService;
	
	
	/**
	 * 트렌드 리뷰 더보기
	 * @param boardEntity
	 * @return
	 */
	@RequestMapping(value = "/{trandReview}", method = RequestMethod.GET)
	public ResponseEntity getTrandReview(@PathVariable String trandReview, BoardEntity boardEntity){
		ResponseEntity result = new ResponseEntity();
		try{
			String resultCode = ResultCode.FAIL;
			String resultMessage = messages.getMessage("nextPage.fail");
			
			if("trandList".equals(trandReview)){
				boardEntity.setTrandCategory("1");
				if(boardService.getBoardTrandUserList(boardEntity) != null ){
					resultCode = ResultCode.SUCCESS;
					resultMessage = messages.getMessage("nextPage.success"); 
				}
			}else if("reviewList".equals(trandReview)){
				boardEntity.setTrandCategory("2");
				if(boardService.getBoardTrandUserList(boardEntity) != null ){
					resultCode = ResultCode.SUCCESS;
					resultMessage = messages.getMessage("nextPage.success"); 
				}
			}else if("caseList".equals(trandReview)){
				boardEntity.setTrandCategory("3");
				if(boardService.getBoardTrandUserList(boardEntity) != null ){
					resultCode = ResultCode.SUCCESS;
					resultMessage = messages.getMessage("nextPage.success"); 
				}
			}else if("socialList".equals(trandReview)){
				if(boardService.getBoardSocialBlogUserList(boardEntity) != null ){
					resultCode = ResultCode.SUCCESS;
					resultMessage = messages.getMessage("nextPage.success"); 
				}
			}
			result.setResultDATA(boardEntity);
			result.setResultCode(resultCode);
			result.setResultMSG(resultMessage);
	} catch (Exception e) {
		logger.error("BoardRestController.insertBoardTrand:Faild" , e);
		result.setResultCode(ResultCode.FAIL);
		result.setResultMSG(messages.getMessage("nextPage.fail"));
	}
		return result;
	}
	
}