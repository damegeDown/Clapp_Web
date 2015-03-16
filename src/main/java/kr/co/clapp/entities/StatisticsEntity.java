package kr.co.clapp.entities;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

public class StatisticsEntity extends PageEntity implements Serializable{
	private static final long serialVersionUID =1L;
	
	public StatisticsEntity() {
		super(1L);
	}
	
	private int joinMember = 0;						//일반가입수 
	private int joinCompanyMember = 0;				//기업/단체가입수
	private int loginCount = 0;						//일반 로그인수
	private int loginCompanyCount = 0;				//기업/단체 로그인수
	private int leaveMember = 0;					//회원 탈퇴수 
	private int receptionMail = 0;					//메일 수신수 
	private int refusalMail = 0;					//메일 거부수
	private int mailInquery = 0;					//이메일 문의수
	private Date statisticsDate;					//등록일자
	private String statisticsTime;					//등록시간
	private int dayOfWeek = 0;						//요일
	private String dayName;							//요일영어명
	private int accrueMember = 0;					//누적 일반회원
	private int accrueCompany = 0;					//누적 기업/단체회원
	private int sumJoinMember = 0;					//검색 총 일반가입수 
	private int sumJoinCompanyMember = 0;			//검색 초 기업/단체가입수
	private int sumLoginCount = 0;					//검색 총 일반로그인수 
	private int sumLoginCompanyCount = 0;			//검색 초 기업/단체로그인수
	private int dropOutCount = 0;					//탈퇴 회원수
	private int sumDropOutCount = 0;				//검색 탈퇴 총 수
	private int totDropOutCount = 0;				//탈퇴 총 수
	private String dropOutDate;						//탈퇴 일
	private String dropOutReason;					//탈퇴 사유
	
	private int tempPassword = 0;					// 임시비번발송
	private int payCredit = 0;						// 유료(신용,핸드폰)
	private int payVirtuarAccount = 0;				// 유료(가상계좌)
	private int revokePayment = 0;					// 결제 취소
	private int depositTimeOut = 0;					// 계좌입금 기한종료
	private int jnlpSync = 0;						// JNLP 공유
	private int jnlpReservation = 0;				// JNLP 예약
	private int jnlpModifyReservation = 0;			// JNLP 예약 수정
	private int jnlpCancleReservation = 0;			// JNLP 예약 취소
	private int targetAll = 0;						// 타켓 메일 전체
	private int targetGeneral = 0;					// 타켓 메일 일반
	private int targetCompany = 0;					// 타켓 메일 기업 / 단체
	
	//티켓 사용내역
	private int usedTicketMember = 0;				// 일반티켓 사용내역
	private int usedTicketCompanyMember = 0;		// 기업/단체 티켓 사용내역
	private int historyUsedTicketAmount = 0;		// 티켓 사용 갯수
	private float aveUsedTicket = 0.0f;				// 일단대비 사용률
	private int sumDayTotal = 0;					// 일별합계 
	private int sumUsedTicketMember = 0;			// 검색 총 일반티켓 사용내역
	private int sumUsedTicketCompanyMember = 0;		// 검색 총 기업/단체 티켓 사용내역
	private String deviceModelEname;				// 디바이스 모델 이름
	private int deviceKey = 0;						// 디바이스 마스터 키
	private Date historyEndUsedTime;				// 사용 종류일 
	private List<StatisticsEntity> statisticsList;	// 관리자 리스트;

	//적용 상품
	private int serviceTargetAll = 0;				// 전체 건수
	private int serviceTargetGeneral = 0;			// 일반 건수
	private int serviceTargetCompany = 0;			// 기업/단체 건수 
	private int serviceTargetUnit = 0;				// 개별 건수
	private int serviceAmountAll = 0;				// 전체 티켓수 
	private int serviceAmountGeneral = 0;			// 일반 티켓수 
	private int serviceAmountCompany = 0;			// 기업/단체 티켓수 
	private int serviceAmountUnit = 0;				// 개별 티켓수 
	private int dayOfTargetTotal = 0;				// 일별 총 건수 
	private int dayOfAmountTotal = 0;				// 일별 총 티켓수
	private int totDayOfTargetTotal = 0;			// 일별 총 건수 
	private int totDayOfAmountTotal = 0;			// 일별 총 티켓수
	private String sreviceReason;					// 서비스 사유
	
	private String inquiryText;					    //문의
	private int inquiryCount = 0;					//문의 건수
    private int totalCount = 0;                     //문의 카운트
    private int answerCount = 0;                    //답변 카운트
    private int notAnswerCount = 0;                 //미답변 카운트

	private String adviceType;						//상담 타입
	private int adviceCount = 0;					//상담수
	private int adviceTotal = 0;					//상담총수
    private int cableAdviceTotalCount = 0;          //누적 카운트
    private int cableAdviceSearchCount = 0;         //검색 카운트

