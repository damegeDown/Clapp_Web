package kr.co.clapp.service.applyform.impl;

import kr.co.clapp.dao.ApplyFormDAO;
import kr.co.clapp.entities.ApplyFormEntity;
import kr.co.clapp.entities.PageEntity;
import kr.co.clapp.service.applyform.ApplyformService;
import kr.co.digigroove.commons.messages.Messages;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by admin on 2015-08-21.
 */
@Service
@Transactional(readOnly=true)
public class ApplyformServiceimpl implements ApplyformService {
    @Autowired
    private ApplyFormDAO applyFormDAO;
    @Autowired
    private Messages messages;
    @Override
    @Transactional(readOnly = false)
    public int insertApplyForm(ApplyFormEntity applyFormEntity) throws Exception {
//        int insertResult =0;
        int result = applyFormDAO.insertApplyForm(applyFormEntity);
        return result;
    }

    /**
     * 테스팅 신청 목록
     */
    public ApplyFormEntity getTestRequestList(ApplyFormEntity applyFormEntity) throws Exception{
        applyFormEntity.setPageParams();
        if (applyFormEntity.getSortListSize() == 0) applyFormEntity.setSortListSize(PageEntity.PAGE_LIST_SIZE_PARAM);
        applyFormEntity.setPageSize(applyFormEntity.getSortListSize(), PageEntity.PAGE_GROUP_SIZE_PARAM);
        applyFormEntity.setDataSize(applyFormDAO.getTestRequestCount(applyFormEntity));
        List<ApplyFormEntity> testRequestList =applyFormDAO.getTestRequestList(applyFormEntity);
        applyFormEntity.setTestRequestList(testRequestList);

        return applyFormEntity;
    }
    @Override
    public int getTestRequestCount(
		ApplyFormEntity applyFormEntity) throws Exception {
	    int testRequestCount = applyFormDAO.getTestRequestCount(applyFormEntity);
	    return testRequestCount;
    }

}
