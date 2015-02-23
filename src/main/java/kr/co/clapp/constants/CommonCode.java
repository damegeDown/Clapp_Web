package kr.co.clapp.constants;

public class CommonCode {

	/** ReturnResult */
	public static final int ZERO = 0;
	public static final int ONE = 1;
	public static final String MASTER = "Y";
	public static final String NO_MASTER = "N";
	public static final int SUCCESS_NO = 1;												
	public static final int FAIL_NO = 2;		
	public static final String SUCCESS = "success";
	public static final String FAIL = "fail";
	
	/** CommonCode */
	public static final String GRANT = "GRANT";												//공통코드 권한
	public static final String USER_MEMBER = "1";											//회원 타입 일반회원 
	public static final String USER_COMPANY = "2";											//회원 타입 기업회원
	public static final String USER_AGE_GROUP = "USER_AGE_GROUP";							    //공통코드 연령대별
	public static final String USER_JOB_TYPE = "USER_JOB_TYPE";								//공통코드 직종
	public static final String POPUP_OPEN = "POPUP_OPEN";									//공통코드 팝업진행여부
	public static final String USER_COMPANY_BUSINESS_TYPE = "USER_COMPANY_BUSINESS_TYPE";		//공통코드 업종
	public static final String DROP_OUT_REASON = "DROP_OUT_REASON";							//공통코드 탈퇴사유
	public static final String USER_COMPANY_GROUP_TYPE = "USER_COMPANY_GROUP_TYPE";			//공통코드 기업/단체 타입
	public static final String DEVICE_MAKER_CODE = "DEVICE_MAKER_CODE";						//공통코드 디바이스 제조사
	public static final String DEVICE_OS_CODE = "DEVICE_OS_CODE";								//공통코드 디바이스 OS
	public static final String DEVICE_SORT = "DEVICE_SORT";									//공통코드 디바이스 정렬
	public static final String PRODUCT_TYPE = "PRODUCT_TYPE";									//공통코드 상품타입
	public static final String CONTRACT_STATE = "CONTRACT_STATE";								//공통코드 계약 이용현황
	public static final String FILE_ORI_TYPE = "1";											//파일 원본 타입
	public static final String FILE_THUMB_TYPE = "2";										//파일 썸네일 타입
	public static final String AREA = "AREA";												//공통코드 기업/단체 타입
	public static final String AREA_DETAIL = "AREA_DETAIL";									//공통코드 기업/단체 타입
	public static final String CELL_PHONE_NUM = "CELL_PHONE_NUM";							//공통코드 핸드폰
	public static final String TELE_PHONE_NUM = "TELE_PHONE_NUM";							//공통코드 전화번호
	public static final String FILE_TARGET_DEVICE = "device";								//디바이스 파일 저장 폴더 
	public static final String FILE_TARGET_INQUIRY = "inquiry";								//상담 파일 저장 폴더 
	public static final String FILE_TARGET_BOARD_TRAND = "boardTrand";						//트렌드리뷰 파일 저장 폴더 
	public static final String FILE_TARGET_BOARD_SOCIAL_BLOG = "boardSocialBlog";			//소셜/블로그 파일 저장 폴더 
	public static final String FILE_THUMB_Y = "Y";									     	//파일 썸네일 생성여부 
	public static final String FILE_THUMB_N = "N";									     	//파일 썸네일 생성여부 
	public static final int FILE_THUMB_MAXDIM = 300;								   			//파일 썸네일 사이즈 
	public static final String USER_TYPE = "USER_TYPE";										//공통코드 일반,기업/단체 구분
	public static final String SERVICE_APPLY_REASON = "SERVICE_APPLY_REASON";					//공통코드 티켓 적용사유
	public static final String TRAND_CATEGORY = "TRAND_CATEGORY";							//공통코드 트렌드리뷰 분류
	public static final String INQUIRY_CATEGORY = "INQUIRY_CATEGORY";						//공통코드 이메일답변 분류 
	public static final String ANSWER_INSERT_YN = "ANSWER_INSERT_YN";						//공통코드 이메일답변처리 여부 
	public static final String SORT_LIST_SIZE = "SORT_LIST_SIZE";							//공통코드 10개,20개,50개,100개씩 보기
	public static final String CABLED_ADVICE = "CABLED_ADVICE";								//공통코드 유선상담 분류
	public static final String NOTICE_OPEN = "NOTICE_OPEN";									//공통코드 공지사항 노출 여부
	public static final String POINT_TEXT = "POINT_TEXT";									//공통코드 포인트 텍스트 타입
	public static final String SERVICE_TARGET_TYPE = "SERVICE_TARGET_TYPE";					//회원타입 1: 회원전체, 2:일반 전체, 3:기업/단체 전체, 4:개별 계정
	public static final String RESERVATION_STATUS = "RESERVATION_STATUS";		//예약 상태
	public static final String PAYMENT_TYPE = "PAYMENT_TYPE";		//결제방법
	public static final int TICKET_TIME = 30;						// 티켓 당 사용 시간
	
	
	public static final class MailType {
		public final static int MAIL_JOIN_MEMBER = 1;						// 일반회원 가입
		public final static int MAIL_JOIN_COMPANY = 2;					// 기업/단체 회원 가입
		public final static int MAIL_DROPOUT_MEMBER = 3;			    // 회원 탈퇴
		public final static int MAIL_TEMP_PASSWORD = 4;					// 임시 비밀번호 발송
		public final static int MAIL_PAYMENT_CARD = 5;					// 유료 서비스 결제(카드,핸드폰)
		public final static int MAIL_PAYMENT_VIRTUAL = 6;				// 유료 서비스 결제 (가상 계좌)
		public final static int MAIL_CANCEL_PAYMENT = 7;			    	// 결제 취소 
		public final static int MAIL_END_RECEIPT_TERM = 8;				// 입금 기한 종료
		public final static int MAIL_INQUIRY = 9;			   					// 고객문의 답변메일
		public final static int MAIL_RECRUIT = 10;			   					// 입사지원 
		public final static int MAIL_SYNC_DIVICE = 11;  			    	// 디바이스 공유하기
		public final static int MAIL_RESERVE_DIVICE = 12;  				// 디바이스 예약
		public final static int MAIL_RESERVE_CANCEL_DIVICE = 13;  	// 디바이스 예약취소
		public final static int MAIL_RESERVE_MODIFY_DIVICE = 14;  	// 디바이스 예약 변경
		public final static int MAIL_ISSUE = 15;									// 이슈 발생시 (관리자)
		public final static int MAIL_TARGET_ALL = 16;						// 타켓메일(전체)
		public final static int MAIL_TARGET_GENERAL = 17;				// 타켓메일(일반)
		public final static int MAIL_TARGET_COMPANY = 18;				// 타켓메일(기업)
		
