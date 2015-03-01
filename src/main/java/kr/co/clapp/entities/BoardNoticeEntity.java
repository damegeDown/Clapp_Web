package kr.co.clapp.entities;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

public class BoardNoticeEntity extends PageEntity implements Serializable{

	private static final long serialVersionUID =1L;
	
	public BoardNoticeEntity() {
		super(1L);
	}
 
	private int boardNoticeKey;
	private String noticeTitle;									//공지사항 제목
	private String noticeContents;								//공지사항 내용
	private String noticeOpenYn;									//공지사항 노출여부
	private Date noticeOpenDate;								//노출 일시
	private String noticeInsertName;							//등록자
	private Date noticeInsertDate;								//등록일
	private Date noticeRemoveDate;								//삭제일
	private int noticeNextPage;									//다음글
	private int noticePrevPage;									//이전글
	
	private List<BoardNoticeEntity> boardNoticeList;
	private int sortListSize;									//10개씩/20개/50개/100개씩보기

	public int getBoardNoticeKey() {
		return boardNoticeKey;
	}
	public void setBoardNoticeKey(int boardNoticeKey) {
		this.boardNoticeKey = boardNoticeKey;
	}
	public String getNoticeTitle() {
		return noticeTitle;
	}
	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}
	public String getNoticeContents() {
		return noticeContents;
	}
	public void setNoticeContents(String noticeContents) {
		this.noticeContents = noticeContents;
	}
	public String getNoticeOpenYn() {
		return noticeOpenYn;
	}
	public void setNoticeOpenYn(String noticeOpenYn) {
		this.noticeOpenYn = noticeOpenYn;
	}
	public Date getNoticeOpenDate() {
		return noticeOpenDate;
	}
	public void setNoticeOpenDate(Date noticeOpenDate) {
		this.noticeOpenDate = noticeOpenDate;
	}
	
	public String getNoticeInsertName() {
		return noticeInsertName;
	}
	public void setNoticeInsertName(String noticeInsertName) {
		this.noticeInsertName = noticeInsertName;
	}
	public Date getNoticeInsertDate() {
		return noticeInsertDate;
	}
	public void setNoticeInsertDate(Date noticeInsertDate) {
		this.noticeInsertDate = noticeInsertDate;
	}
	public Date getNoticeRemoveDate() {
		return noticeRemoveDate;
	}
	public void setNoticeRemoveDate(Date noticeRemoveDate) {
		this.noticeRemoveDate = noticeRemoveDate;
	}
	public List<BoardNoticeEntity> getBoardNoticeList() {
		return boardNoticeList;
	}
	public void setBoardNoticeList(List<BoardNoticeEntity> boardNoticeList) {
		this.boardNoticeList = boardNoticeList;
	}
	public int getSortListSize() {
		return sortListSize;
	}
	public void setSortListSize(int sortListSize) {
		this.sortListSize = sortListSize;
	}
	public int getNoticeNextPage() {
		return noticeNextPage;
	}
	public void setNoticeNextPage(int noticeNextPage) {
		this.noticeNextPage = noticeNextPage;
	}
	public int getNoticePrevPage() {
		return noticePrevPage;
	}
	public void setNoticePrevPage(int noticePrevPage) {
		this.noticePrevPage = noticePrevPage;
	};		
	

}
