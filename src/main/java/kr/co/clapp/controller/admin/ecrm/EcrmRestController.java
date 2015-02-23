package kr.co.clapp.controller.admin.ecrm;

import kr.co.clapp.constants.CommonCode;
import kr.co.clapp.entities.EcrmEntity;
import kr.co.clapp.entities.ResponseEntity;
import kr.co.clapp.entities.ResultEntity;
import kr.co.clapp.service.ecrm.EcrmService;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/admin/ecrm/rest")
public class EcrmRestController {
	
  private static final Logger logger = LoggerFactory.getLogger(EcrmRestController.class);
  @Autowired
  private EcrmService ecrmService;
  
  /**
   * 메일 폼 불러오기
   * @return
   */
  @RequestMapping("/getMailTemp")
  public ResultEntity getMailTemp(@RequestParam int id) {
	EcrmEntity ecrmEntity = new EcrmEntity();
	ResultEntity result = new ResultEntity();
	try {
	  ecrmEntity.setMailType(id);
	  ecrmEntity = ecrmService.getMailTemp(ecrmEntity);
	  result.setCode(ecrmEntity.getMailTempContents()); 
	  
	} catch (Exception e) {
	  logger.error("EcrmController.getMailTemp:Faild" , e);
	}
	return result;
  }
  /**
   * 메일 수신 확인
   * @param msg
   */
  @RequestMapping(value="/mailCheck/{msg}", method=RequestMethod.GET)
  public void mailCheck(@PathVariable int msg) {
	EcrmEntity ecrmEntity = new EcrmEntity();
	ecrmEntity.setMailMasterKey(msg);
	ecrmService.setMailOpen(ecrmEntity);
  }
  /**
   * 설문 답변 (홈페이지로 이동되었을시) 
   * @param ecrmEntity
   * @return
   */
  @RequestMapping(value="/insertSurveyAnswer", method=RequestMethod.POST)
  public ResponseEntity insertSurveyAnswer(EcrmEntity ecrmEntity) {
	ResponseEntity response = new ResponseEntity();
	int result = CommonCode.ZERO;
	try{
	  int[] surveyQuestionKeyArr = ecrmEntity.getSurveyQuestionKeyArr();
	  int[] surveyPointTypeArr = ecrmEntity.getSurveyPointTypeArr();
	  String[] surveyAnswerArr = ecrmEntity.getSurveyAnswerArr();
	  for(int i = 0; i < surveyQuestionKeyArr.length;i++) {
		  ecrmEntity.setSurveyQuestionKey(surveyQuestionKeyArr[i]);
		  if(surveyPointTypeArr[i] == 1) {
			  ecrmEntity.setSurveyAnswerPoint(Integer.parseInt(surveyAnswerArr[i]));
		  } else {
			  ecrmEntity.setSurveyAnswerContents(surveyAnswerArr[i]);
		  }
		  ecrmEntity.setSurveyPointType(surveyPointTypeArr[i]);
		  ecrmEntity.setUserId("test");
		  result = ecrmService.insertSurveyAnswer(ecrmEntity);
		  if(result > CommonCode.ZERO) {
		    response.setResultMSG("설문을 등록 하였습니다.");
		    response.setResultACT("self.close()");
		  }
	  }
	} catch (Exception e) {
	  logger.error("EcrmController.insertSurveyAnswer:Faild" , e);
	}
	return response;
  }
}
