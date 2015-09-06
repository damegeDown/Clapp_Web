package kr.co.clapp.controller.user.product;

import javax.servlet.http.HttpSession;

import kr.co.clapp.constants.CommonCode;
import kr.co.clapp.entities.MemberEntity;
import kr.co.clapp.entities.TicketEntity;
import kr.co.clapp.service.board.BoardService;
import kr.co.clapp.service.member.MemberService;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/product")
public class ProductController {
	private static final Logger logger = LoggerFactory.getLogger( ProductController.class );
	@Autowired
	private MemberService memberService;
    @Autowired
    private BoardService boardService;
	/**
	 * 상품 목록
	 * @return
	 */
	@RequestMapping(value="/productList")
	public String productList (HttpSession session, Model model) {
		MemberEntity userInfo =  new MemberEntity();
		TicketEntity ticketInfo = new TicketEntity();
		userInfo = (MemberEntity) session.getAttribute(CommonCode.Session.USER_LOGIN_SESSION);
		try {
			/**사용자 상품 정보*/
			ticketInfo = memberService.getUserProductInfo(userInfo);
		} catch  (Exception e) {
			  logger.error("ProductController.productList:Faild" , e);
		}
		
		model.addAttribute("ticketInfo", ticketInfo);
		return "user/product/productList";
	}
    @RequestMapping(value="popup/paymentGuideSample")
    String paymentGuideSample(){
        return "introduction/popup/paymentGuideSample";
    }
    @RequestMapping(value="popup/freeJoinPopup")
    String freeJoinPopup(){
        return "introduction/popup/freeJoinPopup";
    }
    @RequestMapping(value="popup/myclappRequestPopup")
    String myclappRequestPopup(){
        return "introduction/popup/myclappRequestPopup";
    }

}
