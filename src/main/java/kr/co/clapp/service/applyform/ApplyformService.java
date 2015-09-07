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
}
