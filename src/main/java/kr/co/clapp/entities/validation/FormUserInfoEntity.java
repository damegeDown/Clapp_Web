package kr.co.clapp.entities.validation;

import java.io.Serializable;

import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.format.annotation.NumberFormat;

import kr.co.clapp.constants.Regex;

public class FormUserInfoEntity implements Serializable, CommonFormValidEntity{

	private static final long serialVersionUID = 2379626653709164306L;
	/**USER_MASTER*/
	@NumberFormat
	private int userMasterKey;									// 회원 고유키
	
	@Email(message="valid.userId.pattern")
	@NotEmpty(message="vaild.notEmpty")
	private String userId;											// 회원 아이디
	
	@Pattern(regexp=Regex.UPDATE_PASSWORD, message="비밀번호는 영문, 숫자 또는 영/숫자 조합 6자리 이상 입니다." , groups={ModifyPass.class})
	@NotEmpty(message="비밀번호를 입력해 주세요.", groups={ModifyPass.class})
	private String userPassword;								// 회원 비밀번호 
	
	@Pattern(regexp=Regex.UPDATE_PASSWORD, message="입력하신 비밀번호가 일치하지 않습니다.\n확인 후 다시 한번 입력해 주세요." , groups={ModifyPass.class})
	@NotEmpty(message="비밀번호 확인이 되지 않았습니다. 비밀번호를 입력해 주세요.", groups={ModifyPass.class})
	private String userPasswordConf;						   // 회원 비밀번호 확인
	
	@NotEmpty(message="valid.userName.empty")
	private String userName;										// 회원 이름
	
	@Pattern(regexp=Regex.CELLPHONE)
	@NotEmpty(message="valid.cellNumber.empty")
	private String userCellPhoneNumber;						// 휴대폰 번호
	
	@NotEmpty(message="valid.notEmpty")
	private String userType;										// 가입 유형(일반:1 , 기업/단체:2)
	
	@NotEmpty(message="valid.notEmpty")
	private String userAreaType;								// 지역 타입(국내:1 , 해외:2)
	
	@NotEmpty(message="valid.area.empty")
	private String userArea;										// 지역(나라, 시/도)
	
	@NotEmpty(message="valid.area.first")
	@Size(min=1)
	private String userAreaDetail;								// 지역(도시, 구/군/시)
	
	@NotEmpty(message="valid.mail.not_checked")
	@Size(min=1)
	private String userMailReceptionYn;						// 메일 수신 여부(수신:Y, 수신거부:N)
	
	@NotEmpty(message="valid.notEmpty")
	private String userStaff;										//  담당자

	public int getUserMasterKey() {
		return userMasterKey;
	}

	public void setUserMasterKey(int userMasterKey) {
		this.userMasterKey = userMasterKey;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPassword() {
		return userPassword;
	}

	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}

	public String getUserPasswordConf() {
		return userPasswordConf;
	}

	public void setUserPasswordConf(String userPasswordConf) {
		this.userPasswordConf = userPasswordConf;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserCellPhoneNumber() {
		return userCellPhoneNumber;
	}

	public void setUserCellPhoneNumber(String userCellPhoneNumber) {
		this.userCellPhoneNumber = userCellPhoneNumber;
	}

	public String getUserType() {
		return userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}

	public String getUserAreaType() {
		return userAreaType;
	}

	public void setUserAreaType(String userAreaType) {
		this.userAreaType = userAreaType;
	}

	public String getUserArea() {
		return userArea;
	}

	public void setUserArea(String userArea) {
		this.userArea = userArea;
	}

	public String getUserAreaDetail() {
		return userAreaDetail;
	}

	public void setUserAreaDetail(String userAreaDetail) {
		this.userAreaDetail = userAreaDetail;
	}

	public String getUserMailReceptionYn() {
		return userMailReceptionYn;
	}

	public void setUserMailReceptionYn(String userMailReceptionYn) {
		this.userMailReceptionYn = userMailReceptionYn;
	}

	public String getUserStaff() {
		return userStaff;
	}

	public void setUserStaff(String userStaff) {
		this.userStaff = userStaff;
	}
	
	public interface ModifyPass {
    }
}

