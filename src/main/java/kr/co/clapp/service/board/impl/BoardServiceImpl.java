package kr.co.clapp.service.board.impl;

import kr.co.clapp.constants.CommonCode;
import kr.co.clapp.dao.BoardDAO;
import kr.co.clapp.entities.BoardEntity;
import kr.co.clapp.entities.PageEntity;
import kr.co.clapp.service.board.BoardService;
import kr.co.digigroove.commons.messages.Messages;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional(readOnly=true)
public class BoardServiceImpl implements BoardService {
    @Autowired
    private BoardDAO boardDAO;

    @Autowired
    private Messages messages;
    /**
     * 트렌드 게시판 목록
     */
    public BoardEntity getBoardTrandList(BoardEntity boardEntity) throws Exception{
        boardEntity.setPageParams();
        if (boardEntity.getSortListSize() == 0) boardEntity.setSortListSize(PageEntity.PAGE_LIST_SIZE_PARAM);
        boardEntity.setPageSize(boardEntity.getSortListSize(), PageEntity.PAGE_GROUP_SIZE_PARAM);
        boardEntity.setDataSize(boardDAO.getBoardTrandCount(boardEntity));
        List<BoardEntity> boardTrandListResult = boardDAO.getBoardTrandList(boardEntity);
        boardEntity.setBoardTrandList(boardTrandListResult);

        return boardEntity;
    }
    /**
     * 트렌드 게시판 상세
     */
    @Override
    public BoardEntity getBoardTrandDetail(BoardEntity boardEntity){
        BoardEntity boardTrandInfo = boardDAO.getBoardTrandDetail(boardEntity);
        return boardTrandInfo;
    }
    /**
     * 트렌드 게시판 수정
     */
    @Override
    @Transactional(readOnly = false, rollbackFor = Exception.class)
    public int modifyBoardTrand(BoardEntity boardEntity) throws Exception{
        int result = CommonCode.ZERO;
        result = boardDAO.modifyBoardTrand(boardEntity);
        return result;
    }
    /**
     * 트렌드 게시판 등록
     */
    @Override
    @Transactional(readOnly = false, rollbackFor = Exception.class)
    public int insertBoardTrand(BoardEntity boardEntity) throws Exception{
        int result = 0;
        result = boardDAO.insertBoardTrand(boardEntity);
        return result;
    }
    /**
     * 트렌드 게시판 삭제
     */
    @Override
    @Transactional(readOnly = false, rollbackFor = Exception.class)
    public int removeBoardTrand(BoardEntity boardEntity) throws Exception{
        int result = 0;
        result = boardDAO.removeBoardTrand(boardEntity);
        return result;
    }
    /**
     * 소셜 블로그 게시판 목록
     */
    public BoardEntity getBoardSocialBlogList(BoardEntity boardEntity) throws Exception{
        boardEntity.setPageParams();
        if (boardEntity.getSortListSize() == 0) boardEntity.setSortListSize(PageEntity.PAGE_LIST_SIZE_PARAM);
        boardEntity.setPageSize(boardEntity.getSortListSize(), PageEntity.PAGE_GROUP_SIZE_PARAM);
        boardEntity.setDataSize(boardDAO.getBoardSocialBlogCount(boardEntity));
        List<BoardEntity> getBoardSocialBlogListResult = boardDAO.getBoardSocialBlogList(boardEntity);
        boardEntity.setBoardSocialBlogList(getBoardSocialBlogListResult);

        return boardEntity;
    }
    /**
     * 소셜 블로그 게시판 상세
     */
    @Override
    public BoardEntity getBoardSocialBlogDetail(BoardEntity boardEntity){
        BoardEntity boardSocialBlogInfo = boardDAO.getBoardSocialBlogDetail(boardEntity);
        return boardSocialBlogInfo;
    }
    /**
     * 소셜 블로그 게시판 수정
     */
    @Override
    @Transactional(readOnly = false, rollbackFor = Exception.class)
    public int modifyBoardSocialBlog(BoardEntity boardEntity) throws Exception{
        int result = CommonCode.ZERO;
        result = boardDAO.modifyBoardSocialBlog(boardEntity);
        return result;
    }
    /**
     * 소셜 블로그 게시판 등록
     */
    @Override
    @Transactional(readOnly = false, rollbackFor = Exception.class)
    public int insertBoardSocialBlog(BoardEntity boardEntity) throws Exception{
        int result = 0;
        result = boardDAO.insertBoardSocialBlog(boardEntity);
        return result;
    }
    /**
     * 소셜 블로그 게시판 삭제
     */
    @Override
    @Transactional(readOnly = false, rollbackFor = Exception.class)
    public int removeBoardSocialBlog(BoardEntity boardEntity) throws Exception{
        int result = 0;
        result = boardDAO.removeBoardSocialBlog(boardEntity);
        return result;
    }
    /**
     * 사용자 트렌드 리뷰 목록
     */
    @Override
    public BoardEntity getBoardTrandUserList(BoardEntity boardEntity) {
        boardEntity.setPageParams();
        int currentPage = (int)boardEntity.getCurrentPage();
        boardEntity.setLoCurrentPage(currentPage);
        boardEntity.setPageSize(boardEntity.getTrandReviewListSize(), PageEntity.PAGE_GROUP_SIZE_PARAM);
        boardEntity.setDataSize(boardDAO.getBoardTrandUserCount(boardEntity));
        List<BoardEntity> boardTrandListResult = boardDAO.getBoardTrandUserList(boardEntity);
        boardEntity.setBoardTrandList(boardTrandListResult);
        boardEntity.setCurrentPage(currentPage);
        return boardEntity;
    }
    /**
     * 사용자 소셜 블로그 목록
     */
    @Override
    public BoardEntity getBoardSocialBlogUserList(BoardEntity boardEntity) {
        boardEntity.setPageParams();
        int currentPage = (int)boardEntity.getCurrentPage();
        boardEntity.setLoCurrentPage(currentPage);
        boardEntity.setPageSize(boardEntity.getTrandReviewListSize(), boardEntity.PAGE_GROUP_SIZE_PARAM);
        boardEntity.setDataSize(boardDAO.getBoardSocialBlogUserCount(boardEntity));
        List<BoardEntity> getBoardSocialBlogListResult = boardDAO.getBoardSocialBlogUserList(boardEntity);
        boardEntity.setBoardSocialBlogList(getBoardSocialBlogListResult);
        boardEntity.setCurrentPage(currentPage);
        return boardEntity;
    }
    /**
     * 사용자 트렌드 리뷰 상세
     */
    @Override
    public BoardEntity getTrandReviewDetail(BoardEntity boardEntity) {
        return boardDAO.getTrandReviewDetail(boardEntity);
    }

