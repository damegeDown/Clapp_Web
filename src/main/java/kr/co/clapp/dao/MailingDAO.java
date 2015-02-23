package kr.co.clapp.dao;

import kr.co.clapp.entities.EcrmEntity;

public interface MailingDAO {

	EcrmEntity getMailTemp(EcrmEntity ecrmEntity);
	/**
	 * 메일 발송정보 저장
	 * @param ecrmEntity
	 * @return
	 */
	int setMailMaster(EcrmEntity ecrmEntity);

}
