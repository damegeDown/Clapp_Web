package kr.co.clapp.service.sms.impl;

import kr.co.clapp.dao.SmsDAO;
import kr.co.clapp.entities.SmsEntity;
import kr.co.clapp.service.sms.SmsService;
import kr.co.digigroove.commons.utils.DateUtils;
import kr.co.digigroove.commons.utils.NumberUtils;
import kr.co.digigroove.commons.utils.StringUtils;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created by yusul on 15. 2. 5..
 */
@Service
public class SmsServiceImpl implements SmsService{
    @Autowired
    private SmsDAO smsDAO;

    @Override
    @Transactional(readOnly = false)
    public int insertSms(SmsEntity smsEntity) throws Exception{
        int result = 0;
        //랜덤 숫자 10 
        smsEntity.setRanNum(NumberUtils.getRandomNumber(Integer.class, 10));
        //밀리세컨드 
        DateUtils.getDateToMillsec(DateUtils.getDate());
        result = smsDAO.insertSendSms(smsEntity);
        return result;
    }
}
