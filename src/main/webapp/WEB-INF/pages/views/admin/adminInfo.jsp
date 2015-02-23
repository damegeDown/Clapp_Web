<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="dgPageNav" uri="/WEB-INF/tlds/PageNavigation.tld" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<div id="wrapBgGnb">
<div class="GnbContainer">
	<div class="GnbNavContainer">
		<ul>
			<li class="mGnbLi1 gnbLine">
				<a class="gnbLink" href="./mobile_testing.html">모바일 테스팅</a>
				<ul class="mGnbSub1" style="display: none;">
					<li class="mGnbSub1-1"><a href="./mobile_testing.html">클앱 모바일 테스팅</a></li>
					<li class="mGnbSub1-2"><a href="./mobile_testing.html#merit">특·장점</a></li>
					<li class="mGnbSub1-3"><a href="./mobile_testing.html">도입 사례</a></li>
					<li class="mGnbSub1-4"><a href="./mobile_testing.html">주요 기능</a></li>
					<li class="mGnbSub1-5"><a href="./mobile_testing.html">사용 방법</a></li>
					<li class="mGnbSub1-6"><a href="./provide_device.html">제공 디바이스</a></li>
				</ul>
			</li>
			<li class="mGnbLi2 gnbLine">
				<a class="gnbLink" href="./clapp_test_auto.html">테스트 자동화</a>
				<ul class="mGnbSub2" style="display: none;">
					<li class="mGnbSub2-1"><a href="./clapp_test_auto.html">클앱 테스트 자동화</a></li>
					<li class="mGnbSub2-2"><a href="./clapp_test_auto.html">특·장점</a></li>
					<li class="mGnbSub2-3"><a href="./clapp_test_auto.html">구성도</a></li>
					<li class="mGnbSub2-4"><a href="./clapp_test_auto.html">주요 기능</a></li>
					<li class="mGnbSub2-5"><a href="./clapp_test_auto.html">사용 방법</a></li>
					<li class="mGnbSub2-6"><a href="./auto_testing_provide_device.html">제공 디바이스</a></li>
				</ul>
			</li>
			<li class="mGnbLi3 gnbLine">
				<a class="gnbLink" href="./clapp_qa_consulting.html">QA 컨설팅</a>
				<ul class="mGnbSub3" style="display: none;">
					<li class="mGnbSub3-1"><a href="./clapp_qa_consulting.html">클앱 QA 컨설팅</a></li>
					<li class="mGnbSub3-2"><a href="./clapp_qa_consulting.html">특·장점</a></li>
					<li class="mGnbSub3-3"><a href="./clapp_qa_consulting.html">프로세스</a></li>
				</ul>
			</li>
			<li class="mGnbLi4 gnbLine">
				<a class="gnbLink" href="./industry_main.html">트렌드 리뷰</a>
				<ul class="mGnbSub4" style="display: none;">
					<li class="mGnbSub4-1"><a href="./industry_main.html">트렌드 리뷰</a></li>
					<li class="mGnbSub4-2"><a href="./industry_trend_list.html">업계 동향</a></li>
					<li class="mGnbSub4-3"><a href="./industry_review_list.html">리뷰·전망</a></li>
					<li class="mGnbSub4-4"><a href="./industry_case_list.html">케이스 스터디</a></li>
					<li class="mGnbSub4-5"><a href="./industry_social_list.html">소셜·블로그</a></li>
				</ul>
			</li>
			<li class="mGnbLi5">
				<a class="gnbLink" href="./company_introduction.html">회사 소개</a>
				<ul class="mGnbSub5" style="display: none;">
					<li class="mGnbSub5-1"><a href="./company_introduction.html">회사 소개</a></li>
					<li class="mGnbSub5-2"><a href="./news_article_list.html">언론 기사</a></li>
					<li class="mGnbSub5-3"><a href="./person_recruit.html">인재 채용</a></li>
					<li class="mGnbSub5-4"><a href="./cooperation_enterprise.html">고객·협력사</a></li>
					<li class="mGnbSub5-4"><a href="./support_customer_list.html">고객 지원</a></li>
				</ul>
			</li>
		</ul>
	</div> <!-- .GnbContainer End -->
	
	<div class="GnbStartContainer">
		<a href="#"><img class="GnbStartButton" src="${contextPath }/resources/images/gnb_start.png" alt="시작하기" /></a>
	</div><!-- .GnbStartContainer End -->
