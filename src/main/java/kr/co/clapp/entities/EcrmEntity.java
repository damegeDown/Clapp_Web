package kr.co.clapp.entities;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

public class EcrmEntity extends PageEntity implements Serializable{
	
	private static final long serialVersionUID =1L;
	
	public EcrmEntity() {
		super(1L);
	}
	
	//MAIL MASTER
	private int mailMasterKey;				// 관리자 고유키;
	private String mailSendAddress;			// 발송인 주소
	private String mailTitle;				// 메일 제목
	private String mailContent;				// 메일 내용 
	private int mailSection;					// 메일 구분 = 1:수시발송용, 2: 타겟메일
	private int mailSort;					// 메일 분류 = 1: 회원정보, 2: 결제, 3: JNLP, 4: 고객센터
	private String mailSortText;				// 메일 분류 = 1: 회원정보, 2: 결제, 3: JNLP, 4: 고객센터
	private int mailType;					// 메일 타입 - 1: 일반가입, 2: 기업 / 단체 ..........
	private String mailTypeText;				// 메일 타입 - 1: 일반가입, 2: 기업 / 단체 ..........
	private int mailState;					// 발송상태 = 1: 성공, 2: 실패
	private String mailStateText;			// 발송상태 = 1: 성공, 2: 실패
	private Date mailSendStartDate;			// 발송일시작일시
	private Date mailSendEndDate;			// 발송일종료일시
	private Date mailSendDate;				// 발송일
	private int mailTarget;					// 메일 대상 = 1:전체, 2:일반, 3:기업/ 단체
	private String mailTargetText;			// 메일 대상 = 1:전체, 2:일반, 3:기업/ 단체

	//MAIL_RECEPTION	
	private String mailReceptionAddress;		// 수신인 주소
	private String[] mailReceptionAddressArr;		// 수신인 주소
	private String mailOpen;					// 오픈 여부
	private Date mailOpenDate;				// 오픈 날짜 
	private String mailClick;				// 클릭 여부(본문 클릭하여 사이트 유입여부)
	private Date mailClickDate;				// 클릭 날짜 
	
	//MAIL_TEMP
	private int mailtempKey;					// 메일 템프 키
	private int mailTempSort;				// 메일 분류 = 1: 회원정보, 2: 결제, 3: JNLP, 4: 고객센터
	private String mailTempTitle;
	private String mailTempContents;
	private Date insertDate;
	private int toDaySend = 0;				// 오늘 발송
	private int toDayOpen = 0;				// 오늘 오픈
	private int toDaySend7Ago = 0;			// 7일전 오픈
	private int toDaySend30Ago = 0;			// 30일전 오픈
	private int totalSendCount = 0;			// 누적 수
	
	private int dayOfWeek = 0;				// 요일
	private String dayName;					// 요일영어명
	private int sendSuccessCount = 0;		// 성공
	private int sendFailCount = 0;			// 실패
	private int mailOpenCount = 0;			// 오픈수
	private int mailClickCount = 0;			// 클릭수
	
	//SURVEY_MASTER
	private int surveyMasterKey;			    // 키 
	private String surveyTitle;				// 제목 
	private String surveyNoti;				// 설명 
	private Date surveyStartDate;			// 발송 시작일자
	private Date surveyEndDate;				// 발송 종료일자
	private int surveySendType;				// 발송 타입 = 1:즉시 발송, 2:예약 발송
	private Date surveySendDate;				// 발송 일자
	private String surveyState;				// 설문 여부 
	private int targetType;					// 대상 회원 = 0:전체, 1:개인회원, 2: 기업/단체회원
	//SURVEY_QUESTION
	private int surveyQuestionKey;			// 키 
	private int[] surveyQuestionKeyArr;			// 키 
	private int surveyQuestionType;			// 문항 타입 = 1:객관식, 2:주관식
	private String surveyQuestionTitle;		// 설문
	private int surveySort;					// 정렬
	private int surveyStartPoint;			// 점수 시작 범위
	private int surveyEndPoint;				// 점수 종료 범위
	private int surveyPointType;				// 답변타입 = 1:점수형, 2:텍스트형
	private List<EcrmEntity> questionList;
	
