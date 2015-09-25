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

    jQuery(document).ready(function(){
        jQuery('#mainrolling').skdslider({'delay':5000, 'animationSpeed': 500,'showNextPrev':true,'showPlayButton':true,'autoSlide':true,'animationType':'fading'});
        jQuery('#responsive').change(function(){
            $('#responsive_wrapper').width(jQuery(this).val());
        });
        $('#mainrolling').css('display','block');
    });
</script>
<style type="text/css">
    body{ margin:0; padding:0;}
    #mainrolling{height:500px; margin:0; padding:0;display: none;}
</style>
<%--<style type="text/css">--%>
<%--* {--%>
<%--margin:0;--%>
<%--padding:0;--%>
<%--list-style:none;--%>
<%--font-family: 	'Nanum Gothic' !important;--%>
<%--}--%>
<%--body {--%>
<%--background:#fff;--%>
<%--font:normal 12px/22px  Arial, Helvetica, sans-serif;--%>
<%--width:100%;--%>
<%--}--%>
<%--img {--%>
<%--border:0;--%>
<%--}--%>
<%--#footer {--%>
<%--text-align:center;--%>
<%--}--%>
<%--.slider {--%>
<%--width:100%;--%>
<%--height:500px;--%>
<%--position:relative;--%>
<%--overflow:hidden;--%>
<%--background:#fff;--%>
<%--text-align:center;--%>
<%--}--%>
<%--.slider {--%>
<%--width:100%;--%>
<%--overflow:hidden;--%>
<%--}--%>
<%--.bd {--%>
<%--width:100%;--%>
<%--}--%>
<%--.bd ul{--%>
<%--}--%>
<%--.bd li {--%>
<%--width:100%;--%>
<%--margin: 0 auto;--%>
<%--overflow:hidden;--%>
<%--}--%>
<%--.bd li img {--%>
<%--display:block;--%>
<%--width:1400px;--%>
<%--height:500px;--%>
<%--margin: 0 auto;--%>
<%--overflow:hidden;--%>
<%--}--%>
<%--.main1 {--%>
<%--background: url('${contextPath }/resources/images/main_1_bg.png') repeat-x;--%>
<%--}--%>
<%--.main2 {--%>
<%--background: url('${contextPath }/resources/images/main_2_bg.png') repeat-x;--%>
<%--}--%>
<%--.main3 {--%>
<%--background: url('${contextPath }/resources/images/main_3_bg.png') repeat-x;--%>
<%--}--%>
<%--.main4 {--%>
<%--background: url('${contextPath }/resources/images/main_4_bg.png') repeat-x;--%>
<%--}--%>
<%--.main5 {--%>
<%--background: url('${contextPath }/resources/images/main_5_bg.png') repeat-x;--%>
<%--}--%>
<%--.main6 {--%>
<%--background: url('${contextPath }/resources/images/main_6_bg.png') repeat-x;--%>
<%--}--%>

