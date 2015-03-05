<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="dgPageNav" uri="/WEB-INF/tlds/PageNavigation.tld" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="Strings" uri="/WEB-INF/tlds/Strings.tld" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<script src="${contextPath }/resources/js/timeago.js" type="text/javascript"></script>
<script type="text/javascript" src="${contextPath }/resources/js/main.js"></script>
<script type="text/javascript" src="//wcs.naver.net/wcslog.js"></script>
<script type="text/javascript">
if(!wcs_add) var wcs_add = {};
wcs_add["wa"] = "5cdfd898d6ee64";
wcs_do();
</script>
<div id="wrapBgGnb">
  <div class="GnbContainer">
    <div class="GnbNavContainer">
      <ul>
        <li class="mGnbLi1 gnbLine">
          <a class="gnbLink" href="${contextPath}/mobileTesting/mobileTestingMain">클앱 테스팅</a>
          <ul class="mGnbSub1" style="display: none;">
            <li class="mGnbSub1-1"><a href="${contextPath}/mobileTesting/mobileTestingMain">클앱 테스팅</a></li>
            <li class="mGnbSub1-1"><a href="${contextPath}/mobileTesting/mobileTestingMain/#merit">특·장점</a></li>
            <li class="mGnbSub1-2"><a href="${contextPath}/mobileTesting/mobileTestingMain/#introduction">도입 사례</a></li>
            <li class="mGnbSub1-3"><a href="${contextPath}/mobileTesting/mobileTestingMain/#function">주요 기능</a></li>
            <li class="mGnbSub1-4"><a href="${contextPath}/mobileTesting/mobileTestingMain/#howto">사용 방법</a></li>
            <li class="mGnbSub1-5"><a href="${contextPath}/mobileTesting/mobileTestingMain/#devices">제공 디바이스</a></li>
          </ul>
        </li>
        <li class="mGnbLi2 gnbLine">
          <a class="gnbLink" href="${contextPath}/clappTesting/autoMain">클앱 자동화</a>
          <ul class="mGnbSub2" style="display: none;">
            <li class="mGnbSub2-1"><a href="${contextPath}/clappTesting/autoMain#cta">클앱 자동화</a></li>
            <li class="mGnbSub2-1"><a href="${contextPath}/clappTesting/autoMain#tamerit">특·장점</a></li>
            <li class="mGnbSub2-2"><a href="${contextPath}/clappTesting/autoMain#diagram">구성도</a></li>
            <li class="mGnbSub2-3"><a href="${contextPath}/clappTesting/autoMain#tafunction">주요 기능</a></li>
            <li class="mGnbSub2-4"><a href="${contextPath}/clappTesting/autoMain#tahowto">사용 방법</a></li>
            <li class="mGnbSub2-5"><a href="${contextPath}/clappTesting/autoMain#tadevices">제공 디바이스</a></li>
          </ul>
        </li>
        <li class="mGnbLi3 gnbLine">
          <a class="gnbLink" href="${contextPath}/clappConsulting/consulting">클앱 컨설팅</a>
          <ul class="mGnbSub3" style="display: none;">
            <li class="mGnbSub3-1"><a href="${contextPath}/clappConsulting/consulting">클앱 컨설팅</a></li> 
            <li class="mGnbSub3-1"><a href="${contextPath}/clappConsulting/consulting#camerit">특·장점</a></li>
            <li class="mGnbSub3-2"><a href="${contextPath}/clappConsulting/consulting#result">최근 수행 실적</a></li>
            <li class="mGnbSub3-3"><a href="${contextPath}/clappConsulting/consulting#process">프로세스</a></li>
          </ul>
        </li>
        <li class="mGnbLi4 gnbLine">
          <a class="gnbLink" href="${contextPath}/trandReview/trandReviewMain">트렌드 리뷰</a>
          <ul class="mGnbSub4" style="display: none;">
            <li class="mGnbSub4-1"><a href="${contextPath}/trandReview/trandReviewMain">트렌드 리뷰</a></li>
            <li class="mGnbSub4-1"><a href="${contextPath}/trandReview/trandList">업계 동향</a></li>
            <li class="mGnbSub4-2"><a href="${contextPath}/trandReview/reviewList">리뷰·전망</a></li>
            <li class="mGnbSub4-3"><a href="${contextPath}/trandReview/caseList">케이스 스터디</a></li>
            <li class="mGnbSub4-4"><a href="${contextPath}/trandReview/socialList">소셜·블로그</a></li>
          </ul>
        </li>
        <li class="mGnbLi5">
          <a class="gnbLink" href="${contextPath}/introduction/introductionMain">브랜드 클앱</a>
          <ul class="mGnbSub5" style="display: none;">
            <li class="mGnbSub5-1"><a href="${contextPath}/introduction/introductionMain">클앱 소개</a></li>
            <li class="mGnbSub5-2"><a href="${contextPath}/introduction/newsArticleList">언론 기사</a></li>
            <li class="mGnbSub5-3"><a href="${contextPath}/introduction/personRecruit">인재 채용</a></li>
            <li class="mGnbSub5-4"><a href="${contextPath}/introduction/cooperation">고객·협력사</a></li>
            <li class="mGnbSub5-4"><a href="${contextPath}/introduction/supportCustomerList">고객 지원</a></li>
          </ul>
        </li>
      </ul>
    </div> <!-- .GnbContainer End -->
    
    <div class="GnbStartContainer">
      <a href="#"><img class="GnbStartButton" onclick="JnlpUtils.startTest()" src="${contextPath }/resources/images/gnb_start.png"   onmouseover="this.src='${contextPath }/resources/images/gnb_start_r.png';" onMouseOut="this.src='${contextPath }/resources/images/gnb_start.png';" alt="시작하기" /></a>
    </div><!-- .GnbStartContainer End -->
  </div> <!-- GnbContainer End -->
