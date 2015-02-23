package kr.co.clapp.controller.user.clappConsulting;

import kr.co.clapp.entities.DeviceEntity;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/clappConsulting")
public class ClappConsultingController {
	
	private static final Logger logger = LoggerFactory.getLogger(ClappConsultingController.class);
	
	@RequestMapping(value="/consulting")
	public String consulting(DeviceEntity deviceEntity, Model model) {
		try {
	    	 
		} catch (Exception e) {
			logger.error("ClappConsultingController.consulting:Faild" , e);
		}
		return "user/sub/consulting/clappConsulting";
	} 
	
}
