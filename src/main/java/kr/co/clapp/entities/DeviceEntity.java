package kr.co.clapp.entities;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

public class DeviceEntity extends AdministrationFileEntity  implements Serializable {
	
	private static final long serialVersionUID =1L;
	
	
	private int deviceKey;									// 디바이스 고유키
	private String deviceModelEname;						// 디바이스 영문이름
	private String deviceModelKname;						// 디바이스 한글이름
	private String deviceMakerCode;							// 디바이스 제조사 코드
	private String deviceOsCode;							// 디바이스 OS 코드
	private String deviceVersion;							// 디바이스 버전
	private String deviceTop10Open;							// 상위 10 노출 디바이스 여부(노출 :Y, 미노출: N)
	private int deviceTop10Count;							// 상위 10 노출 디바이스 총수
	private int deviceTop10Number;							// 상위 10 노출 순서
	private String deviceOpen;								// 디바이스 사용 여부
	private String deviceInsertName;						// 디바이스 등록자
	private Date deviceInsertDate;							// 디바이스 등록일
	private Date deviceModifyDate;							// 디바이스 최종 수정일
	private Date deviceRemoveDate;							// 디바이스 삭제일
	private List<Integer> deviceKeyArr;
	private String deviceKeyList;
	
	private int sortListSize;	
	private int deviceSort;
	private int deviceCount;
	private int insertDeviceCount;							// 등록된 디바이스 카운트
	
	private List<DeviceEntity> deviceSelectedList;
	private List<DeviceEntity> deviceList;

	public int getDeviceKey() {
		return deviceKey;
	}
	public void setDeviceKey(int deviceKey) {
		this.deviceKey = deviceKey;
	}
	public String getDeviceModelEname() {
		return deviceModelEname;
	}
	public void setDeviceModelEname(String deviceModelEname) {
		this.deviceModelEname = deviceModelEname;
	}
	public String getDeviceModelKname() {
		return deviceModelKname;
	}
	public void setDeviceModelKname(String deviceModelKname) {
		this.deviceModelKname = deviceModelKname;
	}
	public String getDeviceMakerCode() {
		return deviceMakerCode;
	}
	public void setDeviceMakerCode(String deviceMakerCode) {
		this.deviceMakerCode = deviceMakerCode;
	}
	public String getDeviceOsCode() {
		return deviceOsCode;
	}
	public void setDeviceOsCode(String deviceOsCode) {
		this.deviceOsCode = deviceOsCode;
	}
	public String getDeviceVersion() {
		return deviceVersion;
	}
	public void setDeviceVersion(String deviceVersion) {
		this.deviceVersion = deviceVersion;
	}
	public String getDeviceTop10Open() {
		return deviceTop10Open;
	}
	public void setDeviceTop10Open(String deviceTop10Open) {
		this.deviceTop10Open = deviceTop10Open;
	}
	
	public int getDeviceTop10Count() {
		return deviceTop10Count;
	}
	public void setDeviceTop10Count(int deviceTop10Count) {
		this.deviceTop10Count = deviceTop10Count;
	}
	public int getDeviceTop10Number() {
		return deviceTop10Number;
	}
	public void setDeviceTop10Number(int deviceTop10Number) {
		this.deviceTop10Number = deviceTop10Number;
	}
	public String getDeviceOpen() {
		return deviceOpen;
	}
	public void setDeviceOpen(String deviceOpen) {
		this.deviceOpen = deviceOpen;
	}
	public String getDeviceInsertName() {
		return deviceInsertName;
	}
	public void setDeviceInsertName(String deviceInsertName) {
		this.deviceInsertName = deviceInsertName;
	}
	public Date getDeviceInsertDate() {
		return deviceInsertDate;
	}
	public void setDeviceInsertDate(Date deviceInsertDate) {
		this.deviceInsertDate = deviceInsertDate;
	}
	public Date getDeviceModifyDate() {
		return deviceModifyDate;
	}
	public void setDeviceModifyDate(Date deviceModifyDate) {
		this.deviceModifyDate = deviceModifyDate;
	}
	public Date getDeviceRemoveDate() {
		return deviceRemoveDate;
	}
	public void setDeviceRemoveDate(Date deviceRemoveDate) {
		this.deviceRemoveDate = deviceRemoveDate;
	}
	public List<Integer> getDeviceKeyArr() {
		return deviceKeyArr;
	}
	public void setDeviceKeyArr(List<Integer> deviceKeyArr) {
		this.deviceKeyArr = deviceKeyArr;
	}
	public List<DeviceEntity> getDeviceSelectedList() {
		return deviceSelectedList;
	}
	public void setDeviceSelectedList(List<DeviceEntity> deviceSelectedList) {
		this.deviceSelectedList = deviceSelectedList;
	}
	public List<DeviceEntity> getDeviceList() {
		return deviceList;
	}
	public void setDeviceList(List<DeviceEntity> deviceList) {
		this.deviceList = deviceList;
	}
	public String getDeviceKeyList() {
		return deviceKeyList;
	}
	public void setDeviceKeyList(String deviceKeyList) {
		this.deviceKeyList = deviceKeyList;
	}
	public int getSortListSize() {
		return sortListSize;
	}
	public void setSortListSize(int sortListSize) {
		this.sortListSize = sortListSize;
	}
	public int getDeviceSort() {
		return deviceSort;
	}
	public void setDeviceSort(int deviceSort) {
		this.deviceSort = deviceSort;
	}
	public int getDeviceCount() {
		return deviceCount;
	}
	public void setDeviceCount(int deviceCount) {
		this.deviceCount = deviceCount;
	}
	public int getInsertDeviceCount() {
		return insertDeviceCount;
	}
	public void setInsertDeviceCount(int insertDeviceCount) {
		this.insertDeviceCount = insertDeviceCount;
	}
	
}