</div> <!-- GnbContainer End -->
</div> <!-- #wrapBgGnb End -->
<div id="wrapBgDevice">
	<div class="BGSlider">
		<div class="mSliderLayer1">
			<div class="mSliderContent1">
				<div class="mSliderContentItem1">
					<img src="${contextPath }/resources/images/device_phone.png" />
					<div class="mSliderTextBox1" style="display: none;">
					<span class="msliderText1">Samsung Galaxy S III</span>
					<span class="msliderText2">Samsung</span>
					<span class="msliderText3">Android</span>
				</div>
			</div>
			
		</div>
		<div class="mSliderContent2">
			<div class="mSliderContent2BoxTop">
				<div class="mSliderContentItem2">
					<img src="${contextPath }/resources/images/device_pad.png" />
					<div class="mSliderTextBox2" style="display: none;">
						<span class="msliderText1">Samsung Galaxy S III</span>
						<span class="msliderText2">Samsung</span>
						<span class="msliderText3">Android</span>
					</div>
				</div>
				<div class="mSliderContentItem3">
					<img src="${contextPath }/resources/images/device_note.png" />
					<div class="mSliderTextBox3" style="display: none;">
						<span class="msliderText1">Samsung Galaxy S III</span>
						<span class="msliderText2">Samsung</span>
						<span class="msliderText3">Android</span>
					</div>
				</div>
			</div>
			<div class="mSliderContent2BoxBottom">
				<div class="mSliderContentItem4">
					<img src="${contextPath }/resources/images/device_g3.png" />
					<div class="mSliderTextBox4" style="display: none;">
						<span class="msliderText1">Samsung Galaxy S III</span>
						<span class="msliderText2">Samsung</span>
						<span class="msliderText3">Android</span>
					</div>
				</div>
				<div class="mSliderContentControl">
					<div class="mSliderControlBox">
						<span class="mSliderLeftArrow mslaDisabled"></span>
						<span class="mSliderTitle">제공 디바이스</span>
						<span class="mSliderRightArrow"><a></a></span>
						<span class="mDeviceMore"><a href="./provide_device.html"></a></span>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="mSliderLayer2" style="display:none;">
		<div class="mSliderContent5">
			<div class="mSliderContent5BoxTop">
				<div class="mSliderContentItem5">
					<img src="${contextPath }/resources/images/device_pad.png" />
					<div class="mSliderTextBox5" style="display: none;">
						<span class="msliderText1">Samsung Galaxy S III</span>
						<span class="msliderText2">Samsung</span>
						<span class="msliderText3">Android</span>
					</div>
				</div>
				<div class="mSliderContentItem6">
					<img src="${contextPath }/resources/images/device_note.png" />
					<div class="mSliderTextBox6" style="display: none;">
						<span class="msliderText1">Samsung Galaxy S III</span>
						<span class="msliderText2">Samsung</span>
						<span class="msliderText3">Android</span>
					</div>
				</div>
			</div>
			<div class="mSliderContent5BoxBottom">
				<div class="mSliderContentItem7">
					<img src="${contextPath }/resources/images/device_g3.png" />
					<div class="mSliderTextBox7" style="display: none;">
						<span class="msliderText1">Samsung Galaxy S III</span>
						<span class="msliderText2">Samsung</span>
						<span class="msliderText3">Android</span>
					</div>
				</div>
				<div class="mSliderContentItem8">
					<img src="${contextPath }/resources/images/device_note.png" />
					<div class="mSliderTextBox8" style="display: none;">
						<span class="msliderText1">Samsung Galaxy S III</span>
						<span class="msliderText2">Samsung</span>
						<span class="msliderText3">Android</span>
					</div>
				</div>
			</div>
			
		</div>
		<div class="mSliderContent6">
			<div class="mSliderContent6BoxTop">
				<div class="mSliderContentItem9">
					<img src="${contextPath }/resources/images/device_note.png" />
					<div class="mSliderTextBox9" style="display: none;">
						<span class="msliderText1">Samsung Galaxy S III</span>
						<span class="msliderText2">Samsung</span>
						<span class="msliderText3">Android</span>
					</div>
				</div>
				<div class="mSliderContentItem10">
					<img src="${contextPath }/resources/images/device_pad.png" />
					<div class="mSliderTextBox10" style="display: none;">
						<span class="msliderText1">Samsung Galaxy S III</span>
						<span class="msliderText2">Samsung</span>
						<span class="msliderText3">Android</span>
					</div>
				</div>
			</div>
			<div class="mSliderContent6BoxBottom">
				<div class="mSliderContentItem11">
					<img src="${contextPath }/resources/images/device_g3.png" />
					<div class="mSliderTextBox11" style="display: none;">
							<span class="msliderText1">Samsung Galaxy S III</span>
							<span class="msliderText2">Samsung</span>
							<span class="msliderText3">Android</span>
						</div>
					</div>
					<div class="mSliderContentControl">
						<div class="mSliderControlBox">
							<span class="mSliderLeftArrow"><a></a></span>
							<span class="mSliderTitle">제공 디바이스</span>
							<span class="mSliderRightArrow msraDisabled"></span>
							<span class="mDeviceMore"><a href="./provide_device.html"></a></span>
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
				<span class="wrapBgMTQLText">모바일 테스팅</span>
				<span class="wrapBgMTQLText2">It's Not Emulator, It's Real!</span>
				<p class="wrapBgMTQLText3">CLAPP은 온라인 상의 실제 디바이스에 접속,<br /> 
				365일 언제 어디서나 쉽고 빠른 테스팅을 위해<br />
				국내 기술로 탄생한 클라우드 테스트 플랫폼 입니다!</p>
				<span class="wrapBgMTQLMore">
					<a href="./mobile_testing.html"></a>
				</span>
			</div>

		</div> <!-- .wrapBgMTQLeft End -->
	<div class="wrapBgMTQRight">
		<div class="mtqRTop">
			<div class="wrapBgMTQRTTextContainer">
				<span class="wrapBgMTQRTText">테스트 자동화</span>
				<p class="wrapBgMTQRTText2">CLAPP은 수동으로 수행하기 힘든 반복,<br />리그레션 테스트를 자동화하여<br />APP의 품질 및 생산성을 향상시켜주는<br />테스트 자동화 프로그램 입니다!</p>
				<span class="wrapBgMTQRTMore">
					<a href="./clapp_test_auto.html"></a>
				</span>
			</div>
		</div>
		<div class="mtqRBottom">
			<div class="wrapBgMTQRBTextContainer">
				<span class="wrapBgMTQRBText">QA 컨설팅</span>
				<p class="wrapBgMTQRBText2">CLAPP의 QA 컨설팅은 풍부한 경험과<br />
				국제 표준에 의한 품질 요소 검증을<br /> 
				기반으로 소프트웨어 테스트 관련 <br />
				최고의 기술을 보유하고 있습니다!</p>
				<span class="wrapBgMTQRBTMore">
					<a href="./clapp_qa_consulting.html"></a>
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
						<a href="./industry_trend_list.html"></a>
					</span>
				</div>
			</div>
			<div class="article">
				<div class="wrapArticleContainer brownbg">
					<div class="wrapArticleThumbnail">
						<img src="${contextPath }/resources/images/list_img_0102.png" alt="Thumbnail" />
					</div>
					<div class="wrapArticleTitleText">
						<p class="wrapAritcleTitle Brown">
						<a href="#">개발된 Application을 온라인 상에서 테스트하는 CLAPP</a></p>
						<p class="wrapArticleText">
						CLAPP은 별도 디바이스를 보유하지 않아도 직접 개발한 애플리케이션 …
						</p>
					</div>
				</div>
			</div>
		</div> <!-- .wrapASecTopLeft End -->
	<div class="wrapASecTopRight">
		<div class="article artLine">
			<div class="wrapArticleContainerR brownbg">
				<div class="wrapArticleThumbnail">
					<img src="${contextPath }/resources/images/list_img_0101.png" alt="Thumbnail" />
				</div>
				<div class="wrapArticleTitleText">
					<p class="wrapAritcleTitle Brown">
					<a href="#">개발된 Application을 온라인 상에서 테스트하는 CLAPP</a></p>
					<p class="wrapArticleText">
					CLAPP은 별도 디바이스를 보유하지 않아도 직접 개발한 애플리케이션 …
					</p>
				</div>
			</div>
		</div>
		<div class="article">
			<div class="wrapArticleContainerR brownbg">
				<div class="wrapArticleThumbnail">
					<img src="${contextPath }/resources/images/list_img_0103.png" alt="Thumbnail" />
				</div>
				<div class="wrapArticleTitleText">
					<p class="wrapAritcleTitle Brown">
					<a href="#">개발된 Application을 온라인 상에서 테스트하는 CLAPP</a></p>
					<p class="wrapArticleText">
					CLAPP은 별도 디바이스를 보유하지 않아도 직접 개발한 애플리케이션 …
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
				<div class="wrapArticleThumbnail">
					<img src="${contextPath }/resources/images/list_img_0201.png" alt="Thumbnail" />
				</div>
				<div class="wrapArticleTitleText">
					<p class="wrapAritcleTitle Navy">
					<a href="#">개발된 Application을 온라인 상에서 테스트하는 CLAPP</a></p>
					<p class="wrapArticleText">
					CLAPP은 별도 디바이스를 보유하지 않아도 직접 개발한 애플리케이션 …
					</p>
				</div>
			</div>
		</div>
		<div class="article">
			<div class="wrapArticleContainer navybg">
				<div class="wrapArticleThumbnail">
					<img src="${contextPath }/resources/images/list_img_0202.png" alt="Thumbnail" />
				</div>
				<div class="wrapArticleTitleText">
					<p class="wrapAritcleTitle Navy">
					<a href="#">개발된 Application을 온라인 상에서 테스트하는 CLAPP</a></p>
					<p class="wrapArticleText">
					CLAPP은 별도 디바이스를 보유하지 않아도 직접 개발한 애플리케이션 …
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
					<a href="./industry_review_list.html"></a>
				</span>
			</div>
		</div>
		<div class="article">
			<div class="wrapArticleContainerR navybg">
				<div class="wrapArticleThumbnail">
					<img src="${contextPath }/resources/images/list_img_0203.png" alt="Thumbnail" />
				</div>
				<div class="wrapArticleTitleText">
					<p class="wrapAritcleTitle Navy">
					<a href="#">개발된 Application을 온라인 상에서 테스트하는 CLAPP</a></p>
					<p class="wrapArticleText">
					CLAPP은 별도 디바이스를 보유하지 않아도 직접 개발한 애플리케이션 …
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
					<a href="./industry_case_list.html"></a>
				</span>
			</div>
		</div>
		<div class="article">
			<div class="wrapArticleContainer purplebg">
				<div class="wrapArticleThumbnail">
					<img src="${contextPath }/resources/images/list_img_0301.png" alt="Thumbnail" />
				</div>
				<div class="wrapArticleTitleText">
					<p class="wrapAritcleTitle Purple">
					<a href="#">개발된 Application을 온라인 상에서 테스트하는 CLAPP</a></p>
					<p class="wrapArticleText">
					CLAPP은 별도 디바이스를 보유하지 않아도 직접 개발한 애플리케이션 …
					</p>
				</div>
			</div>
		</div>
	</div> <!-- .wrapASecBottomLeft End -->
	<div class="wrapASecBottomRight">
		<div class="article artLine">
			<div class="wrapArticleContainerR purplebg">
				<div class="wrapArticleThumbnail">
					<img src="${contextPath }/resources/images/list_img_0302.png" alt="Thumbnail" />
				</div>
				<div class="wrapArticleTitleText">
					<p class="wrapAritcleTitle Purple">
					<a href="#">개발된 Application을 온라인 상에서 테스트하는 CLAPP</a></p>
					<p class="wrapArticleText">
					CLAPP은 별도 디바이스를 보유하지 않아도 직접 개발한 애플리케이션 …
					</p>
				</div>
			</div>
		</div>
		<div class="article">
			<div class="wrapArticleContainerR purplebg">
				<div class="wrapArticleThumbnail">
					<img src="${contextPath }/resources/images/list_img_0303.png" alt="Thumbnail" />
				</div>
				<div class="wrapArticleTitleText">
					<p class="wrapAritcleTitle Purple">
					<a href="#">개발된 Application을 온라인 상에서 테스트하는 CLAPP</a></p>
					<p class="wrapArticleText">
					CLAPP은 별도 디바이스를 보유하지 않아도 직접 개발한 애플리케이션 …
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
					<a href="#" target="_blank"><img src="${contextPath }/resources/images/sns_facebook.png" onmouseover="this.src='${contextPath }/resources/images/sns_facebook_r.png';" onmouseout="this.src='${contextPath }/resources/images/sns_facebook.png';" alt="Facebook" /></a>
				<a href="#" target="_blank"><img src="${contextPath }/resources/images/sns_twitter.png" onmouseover="this.src='${contextPath }/resources/images/sns_twitter_r.png';" onmouseout="this.src='${contextPath }/resources/images/sns_twitter.png';"  alt="Twitter" /></a>
				<a href="#" target="_blank"><img src="${contextPath }/resources/images/sns_blog.png" onmouseover="this.src='${contextPath }/resources/images/sns_blog_r.png';" onmouseout="this.src='${contextPath }/resources/images/sns_blog.png';"  alt="Blog" /></a>
			</div>
		</div>					
	</div>
	<div class="wBGSnsBoldLine"></div>
	<div class="wBgSnsArticles">
		<div class="SnsArticleBox SnsArticleLine">
			<div class="SnsArticleThumbnail">
				<img src="${contextPath }/resources/images/sns_list.png" alt="SNS Thumbnail" />
			</div>
			<div class="SnsArticleText">
				<p class="snsArticleTitle snsRT"><a href="#">클앱은 클앱으로! @CLAPP</a></p>
				<span class="snsArticleTime">17시간 전</span>
				<p class="snsArticleText">자체 개발한 Application을 테스트하기 위한 유명한 사이트 CLAPP의 편리한 기능들을 다양하게 이용해 보세요!</p>
			</div>
		</div>
		<div class="SnsArticleBox SnsArticleLine">
			<div class="SnsArticleThumbnail">
				<img src="${contextPath }/resources/images/sns_list.png" alt="SNS Thumbnail" />
			</div>
			<div class="SnsArticleText">
				<p class="snsArticleTitle snsRT"><a href="#">클앱은 클앱으로! @CLAPP</a></p>
				<span class="snsArticleTime">17시간 전</span>
				<p class="snsArticleText">자체 개발한 Application을 테스트하기 위한 유명한 사이트 CLAPP의 편리한 기능들을 다양하게 이용해 보세요!</p>
			</div>
		</div>
		<div class="SnsArticleBox">
			<div class="SnsArticleThumbnail">
				<img src="${contextPath }/resources/images/sns_list.png" alt="SNS Thumbnail" />
			</div>
			<div class="SnsArticleText">
				<p class="snsArticleTitle snsRT"><a href="#">클앱은 클앱으로! @CLAPP</a></p>
				<span class="snsArticleTime">17시간 전</span>
				<p class="snsArticleText">자체 개발한 Application을 테스트하기 위한 유명한 사이트 CLAPP의 편리한 기능들을 다양하게 이용해 보세요!</p>
			</div>
		</div>
	</div>
