package kr.co.clapp.entities;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Random;

import kr.co.clapp.constants.CommonCode;

import org.apache.commons.lang.StringUtils;

public class PayLgdInfo {

	private String CST_PLATFORM;	// LG유플러스 결제서비스 선택(test:테스트, service:서비스)
	private String CST_MID;			// LG유플러스으로 부터 발급받으신 상점아이디를 입력하세요.
	private String LGD_MERTKEY;		// 상점MertKey(mertkey는 상점관리자 -> 계약정보 -> 상점정보관리에서 확인하실수 있습니다)
	private String LGD_MID;			// 테스트 아이디는 't'를 제외하고 입력하세요.
	
	private String LGD_TID;			// LG 유플러스 할당 거래번호 
	private String LGD_OID;			// 주문번호(상점정의 유니크한 주문번호를 입력하세요)
	private String LGD_PRODUCTINFO;	// 상품명
	private String LGD_AMOUNT;		// 결제금액("," 를 제외한 결제금액을 입력하세요)
	
	private String LGD_BUYER;		// 구매자명
	private String LGD_BUYEREMAIL;	// 구매자 이메일
	private String LGD_BUYERPHONE;	// 구매자 휴대폰
	private String LGD_BUYERID;		// 구매자 아이디
	private String LGD_BUYERIP;		// 구매자IP
	
	private String LGD_TIMESTAMP;	// 타임스탬프(거래 위변조를 막기위해 사용. 예>20140522031523)
	private String LGD_HASHDATA;	// 해쉬 데이터(거래 위변조를 막기위한 파라미터)
	
	private String LGD_HASHDATA2;	// 무통장 결제처리용 해쉬 데이터
	private String LGD_CASNOTEURL;	// 무통장 수신결과페이지. 입금 계좌번호 발급 및 입금시 DB연동 페이지
	private String LGD_CLOSEDATE;	// 무통장 입금 마감시간 (예>yyyyMMddHHmmss)
	private String LGD_RESPCODE;	// 응답코드 : 0000(성공) 그 외 실패
	private String LGD_RESPMSG;		// 응답메세지
	
	private String LGD_CUSTOM_SKIN = "yellow";			// 상점정의 결제창 스킨(기본값:red, blue, cyan, green, yellow)
	private String LGD_CUSTOM_PROCESSTYPE = "TWOTR";	// 상점 정의 프로세스타입(기본값:TOWTR)
	private String LGD_CUSTOM_USABLEPAY;				// 상점 결제 종류
	
	
	/**
	 * 주문번호 자동생성
	 */
	public String createOrderNo() {
		String orderNo = "";
		long time = System.currentTimeMillis();
		SimpleDateFormat sf = new SimpleDateFormat("yyMMdd-HHmmssS");
		String now = sf.format(new Date(time));
		Random random = new Random();
		orderNo = now + random.nextInt(10);
		return orderNo;
	}
	
	/**
	 * 타임스탬프
	 */
	public String getTimestamp(final int addDate) {
		Calendar now = Calendar.getInstance();
		if(addDate > CommonCode.ZERO) {
			now.add(Calendar.DATE, addDate);
		}
		SimpleDateFormat sf = new SimpleDateFormat("yyyyMMddHHmmss");
		return sf.format(now.getTime());
	}
	
