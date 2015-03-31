package kr.co.clapp.entities;

import org.apache.commons.lang.StringUtils;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

public class BoardEntity extends AdministrationFileEntity implements Serializable{

	private static final long serialVersionUID = 7945774138958571977L;

	private int boardTrandKey;					//
	private String trandCategory;				//트렌드 분류(업계동향 : 1, 리뷰/전망 : 2, 케이스 스터디 : 3)
	private String trandCategoryName;			//트렌드 분류 명
	private String trandTitle;					//트렌드 제목
	private String trandContents;				//트렌드 내용
	private String trandOrigin;					//출처
	private String trandOriginLink;				//출처 링크
	private String trandInsertName;				//작성자
	private Date trandInsertDate;				//작성일
	private Date trandRemoveDate;				//삭제일
	private int snsType;						//1:페이스북, 2:트위터, 3:블로그
	private List<BoardEntity> boardTrandList;
	private List<BoardEntity> trandList;
	private List<BoardEntity> reviewList;
	private List<BoardEntity> caseList;
	private List<BoardEntity> socialBlogList;
	private int sortListSize;				//10개씩/20개/50개/100개씩보기
	private String fileName;
    private String boardTrandKeyList;

	private int boardSocialBlogKey;
	private String socialLink;					//소셜 링크
	private String socialOrigin;			    //소셜 출처
	private String socialBlogTitle;				//소셜/블로그 제목
	private String socialBlogContent;			//소셜/블로그 내용
	private String socialBlogInsertName;		//등록자
	private Date socialBlogInsertDate;			//등록일
	private String socialBlogInsertYearDay;		//
	private String socialBlogInsertYear;		//
	private String socialBlogInsertTime;		//
	private String socialBlogInsertDay;
	private Date socialBlogRemoveDate;			//삭제일
	private int directBoardKey;
    private String boardSocialBlogKeyList;
	
	private List<BoardEntity> boardSocialBlogList;
	private List<BoardEntity> boardSocialBlogUserList;
	private int trandNextPage;					//다음글
	private int trandPrevPage;					//이전글
	private String accessTocken;					//토큰
	private String facebookId;
	private String facebookFlag = "N";		
	private String twitterFlag = "N";
	private String blogFlag = "N";
	private String facebookLink;		
	private String twitterLink;
	private String blogLink;
	
	private String appId;
	private String linkUrl;
	
	private String consumerKey;
	private String consumerSecret;
	private String accessToken;
	private String accessTokenSecret;
	
	private String blogApiKey;
	private String blogId;
	
	private String mvType;
	private int loCurrentPage;
	private String facebookImg;
	
	
	public int getTrandReviewListSize() {
		int pageListSize = super.PAGE_LIST_SIZE_PARAM_12;
		int currentPage = this.getLoCurrentPage();
		if(!StringUtils.isEmpty(this.getMvType())) {
			pageListSize = currentPage * pageListSize;
			super.setCurrentPage(1);
		}
		return pageListSize;
	}
	
	public int getBoardTrandKey() {
		return boardTrandKey;
	}

	public void setBoardTrandKey(int boardTrandKey) {
		this.boardTrandKey = boardTrandKey;
	}

	public String getTrandCategory() {
		return trandCategory;
	}

	public void setTrandCategory(String trandCategory) {
		this.trandCategory = trandCategory;
	}

	public String getTrandCategoryName() {
		return trandCategoryName;
	}

	public void setTrandCategoryName(String trandCategoryName) {
		this.trandCategoryName = trandCategoryName;
	}

	public String getTrandTitle() {
		return trandTitle;
	}

	public void setTrandTitle(String trandTitle) {
		this.trandTitle = trandTitle;
	}

	public String getTrandContents() {
		return trandContents;
	}

	public void setTrandContents(String trandContents) {
		this.trandContents = trandContents;
	}

	public String getTrandOrigin() {
		return trandOrigin;
	}

	public void setTrandOrigin(String trandOrigin) {
		this.trandOrigin = trandOrigin;
	}

	public String getTrandOriginLink() {
		return trandOriginLink;
	}

	public void setTrandOriginLink(String trandOriginLink) {
		this.trandOriginLink = trandOriginLink;
	}

	public String getTrandInsertName() {
		return trandInsertName;
	}

	public void setTrandInsertName(String trandInsertName) {
		this.trandInsertName = trandInsertName;
	}

	public Date getTrandInsertDate() {
		return trandInsertDate;
	}