</div> <!-- .wrapBgSnsContainer End -->
</div> <!-- #wrapBgSns End -->
<div id="wrapBgContact">
	<div class="wrapBgContactContainer">
		<div class="wrapBgContactPhone">
			<div class="wBCPITContainer">
				<div class="wBCPhoneIcon"></div>
				<div class="wBCPhoneText">
					<span class="wBCPhoneNumber">02-3460-8333</span>
					<p class="wBCBusinessTime">평일 오전 10시 ~ 오후 6시 (점심시간 : 정오 ~ 오후 1시)</p>
					<p class="WBCBusinessClosed">토,일,공휴일 휴무</p>
				</div>
			</div>
		</div>
		<div class="wrapBgContactMail">
			<div class="wBCMITContainer">
				<div class="wBCMailIcon"></div>
				<div class="wBCMailText">
					<span class="wBCMailAddress">대표이메일 : <a href="mailto:support@clapp.co.kr">support@clapp.co.kr</a></span>
					<div class="wBCNHSContainer">
						<div class="wBCNoticeBtn"><span class="wBCNoticeText"><a href="./support_customer_list.html">공지사항</a></span></div>
						<div class="wBCHelpBtn"><span class="wBCHelpText"><a href="./support_qa.html">도움말</a></span></div>
						<div class="wBCServiceBtn"><span class="wBCServiceText"><a href="./support_inquire.html">서비스별 문의</a></span></div>
					</div>
				</div>
			</div>
		</div>
	</div> <!-- .wrapBgContactContainer End -->