	private int[] surveyQuestionTypeArr;			// 문항 타입 = 1:객관식, 2:주관식
	private String[] surveyQuestionTitleArr;		// 설문
	private int[] surveySortArr;					// 정렬
	private int[] surveyStartPointArr;			// 점수 시작 범위
	private int[] surveyEndPointArr;				// 점수 종료 범위
	private int[] surveyStartTextArr;			// 점수 시작 범위
	private int[] surveyEndTextArr;				// 점수 종료 범위
	private int[] surveyPointTypeArr;			// 답변타입 = 1:점수형, 2:텍스트형
	
	//SURVEY_ANSWER
	private int surveyAnswerKey;				// 키 
	private int userMasterKey;				// 회원 키 
	private String surveyAnswerContents;		// 답변 
	private int surveyAnswerPoint;			// 답변 점수
	private String userId;					// 답변자 아이디
	private List<EcrmEntity> answerList;
	private int answerCount = 0;				// 답변수 
	private int notAnswerCount = 0;			// 미 답변수 
	private int groupCount = 0;				// 총 수
	private List<EcrmEntity> ecrmList;		// 리스트
	private List<EcrmEntity> surveyList;		// 리스트
	private String[][] ecrmArr;
	private String surveyTemp;
	private String[] surveyAnswerArr;
	
	private int surveyAnswer1Point;
	private int surveyAnswer2Point;
	private int surveyAnswer3Point;
	private int surveyAnswer4Point;
	private int surveyAnswer5Point;
	private int surveyAnswer6Point;
	private int surveyAnswer7Point;
	private int surveyAnswer8Point;
	private int surveyAnswer9Point;
	private int surveyAnswer10Point;
	private String[] surveyAnswerContentsArr;
	
	
	/** API MAIL */
	private String userName;
	private String fromEmail;
	private String prodName;
	private String fileUrl;
	private String memo;
	private String startDttm;
	private String testName;
	private String serverUrl;
	
	
	
