package kr.co.clapp.controller.admin.board;

import kr.co.clapp.constants.CommonCode;
import kr.co.clapp.constants.ResultCode;
import kr.co.clapp.entities.AdministrationFileEntity;
import kr.co.clapp.entities.BoardEntity;
import kr.co.clapp.entities.ResponseEntity;
import kr.co.clapp.service.board.BoardService;
import kr.co.clapp.service.file.AdministrationFileService;
import kr.co.clapp.service.statistics.StatisticsService;
import kr.co.clapp.utils.SnsClientUtils;
import kr.co.digigroove.commons.entities.SavedFileEntity;
import kr.co.digigroove.commons.messages.Messages;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import twitter4j.Status;

import java.io.File;
import java.util.ArrayList;
import java.util.List;


@RestController
@RequestMapping("/admin/board/rest")
public class BoardRestController {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardRestController.class);
	
	@Autowired
	private Messages messages;
	
	@Autowired
	private BoardService boardService;
	
	@Autowired
	AdministrationFileService administrationFileService;

    @Autowired
    StatisticsService statisticsService;
	
	@Value("#{fileConfig['filePath']}")
	private String filePath;
	@Value("#{snsConfig['accessTocken']}")
	private String accessTocken;
	@Value("#{snsConfig['appId']}")
	private String appId;
	@Value("#{snsConfig['linkUrl']}")
	private String linkUrl;
	@Value("#{snsConfig['facebookLink']}")
	private String facebookLink;
	@Value("#{snsConfig['imgPath']}")
	private String imgPath;
	@Value("#{snsConfig['twitterLink']}")
	private String twitterLink;
	@Value("#{snsConfig['consumerKeyStr']}")
	private String consumerKeyStr;
	@Value("#{snsConfig['consumerSecretStr']}")
	private String consumerSecretStr;
	@Value("#{snsConfig['accessTokenStr']}")
	private String accessTokenStr;
	@Value("#{snsConfig['accessTokenSecretStr']}")
	private String accessTokenSecretStr;
	@Value("#{snsConfig['blogLink']}")
	private String blogLink; 
	@Value("#{snsConfig['blogApiKey']}")
	private String blogApiKey; 
	@Value("#{snsConfig['blogId']}")
	private String blogId;
	/**
	 * 트렌드 게시판 수정
	 * @param boardEntity
	 * @return
	 */
	@RequestMapping(value = "/modifyBoardTrand",  method = RequestMethod.POST)
	public ResponseEntity modifyBoardTrand(MultipartHttpServletRequest req, BoardEntity boardEntity) {
	  ResponseEntity result = new ResponseEntity();
	  AdministrationFileEntity administrationFileEntity = new AdministrationFileEntity();
	  try {
		String resultCode = ResultCode.FAIL;
		String resultMessage = messages.getMessage("modify.fail");
		//상품 수정 성공시
		if(boardService.modifyBoardTrand(boardEntity) > CommonCode.ZERO) {
		  resultCode = ResultCode.SUCCESS;
		  resultMessage = messages.getMessage("modify.success");
//		  // 파일 업로드
		  if(req.getFileNames().hasNext()) {
			  administrationFileEntity.setFileTargetKey(boardEntity.getBoardTrandKey());
			  administrationFileEntity.setFileTarget(CommonCode.FILE_TARGET_BOARD_TRAND);
			  administrationFileEntity.setThumbYn(CommonCode.FILE_THUMB_Y);
			  boardEntity.setFileTarget(CommonCode.FILE_TARGET_BOARD_TRAND);
			  boardEntity.setThumbYn(CommonCode.FILE_THUMB_Y);
			  //기존 파일 삭제 
			  this.removeFile(boardEntity);
			  //파일 등록
			  this.saveFileForFormData(req, administrationFileEntity);
		  }
		}
		result.setResultCode(resultCode);
		result.setResultMSG(resultMessage);
		result.setResultURL("/admin/board/boardTrandList");
	  } catch (Exception e) {
		logger.error("BoardRestController.modifyBoardTrand:Faild" , e);
		result.setResultCode(ResultCode.FAIL);
		result.setResultMSG(messages.getMessage("modify.fail"));
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
	 * 트렌드 게시판 등록
	 * @param boardEntity
	 * @return
	 */
	@RequestMapping(value = "/insertBoardTrand",  method = RequestMethod.POST)
	public ResponseEntity insertBoardTrand(BoardEntity boardEntity, MultipartHttpServletRequest req) {
      ResponseEntity result = new ResponseEntity();
	  AdministrationFileEntity administrationFileEntity = new AdministrationFileEntity();
	  try {
		String resultCode = ResultCode.FAIL;
		String resultMessage = messages.getMessage("insert.fail");
		if(boardService.insertBoardTrand(boardEntity) > CommonCode.ZERO) {
		  resultCode = ResultCode.SUCCESS;
		  resultMessage = messages.getMessage("insert.success"); 
		  result.setResultURL("/admin/board/boardTrandList");
		  // 파일 업로드
		  if(req.getFileNames().hasNext()) {
			  administrationFileEntity.setFileTargetKey(boardEntity.getBoardTrandKey());
			  administrationFileEntity.setFileTarget(CommonCode.FILE_TARGET_BOARD_TRAND);
			  administrationFileEntity.setThumbYn(CommonCode.FILE_THUMB_Y);
			  this.saveFileForFormData(req, administrationFileEntity);
		  }
		}
		result.setResultCode(resultCode);
		result.setResultMSG(resultMessage); 
	  } catch (Exception e) {
		logger.error("BoardRestController.insertBoardTrand:Faild" , e);
		result.setResultCode(ResultCode.FAIL);
		result.setResultMSG(messages.getMessage("insert.fail"));
	  }
	  return result;
	}
	/**
	 * 트렌드 게시판 삭제
	 * @param boardEntity
	 * @return
	 */
	@RequestMapping(value = "/removeBoardTrand",  method = RequestMethod.POST)
	public ResponseEntity removeBoardTrand(@RequestParam int id) {
		ResponseEntity result = new ResponseEntity();
	  try {
		BoardEntity boardEntity = new BoardEntity();
		boardEntity.setBoardTrandKey(id);
		String resultCode = ResultCode.FAIL;
		String resultMessage = messages.getMessage("remove.fail");
		
		if(boardService.removeBoardTrand(boardEntity) > CommonCode.ZERO) {	
		  resultCode = ResultCode.SUCCESS;
		  resultMessage = messages.getMessage("remove.success"); 
		  result.setResultURL("/admin/board/boardTrandList");
		}
		result.setResultCode(resultCode);
		result.setResultMSG(resultMessage); 
	  } catch (Exception e) {
		logger.error("BoardRestController.removeBoardTrand:Faild" , e);
		result.setResultCode(ResultCode.FAIL);
		result.setResultMSG(messages.getMessage("remove.fail"));
	  }
	  return result;
	}
	/**
	 * 소셜 블로그 게시판 수정
	 * @param req
	 * @param boardEntity
	 * @return
	 */
	@RequestMapping(value = "/modifyBoardSocialBlog",  method = RequestMethod.POST)
	public ResponseEntity modifyBoardSocialBlog(MultipartHttpServletRequest req, BoardEntity boardEntity) {
	  ResponseEntity result = new ResponseEntity();
	  AdministrationFileEntity administrationFileEntity = new AdministrationFileEntity();
	  try {
		String resultCode = ResultCode.FAIL;
		String resultMessage = messages.getMessage("modify.fail");
		//상품 수정 성공시
		if(boardService.modifyBoardSocialBlog(boardEntity) > CommonCode.ZERO) {
		  resultCode = ResultCode.SUCCESS;
		  resultMessage = messages.getMessage("modify.success");
		  // 파일 업로드
		  if(req.getFileNames().hasNext()) {
			  administrationFileEntity.setFileTargetKey(boardEntity.getBoardSocialBlogKey());
			  administrationFileEntity.setFileTarget(CommonCode.FILE_TARGET_BOARD_SOCIAL_BLOG);
			  administrationFileEntity.setThumbYn(CommonCode.FILE_THUMB_Y);
			  boardEntity.setFileTarget(CommonCode.FILE_TARGET_BOARD_SOCIAL_BLOG);
			  boardEntity.setThumbYn(CommonCode.FILE_THUMB_Y);
			  //기존 파일 삭제 
			  this.removeFile(boardEntity);
			  //파일 등록
			  this.saveFileForFormData(req, administrationFileEntity);
		  }
		}
		result.setResultCode(resultCode);
		result.setResultMSG(resultMessage);
		result.setResultURL("/admin/board/boardSocialBlogList");
	  } catch (Exception e) {
		logger.error("BoardRestController.modifyBoardSocialBlog:Faild" , e);
		result.setResultCode(ResultCode.FAIL);
		result.setResultMSG(messages.getMessage("modify.fail"));
	  }
	  return result;
	}
	/**
	 * 소셜 블로그 게시판 등록
	 * @param boardEntity
	 * @return
	 */
	@RequestMapping(value = "/insertBoardSocialBlog",  method = RequestMethod.POST)
	public ResponseEntity insertBoardSocialBlog(BoardEntity boardEntity, MultipartHttpServletRequest req) {
      ResponseEntity result = new ResponseEntity();
	  AdministrationFileEntity administrationFileEntity = new AdministrationFileEntity();
	  try {
		String resultCode = ResultCode.FAIL;
		String resultMessage = messages.getMessage("insert.fail");
		List<SavedFileEntity> file = null;
		File targetFile =  null; 
		String facebookId = "";
		Status state = null;
		if(boardService.insertBoardSocialBlog(boardEntity) > CommonCode.ZERO) {
		  resultCode = ResultCode.SUCCESS;
		  resultMessage = messages.getMessage("insert.success"); 
		  result.setResultURL("/admin/board/boardSocialBlogList");
		  // 파일 업로드
		  if(req.getFileNames().hasNext()) {
			  administrationFileEntity.setFileTargetKey(boardEntity.getBoardSocialBlogKey());
			  administrationFileEntity.setFileTarget(CommonCode.FILE_TARGET_BOARD_SOCIAL_BLOG);
			  administrationFileEntity.setThumbYn(CommonCode.FILE_THUMB_Y);
			  file =  this.saveFileForFormData(req, administrationFileEntity);
			  String path = filePath + administrationFileEntity.getFileTarget()+"/";
			  String uploadFileName = file.get(0).getSavedFileName() ;
			  String imgView = imgPath+"?fileType=boardSocialBlog&fileName=";
			  targetFile =  new File( path + uploadFileName) ;
			  boardEntity.setFileName(imgView + "thumb_"+uploadFileName); 
		  }
		  /**페이스북 글쓰기*/
		  if(boardEntity.getFacebookFlag().equals("Y")) {
			  boardEntity.setAppId(appId);
			  boardEntity.setLinkUrl(linkUrl);
			  SnsClientUtils blog = new SnsClientUtils();
			 facebookId = blog.doWriteFacebook(boardEntity).replace("\"",  "");
			 boardEntity.setFacebookId(facebookId);
			 //boardEntity.setFacebookLink(facebookLink+"#"+facebookId);
			 boardEntity.setFacebookLink(facebookLink);
		  } 
		  /**트위터글쓰기*/
            boardEntity.setConsumerKey(consumerKeyStr);
            if(boardEntity.getTwitterFlag().equals("Y")) {
			  boardEntity.setConsumerSecret(consumerSecretStr);
			  boardEntity.setAccessToken(accessTokenStr);
			  boardEntity.setAccessTokenSecret(accessTokenSecretStr);
			  SnsClientUtils blog = new SnsClientUtils();
			  state = blog.doWriteTwitter(boardEntity, targetFile);
			  boardEntity.setTwitterLink(twitterLink+state.getId());
		  }
		  /**네이버블로그 글쓰기*/
		  if(boardEntity.getBlogFlag().equals("Y")) {
			  boardEntity.setBlogApiKey(blogApiKey);
			  boardEntity.setBlogId(blogId);
			  SnsClientUtils blog = new SnsClientUtils();
			  String blogId = blog.doWriteBlog(boardEntity);
			  boardEntity.setBlogLink(blogLink + blogId);
		  }
		  boardService.modifyBoardSocialBlogFlag(boardEntity);
		}
		
		result.setResultCode(resultCode);
		result.setResultMSG(resultMessage); 
	  } catch (Exception e) {
		logger.error("BoardRestController.insertBoardSocialBlog:Faild" , e);
		result.setResultCode(ResultCode.FAIL);
		result.setResultMSG(messages.getMessage("insert.fail"));
	  }
	  return result;
	}
	 
	/**
	 * 소셜 블로그 게시판 삭제
	 * @param id
	 * @return
	 */ 
	@RequestMapping(value = "/removeBoardSocialBlog",  method = RequestMethod.POST)
	public ResponseEntity removeBoardSocialBlog(@RequestParam int id) {
		ResponseEntity result = new ResponseEntity();
	  try {
		BoardEntity boardEntity = new BoardEntity();
		boardEntity.setBoardSocialBlogKey(id);
		String resultCode = ResultCode.FAIL;
		String resultMessage = messages.getMessage("remove.fail");
		
		if(boardService.removeBoardSocialBlog(boardEntity) > CommonCode.ZERO) {	
		  resultCode = ResultCode.SUCCESS;
		  resultMessage = messages.getMessage("remove.success"); 
		  result.setResultURL("/admin/board/boardSocialBlogList");
		}
		result.setResultCode(resultCode);
		result.setResultMSG(resultMessage); 
	  } catch (Exception e) {
		logger.error("BoardRestController.removeBoardSocialBlog:Faild" , e);
		result.setResultCode(ResultCode.FAIL);
		result.setResultMSG(messages.getMessage("remove.fail"));
	  }
	  return result;
	}

    /**
     * 트렌드리뷰 게시글 최상단 노출
     * @param boardEntity
     * @return
     */
    @RequestMapping(value = "/boardTopOpen", method = RequestMethod.POST, consumes = "application/json", produces = "application/json")
    public ResponseEntity boardTopOpen(@RequestBody BoardEntity boardEntity) {
        ResponseEntity result = new ResponseEntity();
        try {
            String resultCode = ResultCode.FAIL;
            String resultMessage = messages.getMessage("boardTopOpen.fail");
            if(boardService.boardTopOpen(boardEntity) > CommonCode.ZERO) {
                resultCode = ResultCode.SUCCESS;
                resultMessage = messages.getMessage("boardTopOpen.success");
                result.setResultURL("/admin/device/boardTrandList");
            }
            result.setResultCode(resultCode);
            result.setResultMSG(resultMessage);
        } catch (Exception e) {
            logger.error("BoardeRestController.boardTopOpen:Failed" , e);
            result.setResultCode(ResultCode.FAIL);
            result.setResultMSG(messages.getMessage("boardTopOpen.fail"));
        }
        return result;
    }

    /**
     * 소셜 블로그 게시글 최상단 노출
     * @param boardEntity
     * @return
     */
    @RequestMapping(value = "/socialBlogTopOpen", method = RequestMethod.POST, consumes = "application/json", produces = "application/json")
    public ResponseEntity socialBlogTopOpen(@RequestBody BoardEntity boardEntity) {
        ResponseEntity result = new ResponseEntity();
        try {
            String resultCode = ResultCode.FAIL;
            String resultMessage = messages.getMessage("boardTopOpen.fail");
            if(boardService.socialBlogTopOpen(boardEntity) > CommonCode.ZERO) {
                resultCode = ResultCode.SUCCESS;
                resultMessage = messages.getMessage("boardTopOpen.success");
                result.setResultURL("/admin/device/boardTrandList");
            }
            result.setResultCode(resultCode);
            result.setResultMSG(resultMessage);
        } catch (Exception e) {
            logger.error("BoardeRestController.socialBlogTopOpen:Failed" , e);
            result.setResultCode(ResultCode.FAIL);
            result.setResultMSG(messages.getMessage("boardTopOpen.fail"));
        }
        return result;
    }
}
