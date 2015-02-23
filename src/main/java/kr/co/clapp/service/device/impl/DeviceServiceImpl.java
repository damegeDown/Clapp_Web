package kr.co.clapp.service.device.impl;

import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.clapp.constants.CommonCode;
import kr.co.clapp.dao.DeviceDAO;
import kr.co.clapp.entities.DeviceEntity;
import kr.co.clapp.entities.PageEntity;
import kr.co.clapp.service.device.DeviceService;
import kr.co.digigroove.commons.messages.Messages;

@Service
@Transactional(readOnly=true)
public class DeviceServiceImpl implements DeviceService {
  @Autowired
  private DeviceDAO deviceDAO;

  @Autowired
  private Messages messages;
  /**
   * 디바이스 목록
   */
  public DeviceEntity getDeviceList(DeviceEntity deviceEntity) throws Exception{
	deviceEntity.setPageParams();
	if (deviceEntity.getSortListSize() == 0) deviceEntity.setSortListSize(PageEntity.PAGE_LIST_SIZE_PARAM);
	deviceEntity.setPageSize(deviceEntity.getSortListSize(), PageEntity.PAGE_GROUP_SIZE_PARAM);
	deviceEntity.setDataSize(deviceDAO.getDeviceCount(deviceEntity));
	List<DeviceEntity> deviceListResult = deviceDAO.getDeviceList(deviceEntity);
	deviceEntity.setDeviceList(deviceListResult);
	
	DeviceEntity deviceEntity2 = new DeviceEntity();
	deviceEntity2.setDeviceTop10Open("Y");
	List<DeviceEntity> deviceSelectedList = deviceDAO.getDeviceList(deviceEntity2);
	deviceEntity.setDeviceSelectedList(deviceSelectedList);
	return deviceEntity;
  }
  /**
   * 디바이스 상세
   */
  @Override
  public DeviceEntity getDeviceDetail(DeviceEntity deviceEntity){
	  DeviceEntity deviceInfo = deviceDAO.getDeviceDetail(deviceEntity);
	  return deviceInfo;
  }
  /**
   * 디바이스 수정
   */
  @Override
  @Transactional(readOnly = false, rollbackFor = Exception.class)
  public int modifyDevice(DeviceEntity deviceEntity) throws Exception{
	  int result = CommonCode.ZERO;
	  result = deviceDAO.modifyDevice(deviceEntity);
	  return result;
  }
  /**
   * 디바이스 등록
   */
  @Override
  @Transactional(readOnly = false, rollbackFor = Exception.class)
  public int insertDevice(DeviceEntity deviceEntity) throws Exception{
	  int result = 0;
	  result = deviceDAO.insertDevice(deviceEntity);
	  return result;
  }
  /**
   * 디바이스 삭제
   */
  @Override
  @Transactional(readOnly = false, rollbackFor = Exception.class)
  public int removeDevice(DeviceEntity deviceEntity) throws Exception{
	  int result = 0;
	  result = deviceDAO.removeDevice(deviceEntity);
	  return result;
  }
  /**
   * 디바이스 상위 노출
   */
  @Override
  @Transactional(readOnly = false, rollbackFor = Exception.class)
  public int deviceTop10Open(DeviceEntity deviceEntity) throws Exception{
	  int result = 0;
	  result = deviceDAO.deviceTop10Open(deviceEntity);
	  return result;
  }
  /**
   * 디바이스 상위 노출 해제
   */
  @Override
  @Transactional(readOnly = false, rollbackFor = Exception.class)
  public int deviceTop10Close(DeviceEntity deviceEntity) throws Exception{
	  int result = 0;
	  result = deviceDAO.deviceTop10Close(deviceEntity);
	  return result;
  }
  /**
   * 디바이스 TOP10 카운트
   */
  @Override
	public int getCountExposedDevice() {
		return deviceDAO.getCountExposedDevice();
	}
  /**
   * 등록된 디바이스 카운트
   */
@Override
public int getInsertDeviceCount() {
	return deviceDAO.getInsertDeviceCount();
}
/**
 * 사용자 디바이스 목록
 */
@Override
public DeviceEntity getDeviceUserList(DeviceEntity deviceEntity) {
	deviceEntity.setPageParams();
	List<DeviceEntity> deviceListResult = deviceDAO.getDeviceUserList(deviceEntity);
	deviceEntity.setDeviceList(deviceListResult);
	return deviceEntity;
}
}

