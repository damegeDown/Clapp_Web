package kr.co.clapp.entities;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

public class TicketEntity extends PageEntity implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = -5666562392915504046L;

	public TicketEntity() {
		super(-5666562392915504046L);
	}
	
	private int userTicketUserdHistoryKey;				
	private int userTicketMasterKey;
	private int targetKey;
	private String historyStartReserveTime;					//예약 시작시간
	private String historyEndReserveTime;					//예약 종료시간
	private String historyStartUsedTime;					//사용 시작시간
	private String historyEndUsedTime;						//사용 종료시간
	private int historyUsedTicketAmount;					//사용 티켓수
	private String historyUsedTicketAmountText;					//사용 티켓수
	private String historyUsedState;						//현재 상태(1:예약 대기, 2:사용종료)
	private int deviceKey;
	private String userId;									//회원 ID
	private String userType;								//회원 구분(1:일반, 2:기업/단체)
	private String userName;								//회원 이름
	private String userCompanyName;							//회원 기업/단체명
	private int userMasterKey;
	private String deviceModelEname;						//디바이스 영문명
	private String deviceMakerCode;							//디바이스 제조사
	private int ticketCount;								//티켓 카운트
	private int ticketSum;									//티켓 합계
	private int userTypeCount;									//유저 타입 카운트
	private Date insert_date;
	
	private List<?> userIdArr;
	private List<TicketEntity> userTicketUsedList;
	private int sortListSize;
	
	private int ticketProductServiceKey;					//
	private String serviceProductName;						// 상품 이름
	private String serviceTargetType;						//대상 회원 타입
	private String serviceTargetName;						//이름,기업/단체명
	private Date serviceApplyDate;							//적용일시
	private int serviceApplyTicketAmount;					//계정당 적용 티켓수
	private int serviceApplyTicketTotalAmount;				//적용 티켓수
	private String serviceApplyReason;						//적용 사유
	private String serviceApplyReasonDetail;						//적용 사유 상세 (기타일시)
	private String serviceApplyOperatorName;				//적용 담당자 이름
	private Date serviceInsertDate;							//입력 일자
	private List<TicketEntity> ticketProductServiceList; 
	private List<TicketEntity> ticketHistoryList; 

	private int productMasterKey;							//상품키
	private String paymentTid;								//유료 결제 결재번호
	private String productName;								//상품명
	private int ticketAmount;								//티켓수
	private int ticketAvilableAmount;						//사용가능 티켓수
	private	Date ticketStartExpirationDate;					//유효기간 시작일
	private	Date ticketEndExpirationDate;				//유효기간 종료일
	private Date ticketApplyDate;						//적용일
	private int expirationDate;				//유효기간(일로 표시 )
	private List<TicketEntity> historyList;
	private int historyCount;		
	/*reservation*/
	private int id;								//키 
	private int deviceId;					//디바이스키 
	private String reservationNo;		//예약번호 
	private Date reserveTime;			//예약일시
	private int duration;					//예약구분
	private Date startDttm;				//예약시작년월일
	private Date endDttm;					//예약종료년월일 
	private int canceled;					//예약취소
	private Date regDttm;					//등록일시 
	private Date updtDttm;				//수정일시 
	private int usePoint;					//차감포인트
	private int status;						//상태 
	private String statusText;						//상태 
	/*devices*/
	private String manufacturer;		//제조사 
	private String prodName;		 		//모델명
	private String os;						//OS
	private String resolution;				//화면 사이즈
	private String osVersion;				//os 버전
	
	private int reservationWaitCount;	//예약대기 카운트 
	private int reservationFinishCount; //사용종료 카운트
	
	public int getUserTicketUserdHistoryKey() {
		return userTicketUserdHistoryKey;
	}
	public void setUserTicketUserdHistoryKey(int userTicketUserdHistoryKey) {
		this.userTicketUserdHistoryKey = userTicketUserdHistoryKey;
	}
	public int getUserTicketMasterKey() {
		return userTicketMasterKey;
	}
	public void setUserTicketMasterKey(int userTicketMasterKey) {
		this.userTicketMasterKey = userTicketMasterKey;
	}
	
	public int getTargetKey() {
		return targetKey;
	}
	public void setTargetKey(int targetKey) {
		this.targetKey = targetKey;
	}
	public String getHistoryStartReserveTime() {
		return historyStartReserveTime;
	}
	public void setHistoryStartReserveTime(String historyStartReserveTime) {
		this.historyStartReserveTime = historyStartReserveTime;
	}
	public String getHistoryEndReserveTime() {
		return historyEndReserveTime;
	}
	public void setHistoryEndReserveTime(String historyEndReserveTime) {
		this.historyEndReserveTime = historyEndReserveTime;
	}
	public String getHistoryStartUsedTime() {
		return historyStartUsedTime;
	}
	public void setHistoryStartUsedTime(String historyStartUsedTime) {
		this.historyStartUsedTime = historyStartUsedTime;
	}
	public String getHistoryEndUsedTime() {
		return historyEndUsedTime;
	}
	public void setHistoryEndUsedTime(String historyEndUsedTime) {
		this.historyEndUsedTime = historyEndUsedTime;
	}
	public int getHistoryUsedTicketAmount() {
		return historyUsedTicketAmount;
	}
	public void setHistoryUsedTicketAmount(int historyUsedTicketAmount) {
		this.historyUsedTicketAmount = historyUsedTicketAmount;
	}
	public String getHistoryUsedTicketAmountText() {
		return historyUsedTicketAmountText;
	}
	public void setHistoryUsedTicketAmountText(String historyUsedTicketAmountText) {
		this.historyUsedTicketAmountText = historyUsedTicketAmountText;
	}
	public String getHistoryUsedState() {
		return historyUsedState;
	}
	public void setHistoryUsedState(String historyUsedState) {
		this.historyUsedState = historyUsedState;
	}
	public int getDeviceKey() {
		return deviceKey;
	}
	public void setDeviceKey(int deviceKey) {
		this.deviceKey = deviceKey;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserType() {
		return userType;
	}
	public void setUserType(String userType) {
		this.userType = userType;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserCompanyName() {
		return userCompanyName;
	}
	public void setUserCompanyName(String userCompanyName) {
		this.userCompanyName = userCompanyName;
	}
	public int getUserMasterKey() {
		return userMasterKey;
	}
	public void setUserMasterKey(int userMasterKey) {
		this.userMasterKey = userMasterKey;
	}
	public String getDeviceModelEname() {
		return deviceModelEname;
	}
	public void setDeviceModelEname(String deviceModelEname) {
		this.deviceModelEname = deviceModelEname;
	}
	public String getDeviceMakerCode() {
		return deviceMakerCode;
	}
	public void setDeviceMakerCode(String deviceMakerCode) {
		this.deviceMakerCode = deviceMakerCode;
	}
	public int getTicketCount() {
		return ticketCount;
	}
	public void setTicketCount(int ticketCount) {
		this.ticketCount = ticketCount;
	}
	
	public int getTicketSum() {
		return ticketSum;
	}
	public void setTicketSum(int ticketSum) {
		this.ticketSum = ticketSum;
	}
	
	public int getUserTypeCount() {
		return userTypeCount;
	}
	public void setUserTypeCount(int userTypeCount) {
		this.userTypeCount = userTypeCount;
	}
	
	public Date getInsert_date() {
		return insert_date;
	}
	public void setInsert_date(Date insert_date) {
		this.insert_date = insert_date;
	}
	public List<?> getUserIdArr() {
		return userIdArr;
	}
	public void setUserIdArr(List<?> userIdArr) {
		this.userIdArr = userIdArr;
	}
	public List<TicketEntity> getUserTicketUsedList() {
		return userTicketUsedList;
	}
	public void setUserTicketUsedList(List<TicketEntity> userTicketUsedList) {
		this.userTicketUsedList = userTicketUsedList;
	}
	public int getSortListSize() {
		return sortListSize;
	}
	public void setSortListSize(int sortListSize) {
		this.sortListSize = sortListSize;
	}
	public int getTicketProductServiceKey() {
		return ticketProductServiceKey;
	}
	public void setTicketProductServiceKey(int ticketProductServiceKey) {
		this.ticketProductServiceKey = ticketProductServiceKey;
	}
	public String getServiceProductName() {
		return serviceProductName;
	}
	public void setServiceProductName(String serviceProductName) {
		this.serviceProductName = serviceProductName;
	}
	public String getServiceTargetType() {
		return serviceTargetType;
	}
	public void setServiceTargetType(String serviceTargetType) {
		this.serviceTargetType = serviceTargetType;
	}
	public String getServiceTargetName() {
		return serviceTargetName;
	}
	public void setServiceTargetName(String serviceTargetName) {
		this.serviceTargetName = serviceTargetName;
	}
	public Date getServiceApplyDate() {
		return serviceApplyDate;
	}
	public void setServiceApplyDate(Date serviceApplyDate) {
		this.serviceApplyDate = serviceApplyDate;
	}
	
	public int getServiceApplyTicketAmount() {
		return serviceApplyTicketAmount;
	}
	public void setServiceApplyTicketAmount(int serviceApplyTicketAmount) {
		this.serviceApplyTicketAmount = serviceApplyTicketAmount;
	}
	public int getServiceApplyTicketTotalAmount() {
		return serviceApplyTicketTotalAmount;
	}
	public void setServiceApplyTicketTotalAmount(int serviceApplyTicketTotalAmount) {
		this.serviceApplyTicketTotalAmount = serviceApplyTicketTotalAmount;
	}
	public String getServiceApplyReason() {
		return serviceApplyReason;
	}
	public void setServiceApplyReason(String serviceApplyReason) {
		this.serviceApplyReason = serviceApplyReason;
	}
	public String getServiceApplyOperatorName() {
		return serviceApplyOperatorName;
	}
	public void setServiceApplyOperatorName(String serviceApplyOperatorName) {
		this.serviceApplyOperatorName = serviceApplyOperatorName;
	}
	public Date getServiceInsertDate() {
		return serviceInsertDate;
	}
	public void setServiceInsertDate(Date serviceInsertDate) {
		this.serviceInsertDate = serviceInsertDate;
	}
	
	public List<TicketEntity> getTicketProductServiceList() {
		return ticketProductServiceList;
	}
	public void setTicketProductServiceList(
			List<TicketEntity> ticketProductServiceList) {
		this.ticketProductServiceList = ticketProductServiceList;
	}
	
	public int getProductMasterKey() {
		return productMasterKey;
	}
	public void setProductMasterKey(int productMasterKey) {
		this.productMasterKey = productMasterKey;
	}
	public String getPaymentTid() {
		return paymentTid;
	}
	public void setPaymentTid(String paymentTid) {
		this.paymentTid = paymentTid;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public int getTicketAmount() {
		return ticketAmount;
	}
	public void setTicketAmount(int ticketAmount) {
		this.ticketAmount = ticketAmount;
	}
	public int getTicketAvilableAmount() {
		return ticketAvilableAmount;
	}
	public void setTicketAvilableAmount(int ticketAvilableAmount) {
		this.ticketAvilableAmount = ticketAvilableAmount;
	}
	public Date getTicketEndExpirationDate() {
		return ticketEndExpirationDate;
	}
	public void setTicketEndExpirationDate(Date ticketEndExpirationDate) {
		this.ticketEndExpirationDate = ticketEndExpirationDate;
	}
	public Date getTicketStartExpirationDate() {
		return ticketStartExpirationDate;
	}
	public void setTicketStartExpirationDate(Date setTicketStartExpirationDate) {
		this.ticketStartExpirationDate = setTicketStartExpirationDate;
	}
	public Date getTicketApplyDate() {
		return ticketApplyDate;
	}
	public void setTicketApplyDate(Date ticketApplyDate) {
		this.ticketApplyDate = ticketApplyDate;
	}
	public int getExpirationDate() {
		return expirationDate;
	}
	public void setExpirationDate(int expirationDate) {
		this.expirationDate = expirationDate;
	}
	public List<TicketEntity> getHistoryList() {
		return historyList;
	}
	public void setHistoryList(List<TicketEntity> historyList) {
		this.historyList = historyList;
	}
	
	public int getHistoryCount() {
		return historyCount;
	}
	public void setHistoryCount(int historyCount) {
		this.historyCount = historyCount;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getStatusText() {
		return statusText;
	}
	public void setStatusText(String statusText) {
		this.statusText = statusText;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getDeviceId() {
		return deviceId;
	}
	public void setDeviceId(int deviceId) {
		this.deviceId = deviceId;
	}
	public String getReservationNo() {
		return reservationNo;
	}
	public void setReservationNo(String reservationNo) {
		this.reservationNo = reservationNo;
	}
	public Date getReserveTime() {
		return reserveTime;
	}
	public void setReserveTime(Date reserveTime) {
		this.reserveTime = reserveTime;
	}
	public int getDuration() {
		return duration;
	}
	public void setDuration(int duration) {
		this.duration = duration;
	}
	public Date getStartDttm() {
		return startDttm;
	}
	public void setStartDttm(Date startDttm) {
		this.startDttm = startDttm;
	}
	public Date getEndDttm() {
		return endDttm;
	}
	public void setEndDttm(Date endDttm) {
		this.endDttm = endDttm;
	}
	public int getCanceled() {
		return canceled;
	}
	public void setCanceled(int canceled) {
		this.canceled = canceled;
	}
	public Date getRegDttm() {
		return regDttm;
	}
	public void setRegDttm(Date regDttm) {
		this.regDttm = regDttm;
	}
	public Date getUpdtDttm() {
		return updtDttm;
	}
	public void setUpdtDttm(Date updtDttm) {
		this.updtDttm = updtDttm;
	}
	public int getUsePoint() {
		return usePoint;
	}
	public void setUsePoint(int usePoint) {
		this.usePoint = usePoint;
	}
	public String getManufacturer() {
		return manufacturer;
	}
	public void setManufacturer(String manufacturer) {
		this.manufacturer = manufacturer;
	}
	public String getProdName() {
		return prodName;
	}
	public void setProdName(String prodName) {
		this.prodName = prodName;
	}
	public String getOs() {
		return os;
	}
	public void setOs(String os) {
		this.os = os;
	}
	public String getResolution() {
		return resolution;
	}
	public void setResolution(String resolution) {
		this.resolution = resolution;
	}
	public String getOsVersion() {
		return osVersion;
	}
	public void setOsVersion(String osVersion) {
		this.osVersion = osVersion;
	}
	public int getReservationWaitCount() {
		return reservationWaitCount;
	}
	public void setReservationWaitCount(int reservationWaitCount) {
		this.reservationWaitCount = reservationWaitCount;
	}
	public int getReservationFinishCount() {
		return reservationFinishCount;
	}
	public void setReservationFinishCount(int reservationFinishCount) {
		this.reservationFinishCount = reservationFinishCount;
	}
	public List<TicketEntity> getTicketHistoryList() {
		return ticketHistoryList;
	}
	public void setTicketHistoryList(List<TicketEntity> ticketHistoryList) {
		this.ticketHistoryList = ticketHistoryList;
	}

    public String getServiceApplyReasonDetail() {
        return serviceApplyReasonDetail;
    }

    public void setServiceApplyReasonDetail(String serviceApplyReasonDetail) {
        this.serviceApplyReasonDetail = serviceApplyReasonDetail;
    }
}
