package kr.co.clapp.entities;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

public class MemberEntity extends PageEntity implements Serializable{
	
	private static final long serialVersionUID =1L;
	
	public MemberEntity() {
		super(1L);
	}
	
	/**
	 * user_master
	 */
	private int userMasterKey;									// 회원 고유키
	private String userId;										// 회원 아이디
	private String userPassword;								// 회원 비밀번호
	private String userName;									// 회원 이름
	private String userCellPhoneNumber;							// 휴대폰 번호
	private String userType;									// 가입 유형(일반:1 , 기업/단체:2)
	private String userAreaType;								// 지역 타입(국내:1 , 해외:2)
	private String userArea;									// 지역(나라, 시/도)
	private String userAreaDetail;								// 지역(도시, 구/군/시)
	private String userMailReceptionYn;							// 메일 수신 여부(수신:Y, 수신거부:N)
	private Date userMailReceptionDate;							// 메일 수신 거부 일자
	private Date userJoinDate;									// 가입일
	private int userLoginCount;									// 로그인수
	private Date userLastLoginDate;								// 마지막 로그인 날짜
	private int count;
	private int userLoginState;
	private String keepIdYn;									// 아이디 기억 여부
	private String userStaff;								//담당자
	private List<MemberEntity> memberList;
	private List<MemberEntity> companyList;
	private String userKey;								//회원인증번호(jnlp 연동시 사용)
	private String applicationField;					// 인재 채용 지원 분야
	private String dropOutUserid;
	private String redundancyCheckId;
	/**
	 * v_user_master
	 */
	private int usedTicketAmount;						//보유 티켓수
	private Date ticketStartExpirationDate;			//상품 유효기간 시작일
	private Date ticketEndExpirationDate;			//상품 유효기간 종료일
	private String productName;							//상품명
	
	
	/**
	 * user_detail
	 */
	private String userAgeGroup;								// 연령대(10대:1, 20대:2,...50대:5)
	private String userJobType;									// 직종(텍스트로 입력) 
	private String userJobText;									// 직종(텍스트로 직접 입력) 
	
	/**
	 * user_detail_company
	 */
	private String userCompanyName;								// 기업명
	private	String userCompanyGroupType;						// 구분(기업:1, 단체:2)
	private	String userCompanyGroupTypeText;						// 구분(기업:1, 단체:2)
	private String userCompanyNumber;							//사업장등록번호(구분이 기업일때만 입력)
	private String userCompanyBusinessType;						//업종(텍스트로 입력)
	
	/**
	 * etc
	 */
	private String inquiryContents;
	private String answerContents;
	
	
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

	public Date getUserMailReceptionDate() {
		return userMailReceptionDate;
	}

	public void setUserMailReceptionDate(Date userMailReceptionDate) {
		this.userMailReceptionDate = userMailReceptionDate;
	}

	public Date getUserJoinDate() {
		return userJoinDate;
	}

	public void setUserJoinDate(Date userJoinDate) {
		this.userJoinDate = userJoinDate;
	}
	public int getUserLoginCount() {
		return userLoginCount;
	}

	public void setUserLoginCount(int userLoginCount) {
		this.userLoginCount = userLoginCount;
	}

	public Date getUserLastLoginDate() {
		return userLastLoginDate;
	}

	public void setUserLastLoginDate(Date userLastLoginDate) {
		this.userLastLoginDate = userLastLoginDate;
	}

	public List<MemberEntity> getMemberList() {
		return memberList;
	}

	public void setMemberList(List<MemberEntity> memberList) {
		this.memberList = memberList;
	}

	public String getUserAgeGroup() {
		return userAgeGroup;
	}

	public void setUserAgeGroup(String userAgeGroup) {
		this.userAgeGroup = userAgeGroup;
	}

	public String getUserJobType() {
		return userJobType;
	}

	public void setUserJobType(String userJobType) {
		this.userJobType = userJobType;
	}

	public String getUserJobText() {
		return userJobText;
	}

	public void setUserJobText(String userJobText) {
		this.userJobText = userJobText;
	}

	public String getUserCompanyName() {
		return userCompanyName;
	}

	public void setUserCompanyName(String userCompanyName) {
		this.userCompanyName = userCompanyName;
	}

	public String getUserCompanyGroupType() {
		return userCompanyGroupType;
	}

	public void setUserCompanyGroupType(String userCompanyGroupType) {
		this.userCompanyGroupType = userCompanyGroupType;
	}

	public String getUserCompanyGroupTypeText() {
		return userCompanyGroupTypeText;
	}

	public void setUserCompanyGroupTypeText(String userCompanyGroupTypeText) {
		this.userCompanyGroupTypeText = userCompanyGroupTypeText;
	}

	public String getUserCompanyNumber() {
		return userCompanyNumber;
	}

	public void setUserCompanyNumber(String userCompanyNumber) {
		this.userCompanyNumber = userCompanyNumber;
	}

	public String getUserCompanyBusinessType() {
		return userCompanyBusinessType;
	}

	public void setUserCompanyBusinessType(String userCompanyBusinessType) {
		this.userCompanyBusinessType = userCompanyBusinessType;
	}

	public List<MemberEntity> getCompanyList() {
		return companyList;
	}

	public void setCompanyList(List<MemberEntity> companyList) {
		this.companyList = companyList;
	}

	public String getUserKey() {
		return userKey;
	}

	public void setUserKey(String userKey) {
		this.userKey = userKey;
	}

	public String getApplicationField() {
		return applicationField;
	}

	public void setApplicationField(String applicationField) {
		this.applicationField = applicationField;
	}

	public String getDropOutUserid() {
		return dropOutUserid;
	}

	public void setDropOutUserid(String dropOutUserid) {
		this.dropOutUserid = dropOutUserid;
	}

	public String getRedundancyCheckId() {
		return redundancyCheckId;
	}

	public int getUsedTicketAmount() {
		return usedTicketAmount;
	}

	public void setUsedTicketAmount(int usedTicketAmount) {
		this.usedTicketAmount = usedTicketAmount;
	}

	public Date getTicketStartExpirationDate() {
		return ticketStartExpirationDate;
	}

	public void setTicketStartExpirationDate(Date ticketStartExpirationDate) {
		this.ticketStartExpirationDate = ticketStartExpirationDate;
	}

	public Date getTicketEndExpirationDate() {
		return ticketEndExpirationDate;
	}

	public void setTicketEndExpirationDate(Date ticketEndExpirationDate) {
		this.ticketEndExpirationDate = ticketEndExpirationDate;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public void setRedundancyCheckId(String redundancyCheckId) {
		this.redundancyCheckId = redundancyCheckId;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public int getUserLoginState() {
		return userLoginState;
	}

	public void setUserLoginState(int userLoginState) {
		this.userLoginState = userLoginState;
	}

	public String getKeepIdYn() {
		return keepIdYn;
	}

	public void setKeepIdYn(String keepIdYn) {
		this.keepIdYn = keepIdYn;
	}

	public String getUserStaff() {
		return userStaff;
	}

	public void setUserStaff(String userStaff) {
		this.userStaff = userStaff;
	}

	public String getInquiryContents() {
		return inquiryContents;
	}

	public void setInquiryContents(String inquiryContents) {
		this.inquiryContents = inquiryContents;
	}

	public String getAnswerContents() {
		return answerContents;
	}

	public void setAnswerContents(String answerContents) {
		this.answerContents = answerContents;
	}
	
	
}