</div> <!-- #wrapBgGnb End -->
<div id="wrapBgDevice">
  <div class="BGSlider">
    <div class="mSliderLayer1">
      <div class="mSliderContent1">
        <div class="mSliderContentItem1  alignCenter" style="display:table">
          <div style="display:table-cell;vertical-align:middle;width:480px " >
	          <img src="${contextPath}/common/imgView?fileType=${deviceEntity.deviceSelectedList[0].fileTarget}&fileName=${deviceEntity.deviceSelectedList[0].fileSavedName}" style="max-width: 300px; max-height: 300px;"/>
	          <div class="mSliderTextBox1" style="display: none;">
	            <span class="msliderText0">${deviceEntity.deviceSelectedList[0].deviceModelEname}</span>
	            <span class="msliderText2">${deviceEntity.deviceSelectedList[0].deviceMakerCode}</span>
	            <span class="msliderText3">${deviceEntity.deviceSelectedList[0].deviceOsCode}</span>
	          </div>
          </div>
        </div> 
        
      </div>
      <div class="mSliderContent2">
        <div class="mSliderContent2BoxTop">
          <div class="mSliderContentItem2 alignCenter" style="display:table">
          	<div style="display:table-cell;vertical-align:middle;width:240px">
            	<img src="${contextPath}/common/imgView?fileType=${deviceEntity.deviceSelectedList[1].fileTarget}&fileName=${deviceEntity.deviceSelectedList[1].fileSavedName}" style="max-width:150px; max-height:150px;" />
	            <div class="mSliderTextBox2" style="display: none;">
	              <span class="msliderText1">${deviceEntity.deviceSelectedList[1].deviceModelEname}</span>
	              <span class="msliderText2">${deviceEntity.deviceSelectedList[1].deviceMakerCode}</span>
	              <span class="msliderText3">${deviceEntity.deviceSelectedList[1].deviceOsCode}</span>
	            </div>
            </div> 
          </div>
          <div class="mSliderContentItem3 alignCenter" style="display:table">
          	<div style="display:table-cell;vertical-align:middle;width:240px">
           	 <img src="${contextPath}/common/imgView?fileType=${deviceEntity.deviceSelectedList[2].fileTarget}&fileName=${deviceEntity.deviceSelectedList[2].fileSavedName}" style="max-width:150px; max-height:150px;" />
            <div class="mSliderTextBox3" style="display: none;">
              <span class="msliderText1">${deviceEntity.deviceSelectedList[2].deviceModelEname}</span>
              <span class="msliderText2">${deviceEntity.deviceSelectedList[2].deviceMakerCode}</span>
              <span class="msliderText3">${deviceEntity.deviceSelectedList[2].deviceOsCode}</span>
            </div>
            </div>
          </div>
        </div>
        <div class="mSliderContent2BoxBottom">
          <div class="mSliderContentItem4 alignCenter" style="display:table">
          	<div style="display:table-cell;vertical-align:middle;width:240px">
	            <img src="${contextPath}/common/imgView?fileType=${deviceEntity.deviceSelectedList[3].fileTarget}&fileName=${deviceEntity.deviceSelectedList[3].fileSavedName}"style="max-width:150px; max-height:150px;" />
	            <div class="mSliderTextBox4" style="display: none;">
	              <span class="msliderText1">${deviceEntity.deviceSelectedList[3].deviceModelEname}</span>
	              <span class="msliderText2">${deviceEntity.deviceSelectedList[3].deviceMakerCode}</span>
	              <span class="msliderText3">${deviceEntity.deviceSelectedList[3].deviceOsCode}</span>
	            </div>
            </div>
          </div>
          <div class="mSliderContentControl">
            <div class="mSliderControlBox">
              <span class="mSliderLeftArrow mslaDisabled"></span>
              <span class="mSliderTitle">제공 디바이스</span>
              <span class="mSliderRightArrow"><a></a></span>
              <span class="mDeviceMore"><a href="${contextPath }/mobileTesting/testingDevice"></a></span>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="mSliderLayer2" style="display:none;">
      <div class="mSliderContent5">
        <div class="mSliderContent5BoxTop">
          <div class="mSliderContentItem5 alignCenter" style="display:table">
          	<div style="display:table-cell;vertical-align:middle;width:240px">
            	<img src="${contextPath}/common/imgView?fileType=${deviceEntity.deviceSelectedList[4].fileTarget}&fileName=${deviceEntity.deviceSelectedList[4].fileSavedName}" style="max-width:150px; max-height:150px;"/>
	            <div class="mSliderTextBox5" style="display: none;">
	              <span class="msliderText1">${deviceEntity.deviceSelectedList[4].deviceModelEname}</span>
	              <span class="msliderText2">${deviceEntity.deviceSelectedList[4].deviceMakerCode}</span>
	              <span class="msliderText3">${deviceEntity.deviceSelectedList[4].deviceOsCode}</span>
	            </div>
            </div>
          </div>
          <div class="mSliderContentItem6 alignCenter" style="display:table">
          	<div style="display:table-cell;vertical-align:middle;width:240px">
            	<img src="${contextPath}/common/imgView?fileType=${deviceEntity.deviceSelectedList[5].fileTarget}&fileName=${deviceEntity.deviceSelectedList[5].fileSavedName}"style="max-width:150px; max-height:150px;" />
	            <div class="mSliderTextBox6" style="display: none;">
	              <span class="msliderText1">${deviceEntity.deviceSelectedList[5].deviceModelEname}</span>
	              <span class="msliderText2">${deviceEntity.deviceSelectedList[5].deviceMakerCode}</span>
	              <span class="msliderText3">${deviceEntity.deviceSelectedList[5].deviceOsCode}</span>
	            </div>
            </div>
          </div>
        </div>
        <div class="mSliderContent5BoxBottom">
          <div class="mSliderContentItem7 alignCenter" style="display:table">
          	<div style="display:table-cell;vertical-align:middle;width:240px">
            	<img src="${contextPath}/common/imgView?fileType=${deviceEntity.deviceSelectedList[6].fileTarget}&fileName=${deviceEntity.deviceSelectedList[6].fileSavedName}" style="max-width:150px; max-height:150px;"/>
	            <div class="mSliderTextBox7" style="display: none;">
	              <span class="msliderText1">${deviceEntity.deviceSelectedList[6].deviceModelEname}</span>
	              <span class="msliderText2">${deviceEntity.deviceSelectedList[6].deviceMakerCode}</span>
	              <span class="msliderText3">${deviceEntity.deviceSelectedList[6].deviceOsCode}</span>
	            </div>
            </div>
          </div>
          <div class="mSliderContentItem8 alignCenter" style="display:table">
          	<div style="display:table-cell;vertical-align:middle;width:240px">
            	<img src="${contextPath}/common/imgView?fileType=${deviceEntity.deviceSelectedList[7].fileTarget}&fileName=${deviceEntity.deviceSelectedList[7].fileSavedName}" style="max-width:150px; max-height:150px;"/>
	            <div class="mSliderTextBox8" style="display: none;">
	              <span class="msliderText1">${deviceEntity.deviceSelectedList[7].deviceModelEname}</span>
	              <span class="msliderText2">${deviceEntity.deviceSelectedList[7].deviceMakerCode}</span>
	              <span class="msliderText3">${deviceEntity.deviceSelectedList[7].deviceOsCode}</span>
	            </div>
            </div>
          </div>
        </div>
        
      </div>
      <div class="mSliderContent6">
        <div class="mSliderContent6BoxTop">
          <div class="mSliderContentItem9 alignCenter" style="display:table">
          	<div style="display:table-cell;vertical-align:middle;width:240px">
            	<img src="${contextPath}/common/imgView?fileType=${deviceEntity.deviceSelectedList[8].fileTarget}&fileName=${deviceEntity.deviceSelectedList[8].fileSavedName}" style="max-width:150px; max-height:150px;"/>
	            <div class="mSliderTextBox9" style="display: none;">
	              <span class="msliderText1">${deviceEntity.deviceSelectedList[8].deviceModelEname}</span>
	              <span class="msliderText2">${deviceEntity.deviceSelectedList[8].deviceMakerCode}</span>
	              <span class="msliderText3">${deviceEntity.deviceSelectedList[8].deviceOsCode}</span>
	            </div>
            </div>
          </div>
          <div class="mSliderContentItem10 alignCenter" style="display:table">
          	<div style="display:table-cell;vertical-align:middle;width:240px">
	            <img src="${contextPath}/common/imgView?fileType=${deviceEntity.deviceSelectedList[9].fileTarget}&fileName=${deviceEntity.deviceSelectedList[9].fileSavedName}" style="max-width:150px; max-height:150px;"/>
	            <div class="mSliderTextBox10" style="display: none;">
	              <span class="msliderText1">${deviceEntity.deviceSelectedList[9].deviceModelEname}</span>
	              <span class="msliderText2">${deviceEntity.deviceSelectedList[9].deviceMakerCode}</span>
	              <span class="msliderText3">${deviceEntity.deviceSelectedList[9].deviceOsCode}</span>
	            </div>
            </div>
          </div>
        </div>
        <div class="mSliderContent6BoxBottom">
          <div class="mSliderContentItem11 alignCenter" style="display:table">
          	<div style="display:table-cell;vertical-align:middle;width:240px">
            	<img src="${contextPath}/common/imgView?fileType=${deviceEntity.deviceSelectedList[10].fileTarget}&fileName=${deviceEntity.deviceSelectedList[10].fileSavedName}" style="max-width:150px; max-height:150px;"/>
	            <div class="mSliderTextBox11" style="display: none;">
	              <span class="msliderText1">${deviceEntity.deviceSelectedList[10].deviceModelEname}</span>
	              <span class="msliderText2">${deviceEntity.deviceSelectedList[10].deviceMakerCode}</span>
	              <span class="msliderText3">${deviceEntity.deviceSelectedList[10].deviceOsCode}</span>
	            </div>
            </div>
          </div>
          <div class="mSliderContentControl">
            <div class="mSliderControlBox">
              <span class="mSliderLeftArrow"><a></a></span>
              <span class="mSliderTitle">제공 디바이스</span>
              <span class="mSliderRightArrow msraDisabled"></span>
              <span class="mDeviceMore"><a href="${contextPath }/mobileTesting/testingDevice"></a></span>
            </div>
          </div>
        </div>
      </div>
        
    </div>
  </div>
