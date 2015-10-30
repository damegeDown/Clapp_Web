package kr.co.clapp.service.banner.impl;

import kr.co.clapp.dao.BannerDAO;
import kr.co.clapp.entities.BannerEntity;
import kr.co.clapp.entities.PageEntity;
import kr.co.clapp.service.banner.BannerService;
import kr.co.digigroove.commons.messages.Messages;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional(readOnly=true)
public class BannerServiceImpl implements BannerService {
    @Autowired
    private BannerDAO bannerDAO;

    @Autowired
    private Messages messages;

    /**
     * 팝업 목록
     */
    @Override
    public BannerEntity getBannerList(BannerEntity bannerEntity) throws Exception {
        bannerEntity.setPageParams();
        bannerEntity.setPageSize(PageEntity.PAGE_LIST_SIZE_PARAM, PageEntity.PAGE_GROUP_SIZE_PARAM);
        bannerEntity.setDataSize(bannerDAO.getBannerCount(bannerEntity));
        List<BannerEntity> bannerListResult = bannerDAO.getBannerList(bannerEntity);
        bannerEntity.setBannerList(bannerListResult);

        return bannerEntity;
    }
    /**
     * 팝업 목록 상세
     */
    @Override
    public BannerEntity getBannerDetail(BannerEntity bannerEntity) throws Exception{
        BannerEntity bannerInfo = bannerDAO.getBannerDetail(bannerEntity);
        return bannerInfo;
    }
    /**
     * 팝업 등록
     */
    @Override
    @Transactional(readOnly = false, rollbackFor = Exception.class)
    public int insertBanner(BannerEntity bannerEntity) throws Exception{
        int result = 0;
        result = bannerDAO.insertBanner(bannerEntity);
        return result;
    }
    /**
     * 팝업 수정
     */
    @Override
    @Transactional(readOnly = false, rollbackFor = Exception.class)
    public int modifyBanner(BannerEntity bannerEntity) throws Exception{
        int result = 0;
        result = bannerDAO.modifyBanner(bannerEntity);
        return result;
    }
    /**
     * 팝업 종료
     */
    @Override
    @Transactional(readOnly = false, rollbackFor = Exception.class)
    public int endBanner(BannerEntity bannerEntity) throws Exception{
        int result = 0;
        result = bannerDAO.endBanner(bannerEntity);
        return result;
    }
    @Override
    public List<BannerEntity> getBannerMain() throws Exception {
        return bannerDAO.getBannerMain();
    }

    /**
     * 배너 노출
     * @param bannerEntity
     * @return
     */
    @Override
    @Transactional(readOnly = false, rollbackFor = Exception.class)
    public int bannerViewOn(BannerEntity bannerEntity) {
        return bannerDAO.bannerViewOn(bannerEntity);
    }

    /**
     * 배너 비노출
     * @param bannerEntity
     * @return
     */
    @Override
    @Transactional(readOnly = false, rollbackFor = Exception.class)
    public int bannerViewOff(BannerEntity bannerEntity) {
        return bannerDAO.bannerViewOff(bannerEntity);
    }

    /**
     * 배너 노출 업
     * @param bannerEntity
     * @return
     */
    @Override
    @Transactional(readOnly = false, rollbackFor = Exception.class)
    public int bannerViewUp(BannerEntity bannerEntity) {

        String[] splitParam = bannerEntity.getBannerKeyList().split(",");

    /*
    int result = bannerDAO.bannerViewReverseDown(splitParam[1]);

    if(result > 0 ){
      result = bannerDAO.bannerViewUp(splitParam[0]);
    }
    */

        bannerDAO.bannerViewReverseDown(splitParam[1]);
        int result = bannerDAO.bannerViewUp(splitParam[0]);

        return result;
    }

    /**
     * 배너 비노출 다운
     * @param bannerEntity
     * @return
     */
    @Override
    @Transactional(readOnly = false, rollbackFor = Exception.class)
    public int bannerViewDown(BannerEntity bannerEntity) {

        String[] splitParam = bannerEntity.getBannerKeyList().split(",");

    /*
    //int result = bannerDAO.bannerViewReverseUp(splitParam[1]);

    if(result > 0 ){
      result = bannerDAO.bannerViewDown(splitParam[0]);
    }
    */
        bannerDAO.bannerViewReverseUp(splitParam[1]);
        int result = bannerDAO.bannerViewDown(splitParam[0]);

        return result;
    }


}