<%--.slider .hd {--%>
<%--position: absolute;--%>
<%--width: 100%;--%>
<%--z-index: 1;--%>
<%--height: 23px;--%>
<%--bottom: 21px;--%>
<%--text-align: center;--%>
<%--float: left;--%>
<%--}--%>
<%--.slider .hd li {--%>
<%--display:inline-block;--%>
<%--zoom:1;--%>
<%--width:23px;--%>
<%--height:68px;--%>
<%--line-height:200px;--%>
<%--overflow:hidden;--%>
<%--background:url('${contextPath }/resources/images/slider-btn.png') 0 0px no-repeat;--%>
<%--margin:5px;--%>
<%--cursor:pointer;--%>
<%--filter:alpha(opacity=0.6);--%>
<%--opacity:0.6;--%>
<%--}--%>
<%--.slider .hd li.on {--%>
<%--background-position:0 0;--%>
<%--filter:alpha(opacity=100);--%>
<%--opacity:1;--%>
<%--}--%>
<%--.slider .pnBtn {--%>
<%--position:absolute;--%>
<%--z-index:1;--%>
<%--top:0;--%>
<%--width:100%;--%>
<%--height:500px;--%>
<%--cursor:pointer;--%>
<%--}--%>
<%--.slider .pnBtn .arrow {--%>
<%--display:none;--%>
<%--position:absolute;--%>
<%--top:0;--%>
<%--z-index:1;--%>
<%--width:60px;--%>
<%--height:500px;--%>
<%--}--%>
<%--.slider .pnBtn .arrow:hover {--%>
<%--filter:alpha(opacity=60);--%>
<%--opacity:0.6;--%>
<%--}--%>
<%--.slider .prev .arrow {--%>
<%--right:0;--%>
<%--background:url('${contextPath }/resources/images/slider-arrow.png') -120px 0 no-repeat;--%>
<%--}--%>
<%--.slider .next .arrow {--%>
<%--left:0;--%>
<%--background:url('${contextPath }/resources/images/slider-arrow.png') 0 0 no-repeat;--%>
<%--}--%>
<%--.input_chk{--%>
<%--position:relative;--%>
<%--}--%>
<%--.input_chk .stop {--%>
<%--display:none;--%>
<%--position:absolute;--%>
<%--right:0;--%>
<%--}--%>
<%--.pasue-check{--%>
<%--width: 1px;--%>
<%--position: absolute;--%>
<%--left: 0;--%>
<%--right: 0;--%>
<%--margin-left: auto;--%>
<%--margin-right: auto;--%>
<%--}--%>
<%--.pasue-label{--%>
<%--display: inline-table;--%>
<%--width:22px;--%>
<%--height:24px;--%>
<%--text-align: center;--%>
<%--vertical-align: middle;--%>
<%--}--%>

<%--</style>--%>
<%--<style type="text/css">--%>
<%--* {padding:0; margin:0;}--%>
<%--a {font-size:12px; text-decoration:none; padding:0; margin:0}--%>
<%--li {list-style:none; padding:0; margin:0}--%>
<%--img {vertical-align:top; padding:0; margin:0}--%>

<%--.area {width:100%; margin:0 auto; text-align:center; position:relative;}--%>
<%--.area .screen {width:100%; overflow:hidden; position:relative;}--%>
<%--.area .screen .imgs {width:300%; height:500px; position:relative; left:-100%;}--%>
<%--.area .screen .imgs li {width:33.34%; position:absolute; left:33.33%; display:none;}--%>
<%--.area .screen .imgs li:first-child {display:block;}--%>

<%--.area .navi {position:absolute; left:50%; width: 960px; margin-left:-480px; bottom:15px; overflow:hidden;}--%>
<%--.area .navi a {width:24px; height:24px;  margin-right:8px; display:inline-block; background: url('${contextPath }/resources/images/icon02.png') no-repeat; vertical-align:top;}--%>
<%--.area .navi a.on {background: url('${contextPath }/resources/images/icon01.png') no-repeat;}--%>