</div> <!-- #wrapBgDevice End -->
<div id="wrapBgMTQ">
    <div class="wrapBgMTQLeft">
      <div class="wrapBgMTQLTextContainer">
        <span class="wrapBgMTQLText">클앱 테스팅</span>
        <span class="wrapBgMTQLText2">CLAPP TESTING</span>
        <p class="wrapBgMTQLText3">온라인 상의 실제 디바이스에 접속,<br /> 
        365일 언제 어디서나, 쉽고 빠른 테스팅을 위해<br />
        국내 기술로 탄생한 클라우드 테스트 플랫폼 입니다.</p>
        <span class="wrapBgMTQLMore">
          <a href="${contextPath }/mobileTesting/mobileTestingMain"></a>
        </span>
      </div>

    </div> <!-- .wrapBgMTQLeft End -->
    <div class="wrapBgMTQRight">
      <div class="mtqRTop">
        <div class="wrapBgMTQRTTextContainer">
          <span class="wrapBgMTQRTText">클앱 자동화</span>
                        <span class="wrapBgMTQLText2">CLAPP AUTOMATION</span>
          <p class="wrapBgMTQRTText2">수동으로 수행하기 힘든 반복,<br />회귀 테스트를 자동화로 진행할 수 있는<br />설치형 프로그램 입니다.</p>
          <span class="wrapBgMTQRTMore">
            <a href="${contextPath }/clappTesting/autoMain"></a>
          </span>
        </div>
      </div>
      <div class="mtqRBottom">
        <div class="wrapBgMTQRBTextContainer">
          <span class="wrapBgMTQRBText">클앱 컨설팅</span>
                        <span class="wrapBgMTQLText2">CLAPP CONSULTING</span>
          <p class="wrapBgMTQRBText2">풍부한 경험과 국제 표준에 의한<br />
          품질 요소 검증을 기반으로 SW 테스트<br /> 
          관련 기술을 보유하고 있습니다.</p>
          <span class="wrapBgMTQRBTMore">
            <a href="${contextPath}/clappConsulting/consulting"></a>
          </span>
        </div>
      </div>
    </div> <!-- .wrapBgMTQRight End -->
