package kr.co.clapp.service.ticket.impl;

import kr.co.clapp.constants.CommonCode;
import kr.co.clapp.dao.MemberDAO;
import kr.co.clapp.dao.TicketDAO;
import kr.co.clapp.entities.MemberEntity;
import kr.co.clapp.entities.PageEntity;
import kr.co.clapp.entities.TicketEntity;
import kr.co.clapp.service.ticket.TicketService;
import kr.co.digigroove.commons.messages.Messages;
import kr.co.digigroove.commons.utils.DateUtils;
import kr.co.digigroove.commons.utils.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

@Service
@Transactional(readOnly=true)
public class TicketServiceImpl implements TicketService {
  @Autowired
  private TicketDAO ticketDAO;
  @Autowired
  private MemberDAO memberDAO;
  @Autowired
  private Messages messages;
  /**
   * 티켓 사용 내역 관리 목록
   */
  @Override
  public TicketEntity getUserTicketUsedList(TicketEntity ticketEntity) throws Exception {
	ticketEntity.setPageParams();
	if(ticketEntity.getSortListSize() == 0) ticketEntity.setSortListSize(PageEntity.PAGE_LIST_SIZE_PARAM);
	ticketEntity.setPageSize(ticketEntity.getSortListSize(), PageEntity.PAGE_GROUP_SIZE_PARAM);
	ticketEntity.setDataSize(ticketDAO.getUserTicketUsedCount(ticketEntity));
	List<TicketEntity> userTicketUsedListResult = ticketDAO.getUserTicketUsedList(ticketEntity);
	ticketEntity.setUserTicketUsedList(userTicketUsedListResult);
    return ticketEntity;
}
  /**
   * 티켓 적용 서비스 목록
   */
  @Override
  public TicketEntity getTicketProductServiceList(TicketEntity ticketEntity) throws Exception {
	ticketEntity.setPageParams();
	if(ticketEntity.getSortListSize() == 0) ticketEntity.setSortListSize(PageEntity.PAGE_LIST_SIZE_PARAM);
	ticketEntity.setPageSize(ticketEntity.getSortListSize(), PageEntity.PAGE_GROUP_SIZE_PARAM);
	ticketEntity.setDataSize(ticketDAO.getTicketProductServiceCount(ticketEntity));
	List<TicketEntity> ticketProductServiceListResult = ticketDAO.getTicketProductServiceList(ticketEntity);
	ticketEntity.setTicketProductServiceList(ticketProductServiceListResult);
    return ticketEntity;
	}
    /**
     * 티켓 적용 서비스 신규 적용 NEW(등록)
     */
    @Override
    @Transactional(readOnly = false, rollbackFor = Exception.class)
    public int insertTicketProductServiceNew(TicketEntity ticketEntity) throws Exception{

        /**신규 티켓저장*/
        ticketEntity.setUserMasterKey(ticketEntity.getUserMasterKey());
        ticketEntity.setProductMasterKey(ticketEntity.getProductMasterKey());    //상품키
        ticketEntity.setProductName(ticketEntity.getServiceProductName());        //상품이름
        ticketEntity.setPaymentTid(ticketEntity.getServiceApplyReason());
        ticketEntity.setTicketStartExpirationDate(ticketEntity.getTicketStartExpirationDate());    //사용가능기한-시작
        ticketEntity.setTicketEndExpirationDate(ticketEntity.getTicketEndExpirationDate());    //사용가능기한-종료
        ticketEntity.setTicketApplyDate(DateUtils.getDate());
        /** 사용순위가 우선인 티겟 정보**/
        int priUserMasterKey =0;
        int priAmountTicket =0;
        int ticketLen = 0;
        List<TicketEntity> ticketList = null;
        MemberEntity aprioritieTicketKey = new MemberEntity();
        aprioritieTicketKey.setUserMasterKey(ticketEntity.getUserMasterKey());
        ticketList=ticketDAO.getPrioritieTicketKey(aprioritieTicketKey);
        ticketLen = ticketList.size();
        if(ticketLen > CommonCode.ZERO) {
            priUserMasterKey = ticketList.get(0).getUserTicketMasterKey();//사용순위가 우선인 티켓 마스터 키
            priAmountTicket = ticketList.get(0).getTicketAvilableAmount();//사용순위가 우선인 사용가능 티켓
            /** 기존 가용한 티켓 사용종료 처리*/
            TicketEntity ticketParam2 = new TicketEntity();
            ticketParam2.setUserTicketMasterKey(priUserMasterKey);
            ticketParam2.setUserMasterKey(ticketEntity.getUserMasterKey());
            ticketParam2.setUseYn("N");
            ticketParam2.setTicketAvilableAmount(CommonCode.ZERO);
            ticketDAO.modifyUserTicketMasterUse(ticketParam2);
        }
        /** 저장될 티켓 수**/
        ticketEntity.setTicketAmount(ticketEntity.getServiceApplyTicketAmount());//구입시간
        ticketEntity.setTicketAvilableAmount(ticketEntity.getServiceApplyTicketAmount()+priAmountTicket);//사용가능
        ticketEntity.setUseYn("Y");
        int result = ticketDAO.insertUserTicketMaster(ticketEntity);
//        int InsertResult = ticketDAO.insertTicketProductService(ticketEntity);
//        if(InsertResult > CommonCode.ZERO) {
//           ticketDAO.selectUserType(ticketEntity);
//        }
        return result;
    }
  /**
   * 티켓 적용 서비스 신규 적용(등록)[기존상품]
   */
  @Override
  @Transactional(readOnly = false, rollbackFor = Exception.class)
  public int insertTicketProductService(TicketEntity ticketEntity) throws Exception{
	int selectResult = 0;
	int ticket = 0;
	int avilableTicket = 0;
    String insertType = null;
	Date endDate = null;
	TicketEntity ticketInfo = new TicketEntity();
	TicketEntity ticketParam = ticketEntity;
    TicketEntity ticketNew = ticketEntity;
	//소유한 티켓 정보를 불러온다.
	ticketInfo = ticketDAO.selectTicketInfo(ticketParam);

	int result = ticketDAO.insertTicketProductService(ticketEntity);
	MemberEntity memberEntity = new MemberEntity();
	  if(result > 0 ){
		  selectResult = ticketDAO.selectUserType(ticketEntity);

		  List<String> userId = (List<String>) ticketEntity.getUserIdArr();
		  //if(userId.size() < 1) userId.add(ticketEntity.getUserId());

		  /** 개별 계정 부여시 */
		  if(ticketEntity.getServiceTargetType().equals("4")) {
			  for(int i = 0; i < userId.size(); i++ ) {
				  memberEntity.setUserId(userId.get(i));
				  memberEntity = memberDAO.getUserInfoId(memberEntity);

                  ticketEntity.setUserMasterKey(ticketEntity.getUserMasterKey());//userMasterKey 불러온다
                  ticketEntity.setUserTicketMasterKey(ticketEntity.getUserTicketMasterKey());
                  ticketEntity.setUserMasterKey(ticketEntity.getUserMasterKey());
                  ticketEntity.setUserId(memberEntity.getUserId());
                  ticketEntity.setUserType(memberEntity.getUserType());

//				   /** update ticket for user_ticket_master */
                  ticketDAO.modifyServiceTicketMaster(ticketEntity);
                  /** insert ticket for user_ticket_history*/
                  ticketDAO.insertServiceTicketHistory(ticketEntity);
                  }
              }else {
              /**개별 user_ticket_master_key 지정으로 교체 필요 [김지훈]**/
			  /** update ticket for user_ticket_master */
			  ticketDAO.modifyServiceTicketMaster(ticketEntity);
			  /** insert ticket for user_ticket_history*/
			  ticketDAO.insertServiceTicketHistory(ticketEntity);
		  }
	  }
	  return result > 0 ? selectResult : result;
  }
  /**
   * 이달의 티켓 사용 개수 카운트
   * @param ticketEntity
   * @return
   * @throws Exception
   */
  @Override
  public TicketEntity getTicketSum(TicketEntity ticketEntity) throws Exception {
	TicketEntity ticketSum = ticketDAO.getTicketSum(ticketEntity);
	return ticketSum;
  }
  /**
   * 티켓 적용 서비스 유저 타입 카운트
   * @param ticketEntity
   * @return
   * @throws Exception
   */
  @Override
  public int getUserTypeCount(TicketEntity ticketEntity) throws Exception {
	int userTypeCount = ticketDAO.getUserTypeCount(ticketEntity);
	return userTypeCount;
  }
  
