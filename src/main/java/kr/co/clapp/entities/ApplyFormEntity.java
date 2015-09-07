package kr.co.clapp.entities;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

public class ApplyFormEntity extends PageEntity implements Serializable{

	private static final long serialVersionUID =1L;
//
//             `apply_form_key` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'pk',
//            `apply_email` varchar(100) NOT NULL COMMENT '연락받으실 이메일 주소',
//            `apply_insert_name` varchar(100) NOT NULL COMMENT '의뢰구분',
//            `apply_phone_number` char(13) NOT NULL,
//             `apply_contents` text NOT NULL COMMENT '문의 내용',
//            `apply_url` varchar(100) NOT NULL COMMENT 'URL입력',
//            `apply_insert_date` datetime NOT NULL COMMENT '등록일',
//            `apply_title` varchar(100) NOT NULL COMMENT '제목',

	public ApplyFormEntity() {
		super(1L);
	}
	private int applyFormKey;
	private String inquiryEmail;									    //연락받으실 이메일 주소
	private String inquiryInsertName;								//등록자
	private String inquiryPhoneNumber;								//전화번호
	private String applyFormSelect;									//테스트 신청 구분
	private String applyFormUrl;								     //테스트 URL
	private Date applyInsertDate;									//등록일
   // private String applyTitle;

	private List<ApplyFormEntity> applyFormList;
 	private int sortListSize;

	private int totalCount;
	private int applyCount;
	private String fileName;
	private String fileTarget;
	private String fileSavedName; 
	private String filePath;
      
	public int getApplyFormKey() {
		return applyFormKey;
	}
	public void setApplyFormKey(int applyFormKey) {
		this.applyFormKey = applyFormKey;
	}

	public String getInquiryEmail() {
		return inquiryEmail;
	}
	public void setInquiryEmail(String inquiryEmail) {
		this.inquiryEmail = inquiryEmail;
	}
	public String getInquiryInsertName() {
		return inquiryInsertName;
	}
    public void setInquiryInsertName(String inquiryInsertName) {
        this.inquiryInsertName = inquiryInsertName;
    }
    public String getInquiryPhoneNumber() {
        return inquiryPhoneNumber;
    }
    public void setInquiryPhoneNumber(String inquiryPhoneNumber) {
        this.inquiryPhoneNumber = inquiryPhoneNumber;
    }

    public String getApplyFormSelect() {
        return applyFormSelect;
    }
    public void setApplyFormSelect(String applyFormSelect) {
        this.applyFormSelect = applyFormSelect;
    }
    public String getApplyFormUrl() {
        return applyFormUrl;
    }
    public void setApplyFormUrl(String applyFormUrl) {
        this.applyFormUrl = applyFormUrl;
    }
    public Date getApplyInsertDate() {
        return applyInsertDate;
    }
    public void setApplyInsertDate(Date applyInsertDate) {
        this.applyInsertDate = applyInsertDate;
    }
	public int getSortListSize() {
		return sortListSize;
	}
	public void setSortListSize(int sortListSize) {
		this.sortListSize = sortListSize;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	public int getApplyCount() {
		return applyCount;
	}
	public void setApplyCount(int applyCount) {
		this.applyCount = applyCount;
	}

	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getFileTarget() {
		return fileTarget;
	}
	public void setFileTarget(String fileTarget) {
		this.fileTarget = fileTarget;
	}
	public String getFileSavedName() {
		return fileSavedName;
	}
	public void setFileSavedName(String fileSavedName) {
		this.fileSavedName = fileSavedName;
	}
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	 
}