		public final static int MAIL_ANY_TIME = 1;			        			// 메일구분 - 수시
		public final static int MAIL_TARGET = 2;		    		      		 	// 메일구분 - 타켓
		public final static int MAIL_SORT_MEMBER = 1;		     			// 메일분류 - 회원정보
		public final static int MAIL_SORT_PAYMENT = 2;		       		// 메일분류 - 결제
		public final static int MAIL_SORT_JNLP = 3;			        		// 메일분류 - JNLP
		public final static int MAIL_SORT_CUSTOMER = 4;		        	// 메일분류 - 고객센터
	}
	public static final class MailTarget {
		public final static int MAIL_TARGET_NULL = 0;				// 타켓메일(없음)
		public final static int MAIL_TARGET_ALL = 1;				// 타켓메일(전체)
		public final static int MAIL_TARGET_GENERAL = 2;			// 타켓메일(일반)
		public final static int MAIL_TARGET_COMPANY = 3;			// 타켓메일(기업)
	}
	public static final class DatePattern {
		public final static String SLASH = "yyyy/MM/dd";
		public final static String DASH = "yyyy-MM-dd";
		public final static String DOT = "yyyy.MM.dd";
		public final static String DASH_TIME = "yyyy-MM-dd HH:mm:ss";
		public final static String SLASH_TIME = "yyyy/MM/dd HH:mm:ss";
		public final static String DOT_TIME = "yyyy.MM.dd HH:mm:ss";
		public final static String FULL = "yyyyMMddHHmmss";
		public final static String KOREAN = "yyyy년 MM월 dd일 (E요일) HH시mm분";
	}
	public static final class PayState {
		public final static String COMPLET  = "1";
		public final static String WAIT = "2";
		public final static String CANCEL  = "3";
		public final static String FAIL  = "4";
	}
	public static final class Policy {
		public final static int DEPOSIT_CLOSE_DATE = 7;
	}
	public static final class SnsType {
		public final static int SNS_FACEBOOK = 1;
		public final static int SNS_TWITTER = 2;
		public final static int SNS_BLOG = 3;
		
	}
	public static final class SmsType {
		public final static String CERT_BASE = "(클앱) 휴대폰 인증번호 안내 - ";						// 일반회원 가입
		public final static String CERT_JOIN_MEMBER = "(클앱) 일반가입 인증번호 안내 - ";						// 일반회원 가입
		public final static String CERT_COMPANY_MEMBER = "(클앱) 기업/단체가입 인증번호 안내 - ";		// 기업회원 가입
		
	}
	/** 세션코드 */
	public static final class Session {
		/** 로그인 세션 */
		public final static String USER_LOGIN_SESSION = "userLoginSession";
		/** 관리자 세션 */
		public final static String ADMIN_LOGIN_SESSION = "adminLoginSession";
	}
	
}