<%--.main1 {background: url('${contextPath }/resources/images/main_1_bg.png') repeat-x;}--%>
<%--.main2 {background: url('${contextPath }/resources/images/main_2_bg.png') repeat-x;}--%>
<%--.main3 {background: url('${contextPath }/resources/images/main_3_bg.png') repeat-x;}--%>
<%--.main4 {background: url('${contextPath }/resources/images/main_4_bg.png') repeat-x;}--%>
<%--.main5 {background: url('${contextPath }/resources/images/main_5_bg.png') repeat-x;}--%>
<%--.main6 {background: url('${contextPath }/resources/images/main_6_bg.png') repeat-x;}--%>
<%--</style>--%>
<%--<div class="area">--%>
<%--<div class="screen">--%>
<%--<ul class="imgs" style="left: -1505px;">--%>
<%--<li class="main1" style="display: none; left: 1505px;"><img src="${contextPath }/resources/images/main_1.png" alt=""></li>--%>
<%--<li class="main2" style="display: block; left: 1505px;"><a href="${contextPath }/product/productList"><img src="${contextPath }/resources/images/main_2.png" alt=""></a></li>--%>
<%--<li class="main3" style="display: none; left: 1505px;"><img src="${contextPath }/resources/images/main_3.png" alt=""></li>--%>
<%--<li class="main4" style="display: none; left: 1505px;"><a href="${contextPath }/members/memberJoin"><img src="${contextPath }/resources/images/main_4.png" alt=""></a></li>--%>
<%--<li class="main5" style="display: none; left: 1505px;"><a href="${contextPath }/product/productList"><img src="${contextPath }/resources/images/main_5.png" alt=""></a></li>--%>
<%--<li class="main6" style="display: none; left: 1505px;"><a href="${contextPath }/product/productList"><img src="${contextPath }/resources/images/main_6.png" alt=""></a></li>--%>
<%--</ul>--%>
<%--</div>--%>
<%--<div class="navi"></div>--%>
<%--</div>--%>
<div class="area">
    <ul id="mainrolling">
        <c:forEach items="${bannerEntity}" end="4" var="bannerList" varStatus="i">
            <li style="background:url('${contextPath}/common/imgView?fileType=${bannerList.bgFileTarget}&fileName=${bannerList.bgFileSavedName}')">
                <c:if test="${bannerList.bannerLinkType eq '0' }">
                    <a href="${bannerList.bannerLinkUrl }" target="_blank"><img src="${contextPath}/common/imgView?fileType=${bannerList.fileTarget}&fileName=${bannerList.fileSavedName}" /></a>
                </c:if>
                <c:if test="${bannerList.bannerLinkType eq '1' }">
                    <a href="${bannerList.bannerLinkUrl }" target="_self"><img src="${contextPath}/common/imgView?fileType=${bannerList.fileTarget}&fileName=${bannerList.fileSavedName}" /></a>
                </c:if>
            </li>
        </c:forEach>
        <%--<li style="background:url('${contextPath }/resources/images/main_1_bg.png')">--%>
        <%--<img src="${contextPath }/resources/images/main_1.png" />--%>
        <%--</li>--%>
        <%--<li style="background:url('${contextPath }/resources/images/main_2_bg.png')">--%>
        <%--<a href="${contextPath }/product/productList"><img src="${contextPath }/resources/images/main_2.png" /></a>--%>
        <%--</li>--%>
        <%--<li style="background:url('${contextPath }/resources/images/main_3_bg.png')"><img src="${contextPath }/resources/images/main_3.png" />--%>
        <%--</li>--%>
        <%--<li style="background:url('${contextPath }/resources/images/main_4_bg.png')">--%>
        <%--<a href="${contextPath }/members/memberJoin"><img src="${contextPath }/resources/images/main_4.png" /></a></li>--%>
        <%--</li>--%>
        <%--<li  style="background:url('${contextPath }/resources/images/main_5_bg.png')">--%>
        <%--<a href="${contextPath }/product/productList"><img src="${contextPath }/resources/images/main_5.png" /></a></li>--%>
        <%--<li style="background:url('${contextPath }/resources/images/main_6_bg.png')">--%>
        <%--<a href="${contextPath }/product/productList"><img src="${contextPath }/resources/images/main_6.png" /></a>--%>
        <%--</li>--%>
    </ul>
