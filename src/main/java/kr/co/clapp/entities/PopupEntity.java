package kr.co.clapp.entities;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

public class PopupEntity extends PageEntity implements Serializable{

	private static final long serialVersionUID =1L;
	
	public PopupEntity() {
		super(1L);
	}
	private int popupKey;					//팝업 고유
	private String popupTitle;				//팝업 제목
	private Date popupStartDate;			//팝업 시작
	private Date popupEndDate;				//팝업 종료
	private int popupSizeWidth;				//팝업 사이즈 넓이
	private int popupSizeHeight;			//팝업 사이즈 높이
	private int popupPositionTop;			//팝업 위치 Top
	private int popupPositionLeft;			//팝업 위치 Left
	private String popupContents;			//팝업 콘텐츠
	private String popupOpen;				//팝업 진행여부
	private Date popupInsertDate;			//팝업 생성일
	private List<PopupEntity> popupList;	//팝업 리스트
	private String popupCount;				//팝업 진행 카운트
	
	
	public String getPopupCount() {
		return popupCount;
	}
	public void setPopupCount(String popupCount) {
		this.popupCount = popupCount;
	}
	public int getPopupKey() {
		return popupKey;
	}
	public void setPopupKey(int popupKey) {
		this.popupKey = popupKey;
	}
	public String getPopupTitle() {
		return popupTitle;
	}
	public void setPopupTitle(String popupTitle) {
		this.popupTitle = popupTitle;
	}
	 
	public Date getPopupStartDate() {
		return popupStartDate;
	}
	public void setPopupStartDate(Date popupStartDate) {
		this.popupStartDate = popupStartDate;
	}
	public Date getPopupEndDate() {
		return popupEndDate;
	}
	public void setPopupEndDate(Date popupEndDate) {
		this.popupEndDate = popupEndDate;
	}
	public int getPopupSizeWidth() {
		return popupSizeWidth;
	}
	public void setPopupSizeWidth(int popupSizeWidth) {
		this.popupSizeWidth = popupSizeWidth;
	}
	public int getPopupSizeHeight() {
		return popupSizeHeight;
	}
	public void setPopupSizeHeight(int popupSizeHeight) {
		this.popupSizeHeight = popupSizeHeight;
	}
	public int getPopupPositionTop() {
		return popupPositionTop;
	}
	public void setPopupPositionTop(int popupPositionTop) {
		this.popupPositionTop = popupPositionTop;
	}
	public int getPopupPositionLeft() {
		return popupPositionLeft;
	}
	public void setPopupPositionLeft(int popupPositionLeft) {
		this.popupPositionLeft = popupPositionLeft;
	}
	public String getPopupContents() {
		return popupContents;
	}
	public void setPopupContents(String popupContents) {
		this.popupContents = popupContents;
	}
	public String getPopupOpen() {
		return popupOpen;
	}
	public void setPopupOpen(String popupOpen) {
		this.popupOpen = popupOpen;
	}
	public Date getPopupInsertDate() {
		return popupInsertDate;
	}
	public void setPopupInsertDate(Date popupInsertDate) {
		this.popupInsertDate = popupInsertDate;
	}
	public List<PopupEntity> getPopupList() {
		return popupList;
	}
	public void setPopupList(List<PopupEntity> popupList) {
		this.popupList = popupList;
	}
	
}