	/**
	 * 거래위변조방지 해쉬데이터 암호화
	 * @return
	 * @throws NoSuchAlgorithmException
	 */
	public String encryptHashdata() throws NoSuchAlgorithmException {
		/*
		 *************************************************
		 * 2. MD5 해쉬암호화 (수정하지 마세요) - BEGIN
		 *
		 * MD5 해쉬암호화는 거래 위변조를 막기위한 방법입니다.
		 *************************************************
		 *
		 * 해쉬 암호화 적용( LGD_MID + LGD_OID + LGD_AMOUNT + LGD_TIMESTAMP + LGD_MERTKEY )
		 * LGD_MID          : 상점아이디
		 * LGD_OID          : 주문번호
		 * LGD_AMOUNT       : 금액
		 * LGD_TIMESTAMP    : 타임스탬프
		 * LGD_MERTKEY      : 상점MertKey (mertkey는 상점관리자 -> 계약정보 -> 상점정보관리에서 확인하실수 있습니다)
		 *
		 * MD5 해쉬데이터 암호화 검증을 위해
		 * LG유플러스에서 발급한 상점키(MertKey)를 환경설정 파일(lgdacom/conf/mall.conf)에 반드시 입력하여 주시기 바랍니다.
		 */
		StringBuffer sb = new StringBuffer();
		sb.append(LGD_MID);
		sb.append(LGD_OID);
		sb.append(LGD_AMOUNT);
		if(StringUtils.isNotEmpty(LGD_RESPCODE)) { sb.append(LGD_RESPCODE); }
		sb.append(LGD_TIMESTAMP);
		sb.append(LGD_MERTKEY);
		
		byte[] bNoti = sb.toString().getBytes();
		MessageDigest md = MessageDigest.getInstance("MD5");
		byte[] digest = md.digest(bNoti);
		
		StringBuffer strBuf = new StringBuffer();
		for (int i=0 ; i < digest.length ; i++) {
			int c = digest[i] & 0xff;
			if (c <= 15) {
				strBuf.append('0');
			}
			strBuf.append(Integer.toHexString(c));
		}
		return strBuf.toString();
	}
	
	/**
	 * 거래위변조방지 해쉬데이터 암호화
	 * @return authData
	 * @throws NoSuchAlgorithmException
	 */
	public String encryptHashdata(String mid, String tid, String mertkey) throws NoSuchAlgorithmException {
		StringBuffer sb = new StringBuffer();
		sb.append(mid);
		sb.append(tid);
		sb.append(mertkey);
		
		byte[] bNoti = sb.toString().getBytes();
		MessageDigest md = MessageDigest.getInstance("MD5");
		byte[] digest = md.digest(bNoti);
		
		StringBuffer strBuf = new StringBuffer();
		for (int i=0 ; i < digest.length ; i++) {
			int c = digest[i] & 0xff;
			if (c <= 15) {
				strBuf.append('0');
			}
			strBuf.append(Integer.toHexString(c));
		}
		return strBuf.toString();
	}
	
	public String getLGD_HASHDATA() {
		// 가상계좌 입금 처리 중이 아닐 때. 주문 결제 처리 중일 때만 되도록.
		if(StringUtils.isEmpty(this.LGD_HASHDATA) && StringUtils.isEmpty(this.LGD_RESPCODE)) {
			try {
				LGD_HASHDATA = this.encryptHashdata();
			} catch (NoSuchAlgorithmException e) {
				e.printStackTrace();
				LGD_HASHDATA = null;
			}
		}
		return LGD_HASHDATA;
	}
	
	public String getLGD_HASHDATA2() {
		try {
			LGD_HASHDATA2 = this.encryptHashdata();
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
			LGD_HASHDATA2 = null;
		}
		return LGD_HASHDATA2;
	}
	
	public void setLGD_HASHDATA(String lGD_HASHDATA) {
		LGD_HASHDATA = lGD_HASHDATA;
	}
	
	public void setLGD_HASHDATA2(String lGD_HASHDATA2) {
		LGD_HASHDATA2 = lGD_HASHDATA2;
	}
	
	public String getLGD_RESPCODE() {
		return LGD_RESPCODE;
	}
	public void setLGD_RESPCODE(String lGD_RESPCODE) {
		LGD_RESPCODE = lGD_RESPCODE;
	}
	
	public String getLGD_RESPMSG() {
		return LGD_RESPMSG;
	}
	public void setLGD_RESPMSG(String lGD_RESPMSG) {
		LGD_RESPMSG = lGD_RESPMSG;
	}
	
	public void setLGD_MID() {
		if(StringUtils.isNotEmpty(CST_PLATFORM) && StringUtils.isNotEmpty(CST_MID)) {
			LGD_MID = ("test".equals(CST_PLATFORM.trim()) ? "t" : "") + CST_MID;
		}
	}
	
