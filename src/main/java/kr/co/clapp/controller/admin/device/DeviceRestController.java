package kr.co.clapp.controller.admin.device;

import java.util.ArrayList;
import java.util.List;

import kr.co.clapp.constants.CommonCode;
import kr.co.clapp.constants.ResultCode;
import kr.co.clapp.entities.AdministrationFileEntity;
import kr.co.clapp.entities.DeviceEntity;
import kr.co.clapp.entities.ResponseEntity;
import kr.co.clapp.service.device.DeviceService;
import kr.co.clapp.service.file.AdministrationFileService;
import kr.co.digigroove.commons.entities.SavedFileEntity;
import kr.co.digigroove.commons.messages.Messages;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartHttpServletRequest;


@RestController
@RequestMapping("/admin/device/rest")
public class DeviceRestController {
	
	private static final Logger logger = LoggerFactory.getLogger(DeviceRestController.class);
	
	@Autowired
	private Messages messages;
	
	@Autowired
	private DeviceService deviceService;
	
	@Autowired
	AdministrationFileService administrationFileService;
	
	/**
	 * 디바이스 수정
	 * @param memberEntity
	 * @return
	 */
	@RequestMapping(value = "/modifyDevice",  method = RequestMethod.POST)
	public ResponseEntity modifyDevice(MultipartHttpServletRequest req,DeviceEntity deviceEntity) {
	  ResponseEntity result = new ResponseEntity();
	  //List<SavedFileEntity> saveFileList = new ArrayList<SavedFileEntity>();
	  AdministrationFileEntity administrationFileEntity = new AdministrationFileEntity();
	  try {
		String resultCode = ResultCode.FAIL;
		String resultMessage = messages.getMessage("modify.fail");
		//상품 수정 성공시
		if(deviceService.modifyDevice(deviceEntity) > CommonCode.ZERO) {
		  resultCode = ResultCode.SUCCESS;
		  resultMessage = messages.getMessage("modify.success");
		  // 파일 업로드
		  if(req.getFileNames().hasNext()) {
			  administrationFileEntity.setFileTargetKey(deviceEntity.getDeviceKey());
			  administrationFileEntity.setFileTarget(CommonCode.FILE_TARGET_DEVICE);
			  administrationFileEntity.setThumbYn(CommonCode.FILE_THUMB_Y);
			  deviceEntity.setFileTarget(CommonCode.FILE_TARGET_DEVICE);
			  deviceEntity.setThumbYn(CommonCode.FILE_THUMB_Y);
			  //기존 파일 삭제 
			  this.removeFile(deviceEntity);
			  //파일 등록
			  this.saveFileForFormData(req, administrationFileEntity);
		  }
		}
		result.setResultCode(resultCode);
		result.setResultMSG(resultMessage);
		result.setResultURL("/admin/device/deviceList");
	  } catch (Exception e) {
		logger.error("DeviceRestController.modifyDevice:Faild" , e);
		result.setResultCode(ResultCode.FAIL);
		result.setResultMSG(messages.getMessage("modify.fail"));
	  }
	  return result;
	}
	
