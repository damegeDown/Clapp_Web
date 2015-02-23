package kr.co.clapp.controller.user.mobileTesting;


import java.util.HashMap;
import java.util.List;

import kr.co.clapp.constants.CommonCode;
import kr.co.clapp.entities.CommonCodeEntity;
import kr.co.clapp.entities.DeviceEntity;
import kr.co.clapp.service.common.CommonService;
import kr.co.clapp.service.device.DeviceService;
import kr.co.digigroove.commons.messages.Messages;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/mobileTesting")
public class MobileTestingController {
	private static final Logger logger = LoggerFactory.getLogger( MobileTestingController.class );

	@Autowired
	private Messages messages;
	
	@Autowired
	private CommonService commonService;
	
	@Autowired 
	private DeviceService deviceService;
	
	HashMap<String, Object> commonCode  = new HashMap<String, Object>();
	/**
	 * 모바일 테스팅 목록
	 */
    @RequestMapping(value = "/{var}")
    public String mobileTesting(@PathVariable String var, DeviceEntity deviceEntity, Model model){
    	String returnUrl = "";
		try{
	    	deviceEntity = deviceService.getDeviceUserList(deviceEntity);
			int insertDeviceCount = deviceService.getInsertDeviceCount();
			if(var.equals("mobileTestingMain")){
				returnUrl = "user/sub/mobileTesting/mobileTesting";
			} else if(var.equals("testingDevice")){
				returnUrl = "user/mobileTesting/provideDevice";
		    }
			model.addAttribute("deviceType", var);
			model.addAttribute("deviceEntity", deviceEntity);
			model.addAttribute("insertDeviceCount", insertDeviceCount);
			} catch (Exception e) {
				logger.debug("MobileTestingController.mobileTesting:fail : "+e);
			}
    		return returnUrl;
    }
}