    public BoardEntity getSocialBlogDetail(BoardEntity boardEntity){
        return boardDAO.getSocialBlogDetail(boardEntity);
    }
    /**
     * 사용자 트렌드 리뷰 메인 목록
     */
    @Override
    public BoardEntity getTrandList(BoardEntity boardParam) {
        boardParam.setPageParams();
        boardParam.setPageSize(4, PageEntity.PAGE_GROUP_SIZE_PARAM);

        boardParam.setTrandCategory("1");
        List<BoardEntity> trandListResult = boardDAO.getBoardTrandUserList(boardParam);
        boardParam.setTrandList(trandListResult);

        boardParam.setTrandCategory("2");
        List<BoardEntity> reviewListResult = boardDAO.getBoardTrandUserList(boardParam);
        boardParam.setReviewList(reviewListResult);

        boardParam.setTrandCategory("3");
        List<BoardEntity> caseListResult = boardDAO.getBoardTrandUserList(boardParam);
        boardParam.setCaseList(caseListResult);
        return boardParam;
    }
    /**
     * 사용자 소셜 블로그 메인 목록
     */
    @Override
    public BoardEntity getSocialBlogList(BoardEntity boardParam) {
        boardParam.setPageParams();
        boardParam.setPageSize(3, PageEntity.PAGE_GROUP_SIZE_PARAM);
        List<BoardEntity> socialBlogListResult = boardDAO.getBoardSocialBlogUserList(boardParam);
        boardParam.setSocialBlogList(socialBlogListResult);
        return boardParam;
    }
    @Override
    @Transactional(readOnly = false, rollbackFor = Exception.class)
    public int modifyBoardSocialBlogFlag(BoardEntity boardEntity) {
        return boardDAO.modifyBoardSocialBlogFlag(boardEntity);
    }

    /**
     * 트렌드리뷰 게시글 최상단 노출
     * @param boardEntity
     * @return
     */
    @Override
    @Transactional(readOnly = false, rollbackFor = Exception.class)
    public int boardTopOpen(BoardEntity boardEntity) {
        return boardDAO.modifyBoardTop(boardEntity);
    }

    /**
     * 소셜블로그 게시글 최상단 노출
     * @param boardEntity
     * @return
     */
    @Override
    @Transactional(readOnly = false, rollbackFor = Exception.class)
    public int socialBlogTopOpen(BoardEntity boardEntity) {
        return boardDAO.modifySocialBlogTop(boardEntity);
    }

}

