package kr.co.clapp.dao;

import kr.co.clapp.entities.ApplyFormEntity;

import java.util.List;

/**
 * Created by admin on 2015-08-21.
 */
public interface ApplyFormDAO {
    int insertApplyForm(ApplyFormEntity applyFormEntity);
    List<ApplyFormEntity> getTestRequestList(ApplyFormEntity boardEntity);
    /**
     * 테스팅 신청 리스트 카운트
     * @param applyFormEntity
     * @return
     */
    int getTestRequestCount(ApplyFormEntity applyFormEntity);
}