</div> <!-- #wrapBgMTQ End -->
<div id="wrapArticleList">
  <div class="wrapASecTop">
    <div class="wrapASecTopLeft">
      <div class="article artLineFir artTitle1">
        <div class="wrapArticleContainer">
          <div class="wrapArticleThumbnail">
            <img src="${contextPath }/resources/images/list_img_01.png" alt="Thumbnail" />
          </div>
          <div class="wrapArticleMainTitle">
            <span class="wrapArticleMainTitleText">업계 동향</span>
          </div>
          <span class="wrapArticleMainTitleMore">
            <a href="${contextPath }/trandReview/trandList"></a>
          </span>
        </div>
      </div>
      <div class="article">
        <div class="wrapArticleContainer brownbg">
          <div class="wrapArticleThumbnail alignCenter" style="display:table">
          	<div style="display:table-cell;vertical-align:middle">
            	<img src="${contextPath}/common/imgView?fileType=${boardEntity.trandList[0].fileTarget}&fileName=${boardEntity.trandList[0].fileSavedName}" style="max-width:160px;"/>
            </div>
          </div>
          <div class="wrapArticleTitleText">
            <p class="wrapAritcleTitle Brown">
            <a href="${contextPath}/trandReview/trandDetail?boardTrandKey=${boardEntity.trandList[0].boardTrandKey}">${boardEntity.trandList[0].trandTitle}</a></p>
            <p class="wrapArticleText">
             <Strings:cutTextTag length="80" text="${boardEntity.trandList[0].trandContents}" ellipsis="..."/>
            </p>
          </div>
        </div>
      </div>
    </div> <!-- .wrapASecTopLeft End -->
    <div class="wrapASecTopRight">
      <div class="article artLine">
        <div class="wrapArticleContainerR brownbg">
          <div class="wrapArticleThumbnail alignCenter" style="display:table">
          	<div style="display:table-cell;vertical-align:middle">
            	<img src="${contextPath}/common/imgView?fileType=${boardEntity.trandList[1].fileTarget}&fileName=${boardEntity.trandList[1].fileSavedName}" style="max-width:160px;"/>
            </div>
          </div>
          <div class="wrapArticleTitleText">
            <p class="wrapAritcleTitle Brown">
            <a href="${contextPath}/trandReview/trandDetail?boardTrandKey=${boardEntity.trandList[1].boardTrandKey}">${boardEntity.trandList[1].trandTitle}</a></p>
            <p class="wrapArticleText">
             <Strings:cutTextTag length="80" text="${boardEntity.trandList[1].trandContents}" ellipsis="..."/>
            </p>
          </div>
        </div>
      </div>
      <div class="article">
        <div class="wrapArticleContainerR brownbg">
          <div class="wrapArticleThumbnail alignCenter" style="display:table">
          	<div style="display:table-cell;vertical-align:middle">
            	<img src="${contextPath}/common/imgView?fileType=${boardEntity.trandList[2].fileTarget}&fileName=${boardEntity.trandList[2].fileSavedName}" style="max-width:160px;"/>
            </div>
          </div>
          <div class="wrapArticleTitleText">
            <p class="wrapAritcleTitle Brown">
            <a href="${contextPath}/trandReview/trandDetail?boardTrandKey=${boardEntity.trandList[2].boardTrandKey}">${boardEntity.trandList[2].trandTitle}</a></p>
            <p class="wrapArticleText">
              <Strings:cutTextTag length="80" text="${boardEntity.trandList[2].trandContents}" ellipsis="..."/>
            </p>
          </div>
        </div>
      </div>
    </div> <!-- .wrapASecTopRight End -->
  </div> <!-- .wrapASecTop End -->
  <div class="wrapASecMiddle">
    <div class="wrapASecMiddleLeft">
      <div class="article artLine">
        <div class="wrapArticleContainer navybg">
          <div class="wrapArticleThumbnail alignCenter" style="display:table">
          	<div style="display:table-cell;vertical-align:middle">
            	<img src="${contextPath}/common/imgView?fileType=${boardEntity.reviewList[0].fileTarget}&fileName=${boardEntity.reviewList[0].fileSavedName}" style="max-width:160px;"/>
            </div>
          </div>
          <div class="wrapArticleTitleText">
            <p class="wrapAritcleTitle Navy">
            <a href="${contextPath}/trandReview/reviewDetail?boardTrandKey=${boardEntity.reviewList[0].boardTrandKey}">${boardEntity.reviewList[0].trandTitle}</a></p>
            <p class="wrapArticleText">
              <Strings:cutTextTag length="80" text="${boardEntity.reviewList[0].trandContents}" ellipsis="..."/>
            </p>
          </div>
        </div>
      </div>
      <div class="article">
        <div class="wrapArticleContainer navybg">
          <div class="wrapArticleThumbnail alignCenter" style="display:table">
          	<div style="display:table-cell;vertical-align:middle">
            	<img src="${contextPath}/common/imgView?fileType=${boardEntity.reviewList[1].fileTarget}&fileName=${boardEntity.reviewList[1].fileSavedName}" style="max-width:160px;"/>
            </div>
          </div>
          <div class="wrapArticleTitleText">
            <p class="wrapAritcleTitle Navy">
            <a href="${contextPath}/trandReview/reviewDetail?boardTrandKey=${boardEntity.reviewList[1].boardTrandKey}">${boardEntity.reviewList[1].trandTitle}</a></p>
            <p class="wrapArticleText">
              <Strings:cutTextTag length="80" text="${boardEntity.reviewList[1].trandContents}" ellipsis="..."/>
            </p>
          </div>
        </div>
      </div>
    </div> <!-- .wrapASecMiddleLeft End -->
    <div class="wrapASecMiddleRight">
      <div class="article artLine artTitle2">
        <div class="wrapArticleContainerR">
          <div class="wrapArticleThumbnail">
            <img src="${contextPath }/resources/images/list_img_02.png" alt="Thumbnail" />
          </div>
          <div class="wrapArticleMainTitle">
            <span class="wrapArticleMainTitleTextN">리뷰 · 전망</span>
          </div>
          <span class="wrapArticleMainTitleMore2">
            <a href="${contextPath }/trandReview/reviewList"></a>
          </span>
        </div>
      </div>
      <div class="article">
        <div class="wrapArticleContainerR navybg">
          <div class="wrapArticleThumbnail alignCenter" style="display:table">
          	<div style="display:table-cell;vertical-align:middle">
            	<img src="${contextPath}/common/imgView?fileType=${boardEntity.reviewList[2].fileTarget}&fileName=${boardEntity.reviewList[2].fileSavedName}" style="max-width:160px;"/>
            </div>
          </div>
          <div class="wrapArticleTitleText">
            <p class="wrapAritcleTitle Navy">
            <a href="${contextPath}/trandReview/reviewDetail?boardTrandKey=${boardEntity.reviewList[2].boardTrandKey}">${boardEntity.reviewList[2].trandTitle}</a></p>
            <p class="wrapArticleText">
              <Strings:cutTextTag length="80" text="${boardEntity.reviewList[2].trandContents}" ellipsis="..."/>
            </p>
          </div>
        </div>
      </div>
    </div> <!-- .wrapASecMiddleRight End -->
  </div> <!-- .wrapASecMiddle End -->
  <div class="wrapASecBottom">
    <div class="wrapASecBottomLeft">
      <div class="article artLine artTitle3">
        <div class="wrapArticleContainer">
          <div class="wrapArticleThumbnail">
            <img src="${contextPath }/resources/images/list_img_03.png" alt="Thumbnail" />
          </div>
          <div class="wrapArticleMainTitle">
            <span class="wrapArticleMainTitleText">케이스 스터디</span>
          </div>
          <span class="wrapArticleMainTitleMore3">
            <a href="${contextPath }/trandReview/caseList"></a>
          </span>
        </div>
      </div>
      <div class="article">
        <div class="wrapArticleContainer purplebg">
          <div class="wrapArticleThumbnail alignCenter" style="display:table">
          	<div style="display:table-cell;vertical-align:middle">
            	<img src="${contextPath}/common/imgView?fileType=${boardEntity.caseList[0].fileTarget}&fileName=${boardEntity.caseList[0].fileSavedName}" style="max-width:160px;"/>
            </div>
          </div>
          <div class="wrapArticleTitleText">
            <p class="wrapAritcleTitle Purple">
            <a href="${contextPath}/trandReview/caseDetail?boardTrandKey=${boardEntity.caseList[0].boardTrandKey}">${boardEntity.caseList[0].trandTitle}</a></p>
            <p class="wrapArticleText">
              <Strings:cutTextTag length="80" text="${boardEntity.caseList[0].trandContents}" ellipsis="..."/>
            </p>
          </div>
        </div>
      </div>
    </div> <!-- .wrapASecBottomLeft End -->
    <div class="wrapASecBottomRight">
      <div class="article artLine">
        <div class="wrapArticleContainerR purplebg">
          <div class="wrapArticleThumbnail alignCenter" style="display:table">
          	<div style="display:table-cell;vertical-align:middle">
            	<img src="${contextPath}/common/imgView?fileType=${boardEntity.caseList[1].fileTarget}&fileName=${boardEntity.caseList[1].fileSavedName}" style="max-width:160px;"/>
            </div>
          </div>
          <div class="wrapArticleTitleText">
            <p class="wrapAritcleTitle Purple">
            <a href="${contextPath}/trandReview/caseDetail?boardTrandKey=${boardEntity.caseList[1].boardTrandKey}">${boardEntity.caseList[1].trandTitle}</a></p>
            <p class="wrapArticleText">
              <Strings:cutTextTag length="80" text="${boardEntity.caseList[1].trandContents}" ellipsis="..."/>
            </p>
          </div>
        </div>
      </div>
      <div class="article">
        <div class="wrapArticleContainerR purplebg">
          <div class="wrapArticleThumbnail alignCenter" style="display:table">
          	<div style="display:table-cell;vertical-align:middle">
            	<img src="${contextPath}/common/imgView?fileType=${boardEntity.caseList[2].fileTarget}&fileName=${boardEntity.caseList[2].fileSavedName}" style="max-width:160px;"/>
            </div>
          </div>
          <div class="wrapArticleTitleText">
            <p class="wrapAritcleTitle Purple">
            <a href="${contextPath}/trandReview/caseDetail?boardTrandKey=${boardEntity.caseList[2].boardTrandKey}">${boardEntity.caseList[2].trandTitle}</a></p>
            <p class="wrapArticleText">
              <Strings:cutTextTag length="80" text="${boardEntity.caseList[2].trandContents}" ellipsis="..."/>
            </p>
          </div>
        </div>
      </div>
    </div> <!-- .wrapASecBottomRight End -->
  </div> <!-- wrapASecBottom End -->
