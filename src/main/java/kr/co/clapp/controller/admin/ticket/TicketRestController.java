package kr.co.clapp.controller.admin.ticket;

import kr.co.clapp.constants.CommonCode;
import kr.co.clapp.constants.ResultCode;
import kr.co.clapp.entities.ResponseEntity;
import kr.co.clapp.entities.TicketEntity;
import kr.co.clapp.service.ticket.TicketService;
import kr.co.digigroove.commons.messages.Messages;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/admin/ticket/rest")
public class TicketRestController {
	
	private static final Logger logger = LoggerFactory.getLogger(TicketRestController.class);
	
	@Autowired
	private Messages messages;
	
	@Autowired
	private TicketService ticketService;
	/**
	 * 티켓 신규 적용(등록)
	 * @param ticketEntity
	 * @return
	 */
	@RequestMapping(value = "/insertTicketProductService",  method = RequestMethod.POST)
	public ResponseEntity insertTicketProductService(TicketEntity ticketEntity) {
		ResponseEntity result = new ResponseEntity();
	  try {
		int userTypeCount = 1;//상품 적용대상 사용자 타입 1.일반 2.기업
		String resultCode = ResultCode.FAIL;
		String resultMessage = messages.getMessage("insert.fail");
		if(ticketEntity.getServiceTargetType().equals("4")) {
		  ticketEntity.getServiceApplyTicketAmount();
            ticketEntity.setUserTicketMasterKey(ticketEntity.getUserTicketMasterKey());
            ticketEntity.setServiceRestType(ticketEntity.getServiceRestType());
            ticketEntity.setServiceApplyTicketAmount(ticketEntity.getServiceApplyTicketAmount());//적용시간
		} else {
		  userTypeCount = ticketService.getUserTypeCount(ticketEntity);
		}
		ticketEntity.setServiceApplyTicketTotalAmount(userTypeCount * ticketEntity.getServiceApplyTicketAmount());

        if(ticketEntity.getServiceRestType().equals("restNew")) {
            if(ticketService.insertTicketProductServiceNew(ticketEntity) > CommonCode.ZERO) {
                resultCode = ResultCode.SUCCESS;
                resultMessage = messages.getMessage("insert.success");
                result.setResultURL("/admin/ticket/ticketProductServiceList");
            }
        }else{
            if(ticketService.insertTicketProductService(ticketEntity) > CommonCode.ZERO) {
                resultCode = ResultCode.SUCCESS;
                resultMessage = messages.getMessage("insert.success");
                result.setResultURL("/admin/ticket/ticketProductServiceList");
            }
        }

		result.setResultCode(resultCode);
		result.setResultMSG(resultMessage); 
	  } catch (Exception e) {
		logger.error("TicketRestController.insertTicketProductService:Faild" , e);
		result.setResultCode(ResultCode.FAIL);
		result.setResultMSG(messages.getMessage("insert.fail"));
	  }
	  return result;
	}
}
