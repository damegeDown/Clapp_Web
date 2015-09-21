package kr.co.clapp.controller.user.main;

import javax.servlet.http.HttpServletRequest;

import kr.co.clapp.constants.CommonCode;
import kr.co.clapp.entities.*;
import kr.co.clapp.service.banner.BannerService;
import kr.co.clapp.service.board.BoardService;
import kr.co.clapp.service.common.CommonService;
import kr.co.clapp.service.customer.CustomerService;
import kr.co.clapp.service.device.DeviceService;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@Controller
public class MainController {
	private static final Logger logger = LoggerFactory.getLogger( MainController.class );
	@Autowired
	private BoardService boardService;
    @Autowired
    private CustomerService customerService;
	@Autowired
	private DeviceService deviceService;
	// Banner Add Start
	@Autowired
	private BannerService bannerService;
	// Banner Add End
    @Autowired
    private CommonService commonService;

    HashMap<String, Object> commonCode  = new HashMap<String, Object>();

    CommonCodeEntity commonCodeEntity = new CommonCodeEntity();

    @RequestMapping(value = {"/user", "/"}, method = RequestMethod.GET)
	public String userMain(DeviceEntity deviceEntity,  HttpServletRequest request,BoardNoticeEntity boardNoticeEntity, BoardQnaEntity boardQnaEntity,Model model) {
    	String url = request.getRequestURL().toString();
    	String returnUrl = "user/main";
    	/**티저페이지 이동*/
    	//if(!url.contains("8080")) { 
    		//returnUrl = "teaser"; 
    	//}

//         CommonCodeEntity commonCodeEntity = new CommonCodeEntity();
//        commonCodeEntity.setCodeMasterCode(CommonCode.QNA_CATEGORY);
//        List<CommonCodeEntity> qnaCategoryCode = commonService.getCommonCodeList(commonCodeEntity);
        boardNoticeEntity = customerService.getBoardNoticeUserList(boardNoticeEntity);
        boardQnaEntity = customerService.getBoardQnaUserList(boardQnaEntity);
        deviceEntity = deviceService.getDeviceUserList(deviceEntity);
        
        // Banner Add Start
		List<BannerEntity> bannerEntitys = new ArrayList<BannerEntity>();
		try {
			bannerEntitys = bannerService.getBannerMain();
		} catch (Exception e) {
			e.printStackTrace();
		}
        // Banner Add End

        model.addAttribute("boardNoticeEntity", boardNoticeEntity);
        model.addAttribute("boardQnaEntity", boardQnaEntity);
//        model.addAttribute("qnaCategoryCode", qnaCategoryCode);
        model.addAttribute("CommonCode", commonCode);
		model.addAttribute("deviceEntity", deviceEntity);
		// Banner Add Start
		model.addAttribute("bannerEntity", bannerEntitys);
		// Banner Add End

    	
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


    /**
     * 공사중
     * @return
     */
    @RequestMapping(value="popup/noticePopup")
    String freeJoinPopup(){
        return "introduction/popup/noticePopup";
    }
}
