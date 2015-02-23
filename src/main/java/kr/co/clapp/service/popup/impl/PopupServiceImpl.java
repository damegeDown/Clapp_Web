package kr.co.clapp.service.popup.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.clapp.dao.PopupDAO;
import kr.co.clapp.entities.PageEntity;
import kr.co.clapp.entities.PopupEntity;
import kr.co.clapp.service.popup.PopupService;
import kr.co.digigroove.commons.messages.Messages;

@Service
@Transactional(readOnly=true)
public class PopupServiceImpl implements PopupService {
  @Autowired
  private PopupDAO popupDAO;

  @Autowired
  private Messages messages;

  /**
   * 팝업 목록
   */
  @Override
  public PopupEntity getPopupList(PopupEntity popupEntity) throws Exception {
	popupEntity.setPageParams();
	popupEntity.setPageSize(PageEntity.PAGE_LIST_SIZE_PARAM, PageEntity.PAGE_GROUP_SIZE_PARAM);
	popupEntity.setDataSize(popupDAO.getPopupCount(popupEntity));
	List<PopupEntity> popupListResult = popupDAO.getPopupList(popupEntity);
	popupEntity.setPopupList(popupListResult);
	
    return popupEntity;
  }
  /**
   * 팝업 목록 상세
   */
  @Override
  public PopupEntity getPopupDetail(PopupEntity popupEntity) throws Exception{
	PopupEntity popupInfo = popupDAO.getPopupDetail(popupEntity);
	return popupInfo;
  }
  /**
   * 팝업 등록
   */
  @Override
  @Transactional(readOnly = false, rollbackFor = Exception.class)
  public int insertPopup(PopupEntity popupEntity) throws Exception{
	  int result = 0;
	  result = popupDAO.insertPopup(popupEntity);
	  return result;
  }
  /**
   * 팝업 수정
   */
  @Override
  @Transactional(readOnly = false, rollbackFor = Exception.class)
  public int modifyPopup(PopupEntity popupEntity) throws Exception{
	  int result = 0;
	  result = popupDAO.modifyPopup(popupEntity);
	  return result;
  }
  /**
   * 팝업 종료
   */
  @Override
  @Transactional(readOnly = false, rollbackFor = Exception.class)
  public int endPopup(PopupEntity popupEntity) throws Exception{
	  int result = 0;
	  result = popupDAO.endPopup(popupEntity);
	  return result;
  }
@Override
public List<PopupEntity> getPopupMain(PopupEntity popupEntity) throws Exception {
	return popupDAO.getPopupMain(popupEntity);
}
}


