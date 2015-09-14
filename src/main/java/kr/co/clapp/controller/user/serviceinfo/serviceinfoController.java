package kr.co.clapp.controller.user.serviceinfo;

import kr.co.clapp.constants.CommonCode;
import kr.co.clapp.entities.MemberEntity;
import kr.co.clapp.service.member.MemberService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

/**
 * Created by admin on 2015-08-13.
 */


@Controller
@RequestMapping(value="/serviceinfo")
public class serviceinfoController {
    private static final Logger logger = LoggerFactory.getLogger(serviceinfoController.class);
    @Autowired
    private MemberService memberService;


    @RequestMapping(value="/infoMain")
    public String infoMain(HttpSession session){
        MemberEntity userInfo =  new MemberEntity();
        userInfo = (MemberEntity) session.getAttribute(CommonCode.Session.USER_LOGIN_SESSION);
        try {

        } catch  (Exception e) {
            logger.error("ProductController.productList:Faild" , e);
        }
        return "user/sub/serviceinfo/infoMain";
    }
    @RequestMapping(value="/exGuide")
    public String exGuide(HttpSession session){
        MemberEntity userInfo =  new MemberEntity();
        userInfo = (MemberEntity) session.getAttribute(CommonCode.Session.USER_LOGIN_SESSION);
        try {

        } catch  (Exception e) {
            logger.error("ProductController.productList:Faild" , e);
        }
        return "user/sub/serviceinfo/exGuide";
    }
}
