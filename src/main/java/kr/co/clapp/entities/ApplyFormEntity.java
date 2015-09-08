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
	private String applyEmail;									    //연락받으실 이메일 주소
	private String applyInsertName;								//등록자
	private String applyPhoneNumber;								//전화번호
	private String applyFormSelect;									//테스트 신청 구분
	private String applyFormUrl;								     //테스트 URL
	private Date applyInsertDate;									//등록일
    private String applyTitle;                                      //제목
    private String userId;                                         //아이디
    private String applyType;                                       //상품타입
    private String applyContents;

	private List<ApplyFormEntity> testRequestList;
 	private int sortListSize;
    private int userMasterKey;
	private int totalCount;
	private int applyCount;
	private String fileName;
	private String fileTarget;
	private String fileSavedName; 
	private String filePath;

    public String getUserId() { return  userId;}
    public void setUserId(String userId) { this.userId = userId;}

    public String getApplyContents() { return  applyContents;}
    public void setApplyContents(String applyContents) { this.applyContents = applyContents;}
    public String getApplyType() { return  applyType;}
    public void setApplyType(String applyType) { this.applyType = applyType;}

    public int getUserMasterKey() {
        return userMasterKey;
    }
    public void setUserMasterKey(int userMasterKey) {
        this.userMasterKey = userMasterKey;
    }
	public int getApplyFormKey() {
		return applyFormKey;
	}
	public void setApplyFormKey(int applyFormKey) {
		this.applyFormKey = applyFormKey;
	}
    public List<ApplyFormEntity> getTestRequestList() {
        return testRequestList;
    }
    public void setTestRequestList(List<ApplyFormEntity> testRequestList) {
        this.testRequestList = testRequestList;
    }
    public String getApplyTitle() {
        return applyTitle;
    }
    public void setApplyTitle(String applyTitle) {
        this.applyTitle = applyTitle;
    }
    public String getApplyEmail() {
        return applyEmail;
    }
    public void setApplyEmail(String applyEmail) {
        this.applyEmail = applyEmail;
    }

    public String getApplyInsertName() {
        return applyInsertName;
    }
    public void setApplyInsertName(String applyInsertName) {
        this.applyInsertName = applyInsertName;
    }

    public String getApplyPhoneNumber() {
        return applyPhoneNumber;
    }
    public void setApplyPhoneNumber(String applyPhoneNumber) {
        this.applyPhoneNumber = applyPhoneNumber;
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