    /*reservation*/
    private int id = 0;								//키
    private int deviceId = 0;					//디바이스키
    private String reservationNo;		//예약번호
    private Date reserveTime;			//예약일시
    private int duration = 0;					//예약구분
    private Date startDttm;				//예약시작년월일
    private Date endDttm;					//예약종료년월일
    private int canceled = 0;					//예약취소
    private Date regDttm;					//등록일시
    private Date updtDttm;				//수정일시
    private int usePoint = 0;					//차감포인트
    private int status = 0;						//상태
    private String statusText;						//상태
    /*devices*/
    private String manufacturer;		//제조사
    private String prodName;		 		//모델명
    private String os;						//OS
    private String resolution;				//화면 사이즈
    private String osVersion;				//os 버전

	private List<StatisticsEntity> dropOutList = null;
	private List<StatisticsEntity> dropOutReasonList = null;
	
	
	public int getJoinMember() {
		return joinMember;
	}

	public void setJoinMember(int joinMember) {
		this.joinMember = joinMember;
	}
 
	public int getJoinCompanyMember() {
		return joinCompanyMember;
	}

	public void setJoinCompanyMember(int joinCompanyMember) {
		this.joinCompanyMember = joinCompanyMember;
	}

	public int getLoginCount() {
		return loginCount;
	}

	public void setLoginCount(int loginCount) {
		this.loginCount = loginCount;
	}

	public int getLoginCompanyCount() {
		return loginCompanyCount;
	}

	public void setLoginCompanyCount(int loginCompanyCount) {
		this.loginCompanyCount = loginCompanyCount;
	}

	public int getLeaveMember() {
		return leaveMember;
	}

	public void setLeaveMember(int leaveMember) {
		this.leaveMember = leaveMember;
	}

	public int getReceptionMail() {
		return receptionMail;
	}

	public void setReceptionMail(int receptionMail) {
		this.receptionMail = receptionMail;
	}

	public int getRefusalMail() {
		return refusalMail;
	}

	public void setRefusalMail(int refusalMail) {
		this.refusalMail = refusalMail;
	}

	public int getMailInquery() {
		return mailInquery;
	}

	public void setMailInquery(int mailInquery) {
		this.mailInquery = mailInquery;
	}

	public Date getStatisticsDate() {
		return statisticsDate;
	}

	public void setStatisticsDate(Date statisticsDate) {
		this.statisticsDate = statisticsDate;
	}
	
	public String getStatisticsTime() {
		return statisticsTime;
	}

	public void setStatisticsTime(String statisticsTime) {
		this.statisticsTime = statisticsTime;
	}

	public int getDayOfWeek() {
		return dayOfWeek;
	}

	public void setDayOfWeek(int dayOfWeek) {
		this.dayOfWeek = dayOfWeek;
	}
 
	public String getDayName() {
		return dayName;
	}

	public void setDayName(String dayName) {
		this.dayName = dayName;
	}

	public int getAccrueMember() {
		return accrueMember;
	}

	public void setAccrueMember(int accrueMember) {
		this.accrueMember = accrueMember;
	}

	public int getAccrueCompany() {
		return accrueCompany;
	}

	public void setAccrueCompany(int accrueCompany) {
		this.accrueCompany = accrueCompany;
	}

	public int getSumJoinMember() {
		return sumJoinMember;
	}

	public void setSumJoinMember(int sumJoinMember) {
		this.sumJoinMember = sumJoinMember;
	}

	public int getSumJoinCompanyMember() {
		return sumJoinCompanyMember;
	}

	public void setSumJoinCompanyMember(int sumJoinCompanyMember) {
		this.sumJoinCompanyMember = sumJoinCompanyMember;
	}

	public int getSumLoginCount() {
		return sumLoginCount;
	}

	public void setSumLoginCount(int sumLoginCount) {
		this.sumLoginCount = sumLoginCount;
	}

	public int getSumLoginCompanyCount() {
		return sumLoginCompanyCount;
	}

	public void setSumLoginCompanyCount(int sumLoginCompanyCount) {
		this.sumLoginCompanyCount = sumLoginCompanyCount;
	}

	public int getDropOutCount() {
		return dropOutCount;
	}

	public void setDropOutCount(int dropOutCount) {
		this.dropOutCount = dropOutCount;
	}

	public int getSumDropOutCount() {
		return sumDropOutCount;
	}

	public void setSumDropOutCount(int sumDropOutCount) {
		this.sumDropOutCount = sumDropOutCount;
	}

	public int getTotDropOutCount() {
		return totDropOutCount;
	}

	public void setTotDropOutCount(int totDropOutCount) {
		this.totDropOutCount = totDropOutCount;
	}

	public String getDropOutDate() {
		return dropOutDate;
	}

