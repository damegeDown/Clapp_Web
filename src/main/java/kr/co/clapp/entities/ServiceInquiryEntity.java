package kr.co.clapp.entities;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

public class ServiceInquiryEntity extends PageEntity implements Serializable{

	private static final long serialVersionUID =1L;
	
	public ServiceInquiryEntity() {
		super(1L);
	}
	private int serviceInquiryKey;									//
	private String inquiryCategory;									//문의 분류 선택 (1: 기술, 2:사이트일반, 3:계약제휴광고, 4:채용, 5:기타)
	private String inquiryEmail;									//연락받으실 이메일 주소
	private String inquiryName;										//이름
	private String inquiryPhoneNumber;								//전화번호
	private String inquiryTitle;									//문의 제목
	private String inquiryContents;									//문의 내용
	private String inquiryInsertName;								//등록자
	private Date inquiryInsertDate;									//등록일
	private String answerInsertYn;									//답변처리여부
	
	private List<ServiceInquiryEntity> serviceInquiryList;
	private int sortListSize;

	private String answerTitle;										//답변제목
	private String answerContents;									//답변내용
	private String answerInsertName;								//처리자 이름
	private Date answerInsertDate;								//답변일
	private List<ServiceInquiryEntity> serviceInquiryAnswerList;
	
	private int totalCount;
	private int inquiryCount;
	private int answerCount;
	private int notAnswerCount;
	private String fileName;
	private String fileTarget;
	private String fileSavedName; 
	private String filePath;
      
	public int getServiceInquiryKey() {
		return serviceInquiryKey;
	}
	public void setServiceInquiryKey(int serviceInquiryKey) {
		this.serviceInquiryKey = serviceInquiryKey;
	}
	public String getInquiryCategory() {
		return inquiryCategory;
	}
	public void setInquiryCategory(String inquiryCategory) {
		this.inquiryCategory = inquiryCategory;
	}
	public String getInquiryEmail() {
		return inquiryEmail;
	}
	public void setInquiryEmail(String inquiryEmail) {
		this.inquiryEmail = inquiryEmail;
	}
	public String getInquiryName() {
		return inquiryName;
	}
	public void setInquiryName(String inquiryName) {
		this.inquiryName = inquiryName;
	}
	public String getInquiryPhoneNumber() {
		return inquiryPhoneNumber;
	}
	public void setInquiryPhoneNumber(String inquiryPhoneNumber) {
		this.inquiryPhoneNumber = inquiryPhoneNumber;
	}
	public String getInquiryTitle() {
		return inquiryTitle;
	}
	public void setInquiryTitle(String inquiryTitle) {
		this.inquiryTitle = inquiryTitle;
	}
	public String getInquiryContents() {
		return inquiryContents;
	}
	public void setInquiryContents(String inquiryContents) {
		this.inquiryContents = inquiryContents;
	}
	public String getInquiryInsertName() {
		return inquiryInsertName;
	}
	public void setInquiryInsertName(String inquiryInsertName) {
		this.inquiryInsertName = inquiryInsertName;
	}
	public Date getInquiryInsertDate() {
		return inquiryInsertDate;
	}
	public void setInquiryInsertDate(Date inquiryInsertDate) {
		this.inquiryInsertDate = inquiryInsertDate;
	}
	public String getAnswerInsertYn() {
		return answerInsertYn;
	}
	public void setAnswerInsertYn(String answerInsertYn) {
		this.answerInsertYn = answerInsertYn;
	}
	public List<ServiceInquiryEntity> getServiceInquiryList() {
		return serviceInquiryList;
	}
	public void setServiceInquiryList(List<ServiceInquiryEntity> serviceInquiryList) {
		this.serviceInquiryList = serviceInquiryList;
	}
	public int getSortListSize() {
		return sortListSize;
	}
	public void setSortListSize(int sortListSize) {
		this.sortListSize = sortListSize;
	}
	public String getAnswerTitle() {
		return answerTitle;
	}
	public void setAnswerTitle(String answerTitle) {
		this.answerTitle = answerTitle;
	}
	public String getAnswerContents() {
		return answerContents;
	}
	public void setAnswerContents(String answerContents) {
		this.answerContents = answerContents;
	}
	public String getAnswerInsertName() {
		return answerInsertName;
	}
	public void setAnswerInsertName(String answerInsertName) {
		this.answerInsertName = answerInsertName;
	}
	public Date getAnswerInsertDate() {
		return answerInsertDate;
	}
	public void setAnswerInsertDate(Date answerInsertDate) {
		this.answerInsertDate = answerInsertDate;
	}
	public List<ServiceInquiryEntity> getServiceInquiryAnswerList() {
		return serviceInquiryAnswerList;
	}
	public void setServiceInquiryAnswerList(
			List<ServiceInquiryEntity> serviceInquiryAnswerList) {
		this.serviceInquiryAnswerList = serviceInquiryAnswerList;
	}
	
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	public int getInquiryCount() {
		return inquiryCount;
	}
	public void setInquiryCount(int inquiryCount) {
		this.inquiryCount = inquiryCount;
	}
	public int getAnswerCount() {
		return answerCount;
	}
	public void setAnswerCount(int answerCount) {
		this.answerCount = answerCount;
	}
	public int getNotAnswerCount() {
		return notAnswerCount;
	}
	public void setNotAnswerCount(int notAnswerCount) {
		this.notAnswerCount = notAnswerCount;
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
