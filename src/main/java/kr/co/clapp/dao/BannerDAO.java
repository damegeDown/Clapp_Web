package kr.co.clapp.dao;

import java.util.List;

import kr.co.clapp.entities.BannerEntity;

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
   * @param bannerEntity
   * @return
   */
  int bannerViewUp(BannerEntity bannerEntity);

  /**
   * 배너 순서 다운
   * @param bannerEntity
   * @return
   */
  int bannerViewDown(BannerEntity bannerEntity);

  /**
   * 배너 순서 반전 업
   * @param bannerEntity
   * @return
   */
  int bannerViewReverseUp(BannerEntity bannerEntity);

  /**
   * 배너 순서 반전 다운
   * @param bannerEntity
   * @return
   */
  int bannerViewReverseDown(BannerEntity bannerEntity);
}
