package kr.co.clapp.service.device;

import kr.co.clapp.entities.DeviceEntity;

public interface DeviceService {
	/**
	 * 디바이스 목록
	 * @param deviceEntity
	 * @return
	 * @throws Exception
	 */
	DeviceEntity getDeviceList(DeviceEntity deviceEntity) throws Exception;
	/**
	 * 디바이스 상세
	 * @param deviceEntity
	 * @return
	 * @throws Exception
	 */
	DeviceEntity getDeviceDetail(DeviceEntity deviceEntity) throws Exception;
	/**
	 * 디바이스 수정
	 * @param deviceEntity
	 * @return
	 * @throws Exception
	 */
	int modifyDevice(DeviceEntity deviceEntity) throws Exception;
	/**
	 * 디바이스 등록
	 * @param deviceEntity
	 * @return
	 * @throws Exception
	 */
	int insertDevice(DeviceEntity deviceEntity) throws Exception;
	/**
	 * 디바이스 삭제
	 * @param deviceEntity
	 * @return
	 * @throws Exception
	 */
	int removeDevice(DeviceEntity deviceEntity) throws Exception;
	/**
	 * 디바이스 상위 노출
	 */
	int deviceTop10Open(DeviceEntity deviceEntity) throws Exception;
	/**
	 * 디바이스 상위 노출 해제
	 * @param deviceEntity
	 * @return
	 * @throws Exception
	 */
	int deviceTop10Close(DeviceEntity deviceEntity) throws Exception;
	/**
	 * 디바이스 TOP10 카운트
	 */
	int getCountExposedDevice() throws Exception;
	/**
	 * 등록된 디바이스 카운트
	 */
	int getInsertDeviceCount();
	/**
	 * 사용자 디바이스 목록
	 */
	DeviceEntity getDeviceUserList(DeviceEntity deviceEntity);
	/**
	 * 디바이스 노출 순번
	 */
	int deviceTopChangeSeq(DeviceEntity deviceEntity);
	
}