	public void setTrandInsertDate(Date trandInsertDate) {
		this.trandInsertDate = trandInsertDate;
	}
	
	public Date getTrandRemoveDate() {
		return trandRemoveDate;
	}

	public void setTrandRemoveDate(Date trandRemoveDate) {
		this.trandRemoveDate = trandRemoveDate;
	}

	public List<BoardEntity> getBoardTrandList() {
		return boardTrandList;
	}

	public void setBoardTrandList(List<BoardEntity> boardTrandList) {
		this.boardTrandList = boardTrandList;
	}

	public List<BoardEntity> getTrandList() {
		return trandList;
	}

	public void setTrandList(List<BoardEntity> trandList) {
		this.trandList = trandList;
	}

	public List<BoardEntity> getReviewList() {
		return reviewList;
	}

	public void setReviewList(List<BoardEntity> reviewList) {
		this.reviewList = reviewList;
	}

	public List<BoardEntity> getCaseList() {
		return caseList;
	}

	public void setCaseList(List<BoardEntity> caseList) {
		this.caseList = caseList;
	}

	public List<BoardEntity> getSocialBlogList() {
		return socialBlogList;
	}

	public void setSocialBlogList(List<BoardEntity> socialBlogList) {
		this.socialBlogList = socialBlogList;
	}

	public int getSortListSize() {
		return sortListSize;
	}

	public void setSortListSize(int sortListSize) {
		this.sortListSize = sortListSize;
	}

	public int getBoardSocialBlogKey() {
		return boardSocialBlogKey;
	}

	public void setBoardSocialBlogKey(int boardSocialBlogKey) {
		this.boardSocialBlogKey = boardSocialBlogKey;
	}

	public String getSocialLink() {
		return socialLink;
	}

	public void setSocialLink(String socialLink) {
		this.socialLink = socialLink;
	}

    public String getSocialOrigin() {
        return socialOrigin;
    }

    public void setSocialOrigin(String socialOrigin) {
        this.socialOrigin = socialOrigin;
    }

    public String getSocialBlogTitle() {
		return socialBlogTitle;
	}

	public void setSocialBlogTitle(String socialBlogTitle) {
		this.socialBlogTitle = socialBlogTitle;
	}

	public String getSocialBlogContent() {
		return socialBlogContent;
	}

	public void setSocialBlogContent(String socialBlogContent) {
		this.socialBlogContent = socialBlogContent;
	}

	public String getSocialBlogInsertName() {
		return socialBlogInsertName;
	}

	public void setSocialBlogInsertName(String socialBlogInsertName) {
		this.socialBlogInsertName = socialBlogInsertName;
	}

	public Date getSocialBlogInsertDate() {
		return socialBlogInsertDate;
	}

	public void setSocialBlogInsertDate(Date socialBlogInsertDate) {
		this.socialBlogInsertDate = socialBlogInsertDate;
	}
	
	public String getSocialBlogInsertYearDay() {
		return socialBlogInsertYearDay;
	}

	public void setSocialBlogInsertYearDay(String socialBlogInsertYearDay) {
		this.socialBlogInsertYearDay = socialBlogInsertYearDay;
	}

	public String getSocialBlogInsertTime() {
		return socialBlogInsertTime;
	}

	public void setSocialBlogInsertTime(String socialBlogInsertTime) {
		this.socialBlogInsertTime = socialBlogInsertTime;
	}

	public String getSocialBlogInsertYear() {
		return socialBlogInsertYear;
	}

	public void setSocialBlogInsertYear(String socialBlogInsertYear) {
		this.socialBlogInsertYear = socialBlogInsertYear;
	}

	public String getSocialBlogInsertDay() {
		return socialBlogInsertDay;
	}

	public void setSocialBlogInsertDay(String socialBlogInsertDay) {
		this.socialBlogInsertDay = socialBlogInsertDay;
	}

	public Date getSocialBlogRemoveDate() {
		return socialBlogRemoveDate;
	}

	public void setSocialBlogRemoveDate(Date socialBlogRemoveDate) {
		this.socialBlogRemoveDate = socialBlogRemoveDate;
	}
	
	public int getDirectBoardKey() {
		return directBoardKey;
	}

	public void setDirectBoardKey(int directBoardKey) {
		this.directBoardKey = directBoardKey;
	}

    public String getBoardSocialBlogKeyList() {
        return boardSocialBlogKeyList;
    }

