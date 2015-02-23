package kr.co.clapp.entities;

import java.io.Serializable;
import java.util.Date;
import java.util.List;


public class AdminEntity extends PageEntity implements Serializable{
	
	private static final long serialVersionUID = 1L;

	public AdminEntity() {
		super(serialVersionUID);
	}
	
	//관리자
	private int adminMasterKey;				// 관리자 고유키;
	private String adminId;					// 관리자 아이디;
	private String adminPassword;			// 관리자 비밀번호;
	private String adminName;				// 관리자 이름;
	private String adminCompanyName;		// 관리자 회사명;
	private String adminTeamName;			// 관리자 부서명;
	private Date adminInsertDate;			// 관리자 등록일자;
	private Date adminModifyDate;			// 관리자 수정일자;
	private Date adminRemoveDate;			// 관리자 삭제일자;
	private String adminGrant;			// 관리자 마스터 권한 여부;
	
	//관리자 권한
	private String permissionMaster = "N";		// 관리자 관리;
	private String permissionUser = "N";			// 회원 관리;
	private String permissionPayment = "N";		// 결제내역 관리;
	private String permissionProduct = "N";		// 상품 관리;
	private String permissionDevice = "N";	    // 디바이스 관리;
	private String permissionTrend = "N";			// 트렌드 관리;
	private String permissionEcrm = "N";			// eCRM 관리;
	private String permissionCustomer = "N";		// 고객 관리;
	
	//개인정보 접근 로고
	private int logsMasterKey;
	private String logsAccessAdminId; 
	private String logsAccessReason;
	private String logsAccessType;
	private Date logsAccessDate;
	
	//접근 아이피
	private int adminAccessIpKey;				// 키
	private String accessIpAddress;				// 아이피 주소
	private String insertAdminId;				// 입력 관리자
	private Date insertDate;						// 입력일
	
	private List<AdminEntity> adminList;	// 관리자 리스트;
	private int isAdmin = 0;
	
	public int getAdminMasterKey() {
		return adminMasterKey;
	}
	public void setAdminMasterKey(int adminMasterKey) {
		this.adminMasterKey = adminMasterKey;
	}
	public String getAdminId() {
		return adminId;
	}
	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}
	public String getAdminPassword() {
		return adminPassword;
	}
	public void setAdminPassword(String adminPassword) {
		this.adminPassword = adminPassword;
	}
	public String getAdminName() {
		return adminName;
	}
	public void setAdminName(String adminName) {
		this.adminName = adminName;
	}
	public String getAdminCompanyName() {
		return adminCompanyName;
	}
	public void setAdminCompanyName(String adminCompanyName) {
		this.adminCompanyName = adminCompanyName;
	}
	public String getAdminTeamName() {
		return adminTeamName;
	}
	public void setAdminTeamName(String adminTeamName) {
		this.adminTeamName = adminTeamName;
	}
	public Date getAdminInsertDate() {
		return adminInsertDate;
	}
	public void setAdminInsertDate(Date adminInsertDate) {
		this.adminInsertDate = adminInsertDate;
	}
	public Date getAdminModifyDate() {
		return adminModifyDate;
	}
	public void setAdminModifyDate(Date adminModifyDate) {
		this.adminModifyDate = adminModifyDate;
	}
	public Date getAdminRemoveDate() {
		return adminRemoveDate;
	}
	public void setAdminRemoveDate(Date adminRemoveDate) {
		this.adminRemoveDate = adminRemoveDate;
	}
	public String getAdminGrant() {
		return adminGrant;
	}
	public void setAdminGrant(String adminGrant) {
		this.adminGrant = adminGrant;
	}
	public List<AdminEntity> getAdminList() {
		return adminList;
	}
	public void setAdminList(List<AdminEntity> adminList) {
		this.adminList = adminList;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public String getPermissionMaster() {
		return permissionMaster;
	}
	public void setPermissionMaster(String permissionMaster) {
		this.permissionMaster = permissionMaster;
	}
	public String getPermissionUser() {
		return permissionUser;
	}
	public void setPermissionUser(String permissionUser) {
		this.permissionUser = permissionUser;
	}
	public String getPermissionPayment() {
		return permissionPayment;
	}
	public void setPermissionPayment(String permissionPayment) {
		this.permissionPayment = permissionPayment;
	}
	public String getPermissionProduct() {
		return permissionProduct;
	}
	public void setPermissionProduct(String permissionProduct) {
		this.permissionProduct = permissionProduct;
	}
	public String getPermissionDevice() {
		return permissionDevice;
	}
	public void setPermissionDevice(String permissionDevice) {
		this.permissionDevice = permissionDevice;
	}
	public String getPermissionTrend() {
		return permissionTrend;
	}
	public void setPermissionTrend(String permissionTrend) {
		this.permissionTrend = permissionTrend;
	}
	public String getPermissionEcrm() {
		return permissionEcrm;
	}
	public void setPermissionEcrm(String permissionEcrm) {
		this.permissionEcrm = permissionEcrm;
	}
	public String getPermissionCustomer() {
		return permissionCustomer;
	}
	public void setPermissionCustomer(String permissionCustomer) {
		this.permissionCustomer = permissionCustomer;
	}
	public String getLogsAccessAdminId() {
		return logsAccessAdminId;
	}
	public void setLogsAccessAdminId(String logsAccessAdminId) {
		this.logsAccessAdminId = logsAccessAdminId;
	}
	public String getLogsAccessReason() {
		return logsAccessReason;
	}
	public void setLogsAccessReason(String logsAccessReason) {
		this.logsAccessReason = logsAccessReason;
	}
	public String getLogsAccessType() {
		return logsAccessType;
	}
	public void setLogsAccessType(String logsAccessType) {
		this.logsAccessType = logsAccessType;
	}
	public Date getLogsAccessDate() {
		return logsAccessDate;
	}
	public void setLogsAccessDate(Date logsAccessDate) {
		this.logsAccessDate = logsAccessDate;
	}
	public int getAdminAccessIpKey() {
		return adminAccessIpKey;
	}
	public void setAdminAccessIpKey(int adminAccessIpKey) {
		this.adminAccessIpKey = adminAccessIpKey;
	}
	public String getAccessIpAddress() {
		return accessIpAddress;
	}
	public void setAccessIpAddress(String accessIpAddress) {
		this.accessIpAddress = accessIpAddress;
	}
	public String getInsertAdminId() {
		return insertAdminId;
	}
	public void setInsertAdminId(String insertAdminId) {
		this.insertAdminId = insertAdminId;
	}
	public Date getInsertDate() {
		return insertDate;
	}
	public void setInsertDate(Date insertDate) {
		this.insertDate = insertDate;
	}
	public int getLogsMasterKey() {
		return logsMasterKey;
	}
	public void setLogsMasterKey(int logsMasterKey) {
		this.logsMasterKey = logsMasterKey;
	}
	
	
}
