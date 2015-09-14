package kr.co.clapp.service.applyform;

import kr.co.clapp.entities.ApplyFormEntity;

/**
 * Created by admin on 2015-08-21.
 */
public interface ApplyformService {

    /**
     * 테스팅 신청 등록
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

    ApplyFormEntity getTestRequestDetail(ApplyFormEntity applyFormEntity)throws Exception;

    /**
     * 테스팅 결과 업데이트
     * @param applyFormEntity
     * @return
     */
    int testRequestUpdate(ApplyFormEntity applyFormEntity)throws Exception;
    /**
     * 테스팅 결과 파일 수정 업데이트
     * @param applyFormEntity
     * @return
     */
    int testRequestFileUpdate(ApplyFormEntity applyFormEntity)throws Exception;
}