</div><!-- #wrapArticleList End -->
<div id="wrapBgSns">
  <div class="wrapBgSnsContainer">
    <div class="wrapBgSnsHeader">
      <div class="wBGSHTitleBox">
        <span class="wBGSHTitle">소셜 · 블로그</span>
      </div>
      <div class="wBGSHSnsBox"> 
        <div class="wBGSnsContainer">
          <a href="http://blog.naver.com/yesclapp" target="_blank"><img src="${contextPath }/resources/images/sns_blog.png" onMouseOver="this.src='${contextPath }/resources/images/sns_blog_r.png';" onMouseOut="this.src='${contextPath }/resources/images/sns_blog.png';"  alt="Blog" /></a>
          <a href="https://www.facebook.com/profile.php?id=100009049548425" target="_blank"><img src="${contextPath }/resources/images/sns_facebook.png" onMouseOver="this.src='${contextPath }/resources/images/sns_facebook_r.png';" onMouseOut="this.src='${contextPath }/resources/images/sns_facebook.png';" alt="Facebook" /></a>
          <%-- <a href="#" target="_blank"><img src="${contextPath }/resources/images/sns_twitter.png" onMouseOver="this.src='${contextPath }/resources/images/sns_twitter_r.png';" onMouseOut="this.src='${contextPath }/resources/images/sns_twitter.png';"  alt="Twitter" /></a> --%>
        </div>
      </div>           
    </div>
    <div class="wBGSnsBoldLine"></div>
    <div class="wBgSnsArticles">
    <c:forEach items="${boardEntity.socialBlogList }" var="socialBlogList">
      <div class="SnsArticleBox SnsArticleLine">
			<div class="SnsArticleThumbnail alignCenter" style="display:table">
          	  <div style="display:table-cell;vertical-align:middle">
	          	<img src="${contextPath}/common/imgView?fileType=${socialBlogList.fileTarget}&fileName=${socialBlogList.fileSavedName}" style="max-width:80px;"/>
	          </div>
	        </div>
			<div class="SnsArticleText">
				<p class="snsArticleTitle snsRT"><a href="${socialBlogList.facebookLink }" target="_blank">${socialBlogList.socialBlogTitle}</a></p>
				<span class="snsArticleTime"> <time datetime="${socialBlogList.socialBlogInsertTime}"></time></span>
				<p class="snsArticleText">
					<Strings:cutTextTag length="240" text="${socialBlogList.socialBlogContent}" ellipsis="..."/>
				</p>
			</div>
		</div>
      </c:forEach>
    </div>
  </div> <!-- .wrapBgSnsContainer End -->
