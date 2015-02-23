package kr.co.clapp.dao;

import kr.co.clapp.entities.SmsEntity;

/**
 * Created by yusul on 15. 2. 4..
 */
public interface SmsDAO {
    int insertSendSms(SmsEntity smsEntity);
}