	public int getMailMasterKey() {
		return mailMasterKey;
	}
	public void setMailMasterKey(int mailMasterKey) {
		this.mailMasterKey = mailMasterKey;
	}
	public String getMailSendAddress() {
		return mailSendAddress;
	}
	public void setMailSendAddress(String mailSendAddress) {
		this.mailSendAddress = mailSendAddress;
	}
	public String getMailTitle() {
		return mailTitle;
	}
	public void setMailTitle(String mailTitle) {
		this.mailTitle = mailTitle;
	}
	public String getMailContent() {
		return mailContent;
	}
	public void setMailContent(String mailContent) {
		this.mailContent = mailContent;
	}
	public int getMailSection() {
		return mailSection;
	}
	public void setMailSection(int mailSection) {
		this.mailSection = mailSection;
	}
	public int getMailSort() {
		return mailSort;
	}
	public void setMailSort(int mailSort) {
		this.mailSort = mailSort;
	}
	public String getMailSortText() {
		return mailSortText;
	}
	public void setMailSortText(String mailSortText) {
		this.mailSortText = mailSortText;
	}
	public int getMailType() {
		return mailType;
	}
	public void setMailType(int mailType) {
		this.mailType = mailType;
	}
	public String getMailTypeText() {
		return mailTypeText;
	}
	public void setMailTypeText(String mailTypeText) {
		this.mailTypeText = mailTypeText;
	}
	public int getMailState() {
		return mailState;
	}
	public void setMailState(int mailState) {
		this.mailState = mailState;
	}
	public String getMailStateText() {
		return mailStateText;
	}
	public void setMailStateText(String mailStateText) {
		this.mailStateText = mailStateText;
	}
	public Date getMailSendStartDate() {
		return mailSendStartDate;
	}
	public void setMailSendStartDate(Date mailSendStartDate) {
		this.mailSendStartDate = mailSendStartDate;
	}
	public Date getMailSendEndDate() {
		return mailSendEndDate;
	}
	public void setMailSendEndDate(Date mailSendEndDate) {
		this.mailSendEndDate = mailSendEndDate;
	}
	public Date getMailSendDate() {
		return mailSendDate;
	}
	public void setMailSendDate(Date mailSendDate) {
		this.mailSendDate = mailSendDate;
	}
	public int getMailTarget() {
		return mailTarget;
	}
	public void setMailTarget(int mailTarget) {
		this.mailTarget = mailTarget;
	}
	public String getMailTargetText() {
		return mailTargetText;
	}
	public void setMailTargetText(String mailTargetText) {
		this.mailTargetText = mailTargetText;
	}
	public String getMailReceptionAddress() {
		return mailReceptionAddress;
	}
	public void setMailReceptionAddress(String mailReceptionAddress) {
		this.mailReceptionAddress = mailReceptionAddress;
	}
	public String[] getMailReceptionAddressArr() {
		return mailReceptionAddressArr;
	}
	public void setMailReceptionAddressArr(String[] mailReceptionAddressArr) {
		this.mailReceptionAddressArr = mailReceptionAddressArr;
	}
	public String getMailOpen() {
		return mailOpen;
	}
	public void setMailOpen(String mailOpen) {
		this.mailOpen = mailOpen;
	}
	public Date getMailOpenDate() {
		return mailOpenDate;
	}
	public void setMailOpenDate(Date mailOpenDate) {
		this.mailOpenDate = mailOpenDate;
	}
	public String getMailClick() {
		return mailClick;
	}
	public void setMailClick(String mailClick) {
		this.mailClick = mailClick;
	}
	public Date getMailClickDate() {
		return mailClickDate;
	}
	public void setMailClickDate(Date mailClickDate) {
		this.mailClickDate = mailClickDate;
	}
	
	public int getToDaySend() {
		return toDaySend;
	}
	public void setToDaySend(int toDaySend) {
		this.toDaySend = toDaySend;
	}
	public int getToDayOpen() {
		return toDayOpen;
	}
	public void setToDayOpen(int toDayOpen) {
		this.toDayOpen = toDayOpen;
	}
	public int getToDaySend7Ago() {
		return toDaySend7Ago;
	}
	public void setToDaySend7Ago(int toDaySend7Ago) {
		this.toDaySend7Ago = toDaySend7Ago;
	}
	public int getToDaySend30Ago() {
		return toDaySend30Ago;
	}
	public void setToDaySend30Ago(int toDaySend30Ago) {
		this.toDaySend30Ago = toDaySend30Ago;
	}
	
