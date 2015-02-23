package kr.co.clapp.controller.admin.device;

import java.util.HashMap;
import java.util.List;

import kr.co.clapp.constants.CommonCode;
import kr.co.clapp.entities.CommonCodeEntity;
import kr.co.clapp.entities.DeviceEntity;
import kr.co.clapp.service.common.CommonService;
import kr.co.clapp.service.device.DeviceService;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/admin/device")
public class DeviceController {
  private static final Logger logger = LoggerFactory.getLogger( DeviceController.class );
  
  
  @Autowired
  private CommonService commonService;
  
  @Autowired 
  private DeviceService deviceService;
  
  HashMap<String, Object> commonCode  = new HashMap<String, Object>();
  
  CommonCodeEntity commonCodeEntity = new CommonCodeEntity();
  
  public DeviceController() {
  
  }
  /**
   * 디바이스 목록
   * @param deviceEntity
   * @param model
   * @return
   */
  @RequestMapping("/deviceList")
  public String deviceList(DeviceEntity deviceEntity, Model model){
  	try{
  	  //공통코드 디바이스 제조사
  	  commonCodeEntity.setCodeMasterCode(CommonCode.DEVICE_MAKER_CODE);
  	  //공통코드 디바이스 제조사 코드
  	  List<CommonCodeEntity> deviceMakerCodeNum = commonService.getCommonCodeList(commonCodeEntity);
  	  //공통코드 디바이스 OS
  	  commonCodeEntity.setCodeMasterCode(CommonCode.DEVICE_OS_CODE);
  	  //공통코드 디바이스 OS 코드
  	  List<CommonCodeEntity> deviceOsCodeNum = commonService.getCommonCodeList(commonCodeEntity);
  	  //공통코드 디바이스 정렬
  	  commonCodeEntity.setCodeMasterCode(CommonCode.DEVICE_SORT);
  	  //공통코드 디바이스 정렬 코드
  	  List<CommonCodeEntity> deviceSortCode = commonService.getCommonCodeList(commonCodeEntity);
  	  //공통코드 10개,20개,50개,100개씩보기
  	  commonCodeEntity.setCodeMasterCode(CommonCode.SORT_LIST_SIZE);
  	  //공통코드 10개,20개,50개,100개씩보기 코드
  	  List<CommonCodeEntity> sortListSizeCode = commonService.getCommonCodeList(commonCodeEntity);
  	  deviceEntity = deviceService.getDeviceList(deviceEntity);
  	  int insertDeviceCount = deviceService.getInsertDeviceCount();
  	  
  	  model.addAttribute("insertDeviceCount", insertDeviceCount);									
  	  model.addAttribute("deviceEntity", deviceEntity);									
  	  model.addAttribute("deviceMakerCodeNum", deviceMakerCodeNum);									
  	  model.addAttribute("deviceOsCodeNum", deviceOsCodeNum);									
  	  model.addAttribute("deviceSortCode", deviceSortCode);									
  	  model.addAttribute("sortListSizeCode", sortListSizeCode);									
	
  	  //공통
  	  commonCode.put("navigation", "제공 디바이스 ");										// 현재 페이지 네비게이션
  	  commonCode.put("mainMenu", "permissionDevice");									// left main menu 
  	  commonCode.put("subMenu", "device");												// left sub menu 
  	  model.addAttribute("CommonCode", commonCode);
  	} catch (Exception e) {
  	  logger.error("DeviceController.deviceList:Faild" , e);	
  	}
  	return "admin/device/deviceList";
  }
  /**
   * 디바이스 상세
   * @param popupEntity
   * @param model
   * @return
   */
  @RequestMapping("/deviceDetail")
  public String deviceDetail(DeviceEntity deviceEntity, Model model){
  	String navigation = "디바이스 > 등록";
	String submitType = "등록";
	String submitAction = "admin/device/rest/insertDevice";
	DeviceEntity deviceInfo = null;
	try {
	  //공통코드 
	  CommonCodeEntity commonCodeEntity = new CommonCodeEntity();
	  //공통코드 디바이스 제조사
	  commonCodeEntity.setCodeMasterCode(CommonCode.DEVICE_MAKER_CODE);
	  //공통코드 디바이스 제조사 코드
	  List<CommonCodeEntity> deviceMakerCodeNum = commonService.getCommonCodeList(commonCodeEntity);
	  //공통코드 디바이스 OS
	  commonCodeEntity.setCodeMasterCode(CommonCode.DEVICE_OS_CODE);
	  //공통코드 디바이스 OS 코드
	  List<CommonCodeEntity> deviceOsCodeNum = commonService.getCommonCodeList(commonCodeEntity);
	  //디바이스 상세
	  if(deviceEntity.getDeviceKey() > CommonCode.ZERO) {
		navigation = "디바이스 > 수정";
		submitType = "수정";
		submitAction = "admin/device/rest/modifyDevice";
		deviceEntity.setFileType(CommonCode.FILE_ORI_TYPE);
		deviceInfo = deviceService.getDeviceDetail(deviceEntity);
	  }
	  model.addAttribute("deviceDetail", deviceInfo);
	  model.addAttribute("deviceMakerCodeNum", deviceMakerCodeNum);									
	  model.addAttribute("deviceOsCodeNum", deviceOsCodeNum);
	  int countExposedDevice = deviceService.getCountExposedDevice();
	  model.addAttribute("countExposedDevice", countExposedDevice);
	  //공통
	  commonCode.put("navigation", navigation);	// 현재 페이지 네비게이션
	  commonCode.put("submitType", submitType);
	  commonCode.put("submitAction", submitAction);
	  commonCode.put("mainMenu", "device"); // left main menu 
	  model.addAttribute("CommonCode", commonCode);
	} catch (Exception e) {
	  logger.error("DeviceController.deviceList:Faild" , e);
	}
	model.addAttribute("navigation", navigation);
	return "admin/device/deviceDetail";
  }
}
