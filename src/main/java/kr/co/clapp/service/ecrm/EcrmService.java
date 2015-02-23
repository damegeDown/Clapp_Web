package kr.co.clapp.service.ecrm;

import org.springframework.ui.Model;

import kr.co.clapp.entities.EcrmEntity;

public interface EcrmService {
	/**
	 * 메일
	 * @param ecrmEntity
	 */
	void getMailReport(EcrmEntity ecrmEntity);

	/**
	 * 메일 템플릿 불러오기
	 * @param ecrmEntity
	 * @return
	 */
	EcrmEntity getMailTemp(EcrmEntity ecrmEntity);
	
	/**
	 * 메일 수신 확인
	 * @param ecrmEntity
	 * @return
	 */
	int setMailOpen(EcrmEntity ecrmEntity);
	
	/**
	 * 설문 리스트
	 * @param ecrmEntity
	 * @return
	 */
	EcrmEntity getSurveyList(EcrmEntity ecrmEntity);

	/**
	 * 설문 상세
	 * @param ecrmEntity
	 * @param model
	 * @return
	 */
	EcrmEntity getSurveyDetail(EcrmEntity ecrmEntity,  Model model);

	/**
	 * 설문 등록
	 * @param ecrmEntity
	 * @return
	 */
	int insertSurveyMaster(EcrmEntity ecrmEntity);
	/**
	 * 답변 등록
	 * @param ecrmEntity
	 * @return
	 */
	int insertSurveyAnswer(EcrmEntity ecrmEntity);

}
