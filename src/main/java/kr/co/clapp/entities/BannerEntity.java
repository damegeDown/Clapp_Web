package kr.co.clapp.entities;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

public class BannerEntity extends PageEntity implements Serializable{

	private static final long serialVersionUID =1L;

	public BannerEntity() {
		super(1L);
	}

	private int bannerInquiryKey;			//배너 고유
	private int bannerViewSeq;				//배너 순번
	private String bannerTitle;				//배너 제목
	private Date bannerStartDate;			//배너 시작
	private Date bannerEndDate;				//배너 종료
	private String bannerStatus;			//배너 상태
	private String bannerLinkType;			//배너 연결 구분
	private String bannerLinkUrl;			//배너 연결 URL
	private String bannerInsertName;		//배너 등록
	private Date bannerInsertDate;			//배너 생성일
	private List<BannerEntity> bannerList;	//배너 리스트
	private String bannerCount;				//배너 진행 카운트
	private String fileName;
	private String fileSavedName;
	private String fileTarget = "banner";
	private String bgFileName;
	private String bgFileSavedName;
	private String bgFileTarget = "banner_bg";
	private String bannerKeyList;
    private String thumbYn;
    public String getThumbYn() {
        return thumbYn;
    }
    public void setThumbYn(String thumbYn) {
        this.thumbYn = thumbYn;
    }
	
	public String getBgFileName() {
		return bgFileName;
	}
	public void setBgFileName(String bgFileName) {
		this.bgFileName = bgFileName;
	}
	public String getBgFileSavedName() {
		return bgFileSavedName;
	}
	public void setBgFileSavedName(String bgFileSavedName) {
		this.bgFileSavedName = bgFileSavedName;
	}
	public String getBgFileTarget() {
		return bgFileTarget;
	}
	public void setBgFileTarget(String bgFileTarget) {
		this.bgFileTarget = bgFileTarget;
	}
	public int getBannerInquiryKey() {
		return bannerInquiryKey;
	}
	public void setBannerInquiryKey(int bannerInquiryKey) {
		this.bannerInquiryKey = bannerInquiryKey;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getFileSavedName() {
		return fileSavedName;
	}
	public void setFileSavedName(String fileSavedName) {
		this.fileSavedName = fileSavedName;
	}
	public String getBannerCount() {
		return bannerCount;
	}
	public void setBannerCount(String bannerCount) {
		this.bannerCount = bannerCount;
	}
	public String getBannerTitle() {
		return bannerTitle;
	}
	public void setBannerTitle(String bannerTitle) {
		this.bannerTitle = bannerTitle;
	}
	 
	public Date getBannerStartDate() {
		return bannerStartDate;
	}
	public void setBannerStartDate(Date bannerStartDate) {
		this.bannerStartDate = bannerStartDate;
	}
	public Date getBannerEndDate() {
		return bannerEndDate;
	}
	public void setBannerEndDate(Date bannerEndDate) {
		this.bannerEndDate = bannerEndDate;
	}
	public Date getBannerInsertDate() {
		return bannerInsertDate;
	}
	public void setBannerInsertDate(Date bannerInsertDate) {
		this.bannerInsertDate = bannerInsertDate;
	}
	public List<BannerEntity> getBannerList() {
		return bannerList;
	}
	public void setBannerList(List<BannerEntity> bannerList) {
		this.bannerList = bannerList;
	}
	public int getBannerViewSeq() {
		return bannerViewSeq;
	}
	public void setBannerViewSeq(int bannerViewSeq) {
		this.bannerViewSeq = bannerViewSeq;
	}
	public String getBannerStatus() {
		return bannerStatus;
	}
	public void setBannerStatus(String bannerStatus) {
		this.bannerStatus = bannerStatus;
	}
	public String getBannerLinkType() {
		return bannerLinkType;
	}
	public void setBannerLinkType(String bannerLinkType) {
		this.bannerLinkType = bannerLinkType;
	}
	public String getBannerLinkUrl() {
		return bannerLinkUrl;
	}
	public void setBannerLinkUrl(String bannerLinkUrl) {
		this.bannerLinkUrl = bannerLinkUrl;
	}
	public String getBannerInsertName() {
		return bannerInsertName;
	}
	public void setBannerInsertName(String bannerInsertName) {
		this.bannerInsertName = bannerInsertName;
	}
	public String getFileTarget() {
		return fileTarget;
	}
	public void setFileTarget(String fileTarget) {
		this.fileTarget = fileTarget;
	}
	public String getBannerKeyList() {
		return bannerKeyList;
	}
	public void setBannerKeyList(String bannerKeyList) {
		this.bannerKeyList = bannerKeyList;
	}
}