</div> <!-- #wrapBgSns End -->
<div id="wrapBgContact">
  <div class="wrapBgContactContainer">
    <div class="wrapBgContactPhone">
      <div class="wBCPITContainer">
        <div class="wBCPhoneIcon"></div>
        <div class="wBCPhoneText">
          <span class="wBCPhoneNumber">1661-7083</span>
          <p class="wBCBusinessTime">평일 오전 10시 ~ 오후 6시 (점심시간 : 정오 ~ 오후 1시)</p>
          <p class="WBCBusinessClosed">토,일,공휴일 휴무</p>
        </div>
      </div>
    </div>
    <div class="wrapBgContactMail">
      <div class="wBCMITContainer">
        <div class="wBCMailIcon"></div>
        <div class="wBCMailText">
          <span class="wBCMailAddress">고객지원 이메일 : <a href="mailto:support@clapp.co.kr">support@clapp.co.kr</a></span>
          <div class="wBCNHSContainer">
            <div class="wBCNoticeBtn"><span class="wBCNoticeText"><a href="${contextPath}/introduction/supportCustomerList">공지사항</a></span></div>
            <div class="wBCHelpBtn"><span class="wBCHelpText"><a href="${contextPath}/introduction/supportQnaList">도움말</a></span></div>
            <div class="wBCServiceBtn"><span class="wBCServiceText"><a href="${contextPath}/introduction/supportInquire">서비스별 문의</a></span></div>
          </div>
        </div>
      </div>
    </div>
  </div> <!-- .wrapBgContactContainer End -->
</div> <!-- #wrapBgContact End -->
