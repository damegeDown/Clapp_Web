package kr.co.clapp.controller.user.clappTesting;



import kr.co.clapp.entities.DeviceEntity;
import kr.co.clapp.service.device.DeviceService;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/clappTesting")
public class ClappTestingController {
	
	@Autowired 
	private DeviceService deviceService;
	
	private static final Logger logger = LoggerFactory.getLogger(ClappTestingController.class);
	
	@RequestMapping(value="/{var}")
	public String autoMain(@PathVariable String var, DeviceEntity deviceEntity, Model model) {
		String returnUrl = "";
		try {
	    	deviceEntity = deviceService.getDeviceUserList(deviceEntity);
			int insertDeviceCount = deviceService.getInsertDeviceCount();
			if(var.equals("autoMain")){
				returnUrl = "user/sub/clappTesting/autoMain";
			} else if(var.equals("autoDevice")){
				returnUrl = "user/mobileTesting/provideDevice";
		    }
			model.addAttribute("deviceEntity", deviceEntity);
			model.addAttribute("insertDeviceCount", insertDeviceCount);
		} catch (Exception e) {
			logger.error("ClappTestingController.autoMain:Faild" , e);
		}
		return returnUrl;
	}
	
}