	public void setDropOutDate(String dropOutDate) {
		this.dropOutDate = dropOutDate;
	}

	public String getDropOutReason() {
		return dropOutReason;
	}

	public void setDropOutReason(String dropOutReason) {
		this.dropOutReason = dropOutReason;
	}
	
	public int getTempPassword() {
		return tempPassword;
	}

	public void setTempPassword(int tempPassword) {
		this.tempPassword = tempPassword;
	}

	public int getPayCredit() {
		return payCredit;
	}

	public void setPayCredit(int payCredit) {
		this.payCredit = payCredit;
	}

	public int getPayVirtuarAccount() {
		return payVirtuarAccount;
	}

	public void setPayVirtuarAccount(int payVirtuarAccount) {
		this.payVirtuarAccount = payVirtuarAccount;
	}

	public int getRevokePayment() {
		return revokePayment;
	}

	public void setRevokePayment(int revokePayment) {
		this.revokePayment = revokePayment;
	}

	public int getDepositTimeOut() {
		return depositTimeOut;
	}

	public void setDepositTimeOut(int depositTimeOut) {
		this.depositTimeOut = depositTimeOut;
	}

	public int getJnlpSync() {
		return jnlpSync;
	}

	public void setJnlpSync(int jnlpSync) {
		this.jnlpSync = jnlpSync;
	}

	public int getJnlpReservation() {
		return jnlpReservation;
	}

	public void setJnlpReservation(int jnlpReservation) {
		this.jnlpReservation = jnlpReservation;
	}

	public int getJnlpModifyReservation() {
		return jnlpModifyReservation;
	}

	public void setJnlpModifyReservation(int jnlpModifyReservation) {
		this.jnlpModifyReservation = jnlpModifyReservation;
	}

	public int getJnlpCancleReservation() {
		return jnlpCancleReservation;
	}

	public void setJnlpCancleReservation(int jnlpCancleReservation) {
		this.jnlpCancleReservation = jnlpCancleReservation;
	}

	public int getTargetAll() {
		return targetAll;
	}

	public void setTargetAll(int targetAll) {
		this.targetAll = targetAll;
	}

	public int getTargetGeneral() {
		return targetGeneral;
	}

	public void setTargetGeneral(int targetGeneral) {
		this.targetGeneral = targetGeneral;
	}

	public int getTargetCompany() {
		return targetCompany;
	}

	public void setTargetCompany(int targetCompany) {
		this.targetCompany = targetCompany;
	}

	public int getUsedTicketMember() {
		return usedTicketMember;
	}

	public void setUsedTicketMember(int usedTicketMember) {
		this.usedTicketMember = usedTicketMember;
	}

	public int getUsedTicketCompanyMember() {
		return usedTicketCompanyMember;
	}

	public void setUsedTicketCompanyMember(int usedTicketCompanyMember) {
		this.usedTicketCompanyMember = usedTicketCompanyMember;
	}

	public int getSumUsedTicketMember() {
		return sumUsedTicketMember;
	}

	public void setSumUsedTicketMember(int sumUsedTicketMember) {
		this.sumUsedTicketMember = sumUsedTicketMember;
	}

	public int getSumUsedTicketCompanyMember() {
		return sumUsedTicketCompanyMember;
	}

	public void setSumUsedTicketCompanyMember(int sumUsedTicketCompanyMember) {
		this.sumUsedTicketCompanyMember = sumUsedTicketCompanyMember;
	}

	public List<StatisticsEntity> getStatisticsList() {
		return statisticsList;
	}

	public void setStatisticsList(List<StatisticsEntity> statisticsList) {
		this.statisticsList = statisticsList;
	}


	public int getHistoryUsedTicketAmount() {
		return historyUsedTicketAmount;
	}

	public void setHistoryUsedTicketAmount(int historyUsedTicketAmount) {
		this.historyUsedTicketAmount = historyUsedTicketAmount;
	}

	public float getAveUsedTicket() {
		return aveUsedTicket;
	}

	public void setAveUsedTicket(float aveUsedTicket) {
		this.aveUsedTicket = aveUsedTicket;
	}

	public int getSumDayTotal() {
		return sumDayTotal;
	}

	public void setSumDayTotal(int sumDayTotal) {
		this.sumDayTotal = sumDayTotal;
	}

	public String getDeviceModelEname() {
		return deviceModelEname;
	}

	public void setDeviceModelEname(String deviceModelEname) {
		this.deviceModelEname = deviceModelEname;
	}

	public Date getHistoryEndUsedTime() {
		return historyEndUsedTime;
	}

	public void setHistoryEndUsedTime(Date historyEndUsedTime) {
		this.historyEndUsedTime = historyEndUsedTime;
	}

	public int getDeviceKey() {
		return deviceKey;
	}

	public void setDeviceKey(int deviceKey) {
		this.deviceKey = deviceKey;
	}

