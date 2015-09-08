package kr.co.clapp.service.applyform;

import kr.co.clapp.entities.ApplyFormEntity;

/**
 * Created by admin on 2015-08-21.
 */
public interface ApplyformService {

    /**
     *
     * @param applyFormEntity
     * @return
     */
    int insertApplyForm(ApplyFormEntity applyFormEntity) throws Exception;
    /**
     * 테스팅 신청 목록
     * @param applyFormEntity
     * @return
     * @throws Exception
     */
    ApplyFormEntity getTestRequestList(ApplyFormEntity applyFormEntity) throws Exception;

    int getTestRequestCount(ApplyFormEntity applyFormEntity) throws  Exception;

}
