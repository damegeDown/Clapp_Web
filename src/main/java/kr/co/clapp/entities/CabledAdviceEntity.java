package kr.co.clapp.entities;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

public class CabledAdviceEntity extends PageEntity implements Serializable{

	private static final long serialVersionUID =1L;
	
	public CabledAdviceEntity() {
		super(1L);
	}
	private int cabledAdviceKey;							//
	private String adviceCategory;							//문의분류(1:기술, 2:사이트일반,3:결제,상품, 4:계약,제휴,광고, 5:채용, 6:클레임(웹서비스), 7 : 클레임(JNLP), 8:기타)
	private Date adviceAcceptDate;						//접수일시
	private String adviceInquiryName;						//문의자 이름
	private String adviceEmail;								//이메일 주소
	private String advicePhoneNumber;						//연락처
	private String adviceTitle;								//상담제목
	private String adviceContents;							//상담내용
	private Date adviceComleteDate;						//상담완료일
	private String adviceInsertName;						//상담자
	private Date adviceInsertDate;							//상담등록일
	private int cabledAdviceCount;
	
	private List<CabledAdviceEntity> cabledAdviceList;
	private int sortListSize;								//10개,20개,50개,100개씩 보기

	public int getCabledAdviceKey() {
		return cabledAdviceKey;
	}
	public void setCabledAdviceKey(int cabledAdviceKey) {
		this.cabledAdviceKey = cabledAdviceKey;
	}
	public String getAdviceCategory() {
		return adviceCategory;
	}
	public void setAdviceCategory(String adviceCategory) {
		this.adviceCategory = adviceCategory;
	}
	public Date getAdviceAcceptDate() {
		return adviceAcceptDate;
	}
	public void setAdviceAcceptDate(Date adviceAcceptDate) {
		this.adviceAcceptDate = adviceAcceptDate;
	}
	public String getAdviceInquiryName() {
		return adviceInquiryName;
	}
	public void setAdviceInquiryName(String adviceInquiryName) {
		this.adviceInquiryName = adviceInquiryName;
	}
	public String getAdviceEmail() {
		return adviceEmail;
	}
	public void setAdviceEmail(String adviceEmail) {
		this.adviceEmail = adviceEmail;
	}
	public String getAdvicePhoneNumber() {
		return advicePhoneNumber;
	}
	public void setAdvicePhoneNumber(String advicePhoneNumber) {
		this.advicePhoneNumber = advicePhoneNumber;
	}
	public String getAdviceTitle() {
		return adviceTitle;
	}
	public void setAdviceTitle(String adviceTitle) {
		this.adviceTitle = adviceTitle;
	}
	public String getAdviceContents() {
		return adviceContents;
	}
	public void setAdviceContents(String adviceContents) {
		this.adviceContents = adviceContents;
	}
	public Date getAdviceComleteDate() {
		return adviceComleteDate;
	}
	public void setAdviceComleteDate(Date adviceComleteDate) {
		this.adviceComleteDate = adviceComleteDate;
	}
	public String getAdviceInsertName() {
		return adviceInsertName;
	}
	public void setAdviceInsertName(String adviceInsertName) {
		this.adviceInsertName = adviceInsertName;
	}
	public Date getAdviceInsertDate() {
		return adviceInsertDate;
	}
	public void setAdviceInsertDate(Date adviceInsertDate) {
		this.adviceInsertDate = adviceInsertDate;
	}
	public int getCabledAdviceCount() {
		return cabledAdviceCount;
	}
	public void setCabledAdviceCount(int cabledAdviceCount) {
		this.cabledAdviceCount = cabledAdviceCount;
	}
	public List<CabledAdviceEntity> getCabledAdviceList() {
		return cabledAdviceList;
	}
	public void setCabledAdviceList(List<CabledAdviceEntity> cabledAdviceList) {
		this.cabledAdviceList = cabledAdviceList;
	}
	public int getSortListSize() {
		return sortListSize;
	}
	public void setSortListSize(int sortListSize) {
		this.sortListSize = sortListSize;
	}
	
	
}
