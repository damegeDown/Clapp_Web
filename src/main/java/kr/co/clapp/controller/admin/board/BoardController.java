package kr.co.clapp.controller.admin.board;

import java.util.HashMap;
import java.util.List;

import kr.co.clapp.constants.CommonCode;
import kr.co.clapp.entities.BoardEntity;
import kr.co.clapp.entities.CommonCodeEntity;
import kr.co.clapp.service.board.BoardService;
import kr.co.clapp.service.common.CommonService;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/admin/board")
public class BoardController {
  private static final Logger logger = LoggerFactory.getLogger( BoardController.class );
  
  
  @Autowired
  private CommonService commonService;
  
  @Autowired 
  private BoardService boardService;
  @Value("#{snsConfig['appId']}")
	private String appId;
  
  HashMap<String, Object> commonCode  = new HashMap<String, Object>();
  
  CommonCodeEntity commonCodeEntity = new CommonCodeEntity();
  
  public BoardController() {
  
  }
  /**
   * 트렌트 게시판 목록
   * @param boardEntity
   * @param model
   * @return
   */
  @RequestMapping("/boardTrandList")
  public String boardTrandList(BoardEntity boardEntity, Model model){
  	try{
  	  //공통코드 
  	  CommonCodeEntity commonCodeEntity = new CommonCodeEntity();
  	  //공통코드 트렌드 분류
  	  commonCodeEntity.setCodeMasterCode(CommonCode.TRAND_CATEGORY);
  	  //공통코드 트렌드 분류 코드
  	  List<CommonCodeEntity> TrandCategoryCode = commonService.getCommonCodeList(commonCodeEntity);
  	  //공통코드 10개,20개,50개,100개씩보기
  	  commonCodeEntity.setCodeMasterCode(CommonCode.SORT_LIST_SIZE);
  	  //공통코드 10개,20개,50개,100개씩보기 코드
  	  List<CommonCodeEntity> sortListSizeCode = commonService.getCommonCodeList(commonCodeEntity);
  	  boardEntity = boardService.getBoardTrandList(boardEntity);
	
  	  model.addAttribute("boardEntity", boardEntity);									
  	  model.addAttribute("TrandCategoryCode", TrandCategoryCode);									
  	  model.addAttribute("sortListSizeCode", sortListSizeCode);									
  	  //공통
  	  commonCode.put("navigation", "업계 동향 / 리뷰·전망 / 케이스 스터디 관리");// 현재 페이지 네비게이션
  	  commonCode.put("mainMenu", "permissionTrend");									// left main menu 
  	  commonCode.put("subMenu", "trandBoard");
  	  model.addAttribute("CommonCode", commonCode);
  	} catch (Exception e) {
  	  logger.error("BoardController.boardTrandList:Faild" , e);	
  	}
  	return "admin/board/boardTrandList";
  }
  /**
   * 트렌드 게시판 상세
   * @param popupEntity
   * @param model
   * @return
   */
  @RequestMapping("/boardTrandDetail")
  public String boardTrandDetail(BoardEntity boardEntity, Model model){
  	String navigation = "게시글 > 상세 보기";
	BoardEntity boardTrandInfo = null;
	try {
//	  //공통코드 
	  CommonCodeEntity commonCodeEntity = new CommonCodeEntity();
//	  //공통코드 트렌드 분류
	  commonCodeEntity.setCodeMasterCode(CommonCode.TRAND_CATEGORY);
	  boardTrandInfo = boardService.getBoardTrandDetail(boardEntity);
	  model.addAttribute("boardTrandDetail", boardTrandInfo);
	  //공통
	  commonCode.put("navigation", navigation);	// 현재 페이지 네비게이션
	  commonCode.put("mainMenu", "permissionTrend"); // left main menu 
	  model.addAttribute("CommonCode", commonCode);
	} catch (Exception e) {
	  logger.error("BoardController.boardTrandList:Faild" , e);
	}
	model.addAttribute("navigation", navigation);
	return "admin/board/boardTrandDetail";
  }
  /**
   * 트렌드 게시판 수정/등록
   * @param boardEntity
   * @param model
   * @return
   */
  @RequestMapping("/boardTrandForm")
  public String boardTrandForm(BoardEntity boardEntity, Model model){
  	String navigation = "신규 게시물 > 등록";
	String submitType = "등록";
	String submitAction = "admin/board/rest/insertBoardTrand";
	BoardEntity boardTrandInfo = null;
	try {
//	  //공통코드 
	  CommonCodeEntity commonCodeEntity = new CommonCodeEntity();
//	  //공통코드 트렌드 분류
	  commonCodeEntity.setCodeMasterCode(CommonCode.TRAND_CATEGORY);
//	  //공통코드 트렌드 분류 코드
	  List<CommonCodeEntity> TrandCategoryCode = commonService.getCommonCodeList(commonCodeEntity);
	  
	  if(boardEntity.getBoardTrandKey() > CommonCode.ZERO) {
		navigation = "신규 게시물 > 수정";
		submitType = "수정";
		submitAction = "admin/board/rest/modifyBoardTrand";
		boardEntity.setFileType(CommonCode.FILE_ORI_TYPE);
		boardTrandInfo = boardService.getBoardTrandDetail(boardEntity);
	  }
	  model.addAttribute("boardTrandDetail", boardTrandInfo);
	  model.addAttribute("TrandCategoryCode", TrandCategoryCode);									
	  //공통
	  commonCode.put("navigation", navigation);	// 현재 페이지 네비게이션
	  commonCode.put("submitType", submitType);
	  commonCode.put("submitAction", submitAction);
	  commonCode.put("mainMenu", "permissionTrend"); // left main menu 
	  model.addAttribute("CommonCode", commonCode);
	} catch (Exception e) {
	  logger.error("BoardController.boardTrandList:Faild" , e);
	}
	model.addAttribute("navigation", navigation);
	return "admin/board/boardTrandForm";
  }
  /**
   * 소셜 블로그 게시판 목록
   * @param boardEntity
   * @param model
   * @return
   */
  @RequestMapping("/boardSocialBlogList")
  public String boardSocialBlogList(BoardEntity boardEntity, Model model){
  	try{
  	  //공통코드 
  	  CommonCodeEntity commonCodeEntity = new CommonCodeEntity();
	  //공통코드 10개,20개,50개,100개씩보기
	  commonCodeEntity.setCodeMasterCode(CommonCode.SORT_LIST_SIZE);
	  //공통코드 10개,20개,50개,100개씩보기 코드
	  List<CommonCodeEntity> sortListSizeCode = commonService.getCommonCodeList(commonCodeEntity);
  		
  	  boardEntity = boardService.getBoardSocialBlogList(boardEntity);
  	  model.addAttribute("boardEntity", boardEntity);									
  	  model.addAttribute("sortListSizeCode", sortListSizeCode);									
  	  //공통
  	  commonCode.put("navigation", "언론기사 관리");// 현재 페이지 네비게이션
  	  commonCode.put("mainMenu", "permissionTrend");									// left main menu 
  	  commonCode.put("subMenu", "socialBlogBoard");
  	  model.addAttribute("CommonCode", commonCode);
  	} catch (Exception e) {
  	  logger.error("BoardController.boardSocialBlogList:Faild" , e);	
  	}
  	return "admin/board/boardSocialBlogList";
  }
  /**
   * 소셜 블로그 상세
   * @param boardEntity
   * @param model
   * @return
   */
  @RequestMapping("/boardSocialBlogDetail")
  public String boardSocialBlogDetail(BoardEntity boardEntity, Model model){
  	String navigation = "언론기사 보기 > 상세";
	BoardEntity boardSocialBlogInfo = null;
	try {
	  boardSocialBlogInfo = boardService.getBoardSocialBlogDetail(boardEntity);
	  model.addAttribute("boardSocialBlogDetail", boardSocialBlogInfo);
	  //공통
	  commonCode.put("navigation", navigation);	// 현재 페이지 네비게이션
	  commonCode.put("mainMenu", "permissionTrend"); // left main menu 
	  model.addAttribute("CommonCode", commonCode);
	} catch (Exception e) {
	  logger.error("BoardController.boardSocialBlogDetail:Faild" , e);
	}
	model.addAttribute("navigation", navigation);
	return "admin/board/boardSocialBlogDetail";
  }
  /**
   * 소셜 블로그 수정/등록
   * @param boardEntity
   * @param model
   * @return
   */
  @RequestMapping("/boardSocialBlogForm")
  public String boardSocialBlogForm(BoardEntity boardEntity, Model model){
  	String navigation = "언론기사 관리 > 신규 등록";
	String submitType = "등록";
	String submitAction = "admin/board/rest/insertBoardSocialBlog";
	BoardEntity boardSocialBlogInfo = null;
	try {
	  //공통코드 
	  if(boardEntity.getBoardSocialBlogKey() > CommonCode.ZERO) {
		navigation = "언론기사 관리 > 수정";
		submitType = "수정";
		submitAction = "admin/board/rest/modifyBoardSocialBlog";
		boardEntity.setFileType(CommonCode.FILE_ORI_TYPE);
		boardSocialBlogInfo = boardService.getBoardSocialBlogDetail(boardEntity);
	  }
	  model.addAttribute("boardSocialBlogDetail", boardSocialBlogInfo);
	  //공통
	  commonCode.put("navigation", navigation);	// 현재 페이지 네비게이션
	  commonCode.put("submitType", submitType);
	  commonCode.put("submitAction", submitAction);
	  commonCode.put("mainMenu", "permissionTrend"); // left main menu 
	  model.addAttribute("CommonCode", commonCode);
	} catch (Exception e) {
	  logger.error("BoardController.boardSocialBlogForm:Faild" , e);
	}
	model.addAttribute("navigation", navigation);
	model.addAttribute("appId", appId);
	return "admin/board/boardSocialBlogForm";
  }
}
