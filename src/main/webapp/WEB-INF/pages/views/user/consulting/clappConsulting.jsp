<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="dgPageNav" uri="/WEB-INF/tlds/PageNavigation.tld" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<div class="subMTGnbBottomContainer">
	<div class="subMTGnbBottomBox">
		<div class="subMTGnbBottom">
			<ul>
				<li class="qaLi smtgbItem"><a href="#cqc" class="qaScroll ctqc">클앱 컨설팅</a></li>
				<li></li>
				<li class="qaLi smtgbItem"><a href="#camerit" class="qameritScroll ctqc">특·장점</a></li>
				<li></li>
				<li class="qaLi smtgbItem"><a href="#result" class="qaperformanceScroll ctqc">최근 수행 실적</a></li>
				<li></li>
				<li class="qaLi smtgbItem"><a href="#process" class="qaprocessScroll ctqc">프로세스</a></li>
				<li></li>
			</ul>
		</div>
		<div class="subMTStartBox">
			<a href="#"><img src="${contextPath }/resources/images/gnb_start.png" onclick="JnlpUtils.startTest()" onmouseover="this.src='${contextPath }/resources/images/gnb_start_r.png';" onMouseOut="this.src='${contextPath }/resources/images/gnb_start.png';" alt="시작하기" /></a>
			</div>
		</div>
	</div>
</div> <!-- .subGnbContainer End -->
</div><!-- #subMenu End -->
<div class="subQAHeaderGraphicContainer">
	<div class="subQAHeaderGraphicBgBox">
		<div class="subQAHeaderGraphicBox">
			<div class="subQAHeaderTextContainer">
				<div class="subQAHeaderTextBox">
					<span class="qaTitle">클앱 컨설팅</span>
                          <span class="qaSlogan">CLAPP CONSULTING</span>
					<p class="qaGpText">
						풍부한 경험과 국제 표준에 의한 품질 요소 검증을<br />
						기반으로 소프트웨어 테스트 관련 최고의 기술을<br />
						보유하고 있습니다.<br />
					</p>
					<div class="qaButton">
						<a href="${contextPath }/introduction/supportInquire?inquiryCategory=3" class="qaButtonStart">
							<div>
								<img src="${contextPath }/resources/images/contents_btn_qac.png" onMouseOver="this.src='${contextPath }/resources/images/contents_btn_qac_r.png';" onMouseOut="this.src='${contextPath }/resources/images/contents_btn_qac.png';" alt="QA 컨설팅 문의"/>
							</div>
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</div> <!-- .subHeaderGraphicContainer End -->

<div class="subQAContentOneContainer">
  <div class="subQAContentOnebox">
    <div class="subQACOBLine"></div>
    <span class="subQACOBTitle">특·장점</span>
    <span class="subQACOBItem1">국제 표준 기반</span>
    <p class="subQACOBItem1Text">
      Test Process와<br />
      Testing Service
    </p>
    <span class="subQACOBItem2">풍부한 경험</span>
    <p class="subQACOBItem2Text">
      15년 이상의 풍부한 경험과<br />
      미주, 구주, 중국, 일본 등의<br />
      Global Field Test 경험
    </p>
    <span class="subQACOBItem3">전문 인력</span>
    <p class="subQACOBItem3Text">
      각 Module별 분업 및<br />
      전문 인력 다수 보유
    </p>
    <span class="subQACOBItem4">검증된 수행 능력</span>
    <p class="subQACOBItem4Text">
      Smart 디바이스, Web,<br />
      Embedded S/W
    </p>
  </div>
</div> <!-- .subContentOneContainer End -->

