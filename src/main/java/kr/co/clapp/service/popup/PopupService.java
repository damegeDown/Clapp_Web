package kr.co.clapp.service.popup;

import java.util.List;

import kr.co.clapp.entities.PopupEntity;

public interface PopupService {

  /**
   * 팝업 리스트
   * @param popupEntity
   * @return
   * @throws Exception
   */
  PopupEntity getPopupList(PopupEntity popupEntity) throws Exception;

  /**
   * 팝업 상세
   * @param popupEntity
   * @param model
   * @return
   * @throws Exception
   */
  PopupEntity getPopupDetail(PopupEntity popupEntity) throws Exception;
  
  List<PopupEntity> getPopupMain(PopupEntity popupEntity) throws Exception;
  /**
   * 팝업 등록
   * @param popupEntity
   * @return
   * @throws Exception
   */
  int insertPopup(PopupEntity popupEntity) throws Exception;
  /**
   * 팝업 수정
   * @param popupEntity
   * @return
   * @throws Exception
   */
  int modifyPopup(PopupEntity popupEntity) throws Exception;
  /**
   * 팝업 종료
   * @param popupEntity
   * @return
   * @throws Exception
   */
  int endPopup(PopupEntity popupEntity) throws Exception;
}

