package kr.co.clapp.service.applyform.impl;

import kr.co.clapp.dao.ApplyFormDAO;
import kr.co.clapp.entities.ApplyFormEntity;
import kr.co.clapp.service.applyform.ApplyformService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created by admin on 2015-08-21.
 */
@Service
@Transactional(readOnly=true)
public class ApplyformServiceimpl implements ApplyformService {
    @Autowired
    private ApplyFormDAO applyFormDAO;

    @Override
    @Transactional(readOnly = false)
    public int insertApplyForm(ApplyFormEntity applyFormEntity) throws Exception {
//        int insertResult =0;
        int result = applyFormDAO.insertApplyForm(applyFormEntity);
        return result;
    }
}