  /**
   * 사용자 티켓발급
   */
  @Override
  public int insertUserTicketMaster(TicketEntity ticketEntity) throws Exception {
	  int result = ticketDAO.insertUserTicketMaster(ticketEntity);
	  return result;
  }
  /**
   * 사용가능 티켓 
   */
	@Override 
	public TicketEntity getAvailableTicket(TicketEntity ticketEntity) {
		ticketEntity =ticketDAO.getAvailableTicket(ticketEntity);
		int result = 0;
		if(!StringUtils.isEmpty(ticketEntity)){
			result = ticketEntity.getTicketAvilableAmount();
		}
		return ticketEntity;
	}
	/**
	 * 사용자 티켓 사용 우선순위 위인 티켓키
	 */
	@Override
	public List<TicketEntity> getPrioritieTicketKey(MemberEntity memberEntity) {
		return ticketDAO.getPrioritieTicketKey(memberEntity);
	}
    /**
     * 사용자 티켓 사용 우선순위 위인 티켓키(테스팅 신청)
     */
    @Override
    public List<TicketEntity> getPrioritieTicketKey2(MemberEntity memberEntity) {
        return ticketDAO.getPrioritieTicketKey2(memberEntity);
    }
    @Override
    public List<TicketEntity> getUserTicketProductList(TicketEntity ticketEntity){
        return ticketDAO.getUserTicketProductList(ticketEntity);
    }
	/**
	 * 사용자 티켓 차감 처리
	 */
	@Override
	@Transactional(readOnly = false, rollbackFor = Exception.class)
	public int doUsedTicket(TicketEntity ticketEntity) {
		return ticketDAO.doUsedTicket(ticketEntity);
	}
	/**
	 * 사용자 티켓 사용 히스토리 입력
	 */
	@Override
	@Transactional(readOnly = false, rollbackFor = Exception.class)
	public int insertUsedTicketHistory(TicketEntity ticketEntity) {
		return ticketDAO.insertUsedTicketHistory(ticketEntity);
	}
	/**
	 * 이용현황 상품 정보 
	 */
	@Override
	public TicketEntity selectTicketInfo(TicketEntity ticketEntity) {
		ticketEntity.setTicketHistoryList(ticketDAO.selectTicketHistoryList(ticketEntity));
		return ticketEntity;
	}
	/**
	 * 이용현황
	 */
	@Override 
	public TicketEntity selectTicketUsedHistory(TicketEntity ticketParam) { 
		TicketEntity ticketInfo = new TicketEntity();
		ticketInfo = ticketDAO.selectTicketUsedHistoryCount(ticketParam);
		ticketParam.setPageParams();
		ticketParam.setPageSize(ticketParam.getSearchListSize(), PageEntity.PAGE_GROUP_SIZE_PARAM);
		ticketParam.setDataSize(ticketInfo.getHistoryCount());
		ticketParam.setReservationWaitCount(ticketInfo.getReservationWaitCount());
		ticketParam.setReservationFinishCount(ticketInfo.getReservationFinishCount());
        ticketParam.setUseCount(ticketInfo.getUseCount());
		if(CommonCode.ZERO < ticketInfo.getHistoryCount()) {
			ticketParam.setHistoryList(ticketDAO.selectTicketUsedHistory(ticketParam));
		}
		return ticketParam;
	}
	@Override
	public TicketEntity getMyHistory(TicketEntity ticketParam) {
		TicketEntity ticketInfo = new TicketEntity();
		ticketInfo = ticketDAO.selectTicketInfo(ticketParam);
		ticketParam.setPageParams();
		ticketParam.setPageSize(ticketParam.getSearchListSize(), PageEntity.PAGE_GROUP_SIZE_PARAM);
        int dataSize = ticketDAO.getMyHistoryCount(ticketParam);
		ticketParam.setDataSize(dataSize);
		if(!StringUtils.isEmpty(ticketInfo)) {
			ticketParam.setTicketAvilableAmount(ticketInfo.getTicketAvilableAmount());
			ticketParam.setExpirationDate(ticketInfo.getExpirationDate());
            ticketParam.setProductName(ticketInfo.getProductName());
		}
		if(CommonCode.ZERO < dataSize) {
			ticketParam.setHistoryList(ticketDAO.getMyHistory(ticketParam));
		}
		return ticketParam;
	}

    @Override
    public int selectTimeDiff(int reservation_id) {
        return ticketDAO.selectTimeDiff(reservation_id);
    }
    @Override
    @Transactional(readOnly = false, rollbackFor = Exception.class)
    public int returnTicket(TicketEntity ticketEntity) {
        return ticketDAO.returnTicket(ticketEntity);
    }

    @Override
    public int chkReservation(int reservation_id) {
        return ticketDAO.chkReservation(reservation_id);
    }
}
