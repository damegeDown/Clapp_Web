package kr.co.clapp.dao;


import java.util.List;

import kr.co.clapp.entities.DeviceEntity;

public interface DeviceDAO {
	/**
	 * 디바이스 목록
	 * @param deviceEntity
	 * @return
	 */
	List<DeviceEntity> getDeviceList(DeviceEntity deviceEntity);
	/**
	 * 디바이스 카운트
	 * @param deviceEntity
	 * @return
	 */
	int getDeviceCount(DeviceEntity deviceEntity);
	/**
	 * 디바이스 상세
	 * @param deviceEntity
	 * @return
	 */
	DeviceEntity getDeviceDetail(DeviceEntity deviceEntity);
	/**
	 * 디바이스 수정
	 * @param deviceEntity
	 * @return
	 */
	int modifyDevice(DeviceEntity deviceEntity);
	/**
	 * 디바이스 등록
	 * @param deviceEntity
	 * @return
	 */
	int insertDevice(DeviceEntity deviceEntity);
	/**
	 * 디바이스 삭제
	 * @param deviceEntity
	 * @return
	 */
	int removeDevice(DeviceEntity deviceEntity);
	/**
	 * 디바이스 상위 노출
	 */
	int deviceTop10Open(int deviceKey);
	/**
	 * 디바이스 상위 노출 해제
	 * @param deviceEntity
	 * @return
	 */
	int deviceTop10Close(DeviceEntity deviceEntity);
	/**
	 * 디바이스 TOP10 카운트
	 */
	int getCountExposedDevice();
	/**
	 * 등록된 디바이스 카운트
	 */
	int getInsertDeviceCount();
	/**
	 * 사용자 디바이스 목록
	 */
	List<DeviceEntity> getDeviceUserList(DeviceEntity deviceEntity);
	/**
	 * 디바이스 노출 순번
	 */
	int deviceTopChangeSeq(DeviceEntity deviceEntity);
     
}