</div>
<%--<div class="slider">--%>
<%--<div class="bd">--%>
<%--<ul>--%>
<%--<li class="main2"><a href="${contextPath }/product/productList"><img src="${contextPath }/resources/images/main_2.png" /></a></li>--%>
<%--<li class="main3"><img src="${contextPath }/resources/images/main_3.png" /></li>--%>
<%--<li class="main4"><a href="${contextPath }/members/memberJoin"><img src="${contextPath }/resources/images/main_4.png" /></a></li>--%>
<%--<li class="main5"><a href="${contextPath }/product/productList"><img src="${contextPath }/resources/images/main_5.png" /></a></li>--%>
<%--<li class="main6"><a href="${contextPath }/product/productList"><img src="${contextPath }/resources/images/main_6.png" /></a></li>--%>
<%--<li class="main1"><img src="${contextPath }/resources/images/main_1.png" /></li>--%>
<%--</ul>--%>
<%--</div>--%>
<%--<div class="hd">--%>
<%--<input type="checkbox" id="pasue" class="pasue-check">--%>
<%--<label for="pasue" class="pasue-label" style="position: relative; top: -58px;"></label>--%>
<%--<ul style="display: inline-block;"><li class="on">1</li><li class="">2</li><li class="">3</li></ul>--%>
<%--</div>--%>
<%--</div>--%>
<script type="text/javascript">
    //    jQuery(".slider .bd li").first().before( jQuery(".slider .bd li").last() );
    //    jQuery(".slider").hover(function(){
    //        jQuery(this).find(".arrow").stop(true,true).fadeIn(300)
    //    },function(){
    //        jQuery(this).find(".arrow").fadeOut(300) });
    //    jQuery(".slider").slide(
    //            { titCell:".hd ul", mainCell:".bd ul", effect:"leftLoop",autoPlay:true, vis:3,autoPage:true, trigger:"click"}
    //    );

    //$(document).ready(function(){
    //    $('.area').bannerSlider({
    //        imgs	: $('.area .imgs'),
    //        prev	: $('.area .btn_prev'),
    //        next	: $('.area .btn_next'),
    //        navi	: $('.area .navi'),
    //        type	: 'slide',
    //        auto	: true,
    //        delay	: 5000,
    //        speed	: 500
    //    });
    //});

    function itrPopup(linkUrl,num){
        console.log(linkUrl);
//        if(num == "pop1"){
//            window.open(linkUrl,  "startpop", "width=720, height=850, scrollbars=no, resizable=no ,status=no ,toolbar=no");
//
//        }
        if(num =="pop2" ) {
            window.open(linkUrl, "startpop", "width=400, height=248, scrollbars=no, resizable=no ,status=no ,toolbar=no");
        }
    }
</script><!--
<script>
$(document).ready(function(){
$('#pasue').on('change',function(e){
if($(this).prop('checked')){
$(this).next().css("background","url(images/slider_btn_stop.png)");
}else{
$(this).next().css("background","url(images/slider_btn_play.png)");
}
});
});
</script>-->


<div id="wrapBgGnb">
    <div class="GnbContainer">
        <div class="GnbNavContainer">
            <ul>
                <li class="mGnbLi6 gnbLine">
                    <a class="gnbLink" href="${contextPath}/serviceinfo/infoMain">서비스 소개</a>
                </li>

                <li class="mGnbLi1 gnbLine">
                    <a class="gnbLink" href="${contextPath}/mobileTesting/mobileTestingMain">수동 테스트</a>
                    <%--<ul class="mGnbSub1" style="display: none;">--%>
                    <%--<li class="mGnbSub1-1"><a href="${contextPath}/mobileTesting/mobileTestingMain">클앱 테스팅</a></li>--%>
                    <%--<li class="mGnbSub1-1"><a href="${contextPath}/mobileTesting/mobileTestingMain/#merit">특·장점</a></li>--%>
                    <%--<li class="mGnbSub1-2"><a href="${contextPath}/mobileTesting/mobileTestingMain/#introduction">도입 사례</a></li>--%>
                    <%--<li class="mGnbSub1-3"><a href="${contextPath}/mobileTesting/mobileTestingMain/#function">주요 기능</a></li>--%>
                    <%--<li class="mGnbSub1-4"><a href="${contextPath}/mobileTesting/mobileTestingMain/#howto">사용 방법</a></li>--%>
                    <%--<li class="mGnbSub1-5"><a href="${contextPath}/mobileTesting/mobileTestingMain/#devices">제공 디바이스</a></li>--%>
                    <%--</ul>--%>
                </li>
                <li class="mGnbLi2 gnbLine">
                    <a class="gnbLink" href="${contextPath}/clappTesting/autoMain">자동화 테스트</a>
                    <%--<ul class="mGnbSub2" style="display: none;">--%>
                    <%--<li class="mGnbSub2-1"><a href="${contextPath}/clappTesting/autoMain#cta">클앱 자동화</a></li>--%>
                    <%--<li class="mGnbSub2-1"><a href="${contextPath}/clappTesting/autoMain#tamerit">특·장점</a></li>--%>
                    <%--<li class="mGnbSub2-2"><a href="${contextPath}/clappTesting/autoMain#diagram">구성도</a></li>--%>
                    <%--<li class="mGnbSub2-3"><a href="${contextPath}/clappTesting/autoMain#tafunction">주요 기능</a></li>--%>
                    <%--<li class="mGnbSub2-4"><a href="${contextPath}/clappTesting/autoMain#tahowto">사용 방법</a></li>--%>
                    <%--<li class="mGnbSub2-5"><a href="${contextPath}/clappTesting/autoMain#tadevices">제공 디바이스</a></li>--%>
                    <%--</ul>--%>
                </li>
                <%--<li class="mGnbLi3 gnbLine">--%>
                <%--<a class="gnbLink" href="${contextPath}/clappConsulting/consulting">클앱 컨설팅</a>--%>
                <%--<ul class="mGnbSub3" style="display: none;">--%>
                <%--<li class="mGnbSub3-1"><a href="${contextPath}/clappConsulting/consulting">클앱 컨설팅</a></li>--%>
                <%--<li class="mGnbSub3-1"><a href="${contextPath}/clappConsulting/consulting#camerit">특·장점</a></li>--%>
                <%--<li class="mGnbSub3-2"><a href="${contextPath}/clappConsulting/consulting#result">최근 수행 실적</a></li>--%>
                <%--<li class="mGnbSub3-3"><a href="${contextPath}/clappConsulting/consulting#process">프로세스</a></li>--%>
                <%--</ul>--%>
                <%--</li>--%>
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
            <a href="#"><img class="GnbStartButton" onclick="JnlpUtils.startTest()" src="${contextPath }/resources/images/gnb_start.png"  onmouseover="this.src='${contextPath }/resources/images/gnb_start_r.png';" onMouseOut="this.src='${contextPath }/resources/images/gnb_start.png';" alt="시작하기" /></a>
        </div><!-- .GnbStartContainer End -->
    </div> <!-- GnbContainer End -->