	public int getTotalSendCount() {
		return totalSendCount;
	}
	public void setTotalSendCount(int totalSendCount) {
		this.totalSendCount = totalSendCount;
	}
	public List<EcrmEntity> getEcrmList() {
		return ecrmList;
	}
	public void setEcrmList(List<EcrmEntity> ecrmList) {
		this.ecrmList = ecrmList;
	}
	public int getMailtempKey() {
		return mailtempKey;
	}
	public void setMailtempKey(int mailtempKey) {
		this.mailtempKey = mailtempKey;
	}
	public int getMailTempSort() {
		return mailTempSort;
	}
	public void setMailTempSort(int mailTempSort) {
		this.mailTempSort = mailTempSort;
	}
	public String getMailTempTitle() {
		return mailTempTitle;
	}
	public void setMailTempTitle(String mailTempTitle) {
		this.mailTempTitle = mailTempTitle;
	}
	public String getMailTempContents() {
		return mailTempContents;
	}
	public void setMailTempContents(String mailTempContents) {
		this.mailTempContents = mailTempContents;
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
	
	public int getSendSuccessCount() {
		return sendSuccessCount;
	}
	public void setSendSuccessCount(int sendSuccessCount) {
		this.sendSuccessCount = sendSuccessCount;
	}
	public int getSendFailCount() {
		return sendFailCount;
	}
	public void setSendFailCount(int sendFailCount) {
		this.sendFailCount = sendFailCount;
	}
	public int getMailOpenCount() {
		return mailOpenCount;
	}
	public void setMailOpenCount(int mailOpenCount) {
		this.mailOpenCount = mailOpenCount;
	}
	public int getMailClickCount() {
		return mailClickCount;
	}
	public void setMailClickCount(int mailClickCount) {
		this.mailClickCount = mailClickCount;
	}
	public Date getInsertDate() {
		return insertDate;
	}
	public void setInsertDate(Date insertDate) {
		this.insertDate = insertDate;
	}
	public int getSurveyMasterKey() {
		return surveyMasterKey;
	}
	public void setSurveyMasterKey(int surveyMasterKey) {
		this.surveyMasterKey = surveyMasterKey;
	}
	public String getSurveyTitle() {
		return surveyTitle;
	}
	public void setSurveyTitle(String surveyTitle) {
		this.surveyTitle = surveyTitle;
	}
	public String getSurveyNoti() {
		return surveyNoti;
	}
	public void setSurveyNoti(String surveyNoti) {
		this.surveyNoti = surveyNoti;
	}
	public Date getSurveyStartDate() {
		return surveyStartDate;
	}
	public void setSurveyStartDate(Date surveyStartDate) {
		this.surveyStartDate = surveyStartDate;
	}
	public Date getSurveyEndDate() {
		return surveyEndDate;
	}
	public void setSurveyEndDate(Date surveyEndDate) {
		this.surveyEndDate = surveyEndDate;
	}
	public int getSurveySendType() {
		return surveySendType;
	}
	public void setSurveySendType(int surveySendType) {
		this.surveySendType = surveySendType;
	}
	public Date getSurveySendDate() {
		return surveySendDate;
	}
	public void setSurveySendDate(Date surveySendDate) {
		this.surveySendDate = surveySendDate;
	}
	public String getSurveyState() {
		return surveyState;
	}
	public void setSurveyState(String surveyState) {
		this.surveyState = surveyState;
	}
	
	public int getTargetType() {
		return targetType;
	}
	public void setTargetType(int targetType) {
		this.targetType = targetType;
	}
	public int getSurveyQuestionKey() {
		return surveyQuestionKey;
	}
	public void setSurveyQuestionKey(int surveyQuestionKey) {
		this.surveyQuestionKey = surveyQuestionKey;
	}
	
	public int[] getSurveyQuestionKeyArr() {
		return surveyQuestionKeyArr;
	}
	public void setSurveyQuestionKeyArr(int[] surveyQuestionKeyArr) {
		this.surveyQuestionKeyArr = surveyQuestionKeyArr;
	}
	public int getSurveyQuestionType() {
		return surveyQuestionType;
	}
	public void setSurveyQuestionType(int surveyQuestionType) {
		this.surveyQuestionType = surveyQuestionType;
	}
	public String getSurveyQuestionTitle() {
		return surveyQuestionTitle;
	}
	public void setSurveyQuestionTitle(String surveyQuestionTitle) {
		this.surveyQuestionTitle = surveyQuestionTitle;
	}
	public int getSurveySort() {
		return surveySort;
	}
	public void setSurveySort(int surveySort) {
		this.surveySort = surveySort;
	}
	public int getSurveyStartPoint() {
		return surveyStartPoint;
	}
	public void setSurveyStartPoint(int surveyStartPoint) {
		this.surveyStartPoint = surveyStartPoint;
	}
	public int getSurveyEndPoint() {
		return surveyEndPoint;
	}
	public void setSurveyEndPoint(int surveyEndPoint) {
		this.surveyEndPoint = surveyEndPoint;
	}
	public int getSurveyPointType() {
		return surveyPointType;
	}
	public void setSurveyPointType(int surveyPointType) {
		this.surveyPointType = surveyPointType;
	}
	
	public int[] getSurveyQuestionTypeArr() {
		return surveyQuestionTypeArr;
	}
	public void setSurveyQuestionTypeArr(int[] surveyQuestionTypeArr) {
		this.surveyQuestionTypeArr = surveyQuestionTypeArr;
	}
	public String[] getSurveyQuestionTitleArr() {
		return surveyQuestionTitleArr;
	}
	public void setSurveyQuestionTitleArr(String[] surveyQuestionTitleArr) {
		this.surveyQuestionTitleArr = surveyQuestionTitleArr;
	}
	public int[] getSurveySortArr() {
		return surveySortArr;
	}
	public void setSurveySortArr(int[] surveySortArr) {
		this.surveySortArr = surveySortArr;
	}
	public int[] getSurveyStartPointArr() {
		return surveyStartPointArr;
	}
	public void setSurveyStartPointArr(int[] surveyStartPointArr) {
		this.surveyStartPointArr = surveyStartPointArr;
	}
	public int[] getSurveyEndPointArr() {
		return surveyEndPointArr;
	}
	public void setSurveyEndPointArr(int[] surveyEndPointArr) {
		this.surveyEndPointArr = surveyEndPointArr;
	}
	public int[] getSurveyStartTextArr() {
		return surveyStartTextArr;
	}
	public void setSurveyStartTextArr(int[] surveyStartTextArr) {
		this.surveyStartTextArr = surveyStartTextArr;
	}
	public int[] getSurveyEndTextArr() {
		return surveyEndTextArr;
	}
	public void setSurveyEndTextArr(int[] surveyEndTextArr) {
		this.surveyEndTextArr = surveyEndTextArr;
	}
	public int[] getSurveyPointTypeArr() {
		return surveyPointTypeArr;
	}
	public void setSurveyPointTypeArr(int[] surveyPointTypeArr) {
		this.surveyPointTypeArr = surveyPointTypeArr;
	}
	public int getSurveyAnswerKey() {
		return surveyAnswerKey;
	}
	public void setSurveyAnswerKey(int surveyAnswerKey) {
		this.surveyAnswerKey = surveyAnswerKey;
	}
	public int getUserMasterKey() {
		return userMasterKey;
	}
	public void setUserMasterKey(int userMasterKey) {
		this.userMasterKey = userMasterKey;
	}
	public String getSurveyAnswerContents() {
		return surveyAnswerContents;
	}
	public void setSurveyAnswerContents(String surveyAnswerContents) {
		this.surveyAnswerContents = surveyAnswerContents;
	}
	public int getSurveyAnswerPoint() {
		return surveyAnswerPoint;
	}
	public void setSurveyAnswerPoint(int surveyAnswerPoint) {
		this.surveyAnswerPoint = surveyAnswerPoint;
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
	public int getGroupCount() {
		return groupCount;
	}
	public void setGroupCount(int groupCount) {
		this.groupCount = groupCount;
	}
	public List<EcrmEntity> getSurveyList() {
		return surveyList;
	}
	public void setSurveyList(List<EcrmEntity> surveyList) {
		this.surveyList = surveyList;
	}
	public String[][] getEcrmArr() {
		return ecrmArr;
	}
	public void setEcrmArr(String[][] ecrmArr) {
		this.ecrmArr = ecrmArr;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getSurveyTemp() {
		return surveyTemp;
	}
	public void setSurveyTemp(String surveyTemp) {
		this.surveyTemp = surveyTemp;
	}
	
	public String[] getSurveyAnswerArr() {
		return surveyAnswerArr;
	}
	public void setSurveyAnswerArr(String[] surveyAnswerArr) {
		this.surveyAnswerArr = surveyAnswerArr;
	}
	 
	public int getSurveyAnswer1Point() {
		return surveyAnswer1Point;
	}
	public void setSurveyAnswer1Point(int surveyAnswer1Point) {
		this.surveyAnswer1Point = surveyAnswer1Point;
	}
	public int getSurveyAnswer2Point() {
		return surveyAnswer2Point;
	}
	public void setSurveyAnswer2Point(int surveyAnswer2Point) {
		this.surveyAnswer2Point = surveyAnswer2Point;
	}
	public int getSurveyAnswer3Point() {
		return surveyAnswer3Point;
	}
	public void setSurveyAnswer3Point(int surveyAnswer3Point) {
		this.surveyAnswer3Point = surveyAnswer3Point;
	}
	public int getSurveyAnswer4Point() {
		return surveyAnswer4Point;
	}
	public void setSurveyAnswer4Point(int surveyAnswer4Point) {
		this.surveyAnswer4Point = surveyAnswer4Point;
	}
	public int getSurveyAnswer5Point() {
		return surveyAnswer5Point;
	}
	public void setSurveyAnswer5Point(int surveyAnswer5Point) {
		this.surveyAnswer5Point = surveyAnswer5Point;
	}
	public int getSurveyAnswer6Point() {
		return surveyAnswer6Point;
	}
	public void setSurveyAnswer6Point(int surveyAnswer6Point) {
		this.surveyAnswer6Point = surveyAnswer6Point;
	}
	public int getSurveyAnswer7Point() {
		return surveyAnswer7Point;
	}
	public void setSurveyAnswer7Point(int surveyAnswer7Point) {
		this.surveyAnswer7Point = surveyAnswer7Point;
	}
	public int getSurveyAnswer8Point() {
		return surveyAnswer8Point;
	}
	public void setSurveyAnswer8Point(int surveyAnswer8Point) {
		this.surveyAnswer8Point = surveyAnswer8Point;
	}
	public int getSurveyAnswer9Point() {
		return surveyAnswer9Point;
	}
	public void setSurveyAnswer9Point(int surveyAnswer9Point) {
		this.surveyAnswer9Point = surveyAnswer9Point;
	}
	public int getSurveyAnswer10Point() {
		return surveyAnswer10Point;
	}
	public void setSurveyAnswer10Point(int surveyAnswer10Point) {
		this.surveyAnswer10Point = surveyAnswer10Point;
	}
	public String[] getSurveyAnswerContentsArr() {
		return surveyAnswerContentsArr;
	}
	public void setSurveyAnswerContentsArr(String[] surveyAnswerContentsArr) {
		this.surveyAnswerContentsArr = surveyAnswerContentsArr;
	}
	public List<EcrmEntity> getQuestionList() {
		return questionList;
	}
	public void setQuestionList(List<EcrmEntity> questionList) {
		this.questionList = questionList;
	}
	public List<EcrmEntity> getAnswerList() {
		return answerList;
	}
	public void setAnswerList(List<EcrmEntity> answerList) {
		this.answerList = answerList;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getFromEmail() {
		return fromEmail;
	}
	public void setFromEmail(String fromEmail) {
		this.fromEmail = fromEmail;
	}
	public String getProdName() {
		return prodName;
	}
	public void setProdName(String prodName) {
		this.prodName = prodName;
	}
	public String getFileUrl() {
		return fileUrl;
	}
	public void setFileUrl(String fileUrl) {
		this.fileUrl = fileUrl;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	public String getStartDttm() {
		return startDttm;
	}
	public void setStartDttm(String startDttm) {
		this.startDttm = startDttm;
	}
	public String getTestName() {
		return testName;
	}
	public void setTestName(String testName) {
		this.testName = testName;
	}
	public String getServerUrl() {
		return serverUrl;
	}
	public void setServerUrl(String serverUrl) {
		this.serverUrl = serverUrl;
	}
	
	
	
}