	public String getCST_PLATFORM() {
		return CST_PLATFORM;
	}
	public void setCST_PLATFORM(String cST_PLATFORM) {
		CST_PLATFORM = cST_PLATFORM;
	}
	public String getCST_MID() {
		return CST_MID;
	}
	public void setCST_MID(String cST_MID) {
		CST_MID = cST_MID;
	}
	public String getLGD_MERTKEY() {
		return LGD_MERTKEY;
	}
	public void setLGD_MERTKEY(String lGD_MERTKEY) {
		LGD_MERTKEY = lGD_MERTKEY;
	}
	public String getLGD_MID() {
		return LGD_MID;
	}
	public void setLGD_MID(String lGD_MID) {
		LGD_MID = lGD_MID;
	}
	public String getLGD_OID() {
		return LGD_OID;
	}
	public void setLGD_OID(String lGD_OID) {
		LGD_OID = lGD_OID;
	}
	public String getLGD_TID() {
		return LGD_TID;
	}
	public void setLGD_TID(String lGD_TID) {
		LGD_TID = lGD_TID;
	}
	public String getLGD_PRODUCTINFO() {
		return LGD_PRODUCTINFO;
	}
	public void setLGD_PRODUCTINFO(String lGD_PRODUCTINFO) {
		LGD_PRODUCTINFO = lGD_PRODUCTINFO;
	}
	public String getLGD_AMOUNT() {
		return LGD_AMOUNT;
	}
	public void setLGD_AMOUNT(String lGD_AMOUNT) {
		LGD_AMOUNT = lGD_AMOUNT;
	}
	public String getLGD_BUYER() {
		return LGD_BUYER;
	}
	public void setLGD_BUYER(String lGD_BUYER) {
		LGD_BUYER = lGD_BUYER;
	}
	public String getLGD_BUYEREMAIL() {
		return LGD_BUYEREMAIL;
	}
	public void setLGD_BUYEREMAIL(String lGD_BUYEREMAIL) {
		LGD_BUYEREMAIL = lGD_BUYEREMAIL;
	}
	public String getLGD_BUYERPHONE() {
		return LGD_BUYERPHONE;
	}
	public void setLGD_BUYERPHONE(String lGD_BUYERPHONE) {
		LGD_BUYERPHONE = lGD_BUYERPHONE;
	}
	public String getLGD_BUYERID() {
		return LGD_BUYERID;
	}
	public void setLGD_BUYERID(String lGD_BUYERID) {
		LGD_BUYERID = lGD_BUYERID;
	}
	public String getLGD_BUYERIP() {
		return LGD_BUYERIP;
	}
	public void setLGD_BUYERIP(String lGD_BUYERIP) {
		LGD_BUYERIP = lGD_BUYERIP;
	}
	public String getLGD_TIMESTAMP() {
		return LGD_TIMESTAMP;
	}
	public void setLGD_TIMESTAMP(String lGD_TIMESTAMP) {
		LGD_TIMESTAMP = lGD_TIMESTAMP;
	}
	public String getLGD_CASNOTEURL() {
		return LGD_CASNOTEURL;
	}
	public void setLGD_CASNOTEURL(String lGD_CASNOTEURL) {
		LGD_CASNOTEURL = lGD_CASNOTEURL;
	}
	public String getLGD_CUSTOM_SKIN() {
		return LGD_CUSTOM_SKIN;
	}
	public void setLGD_CUSTOM_SKIN(String lGD_CUSTOM_SKIN) {
		LGD_CUSTOM_SKIN = lGD_CUSTOM_SKIN;
	}
	public String getLGD_CUSTOM_PROCESSTYPE() {
		return LGD_CUSTOM_PROCESSTYPE;
	}
	public void setLGD_CUSTOM_PROCESSTYPE(String lGD_CUSTOM_PROCESSTYPE) {
		LGD_CUSTOM_PROCESSTYPE = lGD_CUSTOM_PROCESSTYPE;
	}
	public String getLGD_CUSTOM_USABLEPAY() {
		return LGD_CUSTOM_USABLEPAY;
	}
	public void setLGD_CUSTOM_USABLEPAY(String lGD_CUSTOM_USABLEPAY) {
		LGD_CUSTOM_USABLEPAY = lGD_CUSTOM_USABLEPAY;
	}
	public String getLGD_CLOSEDATE() {
		return LGD_CLOSEDATE;
	}
	public void setLGD_CLOSEDATE(String lGD_CLOSEDATE) {
		LGD_CLOSEDATE = lGD_CLOSEDATE;
	}
	
}
