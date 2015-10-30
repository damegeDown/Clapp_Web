package kr.co.clapp.dao;

import kr.co.clapp.entities.BannerEntity;

import java.util.List;

public interface BannerDAO {
  
  /**
   * 배너 목록
   * @param bannerEntity
   * @return
   */
  List<BannerEntity> getBannerList(BannerEntity bannerEntity);
  /**
   * 배너 목록 카운트
   * @param bannerEntity
   * @return
   */
  int getBannerCount(BannerEntity bannerEntity);
    /**
     * 노출 가능한 배너 목록 카운트
     * @param bannerEntity
     * @return
     */
    int getBannerMainFalseCount(BannerEntity bannerEntity);
  /**
   * 배너 상세
   * @param bannerEntity
   * @return
   */
  BannerEntity getBannerDetail(BannerEntity bannerEntity);
  /**
   * 배너 등록
   * @param bannerEntity
   * @return
   */
  int insertBanner(BannerEntity bannerEntity);
  /**
   * 배너 수정
   * @param bannerEntity
   * @return
   */
  int modifyBanner(BannerEntity bannerEntity);
  /**
   * 배너 종료
   * @param bannerEntity
   * @return
   */
  int endBanner(BannerEntity bannerEntity);
  /**
   * 배너 진행 카운트
   * @param bannerEntity
   * @return
   */
  int getBannerOpenCount(BannerEntity bannerEntity);
  
  List<BannerEntity> getBannerMain();

  /**
   * 배너 노출
   * @param bannerEntity
   * @return
   */
  int bannerViewOn(BannerEntity bannerEntity);

  /**
   * 배너 비 노출
   * @param bannerEntity
   * @return
   */
  int bannerViewOff(BannerEntity bannerEntity);

  /**
   * 배너 순서 업
   * @param bannerKey
   * @return
   */
  int bannerViewUp(String bannerKey);

  /**
   * 배너 순서 다운
   * @param bannerKey
   * @return
   */
  int bannerViewDown(String bannerKey);

  /**
   * 배너 순서 반전 업
   * @param bannerKey
   * @return
   */
  int bannerViewReverseUp(String bannerKey);

  /**
   * 배너 순서 반전 다운
   * @param bannerKey
   * @return
   */
  int bannerViewReverseDown(String bannerKey);
}