</div> <!-- #wrapBgGnb End -->
<div id="banner1">
    <div class="bannerimg" style="overflow:hidden; height:80px; position:relative; background:#000;"><a href="${contextPath }/serviceinfo/exGuide" ><img src="${contextPath }/resources/images/system_notice.png"style="position:absolute; left:50%; margin-left:-480px; height:82px;"></a>
        <button type="button" class="SystemNoticeBtn"></button>
    </div>
    <script type="text/javascript">
        $('#banner1').dropdownbanner( {
            todayClose : 'todayclose',
            close : '.SystemNoticeBtn',
            speend : 300
        });
    </script>
</div>
<div id="wrapBgDevice">
    <div class="BGSlider">
        <div class="mSliderLayer1">
            <div class="mSliderContentItem">
            </div>
            <c:forEach items="${deviceEntity.deviceSelectedList}" end="4" var="deviceSelectedList" varStatus="i">
                <div class="mSliderLayer2">
                    <div class="mSliderContent1">
                        <div class="mSliderContentimg">
                            <img src="${contextPath}/common/imgView?fileType=${deviceSelectedList.fileTarget}&fileName=${deviceSelectedList.fileSavedName}"/>
                        </div>
                    </div>
                    <div class="mSliderTextBox1">
                        <p class="msliderText1">${deviceSelectedList.deviceModelEname}<br>${deviceSelectedList.deviceMakerCode}<br>${deviceSelectedList.deviceOsCode }</p></div>
                    <div class="device${i.count}">
                    </div>
                </div>
            </c:forEach>

            <div class="mSliderContentItem">
            </div>
            <div class="mSliderContentControl">
                <div class="mSliderControlBox">
                    <span class="mSliderTitle">디바이스<br>전체보기</span>
                </div>
                <div class="mSliderControlBox2">
                    <span class="mSliderMore"><a href="http://www.clapp.co.kr/mobileTesting/testingDevice"><img src="${contextPath }/resources/images/main_btn_device_more.png" alt="디바이스 더보기" onMouseOver="this.src='${contextPath }/resources/images/main_btn_device_more_r.png';" onMouseOut="this.src='${contextPath }/resources/images/main_btn_device_more.png';" /></a></span>
                </div>
            </div>
        </div>
    </div>