    public void setBoardSocialBlogKeyList(String boardSocialBlogKeyList) {
        this.boardSocialBlogKeyList = boardSocialBlogKeyList;
    }

    public List<BoardEntity> getBoardSocialBlogList() {
		return boardSocialBlogList;
	}

	public void setBoardSocialBlogList(List<BoardEntity> boardSocialBlogList) {
		this.boardSocialBlogList = boardSocialBlogList;
	}

	public List<BoardEntity> getBoardSocialBlogUserList() {
		return boardSocialBlogUserList;
	}

	public void setBoardSocialBlogUserList(List<BoardEntity> boardSocialBlogUserList) {
		this.boardSocialBlogUserList = boardSocialBlogUserList;
	}

	public int getTrandNextPage() {
		return trandNextPage;
	}

	public void setTrandNextPage(int trandNextPage) {
		this.trandNextPage = trandNextPage;
	}

	public int getTrandPrevPage() {
		return trandPrevPage;
	}

	public void setTrandPrevPage(int trandPrevPage) {
		this.trandPrevPage = trandPrevPage;
	}

	public String getMvType() {
		return mvType;
	}

	public void setMvType(String mvType) {
		this.mvType = mvType;
	}

	public int getLoCurrentPage() {
		return loCurrentPage;
	}

	public void setLoCurrentPage(int loCurrentPage) {
		this.loCurrentPage = loCurrentPage;
	}


	public String getAccessTocken() {
		return accessTocken;
	}

	public void setAccessTocken(String accessTocken) {
		this.accessTocken = accessTocken;
	}

	public int getSnsType() {
		return snsType;
	}

	public void setSnsType(int snsType) {
		this.snsType = snsType;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

    public String getBoardTrandKeyList() {
        return boardTrandKeyList;
    }

    public void setBoardTrandKeyList(String boardTrandKeyList) {
        this.boardTrandKeyList = boardTrandKeyList;
    }

    public String getFacebookId() {
		return facebookId;
	}

	public void setFacebookId(String facebookId) {
		this.facebookId = facebookId;
	}

	public String getFacebookFlag() {
		return facebookFlag;
	}

	public void setFacebookFlag(String facebookFlag) {
		this.facebookFlag = facebookFlag;
	}

	public String getTwitterFlag() {
		return twitterFlag;
	}

	public void setTwitterFlag(String twitterFlag) {
		this.twitterFlag = twitterFlag;
	}

	public String getBlogFlag() {
		return blogFlag;
	}

	public void setBlogFlag(String blogFlag) {
		this.blogFlag = blogFlag;
	}

	public String getFacebookLink() {
		return facebookLink;
	}

	public void setFacebookLink(String facebookLink) {
		this.facebookLink = facebookLink;
	}

	public String getTwitterLink() {
		return twitterLink;
	}

	public void setTwitterLink(String twitterLink) {
		this.twitterLink = twitterLink;
	}

	public String getBlogLink() {
		return blogLink;
	}

	public void setBlogLink(String blogLink) {
		this.blogLink = blogLink;
	}

	public String getBlogApiKey() {
		return blogApiKey;
	}

	public void setBlogApiKey(String blogApiKey) {
		this.blogApiKey = blogApiKey;
	}

	public String getAppId() {
		return appId;
	}

	public void setAppId(String appId) {
		this.appId = appId;
	}

	public String getLinkUrl() {
		return linkUrl;
	}

	public void setLinkUrl(String linkUrl) {
		this.linkUrl = linkUrl;
	}

	public String getConsumerKey() {
		return consumerKey;
	}

	public void setConsumerKey(String consumerKey) {
		this.consumerKey = consumerKey;
	}

	public String getConsumerSecret() {
		return consumerSecret;
	}

	public void setConsumerSecret(String consumerSecret) {
		this.consumerSecret = consumerSecret;
	}

	public String getAccessToken() {
		return accessToken;
	}

	public void setAccessToken(String accessToken) {
		this.accessToken = accessToken;
	}

	public String getAccessTokenSecret() {
		return accessTokenSecret;
	}

	public void setAccessTokenSecret(String accessTokenSecret) {
		this.accessTokenSecret = accessTokenSecret;
	}

	public String getBlogId() {
		return blogId;
	}

	public void setBlogId(String blogId) {
		this.blogId = blogId;
	}

	public String getFacebookImg() {
		return facebookImg;
	}

	public void setFacebookImg(String facebookImg) {
		this.facebookImg = facebookImg;
	}
	
}
