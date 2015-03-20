package kr.co.clapp.dao;

import java.util.List;

import kr.co.clapp.entities.EcrmEntity;

public interface EcrmDAO {

	List<EcrmEntity> getMailReport(EcrmEntity ecrmEntity);

	EcrmEntity getMailTemp(EcrmEntity ecrmEntity);
	/**
	 * 메일 발송정보 저장
	 * @param ecrmEntity
	 * @return
	 */
	int setMailMaster(EcrmEntity ecrmEntity);
	/**
	 * 메일 발송 수신자 저장
	 * @param ecrmEntity
	 * @return
	 */
	int setMailReception(EcrmEntity ecrmEntity);

	int setMailOpen(EcrmEntity ecrmEntity);

	List<EcrmEntity> getSurveyList(EcrmEntity ecrmEntity);

	EcrmEntity getSurveyInfo(EcrmEntity ecrmEntity);

	List<EcrmEntity> getSurveyReport(EcrmEntity ecrmEntity);

	List<EcrmEntity> getSurveyAnswer(EcrmEntity ecrmEntity);

	List<EcrmEntity> getSurveyQuestion(EcrmEntity ecrmEntity);

	int insertSurveyMaster(EcrmEntity ecrmEntity);

	int insertSurveyQuestion(EcrmEntity ecrmEntity);

	int insertSurveyAnswer(EcrmEntity ecrmEntity);

	int insertSurveyReceiver(EcrmEntity ecrmEntity);

	EcrmEntity getSurveyAnswerCount(EcrmEntity ecrmEntity);

}
