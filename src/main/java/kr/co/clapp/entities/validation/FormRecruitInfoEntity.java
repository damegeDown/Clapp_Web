package kr.co.clapp.entities.validation;

import java.io.File;
import java.io.Serializable;

import javax.mail.Multipart;
import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.web.multipart.MultipartFile;

import kr.co.clapp.constants.Regex;

public class FormRecruitInfoEntity implements Serializable, CommonFormValidEntity{

	private static final long serialVersionUID = 6005473627404974103L;

	@NotEmpty(message="* 이름을 입력하세요.", groups={RecruitPass.class})
	private String name;											// 문의분류
	
	@Email(message="* 이메일 형식을 확인해 주세요." , groups={RecruitPass.class})
	@NotEmpty(message="* 이메일 주소를 입력하세요.", groups={RecruitPass.class})
	private String email;											// 문의분류
	
	
	@Pattern(regexp=Regex.CELLPHONE, message="연락처를 확인하세요.ex : 01X-XXXX-XXXX", groups={RecruitPass.class})
	@NotEmpty(message="* 연락처를 입력하세요.", groups={RecruitPass.class})
	private String tel;											// 회원 아이디
	
	@NotEmpty(message="* 지원분야를 선택해 주세요.", groups={RecruitPass.class})	
	private String depart;								// 이름/ 기업명
	
	//@NotEmpty(message="* 이력서를 첨부 해주세요.", groups={RecruitPass.class})
	private MultipartFile file;						// 파일 

	private String fileName;
	
	public String getName() {
		return name;
	}



	public void setName(String name) {
		this.name = name;
	}



	public String getEmail() {
		return email;
	}



	public void setEmail(String email) {
		this.email = email;
	}



	public String getTel() {
		return tel;
	}



	public void setTel(String tel) {
		this.tel = tel;
	}



	public String getDepart() {
		return depart;
	}



	public void setDepart(String depart) {
		this.depart = depart;
	}

	public String getFileName() {
		return fileName;
	}



	public void setFileName(String fileName) {
		this.fileName = fileName;
	}


	public MultipartFile getFile() {
		return file;
	}



	public void setFile(MultipartFile file) {
		this.file = file;
	}


	public interface RecruitPass {
    }
}

