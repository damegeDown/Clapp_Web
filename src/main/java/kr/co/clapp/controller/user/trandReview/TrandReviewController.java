package kr.co.clapp.controller.user.trandReview;

import java.util.HashMap;

import kr.co.clapp.entities.BoardEntity;
import kr.co.clapp.entities.CommonCodeEntity;
import kr.co.clapp.service.board.BoardService;
import kr.co.clapp.service.common.CommonService;
import kr.co.digigroove.commons.messages.Messages;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
@RequestMapping(value="/trandReview")
public class TrandReviewController {
	private static final Logger logger = LoggerFactory.getLogger(TrandReviewController.class);
	
	@Autowired
	private Messages messages;
	@Autowired
	private BoardService boardService;
	@Autowired
	private CommonService commonService;
	
	HashMap<String, Object> commonCode  = new HashMap<String, Object>();
	  
	CommonCodeEntity commonCodeEntity = new CommonCodeEntity();
	
	/**
	 * 트렌드 리뷰 (업계동향,리뷰전방,케이스스터디 목록)
	 */
	@RequestMapping(value="/{trandReview}", method=RequestMethod.GET)
	public String trandReview(@PathVariable String trandReview, Model model, BoardEntity boardEntity) {
		try {
			if("trandList".equals(trandReview)){
				boardEntity.setTrandCategory("1");
				boardEntity = boardService.getBoardTrandUserList(boardEntity);
			}else if("reviewList".equals(trandReview)){
				boardEntity.setTrandCategory("2");
				boardEntity = boardService.getBoardTrandUserList(boardEntity);
			}else if("caseList".equals(trandReview)){
				boardEntity.setTrandCategory("3");
				boardEntity = boardService.getBoardTrandUserList(boardEntity);
			}else if("socialList".equals(trandReview)){
				boardEntity = boardService.getBoardSocialBlogUserList(boardEntity);
			}else{
				boardEntity = boardService.getTrandList(boardEntity);
				boardEntity = boardService.getSocialBlogList(boardEntity);
			}
			model.addAttribute("boardEntity", boardEntity);
			model.addAttribute("subMenu", trandReview);
		
		} catch (Exception e) {
			logger.debug("TrandReviewController.trandReview:fail : "+e);
		}
		return "user/trandReview/"+trandReview;
	}
	/**
	 * 업계동향 상세
	 */
	@RequestMapping(value="/trandDetail")
	public String trandDetail(BoardEntity boardEntity, Model model){
		BoardEntity trandReviewInfo = null;
		trandReviewInfo = boardService.getTrandReviewDetail(boardEntity);
		model.addAttribute("trandReviewDetail", trandReviewInfo);
		return "user/trandReview/trandDetail";
	}
	/**
	 * 리뷰전망 상세
	 */
	@RequestMapping(value="/reviewDetail")
	public String reviewDetail(BoardEntity boardEntity, Model model){
		BoardEntity trandReviewInfo = null;
		trandReviewInfo = boardService.getTrandReviewDetail(boardEntity);
		model.addAttribute("trandReviewDetail", trandReviewInfo);
		return "user/trandReview/reviewDetail";
	}
	/**
	 * 케이스스터디 상세
	 */
	@RequestMapping(value="/caseDetail")
	public String caseDetail(BoardEntity boardEntity, Model model){
		BoardEntity trandReviewInfo = null;
		trandReviewInfo = boardService.getTrandReviewDetail(boardEntity);
		model.addAttribute("trandReviewDetail", trandReviewInfo);
		return "user/trandReview/caseDetail";
	}
}
