package kr.co.clapp.service.ecrm.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import kr.co.clapp.constants.CommonCode;
import kr.co.clapp.dao.EcrmDAO;
import kr.co.clapp.entities.EcrmEntity;
import kr.co.clapp.entities.MemberEntity;
import kr.co.clapp.service.ecrm.EcrmService;
import kr.co.clapp.service.member.MemberService;
import kr.co.digigroove.commons.utils.StringUtils;

@Service
@Transactional(readOnly=true)
public class EcrmServiceImpl implements EcrmService {
  @Autowired
  private EcrmDAO ecrmDAO;
  @Autowired
  private MemberService memberService;
  
  @Override
  public void getMailReport(EcrmEntity ecrmEntity) {
	List<EcrmEntity> mailList = ecrmDAO.getMailReport(ecrmEntity);
	ecrmEntity.setEcrmList(mailList);
  }
  @Override
  public EcrmEntity getMailTemp(EcrmEntity ecrmEntity) {
	ecrmEntity = ecrmDAO.getMailTemp(ecrmEntity);
	return ecrmEntity;
  }
  @Override
  @Transactional(readOnly=false) 
  public int setMailOpen(EcrmEntity ecrmEntity) {
	if(StringUtils.isEmpty(ecrmEntity.getMailMasterKey())) {
		return CommonCode.ZERO;
	}
	int result = ecrmDAO.setMailOpen(ecrmEntity);
	return result;
  }
  @Override
  public EcrmEntity getSurveyList(EcrmEntity ecrmEntity) {
	List<EcrmEntity> mailList = ecrmDAO.getSurveyList(ecrmEntity);
	ecrmEntity.setEcrmList(mailList);
	return ecrmEntity;
  }
  @Override
  public EcrmEntity getSurveyDetail(EcrmEntity ecrmEntity,  Model model) {
	//기본정보
	ecrmEntity = ecrmDAO.getSurveyInfo(ecrmEntity);
	//질문
	List<EcrmEntity> questionList = ecrmDAO.getSurveyQuestion(ecrmEntity);
	List<EcrmEntity> answerList = ecrmDAO.getSurveyAnswer(ecrmEntity);
	int answerCount = ecrmDAO.getSurveyAnswerCount(ecrmEntity);
	ecrmEntity.setAnswerList(answerList);
	ecrmEntity.setAnswerCount(answerCount);
	ecrmEntity.setQuestionList(questionList);
	//report
	List<EcrmEntity> reportList = ecrmDAO.getSurveyReport(ecrmEntity);
	ecrmEntity.setSurveyList(reportList);
    return ecrmEntity;
  }
  @Override
  @Transactional(readOnly=false)
  public int insertSurveyMaster(EcrmEntity ecrmEntity) {
    int result = 0;
    String[] recipientArr = null;
	MemberEntity memberEntity = new MemberEntity();
    // insert survey_master
    result = ecrmDAO.insertSurveyMaster(ecrmEntity);
    if(result > 0) {
      // insert survey_question
	  for(int i = 0; i < ecrmEntity.getSurveyQuestionTitleArr().length; i++){
	    ecrmEntity.setSurveyQuestionTitle(ecrmEntity.getSurveyQuestionTitleArr()[i]);
	    ecrmEntity.setSurveyQuestionType(ecrmEntity.getSurveyQuestionTypeArr()[i]);
	    ecrmEntity.setSurveySort(i+1);
	    if(ecrmEntity.getSurveyPointTypeArr()[i] == 1) {
	   	  ecrmEntity.setSurveyStartPoint(ecrmEntity.getSurveyStartPointArr()[i]);
	    	  ecrmEntity.setSurveyEndPoint(ecrmEntity.getSurveyEndPointArr()[i]);
	    } else {
		  ecrmEntity.setSurveyStartPoint(ecrmEntity.getSurveyStartTextArr()[i]);
		  ecrmEntity.setSurveyEndPoint(ecrmEntity.getSurveyEndTextArr()[i]);
	    	}
	    	  ecrmEntity.setSurveyPointType(ecrmEntity.getSurveyPointTypeArr()[i]);
	    	  result = ecrmDAO.insertSurveyQuestion(ecrmEntity);
	  }
	  // insert survey_receiver
	  // insert survey_receiver
	  //memberEntity.setUserType(String.valueOf(ecrmEntity.getTargetType() - 1));
	  //recipientArr = memberService.searchUserIdArr(memberEntity);
	  //for(int j = 0; j < recipientArr.length; j++) {
	    ecrmEntity.setTargetType(ecrmEntity.getTargetType() - 1);
	    result = ecrmDAO.insertSurveyReceiver(ecrmEntity);
	  //}
	  
    }
    return 0;
  }
  @Override
  @Transactional(readOnly=false)
  public int insertSurveyAnswer(EcrmEntity ecrmEntity) {
	int result = CommonCode.ZERO;
	result = ecrmDAO.insertSurveyAnswer(ecrmEntity);
	return result;
  }
}