<div class="subQAContentTwoContainer">
  <div class="subQAContentTwoBox">
    <div class="subQACTBLine"></div>
    <span class="subQACTBTitle">최근 수행 실적</span>
    <div class="subQACTCRowOneBox">
      <div class="subQACTCColOneBox">
        <div class="subQACTCColOneContBox">
          <div class="subQACTCColOneCont01">
            <div class="subQACTCColOneCont01Img01">
              <img src="${contextPath }/resources/images/qa_cqa_accompany_01.png" alt="" />
            </div>
            <div class="subQACTCColOneCont01Title">
              <span>무선 디바이스 검증</span>
            </div>
          </div>
          <div class="subQACTCColOneCont02F">
            <div class="subQACTCColOneCont02Tit">
              <span>2014년</span>
            </div><!-- .subQACTCColOneCont02Tit End -->
            <div class="subQACTCColOneCont02Txt">
              <ul>
                <li>
                  <span class="subQACTCMiddot">&middot;</span>Android AT&amp;T 모델 갤럭시S 5 외 4종 단말 검증
                </li>
                                    <li>
                  <span class="subQACTCMiddot">&middot;</span>TIZEN폰 유럽/일본 모델 단말 검증
                </li>
                                    <li>
                  <span class="subQACTCMiddot">&middot;</span>디지털카메라 NX mini 외 1종 단말 검증
                </li>
                                    <li>
                  <span class="subQACTCMiddot">&middot;</span>웨어러블 갤럭시기어 2 외 2종 단말 검증
                </li>
                                    <li>
                  <span class="subQACTCMiddot">&middot;</span>Android AT&amp;T 모델 갤럭시노트 4 외 2종 단말 검증
                </li>
                                    <li>
                  <span class="subQACTCMiddot">&middot;</span>웨어러블 갤럭시기어 VR 외 2종 단말 검증
                </li>
              </ul>
            </div><!-- .subQACTCColOneCont02Txt End -->
          </div><!-- .subQACTCColOneCont02 End -->
          <div class="subQACTCColOneCont03">
            <div class="subQACTCColOneCont03Tit">
              <span>2013년</span>
            </div><!-- .subQACTCColOneCont03Tit -->
            <div class="subQACTCColOneCont03Txt">
              <ul>
                <li>
                  <span class="subQACTCMiddot">&middot;</span>Android 유럽 모델 갤럭시S 4 외 2종 단말 검증
                </li>
                <li>
                  <span class="subQACTCMiddot">&middot;</span>TIZEN 플랫폼 어플리케이션 개발 검증
                </li>
                <li>
                  <span class="subQACTCMiddot">&middot;</span>Android 플랫폼 SKT모델 갤럭시노트3 단말 검증
                </li>
                <li>
                  <span class="subQACTCMiddot">&middot;</span>
                  웨어러블 갤럭시기어1 외 1종 단말 검증
                </li>
                <li>
                  <span class="subQACTCMiddot">&middot;</span>TIZEN폰 유럽 모델 단말 검증
                </li>
                                    <li>
                  <span class="subQACTCMiddot">&middot;</span>디지털 카메라 갤럭시카메라2 단말 검증
                </li>
              </ul>
            </div><!-- .subQACTCColOneCont03Txt End -->
          </div><!-- .subQACTCColOneCont03 End -->
          <div class="subQACTCColOneCont04">
            <div class="subQACTCColOneCont04Tit">
              <span>2012년</span>
            </div><!-- .subQACTCColOneCont04Tit End -->
            <div class="subQACTCColOneCont04Txt">
              <ul>
                <li>
                  <span class="subQACTCMiddot">&middot;</span>Android 유럽/미주 모델 갤럭시S 3 외 3종 단말 검증
                </li>
                <li>
                  <span class="subQACTCMiddot">&middot;</span>bada플랫폼 어플리케이션 개발 검증
                </li>
                <li>
                  <span class="subQACTCMiddot">&middot;</span>Android 유럽 모델 갤럭시노트2 단말 검증
                </li>
                <li>
                  <span class="subQACTCMiddot">&middot;</span>TIZEN플랫폼 어플리케이션 개발 검증
                </li>
              </ul>
            </div><!-- subQACTCColOneCont04Txt End -->
          </div><!-- .subQACTCColOneCont04 End -->
        </div><!-- .subQACTCColOneContBox End -->

      </div><!-- .subQACTCColOneBox End -->

      <div class="subQACTCColTwoBox">

        <div class="subQACTCColOneContBox">
          <div class="subQACTCColOneCont01">
            <div class="subQACTCColOneCont01Img02">
              <img src="${contextPath }/resources/images/qa_cqa_accompany_02.png" alt="" />
            </div>
            <div class="subQACTCColOneCont02Title">
              <span>Platform 검증</span>
            </div>
          </div>
          <div class="subQACTCColOneCont02">
            <div class="subQACTCColOneCont02Tit">
              <span>2014년</span>
            </div><!-- .subQACTCColOneCont02Tit End -->
            <div class="subQACTCColOneCont02Txt">
              <ul>
                <li>
                  <span class="subQACTCMiddot">&middot;</span>갤럭시S 5, 노트 4 등 18종 검증 (SKT, DCM, AU)
                </li>
              </ul>
            </div><!-- .subQACTCColOneCont02Txt End -->
          </div><!-- .subQACTCColOneCont02 End -->
          <div class="subQACTCColOneCont02">
            <div class="subQACTCColOneCont02Tit">
              <span>2013년</span>
            </div><!-- .subQACTCColOneCont02Tit End -->
            <div class="subQACTCColOneCont02Txt">
              <ul>
                <li>
                  <span class="subQACTCMiddot">&middot;</span>갤럭시S 4, 노트 3 등 14종 검증 (ATT, VZW, SKT)
                </li>
              </ul>
            </div><!-- .subQACTCColOneCont02Txt End -->
          </div><!-- .subQACTCColOneCont02 End -->
                        <div class="subQACTCColOneCont02">
            <div class="subQACTCColOneCont02Tit">
              <span>2012년</span>
            </div><!-- .subQACTCColOneCont02Tit End -->
            <div class="subQACTCColOneCont02Txt">
              <ul>
                <li>
                  <span class="subQACTCMiddot">&middot;</span>갤럭시노트 2 등 16종 검증 (ATT, VZW, SKT, LG)
                </li>
              </ul>
            </div><!-- .subQACTCColOneCont02Txt End -->
          </div><!-- .subQACTCColOneCont02 End -->
                        <div class="subQACTCColOneCont022">
            <div class="subQACTCColOneCont02Tit">
              <span>2011년</span>
            </div><!-- .subQACTCColOneCont02Tit End -->
            <div class="subQACTCColOneCont02Txt">
              <ul>
                <li>
                  <span class="subQACTCMiddot">&middot;</span>갤럭시S 2 외 14종 검증 (ATT, VZW, SKT, LG)
                </li>
              </ul>
              <!-- <span class="subQASp">* Android Platform 검증 경험 : GB ~ KK</span>
                <span class="subQASp">* 다양한 통신 방식의 검증 경험 : </span>
                <span class="subQASp">* 미주/유럽/일본/중국 등의 현지 필드테스트</span>
                <span class="subQASp">* 2G ~ LTE A 까지의 진행중인 모든 통신방식의 검증 경험 보유</span> -->

            </div><!-- .subQACTCColOneCont02Txt End -->
          </div><!-- .subQACTCColOneCont02 End -->                            
        </div><!-- .subQACTCColOneContBox End -->

      </div><!-- .subQACTCColTwoBox End -->
    </div><!-- .subQACTCRowOneBox End -->

    <div class="subQACTCRowTwoBox">
      <div class="subQACTCColThreeBox">

        <div class="subQACTCColTwoContBox">
          <div class="subQACTCColTwoCont01">
            <div class="subQACTCColTwoCont01Img01">
              <img src="${contextPath }/resources/images/qa_cqa_accompany_03.png" alt="" />
            </div>
            <div class="subQACTCColTwoCont01Title">
              <span>마켓/앱 서비스 검증</span>
            </div>
          </div>
          <div class="subQACTCColTwoCont02">
            <div class="subQACTCColTwoCont02Tit">
              <span>2014년</span>
            </div><!-- .subQACTCColOneCont02Tit End -->
            <div class="subQACTCColTwoCont02Txt">
              <ul>
                <li>
                  <span class="subQACTCMiddot">&middot;</span>A-Store향 어플리케이션 검증 (334,963건)
                </li>
                                    <li>
                  <span class="subQACTCMiddot">&middot;</span>TIZEN 어플리케이션 검증 (16,509건)
                </li>
              </ul>
            </div><!-- .subQACTCColOneCont02Txt End -->
          </div><!-- .subQACTCColOneCont02 End -->
          <div class="subQACTCColTwoCont03">
            <div class="subQACTCColTwoCont03Tit">
              <span>2013년</span>
            </div><!-- .subQACTCColOneCont02Tit End -->
            <div class="subQACTCColTwoCont02Txt">
              <ul>
                <li>
                  <span class="subQACTCMiddot">&middot;</span>A-Store향 어플리케이션 검증 (564,039건)
                </li>
              </ul>
            </div><!-- .subQACTCColOneCont02Txt End -->
          </div><!-- .subQACTCColOneCont02 End -->
          <div class="subQACTCColTwoCont022">
            <div class="subQACTCColTwoCont03Tit">
              <span>2012년</span>
            </div><!-- .subQACTCColOneCont02Tit End -->
            <div class="subQACTCColTwoCont03Txt">
              <ul>
                <li>
                  <span class="subQACTCMiddot">&middot;</span>A-Store향 어플리케이션 인증 (222,005건)
                </li>
              </ul>
            </div><!-- .subQACTCColOneCont02Txt End -->
          </div><!-- .subQACTCColOneCont3 End -->
        </div><!-- subQACTCColOneContBox End -->

      </div>

      <div class="subQACTCColFourBox">

        <div class="subQACTCColTwoContBox">
          <div class="subQACTCColTwoCont01">
            <div class="subQACTCColTwoCont01Img02">
              <img src="${contextPath }/resources/images/qa_cqa_accompany_04.png" alt="" />
            </div>
            <div class="subQACTCColTwoCont02Title">
              <span>Android Platform 개발지원</span>
            </div>
          </div>
          <div class="subQACTCColTwoCont03">
            <div class="subQACTCColTwoCont03Tit">
              <span>2011년~14년</span>
            </div><!-- .subQACTCColOneCont03Tit End -->
            <div class="subQACTCColTwoCont03Txt">
              <ul>
                <li>
                  <span class="subQACTCMiddot">&middot;</span>Android 과제 언어번역 적용 및 DB관리
                </li>
              </ul>
            </div><!-- .subQACTCColOneCont03Txt End -->
          </div><!-- .subQACTCColOneCont03 End -->
          <div class="subQACTCColTwoCont033">
            <div class="subQACTCColTwoCont03Tit">
              <span>2010년</span>
            </div><!-- .subQACTCColOneCont03Tit End -->
            <div class="subQACTCColTwoCont03Txt">
              <ul>
                <li>
                  <span class="subQACTCMiddot">&middot;</span>Android 다국어관리 시스템 개발
                </li>
              </ul>
            </div><!-- .subQACTCColOneCont03Txt End -->
          </div><!-- .subQACTCColOneCont03 End -->
        </div><!-- subQACTCColOneContBox End -->

      </div>
    </div>
  </div>
