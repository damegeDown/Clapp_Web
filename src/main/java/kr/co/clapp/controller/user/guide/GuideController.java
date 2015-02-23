package kr.co.clapp.controller.user.guide;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class GuideController {
	private static final Logger logger = LoggerFactory.getLogger( GuideController.class );
	
	@RequestMapping(value="/guide/{guide}", method=RequestMethod.GET)
	public String guide(@PathVariable String guide, Model model) {
		try {
			model.addAttribute("topMenu", guide);
		} catch (Exception e) {
			logger.debug("GuideController.guide:fail : "+e);
		}
		return "guide/"+guide;
	}
}
