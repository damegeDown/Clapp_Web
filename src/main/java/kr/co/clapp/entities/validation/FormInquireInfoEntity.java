package kr.co.clapp.entities.validation;

import java.io.Serializable;

import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.format.annotation.NumberFormat;

import kr.co.clapp.constants.Regex;
import kr.co.clapp.entities.validation.FormUserInfoEntity.ModifyPass;

public class FormInquireInfoEntity implements Serializable, CommonFormValidEntity{

	private static final long serialVersionUID = 6005473627404974103L;

	@NotEmpty(message="* 문의 분류를 선택해 주세요.", groups={InquiryPass.class}) 
	private String inquiryCategory;											// 문의분류
	
	@NotEmpty(message="* 제목을 입력해 주세요.", groups={InquiryPass.class})
	private String inquiryTitle;											// 문의분류
	
	@Email(message="* 이메일 형식을 확인해 주세요." , groups={InquiryPass.class})
	@NotEmpty(message="* 답변받으실 이메일 주소를 입력하세요.", groups={InquiryPass.class})
	private String inquiryEmail;											// 회원 아이디
	
	@NotEmpty(message="* 이름 / 기업명을 입력하세요.", groups={InquiryPass.class})
	private String inquiryName;								// 이름/ 기업명
	
	@Pattern(regexp=Regex.CELLPHONE, message="* 휴대폰 형식을 확인해 주세요.", groups={InquiryPass.class})
	@NotEmpty(message="* 휴대폰 번호를 입력하세요.", groups={InquiryPass.class})
	private String inquiryPhoneNumber;						// 휴대폰 번호
	
	@NotEmpty(message="* 문의하실 내용을 입력하세요.", groups={InquiryPass.class})
	private String inquiryContents;									//문의	
	
	@NotEmpty(message="* 개인정보 수집 및 이용에 동의 해주세요.", groups={InquiryPass.class})
	private String agree_term;
	
	private String file;
	
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



	public String getInquiryContents() {
		return inquiryContents;
	}



	public void setInquiryContents(String inquiryContents) {
		this.inquiryContents = inquiryContents;
	}

	public String getInquiryTitle() {
		return inquiryTitle;
	}


	public void setInquiryTitle(String inquiryTitle) {
		this.inquiryTitle = inquiryTitle;
	}



	public String getFile() {
		return file;
	}



	public void setFile(String file) {
		this.file = file;
	}



	public String getAgree_term() {
		return agree_term;
	}



	public void setAgree_term(String agree_term) {
		this.agree_term = agree_term;
	}



	public interface InquiryPass {
    }
}