</div> <!-- .subContentFourContainer End -->

<div class="subQAContentThreeContainer">
  <div class="subQAContentThreeBox">
    <div class="subQACThreeBLine"></div>
    <span class="subQACThreeBTitle">프로세스</span>
    <div class="subQACFContentItemBox">
      <div class="sqacfItem01">
        <div class="sqacfItem01IconBox">
          <span>분석</span>
        </div>
        <div class="sqacfItem01TextBox">
          <p>
            Application 분석<br />
            테스트 목적<br />
            리스크 분석
          </p>              
        </div>
      </div><!-- .sqacfItem01 End -->
      <div class="sqacfItem02">
        <div class="sqacfItem02IconBox">
          <span>계획</span>
        </div>
        <div class="sqacfItem02TextBox">
          <p>
            테스트 전략 수립<br />
            인원 선정<br />
            테스트 장비 셋팅<br />
            일정 수립
          </p>              
        </div>
      </div><!-- .sqacfItem02 End -->
      <div class="sqacfItem03">
        <div class="sqacfItem03IconBox">
          <span>수행</span>
        </div>
        <div class="sqacfItem03TextBox">
          <p>
            인수시험<br />
            Test Case<br />
            기능/성능/사용성/UX/UI<br />
            탐색 테스팅
          </p>              
        </div>
      </div><!-- .sqacfItem03 End -->
      <div class="sqacfItem04">
        <div class="sqacfItem04IconBox">
          <span>완료</span>
        </div>
        <div class="sqacfItem04TextBox">
          <p>
            결함작성<br />
            결과보고서<br />
            피드백 후 후속조치
          </p>              
        </div>
      </div><!-- .sqacfItem03 End -->
    </div>
  </div>
