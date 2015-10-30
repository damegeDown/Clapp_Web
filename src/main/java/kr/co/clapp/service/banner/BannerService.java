package kr.co.clapp.service.banner;

import kr.co.clapp.entities.BannerEntity;

import java.util.List;

public interface BannerService {

  /**
   * 배너 리스트
   * @param bannerEntity
   * @return
   * @throws Exception
   */
  BannerEntity getBannerList(BannerEntity bannerEntity) throws Exception;

  /**
   * 배너 상세
   * @param bannerEntity
   * @return
   * @throws Exception
   */
  BannerEntity getBannerDetail(BannerEntity bannerEntity) throws Exception;
  
  List<BannerEntity> getBannerMain() throws Exception;
  /**
   * 배너 등록
   * @param bannerEntity
   * @return
   * @throws Exception
   */
  int insertBanner(BannerEntity bannerEntity) throws Exception;
  /**
   * 배너 수정
   * @param bannerEntity
   * @return
   * @throws Exception
   */
  int modifyBanner(BannerEntity bannerEntity) throws Exception;
  /**
   * 배너 종료
   * @param bannerEntity
   * @return
   * @throws Exception
   */
  int endBanner(BannerEntity bannerEntity) throws Exception;

  /**
   * 배너 노출
   * @param bannerEntity
   * @return
   */
  int bannerViewOn(BannerEntity bannerEntity);

  /**
   * 배너 비노출
   * @param bannerEntity
   * @return
   */
  int bannerViewOff(BannerEntity bannerEntity);

  /**
   * 배너 노출 업
   * @param bannerEntity
   * @return
   */
  int bannerViewUp(BannerEntity bannerEntity);

  /**
   * 배너 노출 다운
   * @param bannerEntity
   * @return
   */
  int bannerViewDown(BannerEntity bannerEntity);

}

