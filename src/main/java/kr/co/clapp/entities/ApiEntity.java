package kr.co.clapp.entities;

import java.io.Serializable;

public class ApiEntity implements Serializable{

	private static final long serialVersionUID = -9212586851868190857L;
	
	private String resultState;			    //결과상태(성공/실패/오류)
	private String errorMessage;			//실패시 오류메시지 
	private Exception errorData;					//오류 발생시 :오류내용리터(디버깅용)
	
	/* 로그인 */
	private int userMasterKey;				//회원 키
	private int ticketAvilableAmount;		//성공시 사용가능 티켓수
	
	/* 회원정보 */
	private String userName;					//회원 이름
	private String userId;						//회원 아이디
	
	/* 포인트 */
	private int usedTicketAmount;			//사용포인트
    private int totalTicketAmount;			//전체 포인트
    private int returnTicketAmount;		//반환 포인트
	/* 메일 */
	private String email;					// 관리자 이메일
	private int type;							// 관리자 회원가입과 비밀번호 변경을 구부하기 위한 용도
	
	public String getResultState() {
		return resultState;
	}
	public void setResultState(String resultState) {
		this.resultState = resultState;
	}
	public String getErrorMessage() {
		return errorMessage;
	}
	public void setErrorMessage(String errorMessage) {
		this.errorMessage = errorMessage;
	}
	public Exception getErrorData() {
		return errorData;
	}
	public void setErrorData(Exception e) {
		this.errorData = e;
	}
	public int getUserMasterKey() {
		return userMasterKey;
	}
	public void setUserMasterKey(int userMasterKey) {
		this.userMasterKey = userMasterKey;
	}
	public int getTicketAvilableAmount() {
		return ticketAvilableAmount;
	}
	public void setTicketAvilableAmount(int ticketAvilableAmount) {
		this.ticketAvilableAmount = ticketAvilableAmount;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getUsedTicketAmount() {
		return usedTicketAmount;
	}
	public void setUsedTicketAmount(int usedTicketAmount) {
		this.usedTicketAmount = usedTicketAmount;
	}
	public int getTotalTicketAmount() {
		return totalTicketAmount;
	}
	public void setTotalTicketAmount(int totalTicketAmount) {
		this.totalTicketAmount = totalTicketAmount;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public int getReturnTicketAmount() {
		return returnTicketAmount;
	}
	public void setReturnTicketAmount(int returnTicketAmount) {
		this.returnTicketAmount = returnTicketAmount;
	}
	
	
	
	
}