	/**
	 * 디바이스 등록
	 * @param popupEntity
	 * @return
	 */
	@RequestMapping(value = "/insertDevice",  method = RequestMethod.POST)
	public ResponseEntity insertDevice(DeviceEntity deviceEntity, MultipartHttpServletRequest req) {
      ResponseEntity result = new ResponseEntity();
	  AdministrationFileEntity administrationFileEntity = new AdministrationFileEntity();
	  try {
		String resultCode = ResultCode.FAIL;
		String resultMessage = messages.getMessage("insert.fail");
		if(deviceService.insertDevice(deviceEntity) > CommonCode.ZERO) {
		  resultCode = ResultCode.SUCCESS;
		  resultMessage = messages.getMessage("insert.success"); 
		  result.setResultURL("/admin/device/deviceList");
		  // 파일 업로드
		  if(req.getFileNames().hasNext()) {
			  administrationFileEntity.setFileTargetKey(deviceEntity.getDeviceKey());
			  administrationFileEntity.setFileTarget(CommonCode.FILE_TARGET_DEVICE);
			  administrationFileEntity.setThumbYn(CommonCode.FILE_THUMB_Y);
			  this.saveFileForFormData(req, administrationFileEntity);
		  }
		}
		result.setResultCode(resultCode);
		result.setResultMSG(resultMessage); 
	  } catch (Exception e) {
		logger.error("DeviceRestController.insertDevice:Faild" , e);
		result.setResultCode(ResultCode.FAIL);
		result.setResultMSG(messages.getMessage("insert.fail"));
	  }
	  return result;
	}
	/**
	 * 디바이스 삭제
	 * @param deviceEntity
	 * @return
	 */
	@RequestMapping(value = "/removeDevice",  method = RequestMethod.POST)
	public ResponseEntity removeDevice(@RequestParam int id) {
		ResponseEntity result = new ResponseEntity();
	  try {
		DeviceEntity deviceEntity = new DeviceEntity();
		deviceEntity.setDeviceKey(id);
		String resultCode = ResultCode.FAIL;
		String resultMessage = messages.getMessage("remove.fail");
		if(deviceService.removeDevice(deviceEntity) > CommonCode.ZERO) {
		  resultCode = ResultCode.SUCCESS;
		  resultMessage = messages.getMessage("remove.success"); 
		  result.setResultURL("/admin/device/deviceList");
		}
		result.setResultCode(resultCode);
		result.setResultMSG(resultMessage); 
	  } catch (Exception e) {
		logger.error("DeviceRestController.removeDevice:Faild" , e);
		result.setResultCode(ResultCode.FAIL);
		result.setResultMSG(messages.getMessage("remove.fail"));
	  }
	  return result;
	}
	/**
	 * 디바이스 상위 노출
	 */
	@RequestMapping(value = "/deviceTopOpen",  method = RequestMethod.POST, consumes = "application/json", produces = "application/json")
	public ResponseEntity deviceTop10Open(@RequestBody DeviceEntity deviceEntity) {
		ResponseEntity result = new ResponseEntity();
	  try {
		String resultCode = ResultCode.FAIL;
		String resultMessage = messages.getMessage("top10open.fail");
		if(deviceService.deviceTop10Open(deviceEntity) > CommonCode.ZERO) {
		  resultCode = ResultCode.SUCCESS;
		  resultMessage = messages.getMessage("top10open.success"); 
		  result.setResultURL("/admin/device/deviceList");
		}
		result.setResultCode(resultCode);
		result.setResultMSG(resultMessage); 
	  } catch (Exception e) {
		logger.error("DeviceRestController.deviceTopOpen:Faild" , e);
		result.setResultCode(ResultCode.FAIL);
		result.setResultMSG(messages.getMessage("top10open.fail"));
	  }
	  return result;
	}
	/**
	 * 디바이스 노출 순번 저장
	 * @param deviceEntity
	 * @return
	 */
	@RequestMapping(value = "/deviceTopChangeSeq",  method = RequestMethod.POST, consumes = "application/json", produces = "application/json")
	public ResponseEntity deviceTopChangeSeq(@RequestBody DeviceEntity deviceEntity) {
		ResponseEntity result = new ResponseEntity();
	  try {
		String resultCode = ResultCode.FAIL;
		String resultMessage = messages.getMessage("top10openNumber.fail");
		if(deviceService.deviceTopChangeSeq(deviceEntity) > CommonCode.ZERO) {
		  resultCode = ResultCode.SUCCESS;
		  resultMessage = messages.getMessage("top10openNumber.success"); 
		  result.setResultURL("/admin/device/deviceList");
		}
		result.setResultCode(resultCode);
		result.setResultMSG(resultMessage); 
	  } catch (Exception e) {
		logger.error("DeviceRestController.deviceTopChangeSeq:Faild" , e);
		result.setResultCode(ResultCode.FAIL);
		result.setResultMSG(messages.getMessage("top10openNumber.fail"));
	  }
	  return result;
	}
	/**
	 * 디바이스 상위 노출 해제
	 * @param deviceEntity
	 * @return
	 */
	@RequestMapping(value = "/deviceTopClose",  method = RequestMethod.POST, consumes = "application/json", produces = "application/json")
	public ResponseEntity deviceTopClose(@RequestBody DeviceEntity deviceEntity) {
		ResponseEntity result = new ResponseEntity();
	  try {
		String resultCode = ResultCode.FAIL;
		String resultMessage = messages.getMessage("top10close.fail");
		if(deviceService.deviceTop10Close(deviceEntity) > CommonCode.ZERO) {
		  resultCode = ResultCode.SUCCESS;
		  resultMessage = messages.getMessage("top10close.success"); 
		  result.setResultURL("/admin/device/deviceList");
		}
		result.setResultCode(resultCode);
		result.setResultMSG(resultMessage); 
	  } catch (Exception e) {
		logger.error("DeviceRestController.deviceTopClose:Faild" , e);
		result.setResultCode(ResultCode.FAIL);
		result.setResultMSG(messages.getMessage("top10close.fail"));
	  }
	  return result;
	}
	
	/**
	 * 파일 저장
	 * @param req
	 * @param administrationFileEntity
	 * @return
	 */
	public List<SavedFileEntity> saveFileForFormData(MultipartHttpServletRequest req, AdministrationFileEntity administrationFileEntity) {
		List<SavedFileEntity> saveFileList = new ArrayList<SavedFileEntity>();
		try {
			administrationFileService.removeAdministrationFile(administrationFileEntity);
			saveFileList = administrationFileService.saveFileForFormData(req, administrationFileEntity);
		} catch (Exception e) {
			logger.error("DeviceRestController.saveFileForFormData" , e);
		}
		
		return saveFileList;
	}
	
	/**
	 * 파일 저장
	 * @param req
	 * @param administrationFileEntity
	 * @return
	 */
	public void removeFile(AdministrationFileEntity administrationFileEntity) {
		try {
			administrationFileService.removeFile(administrationFileEntity);
		} catch (Exception e) {
			logger.error("DeviceRestController.removeFile" , e);
		}
		
	}
}