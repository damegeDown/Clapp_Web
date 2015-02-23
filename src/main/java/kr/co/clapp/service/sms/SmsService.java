package kr.co.clapp.service.sms;

import kr.co.clapp.entities.SmsEntity;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created by yusul on 15. 2. 5..
 */
public interface SmsService {
    @Transactional(readOnly = false)
    int insertSms(SmsEntity smsEntity) throws Exception;
}