</div>

<div id="wrapBgNotice">
    <div class="wrapBgNoticeContainer">
        <div class="wrapBgContactNotice">
            <div class="WBNTitleBox">
                <div class="WBNTitle">
                    <span>공지사항</span>
                </div>
                <div class="WBNTitleBtn">
                                <span><a href="${contextPath}/introduction/supportCustomerList"><img src="${contextPath }/resources/images/main_btn_notice_more.png" alt="공지사항 더보기" onMouseOver="this.src='${contextPath }/resources/images/main_btn_notice_more_r.png';" onMouseOut="this.src='${contextPath }/resources/images/main_btn_notice_more.png';" /></a>
                                </span>
                </div>
            </div>
            <c:forEach items="${boardNoticeEntity.boardNoticeList }" end='2' var="boardNoticeList" varStatus="i">
                <div class="WBNNoticeBtnListCont">
                    <div class="WBNNoticeBtnListLine">
                        <div class="WBNNoticeBtnLCDate">
                            <span><fmt:formatDate pattern="yyyy. MM. dd" value="${boardNoticeList.noticeInsertDate }" /></span>
                        </div><!-- .subCISupportLOCDate End-->
                        <div class="WBNNoticeLinkBox">
                            <a href="${contextPath}/introduction/supportCustomerDetail?currentPage=${boardNoticeEntity.currentPage}&boardNoticeKey=${boardNoticeList.boardNoticeKey}">
                                <div class="WBNNoticeLinkText">
                                           <span>
                                                   ${boardNoticeList.noticeTitle}
                                           </span>
                                </div><!-- .subCISupportLOCText End-->
                            </a>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
        <div class="wrapBgContactNotice">
            <div class="WBNTitleBox">
                <div class="WBNTitle">
                    <span>자주묻는 질문</span>
                </div>
                <div class="WBNTitleBtn">
                                <span>
                                    <a href="${contextPath}/introduction/supportQnaList"><img src="${contextPath }/resources/images/main_btn_notice_more.png" alt="공지사항 더보기" onMouseOver="this.src='${contextPath }/resources/images/main_btn_notice_more_r.png';" onMouseOut="this.src='${contextPath }/resources/images/main_btn_notice_more.png';" /></a>
                                </span>
                </div>
            </div>
            <c:forEach items="${boardQnaEntity.boardQnaSelectedList }" end="2" var="boardQnaSelected" varStatus="i" >
                <div class="WBNNoticeBtnListCont">
                    <div class="WBNNoticeBtnListLine">
                        <div class="WBNNoticeBtnLCDate">
                            <span>${boardQnaSelected.qnaCategory}</span>
                        </div><!-- .subCISupportLOCDate End-->
                        <div class="WBNNoticeLinkBox">
                            <a href="${contextPath}/introduction/supportQnaList">
                                <div class="WBNNoticeLinkText">
                                           <span>
                                                   ${boardQnaSelected.qnaQuestion}
                                           </span>
                                </div><!-- .subCISupportLOCText End-->
                            </a>
                        </div>
                    </div>
                </div>
            </c:forEach>

        </div>
    </div>
</div>



<div id="wrapBgContact">
    <div class="wrapBgContact2">
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
                        <span class="wBCMailAddress">대표 이메일 : <a href="mailto:support@clapp.co.kr">support@clapp.co.kr</a></span>
                        <div class="wBCNHSContainer">
                            <div class="wBCServiceBtn"><span class="wBCServiceText"><a href="${contextPath }/serviceinfo/infoMain">서비스 소개</a></span></div>
                            <div class="wBCServiceBtn"><span class="wBCServiceText"><a href="${contextPath }/introduction/supportInquire">서비스별 문의</a></span></div>
                        </div>
                    </div>
                </div>
            </div>
        </div> <!-- .wrapBgContactContainer End -->
    </div>
</div> <!-- #wrapBgContact End -->