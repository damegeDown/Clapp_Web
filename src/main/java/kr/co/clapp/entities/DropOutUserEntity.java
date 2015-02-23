package kr.co.clapp.entities;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

public class DropOutUserEntity extends PageEntity implements Serializable{

	private static final long serialVersionUID =1L;
	
	public DropOutUserEntity() {
		super(1L);
	}
	private String dropOutUserId;							// 탈퇴회원 아이디
	private Date dropOutDate;								// 탈퇴 날짜
	private String dropOutReason;							// 탈퇴 사유
	private String dropOutReasonCode;						// 탈퇴 사유 코드 
	private String dropOutPerson;							// 탈퇴 처리자
	private int userMasterKey;								// user고유키
	private int dropOutCount;								// user고유키
	private String userName;									//회원이름
	private List<DropOutUserEntity> dropOutUserList;		// 탈퇴 리스트

	public String getDropOutUserId() {
		return dropOutUserId;
	}

	public void setDropOutUserId(String dropOutUserId) {
		this.dropOutUserId = dropOutUserId;
	}

	public Date getDropOutDate() {
		return dropOutDate;
	}

	public void setDropOutDate(Date dropOutDate) {
		this.dropOutDate = dropOutDate;
	}

	public String getDropOutReason() {
		return dropOutReason;
	}

	public void setDropOutReason(String dropOutReason) {
		this.dropOutReason = dropOutReason;
	}

	public String getDropOutReasonCode() {
		return dropOutReasonCode;
	}

	public void setDropOutReasonCode(String dropOutReasonCode) {
		this.dropOutReasonCode = dropOutReasonCode;
	}

	public String getDropOutPerson() {
		return dropOutPerson;
	}

	public void setDropOutPerson(String dropOutPerson) {
		this.dropOutPerson = dropOutPerson;
	}

	public List<DropOutUserEntity> getDropOutUserList() {
		return dropOutUserList;
	}

	public void setDropOutUserList(List<DropOutUserEntity> dropOutUserList) {
		this.dropOutUserList = dropOutUserList;
	}

	public int getUserMasterKey() {
		return userMasterKey;
	}

	public void setUserMasterKey(int userMasterKey) {
		this.userMasterKey = userMasterKey;
	}

	public int getDropOutCount() {
		return dropOutCount;
	}

	public void setDropOutCount(int dropOutCount) {
		this.dropOutCount = dropOutCount;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}
	
}
