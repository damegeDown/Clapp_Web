package kr.co.clapp.entities;

import java.io.Serializable;
import java.util.Date;

/**
 * Created by yusul on 15. 2. 4..
 */
public class SmsEntity implements Serializable{
	private static final long serialVersionUID = -7991835773680068676L;
	private String  cmid;           //데이터 ID
    private String  umid;           //다우기술 서버에서 정의한 message id
    private int     msg_type;       //데이터 타입      INTEGER                         DEFAULT 0,
    private int     status;         //데이터 발송 상태 (대기 0 / 발송 중 1 / 발송 완료 2 / 에러 3)
    private Date    request_time;   //입력 시간
    private Date    send_time;      //발송 (예약) 시간
    private Date    report_time;    //발송 완료 시간
    private String  dest_phone;     //받는 사람 전화 번호
    private String  dest_name;      //받는 사람 이름
    private String  send_phone;     //보내는 사람 전화 번호
    private String  send_name;      //보내는 사람 이름
    private String  subject;        //(FAX/MMS) 제목 (SMS_INBOUND) 데이터 내용
    private String  msg_body;       //데이터 내용
    private String  wap_url;        //(WAP) URL 주소
    private int     cover_flag;     //(FAX) 표지 발송 옵션
    private int     sms_flag;       //(PHONE) PHONE 실패 시 문자 전송 옵션
    private int     reply_flag;     //(PHONE) 응답 받기 선택
    private int     retry_cnt;      //(FAX/PHONE) 재시도 회수 (5~10분 간격: 최대 3회)
    private String  fax_file;       //(PHONE/FAX/MMS) 파일 전송시 파일 이름
    private String  vxml_file;      //(PHONE) 음성 시나리오 파일 이름
    private int     call_status;    //데이터의 결과 리포트 (Appendix A. Report Code 참고)
    private int     use_page;       //(FAX) 발송 페이지 수
    private int     use_time;       //(PHONE) 발송 소요 시간 (단위 : 초)
    private int     sn_result;      //(PHONE) 설문 조사 응답 값
    private String  wap_info;       //통신사 정보 (SKT/KTF/LGT)
    private String  cinfo;          //Client Indexed Info( 특수기호 \/:*?"<>|. 를 사용할 수 없음 )
	public String getCmid() {
		return cmid;
	}
	public void setCmid(String cmid) {
		this.cmid = cmid;
	}
	public String getUmid() {
		return umid;
	}
	public void setUmid(String umid) {
		this.umid = umid;
	}
	public int getMsg_type() {
		return msg_type;
	}
	public void setMsg_type(int msg_type) {
		this.msg_type = msg_type;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public Date getRequest_time() {
		return request_time;
	}
	public void setRequest_time(Date request_time) {
		this.request_time = request_time;
	}
	public Date getSend_time() {
		return send_time;
	}
	public void setSend_time(Date send_time) {
		this.send_time = send_time;
	}
	public Date getReport_time() {
		return report_time;
	}
	public void setReport_time(Date report_time) {
		this.report_time = report_time;
	}
	public String getDest_phone() {
		return dest_phone;
	}
	public void setDest_phone(String dest_phone) {
		this.dest_phone = dest_phone;
	}
	public String getDest_name() {
		return dest_name;
	}
	public void setDest_name(String dest_name) {
		this.dest_name = dest_name;
	}
	public String getSend_phone() {
		return send_phone;
	}
	public void setSend_phone(String send_phone) {
		this.send_phone = send_phone;
	}
	public String getSend_name() {
		return send_name;
	}
	public void setSend_name(String send_name) {
		this.send_name = send_name;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getMsg_body() {
		return msg_body;
	}
	public void setMsg_body(String msg_body) {
		this.msg_body = msg_body;
	}
	public String getWap_url() {
		return wap_url;
	}
	public void setWap_url(String wap_url) {
		this.wap_url = wap_url;
	}
	public int getCover_flag() {
		return cover_flag;
	}
	public void setCover_flag(int cover_flag) {
		this.cover_flag = cover_flag;
	}
	public int getSms_flag() {
		return sms_flag;
	}
	public void setSms_flag(int sms_flag) {
		this.sms_flag = sms_flag;
	}
	public int getReply_flag() {
		return reply_flag;
	}
	public void setReply_flag(int reply_flag) {
		this.reply_flag = reply_flag;
	}
	public int getRetry_cnt() {
		return retry_cnt;
	}
	public void setRetry_cnt(int retry_cnt) {
		this.retry_cnt = retry_cnt;
	}
	public String getFax_file() {
		return fax_file;
	}
	public void setFax_file(String fax_file) {
		this.fax_file = fax_file;
	}
	public String getVxml_file() {
		return vxml_file;
	}
	public void setVxml_file(String vxml_file) {
		this.vxml_file = vxml_file;
	}
	public int getCall_status() {
		return call_status;
	}
	public void setCall_status(int call_status) {
		this.call_status = call_status;
	}
	public int getUse_page() {
		return use_page;
	}
	public void setUse_page(int use_page) {
		this.use_page = use_page;
	}
	public int getUse_time() {
		return use_time;
	}
	public void setUse_time(int use_time) {
		this.use_time = use_time;
	}
	public int getSn_result() {
		return sn_result;
	}
	public void setSn_result(int sn_result) {
		this.sn_result = sn_result;
	}
	public String getWap_info() {
		return wap_info;
	}
	public void setWap_info(String wap_info) {
		this.wap_info = wap_info;
	}
	public String getCinfo() {
		return cinfo;
	}
	public void setCinfo(String cinfo) {
		this.cinfo = cinfo;
	}
    
}
