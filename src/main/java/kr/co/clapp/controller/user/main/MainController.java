package kr.co.clapp.controller.user.main;

import javax.servlet.http.HttpServletRequest;

import kr.co.clapp.entities.BoardEntity;
import kr.co.clapp.entities.DeviceEntity;
import kr.co.clapp.service.board.BoardService;
import kr.co.clapp.service.device.DeviceService;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MainController {
	private static final Logger logger = LoggerFactory.getLogger( MainController.class );
	@Autowired
	private BoardService boardService;
	
	@Autowired
	private DeviceService deviceService;
	
    @RequestMapping(value = {"/user", "/"}, method = RequestMethod.GET)
	public String userMain(DeviceEntity deviceEntity, BoardEntity boardEntity, Model model, HttpServletRequest request) {
    	String url = request.getRequestURL().toString();
    	String returnUrl = "user/main";
    	/**티저페이지 이동*/
    	if(!url.contains("8080")) { 
    		returnUrl = "teaser";
    	}
    	deviceEntity = deviceService.getDeviceUserList(deviceEntity);
    	boardEntity = boardService.getTrandList(boardEntity);
		boardEntity = boardService.getSocialBlogList(boardEntity);
		model.addAttribute("deviceEntity", deviceEntity);
		model.addAttribute("boardEntity", boardEntity);
    	
		return returnUrl; 
	}
    /**
     * 이용 약관
     * @return
     */
    @RequestMapping(value = "/common/terms")
    public String terms(){
    	return "user/common/terms";
    }
    /**
     * 개인정보 취급방침
     * @return
     */
    @RequestMapping(value = "/common/privacy")
    public String privacy(){
    	return "user/common/privacy";
    }
}
