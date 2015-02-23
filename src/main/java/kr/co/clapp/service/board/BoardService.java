package kr.co.clapp.service.board;

import kr.co.clapp.entities.BoardEntity;

public interface BoardService {

	/**
	 * 트렌드 게시판 목록
	 * @param boardEntity
	 * @return
	 * @throws Exception
	 */
	BoardEntity getBoardTrandList(BoardEntity boardEntity) throws Exception;
	/**
	 * 트렌드 게시판 상세
	 * @param boardEntity
	 * @return
	 */
	BoardEntity getBoardTrandDetail(BoardEntity boardEntity) throws Exception;
	/**
	 * 트렌드 게시판 등록
	 * @param boardEntity
	 * @return
	 */
	int insertBoardTrand(BoardEntity boardEntity) throws Exception;
	/**
	 * 트렌드 게시판 수정
	 * @param boardEntity
	 * @return
	 * @throws Exception
	 */
	int modifyBoardTrand(BoardEntity boardEntity) throws Exception;
	/**
	 * 트렌드 게시판 삭제
	 * @param boardEntity
	 * @return
	 * @throws Exception
	 */
	int removeBoardTrand(BoardEntity boardEntity) throws Exception;
	/**
	 * 소셜 블로그 게시판 목록
	 * @param boardEntity
	 * @return
	 */
	BoardEntity getBoardSocialBlogList(BoardEntity boardEntity) throws Exception;
	/**
	 * 소셜 블로그 게시판 상세
	 * @param boardEntity
	 * @return
	 * @throws Exception
	 */
	BoardEntity getBoardSocialBlogDetail(BoardEntity boardEntity) throws Exception;
	/**
	 * 소셜 블로그 게시판 수정
	 * @param boardEntity
	 * @return
	 * @throws Exception
	 */
	int modifyBoardSocialBlog(BoardEntity boardEntity) throws Exception;
	/**
	 * 소셜 블로그 게시판 등록
	 * @param boardEntity
	 * @return
	 * @throws Exception
	 */
	int insertBoardSocialBlog(BoardEntity boardEntity) throws Exception;
	/**
	 * 소셜 블로그 게시판 삭제
	 * @param boardEntity
	 * @return
	 * @throws Exception
	 */
	int removeBoardSocialBlog(BoardEntity boardEntity) throws Exception;
	/**
	 * 사용자 트렌드 리뷰 목록
	 */
	BoardEntity getBoardTrandUserList(BoardEntity boardEntity);
	/**
	 * 사용자 소셜 블로그 목록
	 */
	BoardEntity getBoardSocialBlogUserList(BoardEntity boardEntity);
	/**
	 * 사용자 트렌드 리뷰 상세
	 */
	BoardEntity getTrandReviewDetail(BoardEntity boardEntity);
	/**
	 * 사용자 트렌드 리뷰 메인 목록
	 */
	BoardEntity getTrandList(BoardEntity boardEntity);
	/**
	 * 사용자 소셜 블로그 메인 목록
	 */
	BoardEntity getSocialBlogList(BoardEntity boardEntity);
	/**
	 * 사용자 소셜 블로그 상세
	 */
	BoardEntity getSocialBlogDetail(BoardEntity boardEntity);
	
	int modifyBoardSocialBlogFlag(BoardEntity boardEntity);
}