</div> <!-- .subTAContentThreeContainer End -->

<div class="subQAContentFourContainer">
  <div class="subQAContentFourBox">
    
    <div class="subQACFourFlowBox">
      <div class="subQACFourFlowItem01">
        <div class="subQACFourFlowItem01Tit01">
          <span>SELLER</span>
        </div>
        <div class="subQACFourFlowItem01Tit02">
          <span>시험의뢰서</span>
        </div>
        <div class="subQACFourFlowItem01Tit03">
          <span>피드백</span>
        </div>
        <div class="subQACFourFlowItem01Tit04">
          <span>시험결과 피드백</span>
        </div>
        <div class="subQACFourFlowItem01Tit05">
          <span>완료</span>
        </div>
      </div><!-- .subQACFourFlowItem01 End -->
      <div class="subQACFourFlowItem02">
        <div class="subQACFourFlowItem02Tit01">
          <span>CLAPP</span>
        </div>
        <div class="subQACFourFlowItem02Tit02">
          <span>시험의뢰서</span>
        </div>
        <div class="subQACFourFlowItem02Cont0201">
          <span>분석</span>
        </div>
        <div class="subQACFourFlowItem02Cont0202">
          <span>설계</span>
        </div>

        <div class="subQACFourFlowItem02Tit03">
          <span>테스트 수행</span>
        </div>
        <div class="subQACFourFlowItem02Cont0301">
          <span>인수 시험</span>
        </div>
        <div class="subQACFourFlowItem02Cont0302">
          <span>Test Case</span>
        </div>
        <div class="subQACFourFlowItem02Cont0303">
          <span>탐색 테스팅</span>
        </div>
        <div class="subQACFourFlowItem02Cont0304">
          <span>기능 / 성능</span>
        </div>
        <div class="subQACFourFlowItem02Cont0305">
          <span>사용성 / UX / UI</span>
        </div>

        <div class="subQACFourFlowItem02Tit04">
          <span>시험결과서</span>
        </div>

        <div class="subQACFourFlowItem02Tit05">
          <span>후속조치</span>
        </div>

      </div><!-- .subQACFourFlowItem02 End -->
      <div class="subQACFourFlowItem03">
        <div class="subQACFourFlowItem03Tit01">
          <span>시험의뢰서 제출 (종류 선택)</span>
        </div>

        <div class="subQACFourFlowItem03Box01">
          <div class="subQACFourFlowItem03Tit02">
            <span>시험확인용</span>
          </div>
          <div class="subQACFourFlowItem03Cont02">
            <div class="subQACFourFlowItem03Cont0201">
              <div class="subQACFourFlowItem03Cont0201Tit">
                <span>SELLER</span>
              </div>
              <div class="subQACFourFlowItem03Cont0201Txt">
                <p>
                  의뢰서 제출계획서<br />
                  확인 후 의뢰 확정
                </p>
              </div>
            </div>
            <div class="subQACFourFlowItem03Cont0202">
              <div class="subQACFourFlowItem03Cont0202Tit">
                <span>CLAPP</span>
              </div>
              <div class="subQACFourFlowItem03Cont0202Txt">
                <p>
                  계획서 발행
                </p>
              </div>
            </div>
          </div>
        </div>

        <div class="subQACFourFlowItem03Box02">
          <div class="subQACFourFlowItem03Tit03">
            <span>인수시험</span>
          </div>
          <div class="subQACFourFlowItem03Cont03">
            <div class="subQACFourFlowItem03Cont0301">
              <div class="subQACFourFlowItem03Cont0301Tit">
                <span>SELLER</span>
              </div>
              <div class="subQACFourFlowItem03Cont0301Txt">
                <p>의뢰서, APK 제출</p>
              </div>
            </div>
            <div class="subQACFourFlowItem03Cont0302">
              <div class="subQACFourFlowItem03Cont0302Tit">
                <span>CLAPP</span>
              </div>
              <div class="subQACFourFlowItem03Cont0302Txt">
                <p>
                  계획서 발행, 앱 설치 및<br />
                  구동여부 테스트 후<br />
                  결과서 발행
                </p>
              </div>
            </div>
          </div>
        </div>

        <div class="subQACFourFlowItem03Box03">
          <div class="subQACFourFlowItem03Tit04">
            <span>전체시험</span>
          </div>
          <div class="subQACFourFlowItem03Cont04">
            <div class="subQACFourFlowItem03Cont0401">
              <div class="subQACFourFlowItem03Cont0401Tit">
                <span>SELLER</span>
              </div>
              <div class="subQACFourFlowItem03Cont0401Txt">
                <p>의뢰서, APK 제출</p>
              </div>
            </div>
            <div class="subQACFourFlowItem03Cont0402">
              <div class="subQACFourFlowItem03Cont0402Tit">
                <span>CLAPP</span>
              </div>
              <div class="subQACFourFlowItem03Cont0402Txt">
                <p>
                  계획서 발행, 인수 시험<br />
                  포함한 앱 전체 기능<br />
                  시험 후 결과서 발행
                </p>
              </div>
            </div>
          </div>
        </div>
      </div><!-- .subQACFourFlowItem03 End -->
    </div>
  </div>
</div> <!-- .subContentFourContainer End -->
<div id="cqc"></div>
<div id="camerit"></div>
<div id="result"></div>
<div id="process"></div>