</div> <!-- #wrapBgContact End -->
<div id="wrapBgBottomNav">
	<div class="wrapBottomNavContainer">
		<div class="wbcBox1">
			<div class="wbcBox1Con">
				<div class="wbcBox1BtLogo">
					<img src="${contextPath }/resources/images/clapp_bt_logo.png" alt="CLAPP" />
				</div>
				<div class="wbcBox1BtCompanyInfo">
					<span class="wbcCompanyName">(주)메디오피아테크</span>
					<span class="wbcCeo">대표이사: 장일홍</span>
					<span class="wbcCompanyNumber">사업자번호: 220-87-36025<span class="mdash">|</span><a class="corpConfirm" href="#">사업자정보확인</a><span class="corparrow"></span></span>
					<span class="wbcCompanyNumber2">통신판매업: 제 강남 - 15728호</span>
					<sapn class="wbcCompanyAddress">주소: 서울 강남구 도곡로 182, 4층</span>
				</div>
			</div>
		</div>
		<div class="wbcBox2">
			<div class="wbcBox2Con">
				<span class="wbcMobileTesting"><a href="./mobile_testing.html">모바일 테스팅</a></span>
				<ul>
					<li><a href="./mobile_testing.html">클앱 모바일 테스팅</a></li>
					<li><a href="./mobile_testing.html">특 · 장점</a></li>
					<li><a href="./mobile_testing.html">도입사례</a></li>
					<li><a href="./mobile_testing.html">주요기능</a></li>
					<li><a href="./mobile_testing_guide1.html">이용 가이드</a></li>
				</ul>
				<span class="wbcTrendReview"><a href="./industry_main.html">트렌드 리뷰</a></span>
			</div>
		</div>
		<div class="wbcBox3">
			<div class="wbcBox3Con">
				<span class="wbcTestAutomattic"><a href="./clapp_test_auto.html">테스트 자동화</a></span>
				<ul>
					<li><a href="./clapp_test_auto.html">클앱 테스트 자동화</a></li>
					<li><a href="./clapp_test_auto.html">특 · 장점</a></li>
					<li><a href="./clapp_test_auto.html">구성도</a></li>
					<li><a href="./clapp_test_auto.html">주요기능</a></li>
					<li><a href="./mobile_testing_guide1.html">이용 가이드</a></li>
				</ul>
				<span class="wbcCompanyIntro"><a href="./company_introduction.html">회사 소개</a></span>
			</div>
		</div>
		<div class="wbcBox4">
			<div class="wbcBox4Con">
				<span class="wbcQaConsulting"><a href="./clapp_qa_consulting.html">QA 컨설팅</a></span>
				<ul>
					<li><a href="./clapp_qa_consulting.html">클앱 QA 컨설팅</a></li>
					<li><a href="./clapp_qa_consulting.html">특 · 장점</a></li>
					<li><a href="./clapp_qa_consulting.html">프로세스</a></li>
				</ul>
				<span class="wbcProductIntro"><a href="./payment_guide.html">상품 안내</a></span>
			</div>
		</div>
	</div>
</div>