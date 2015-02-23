package kr.co.clapp.dao;

import java.util.List;

import kr.co.clapp.entities.PopupEntity;

public interface PopupDAO {
  
  /**
   * 팝업 목록
   * @param adminEntity
   * @return
   */
  List<PopupEntity> getPopupList(PopupEntity PopupEntity);
  /**
   * 팝업 목록 카운트
   * @param popupEntity
   * @return
   */
  int getPopupCount(PopupEntity popupEntity);
  /**
   * 팝업 상세
   * @param popupEntity
   * @return
   */
  PopupEntity getPopupDetail(PopupEntity popupEntity);
  /**
   * 팝업 등록
   * @param popupEntity
   * @return
   */
  int insertPopup(PopupEntity popupEntity);
  /**
   * 팝업 수정
   * @param popupEntity
   * @return
   */
  int modifyPopup(PopupEntity popupEntity);
  /**
   * 팝업 종료
   * @param popupEntity
   * @return
   */
  int endPopup(PopupEntity popupEntity);
  /**
   * 팝업 진행 카운트
   * @param popupEntity
   * @return
   */
  int getPopupOpenCount(PopupEntity popupEntity);
  
List<PopupEntity> getPopupMain(PopupEntity popupEntity);
  
}