	public int getServiceTargetAll() {
		return serviceTargetAll;
	}

	public void setServiceTargetAll(int serviceTargetAll) {
		this.serviceTargetAll = serviceTargetAll;
	}

	public int getServiceTargetGeneral() {
		return serviceTargetGeneral;
	}

	public void setServiceTargetGeneral(int serviceTargetGeneral) {
		this.serviceTargetGeneral = serviceTargetGeneral;
	}

	public int getServiceTargetCompany() {
		return serviceTargetCompany;
	}

	public void setServiceTargetCompany(int serviceTargetCompany) {
		this.serviceTargetCompany = serviceTargetCompany;
	}

	public int getServiceTargetUnit() {
		return serviceTargetUnit;
	}

	public void setServiceTargetUnit(int serviceTargetUnit) {
		this.serviceTargetUnit = serviceTargetUnit;
	}

	public int getServiceAmountAll() {
		return serviceAmountAll;
	}

	public void setServiceAmountAll(int serviceAmountAll) {
		this.serviceAmountAll = serviceAmountAll;
	}

	public int getServiceAmountGeneral() {
		return serviceAmountGeneral;
	}

	public void setServiceAmountGeneral(int serviceAmountGeneral) {
		this.serviceAmountGeneral = serviceAmountGeneral;
	}

	public int getServiceAmountCompany() {
		return serviceAmountCompany;
	}

	public void setServiceAmountCompany(int serviceAmountCompany) {
		this.serviceAmountCompany = serviceAmountCompany;
	}

	public int getServiceAmountUnit() {
		return serviceAmountUnit;
	}

	public void setServiceAmountUnit(int serviceAmountUnit) {
		this.serviceAmountUnit = serviceAmountUnit;
	}

	public int getDayOfTargetTotal() {
		return dayOfTargetTotal;
	}

	public void setDayOfTargetTotal(int dayOfTargetTotal) {
		this.dayOfTargetTotal = dayOfTargetTotal;
	}

	public int getDayOfAmountTotal() {
		return dayOfAmountTotal;
	}

	public void setDayOfAmountTotal(int dayOfAmountTotal) {
		this.dayOfAmountTotal = dayOfAmountTotal;
	}

	public int getTotDayOfTargetTotal() {
		return totDayOfTargetTotal;
	}

	public void setTotDayOfTargetTotal(int totDayOfTargetTotal) {
		this.totDayOfTargetTotal = totDayOfTargetTotal;
	}

	public int getTotDayOfAmountTotal() {
		return totDayOfAmountTotal;
	}

	public void setTotDayOfAmountTotal(int totDayOfAmountTotal) {
		this.totDayOfAmountTotal = totDayOfAmountTotal;
	}

	public String getSreviceReason() {
		return sreviceReason;
	}

	public void setSreviceReason(String sreviceReason) {
		this.sreviceReason = sreviceReason;
	}

	public String getInquiryText() {
		return inquiryText;
	}

	public void setInquiryText(String inquiryText) {
		this.inquiryText = inquiryText;
	}

	public int getInquiryCount() {
		return inquiryCount;
	}

	public void setInquiryCount(int inquiryCount) {
		this.inquiryCount = inquiryCount;
	}

    public int getTotalCount() {
        return totalCount;
    }

    public void setTotalCount(int totalCount) {
        this.totalCount = totalCount;
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

    public String getAdviceType() {
		return adviceType;
	}

	public void setAdviceType(String adviceType) {
		this.adviceType = adviceType;
	}

	public int getAdviceCount() {
		return adviceCount;
	}

	public void setAdviceCount(int adviceCount) {
		this.adviceCount = adviceCount;
	}

	public int getAdviceTotal() {
		return adviceTotal;
	}

	public void setAdviceTotal(int adviceTotal) {
		this.adviceTotal = adviceTotal;
	}

    public int getCableAdviceTotalCount() {
        return cableAdviceTotalCount;
    }

    public void setCableAdviceTotalCount(int cableAdviceTotalCount) {
        this.cableAdviceTotalCount = cableAdviceTotalCount;
    }

    public int getCableAdviceSearchCount() {
        return cableAdviceSearchCount;
    }

    public void setCableAdviceSearchCount(int cableAdviceSearchCount) {
        this.cableAdviceSearchCount = cableAdviceSearchCount;
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

    public List<StatisticsEntity> getDropOutList() {
		return dropOutList;
	}

	public void setDropOutList(List<StatisticsEntity> dropOutList) {
		this.dropOutList = dropOutList;
	}

	public List<StatisticsEntity> getDropOutReasonList() {
		return dropOutReasonList;
	}

	public void setDropOutReasonList(List<StatisticsEntity> dropOutReasonList) {
		this.dropOutReasonList = dropOutReasonList;
	}

	
}
