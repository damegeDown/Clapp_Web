package kr.co.clapp.dao;


import java.util.List;

import kr.co.clapp.entities.BoardEntity;

public interface BoardDAO {
	/**
	 * 트렌드 게시판 목록
	 * @param boardEntity
	 * @return
	 */
	List<BoardEntity> getBoardTrandList(BoardEntity boardEntity);
	/**
	 * 트렌드 게시판 카운트
	 * @param boardEntity
	 * @return
	 */
	int getBoardTrandCount(BoardEntity boardEntity);
	/**
	 * 트렌드 게시판 상세
	 * @param boardEntity
	 * @return
	 */
	BoardEntity getBoardTrandDetail(BoardEntity boardEntity);
	/**
	 * 트렌드 게시판 등록
	 * @param boardEntity
	 * @return
	 */
	int insertBoardTrand(BoardEntity boardEntity);
	/**
	 * 트렌드 게시판 수정
	 * @param boardEntity
	 * @return
	 */
	int modifyBoardTrand(BoardEntity boardEntity);
	/**
	 * 트렌드 게시판 삭제
	 * @param boardEntity
	 * @return
	 */
	int removeBoardTrand(BoardEntity boardEntity);
	/**
	 * 소셜 블로그 게시판 목록
	 * @param boardEntity
	 * @return
	 */
	List<BoardEntity> getBoardSocialBlogList(BoardEntity boardEntity);
	/**
	 * 소셜 블로그 게시판 카운트
	 * @param boardEntity
	 * @return
	 */
	int getBoardSocialBlogCount(BoardEntity boardEntity);
	/**
	 * 소셜 블로그 게시판 상세
	 * @param boardEntity
	 * @return
	 */
	BoardEntity getBoardSocialBlogDetail(BoardEntity boardEntity);
	/**
	 * 소셜 블로그 게시판 수정
	 * @param boardEntity
	 * @return
	 */
	int modifyBoardSocialBlog(BoardEntity boardEntity);
	/**
	 * 소셜 블로그 게시판 등록
	 * @param boardEntity
	 * @return
	 */
	int insertBoardSocialBlog(BoardEntity boardEntity);
	/**
	 * 소셜 블로그 게시판 삭제
	 * @param boardEntity
	 * @return
	 */
	int removeBoardSocialBlog(BoardEntity boardEntity);
	/**
	 * 사용자 트렌드 리뷰 목록
	 */
	List<BoardEntity> getBoardTrandUserList(BoardEntity boardEntity);
	/**
	 * 사용자 소셜 블로그 목록
	 */
	List<BoardEntity> getBoardSocialBlogUserList(BoardEntity boardEntity);
	/**
	 * 사용자 소셜 블로그 카운트
	 * @param boardEntity
	 * @return
	 */
	int getBoardSocialBlogUserCount(BoardEntity boardEntity);
	/**
	 * 사용자 트렌드 리뷰 상세
	 */
	BoardEntity getTrandReviewDetail(BoardEntity boardEntity);
	/**
	 * 사용자 트렌드 리뷰 카운트
	 */
	int getBoardTrandUserCount(BoardEntity boardEntity);
	/**
	 * 다음페이지
	 */
	Integer getTrandNextPage(BoardEntity boardEntity);
	/**
	 * 이전페이지
	 */
	Integer getTrandPrevPage(BoardEntity boardEntity);
	BoardEntity getSocialBlogDetail(BoardEntity boardEntity);
	int modifyBoardSocialBlogFlag(BoardEntity boardEntity);
}
