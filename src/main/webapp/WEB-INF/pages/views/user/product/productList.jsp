<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="dgPageNav" uri="/WEB-INF/tlds/PageNavigation.tld" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<div class="subJoinGnbBottomContainer">
    <div class="subJoinGnbBottomBg">
        <div class="subJoinGnbBottomBox2">
            <div class="subJoinGnbBottom">
                <span class="subJoinTitle">상품 안내</span>
            </div>
            <div class="subStartBox">
                <%--<a href="#"><img src="${contextPath }/resources/images/gnb_start.png"  onmouseover="this.src='${contextPath }/resources/images/gnb_start_r.png';" onMouseOut="this.src='${contextPath }/resources/images/gnb_start.png';" alt="시작하기" /></a>--%>
                <a href="#"><img class="GnbStartButton" onclick="JnlpUtils.startTest()" src="${contextPath }/resources/images/gnb_start.png"  onmouseover="this.src='${contextPath }/resources/images/gnb_start_r.png';" onMouseOut="this.src='${contextPath }/resources/images/gnb_start.png';" alt="시작하기" /></a>
            </div>
        </div>
    </div>
</div>
</div> <!-- .subGnbContainer End -->


<div class="subPGInfoContainer">
    <div class="subPGInfoBg">
        <div class="subPGInfoBox">
            <div class="subPGInfoContBox">
                <div class="subPGInfoCont"><img src="${contextPath}/resources/images/info_btn.png" width="64" height="72" border="0"></div>
                <div class="subPGInfoTxt">상품 구매 전 꼭 확인하세요!</div>
                <div class="subPGInfoTxt2">
                        <span>테스트 진행 시 디바이스 1대당 5분 단위로 차감됩니다.<br>
                        - 예시1) 2분간 이용하시면 이용시간은 5분이 차감됩니다.<br>
                        - 예시2) 7분을 이용하시면 10분이 차감됩니다.</span>
                </div>
            </div><!-- .subPGInfoContBox End -->
            <div class="subPGInfolineBox">
                <div class="subPGInfoline"></div>
            </div><!-- .subPGInfolineBox End -->
            <div class="subPGInfoadvBox">
                <div class="subPGInfoadvTxt">
                    <span class="subPGInfoadvt1">개별 계약상품 문의</span>
                    <span class="subPGInfoadvt3">support@clapp.co.kr  /  1661-7083</span>
                </div>
            </div><!-- .subPGInfoadvBox End -->

        </div><!-- .subPGInfoBox End -->
    </div><!-- .subPGInfoBg End -->
</div><!-- .subPGInfoContainer End -->


<div class="subPGTabContainer">
    <div class="subPGTabBg">
        <div class="subCISupportContentTwobox">
            <div class="subCISupportContentTabBox">
                <div class="subCISupportContentTab01">
                    <a href="javascript:void(0)" class="tab">
							<span class="subCISupportContentTab01Txt">
								시간 이용권
							</span>
                    </a>
                </div>
                <div class="subCISupportContentTab02">
                    <a href="javascript:void(0)" class="tab">
							<span class="subCISupportContentTab02Txt subCISupportContentTabHover">
								클앱 멤버십
							</span>
                    </a>
                </div>
                <div class="subCISupportContentTab03">
                    <a href="javascript:void(0)" class="tab">
							<span class="subCISupportContentTab03Txt">
								개별 계약상품
							</span>
                    </a>
                </div>
            </div>
        </div>
    </div><!-- .subCIArticleGnbBottomBg -->
</div><!-- .subTCIArticleGnbBottomContainer End -->

<%--subPGInfoContainer start--%>
<div class="tabContent" id="subCISupportContentTab01Txt" style="display:none">
    <div class="submemberTwoContainer">
        <div class="submemTwoContbg">
            <div class="submemTwocontentBox">
                <div class="submemTwocontent">
                    <div class="submemTcontTxtBox1">
                        <div class="submemTcontTxt1_1">
                            <span>가입하면 드려요.</span>
                        </div>
                        <div class="submemTcontTxt1_2">
                            <span>무료체험권</span>
                        </div>
                        <div class="submemTcontTxt1_3">
                            <span>0원</span>
                        </div>
                        <div class="submemTcontTxt1_4">
                            <span>가입 후 30일까지<br>60분 무료이용</span>
                        </div>
                        <div class="submemTcontTxt1_5">
                            <span>*60분, 최대 12번 테스트<br>가능(5분 단위 기준)</span>
                        </div><div class="submemTcontTxt1_5">
                        <span>지정 디바이스10대<br>무료 인스톨 테스트 & <br>모바일웹 해상도 테스트 제공</span>
                    </div>
                        <div class="submemTcontTxt1_5">
                            <span>전체 디바이스<br>수동&자동테스트<br>예약/공유</span>
                        </div>
                    </div>

                    <div class="submemTcontbtnBox" id="freeJoin">

                        <c:choose>
                            <c:when test = "${userLoginSession.userMasterKey eq null}">
                                <a href="${contextPath }/members/memberJoin">
                                    <div class="submemTcontbtn1_1">
                                    </div>
                                </a>

                            </c:when>

                            <c:otherwise>
                                <script>
                                    $(document).ready(function() {
                                        $('#freeJoin').removeClass();
                                        $('#freeJoin').addClass('submemTcontbtnBox3');
                                    });

                                </script>
                            </c:otherwise>
                        </c:choose>

                        <a href="${contextPath }/product/popup/freeJoinPopup" onClick="itrPopup(this.href,'pop1');return false;">
                            <div class="submemTcontbtn1_2" >
                            </div>
                        </a>
                    </div>
                </div>

                <div class="submemTwocontent2">
                    <div class="submemTcontTxtBox1">
                        <div class="submemTcontTxt1_1">
                            <span>간단한 테스트는</span>
                        </div>
                        <div class="submemTcontTxt2_2">
                            <span>1시간이용권</span>
                        </div>
                        <div class="submemTcontTxt1_3">
                            <span>14,850원</span>
                        </div>
                        <div class="submemTcontTxt2_4">
                            <span>(계정당 / VAT 포함)</span>
                        </div>
                        <div class="submemTcontTxt2_5">
                            <span>결제한 날로부터<br>1년(365일)까지 사용</span>
                        </div>
                        <div class="submemTcontTxt2_6">
                            <span>*60분, 최대 12번 테스트<br>가능(5분 단위 기준)</span>
                        </div>
                        <div class="submemTcontTxt2_6">
                            <span>전체 디바이스<br>무료 인스톨 테스트 & <br>모바일웹 해상도 테스트 제공</span>
                        </div>
                        <div class="submemTcontTxt2_6">
                            <span>전체 디바이스<br>수동&자동테스트<br>예약/공유</span>
                        </div>
                    </div>
                    <div class="submemTcontbtnBox2">
                        <a href="${contextPath }/myClapp/payment?productMasterKey=15">
                            <div class="submemTcontbtn2_1">
                            </div>
                        </a>
                    </div>
                </div>

                <div class="submemTwocontent3">
                    <div class="submemTcontTxtBox1">
                        <div class="submemTcontTxt1_1">
                            <span>프로젝트 중이세요?</span>
                        </div>
                        <div class="submemTcontTxt2_2">
                            <span>5시간이용권</span>
                        </div>
                        <div class="submemTcontTxt3_3_1"><img src="${contextPath }/resources/images/member2_cont_03.png" width="81" height="20" padding="0">
                        </div>
                        <div class="submemTcontTxt3_3_2">
                            <span>15%↓</span>
                        </div>
                        <div class="submemTcontTxt3_3">
                            <span>62,700원</span>
                        </div>
                        <div class="submemTcontTxt3_4">
                            <span>(계정당 / VAT 포함)</span>
                        </div>
                        <div class="submemTcontTxt2_5">
                            <span>결제한 날로부터<br>1년(365일)까지 사용</span>
                        </div>
                        <div class="submemTcontTxt2_6">
                            <span>*300분, 최대 60번 테스트<br>
                            가능(5분 단위 기준)</span>
                        </div>
                        <div class="submemTcontTxt2_6">
                            <span>전체 디바이스<br>무료 인스톨 테스트 & <br>모바일웹 해상도 테스트 제공</span>
                        </div>
                        <div class="submemTcontTxt2_6">
                            <span>전체 디바이스<br>수동&자동테스트<br>예약/공유</span>
                        </div>
                    </div>
                    <div class="submemTcontbtnBox2">
                        <a href="${contextPath }/myClapp/payment?productMasterKey=19">
                            <div class="submemTcontbtn2_1">
                            </div>
                        </a>
                    </div>
                </div>

                <div class="submemTwocontent4">
                    <div class="submemTcontTxtBox1">
                        <div class="submemTcontTxt1_1">
                            <span>서비스 운영중이라면</span>
                        </div>
                        <div class="submemTcontTxt2_2">
                            <span>10시간이용권</span>
                        </div>
                        <div class="submemTcontTxt3_3_1"><img src="${contextPath }/resources/images/member2_cont_02.png" width="91" height="20"padding="0">
                        </div>
                        <div class="submemTcontTxt3_3_2">
                            <span>25%↓</span>
                        </div>
                        <div class="submemTcontTxt3_3">
                            <span>110,000원</span>
                        </div>
                        <div class="submemTcontTxt3_4">
                            <span>(계정당 / VAT 포함)</span>
                        </div>
                        <div class="submemTcontTxt2_5">
                            <span>결제한 날로부터<br>1년(365일)까지 사용</span>
                        </div>
                        <div class="submemTcontTxt2_6">
                            <span>*600분, 최대 150번 테스트<br>
                            가능(5분 단위 기준)</span>
                        </div>
                        <div class="submemTcontTxt2_6">
                            <span>전체 디바이스<br>무료 인스톨 테스트 & <br>모바일웹 해상도 테스트 제공</span>
                        </div>
                        <div class="submemTcontTxt2_6">
                            <span>전체 디바이스<br>수동&자동테스트<br>예약/공유</span>
                        </div>
                    </div>
                    <div class="submemTcontbtnBox2">
                        <a href="${contextPath }/myClapp/payment?productMasterKey=24">
                            <div class="submemTcontbtn2_1"></div>
                        </a>
                    </div>
                </div>
            </div>
            <div class="submemTTxtBox">
                <div class="submemTTxt">
                    <span>※1시간, 5시간, 10시간 이외의 시간 이용권은 결제 페이지에서 선택하여 구매 가능합니다.</span>
                </div>
            </div>
        </div>
    </div>
    <div class="submemTinfocontent">
        <div class="submemTcontentbg">
            <div class="submemTcontent">
                <div class="submemTtitleTxtBox">
                    <div class="submemTtitleTxt">
                        <span>모든 상품의 기능은 동일합니다.</span>
                    </div>
                </div>
            </div>
            <div class="submemTcontentBoxbg">
                <div class="submemTcontentBox">
                    <div class="submemTcontentTxtBox">
                        <div class="submemTcontentTxt1">
                            <span>전체 디바이스</span>
                        </div>
                        <a href="${contextPath }/clappTesting/autoDevice">
                            <div class="submemTcontentTxtB1">
                                <div class="submemTcontentTxt1_2">자세히 보기
                                </div>
                            </div>
                        </a>
                    </div>
                    <div class="submemTcontentTxtBox">
                        <div class="submemTcontentTxt1">
                            <span>수동&자동 테스트</span>
                        </div>
                    </div>
                    <div class="submemTcontentTxtBox">
                        <div class="submemTcontentTxt1">
                            <span>앱 설치 및 모바일<br>해상도 테스트 대행</span>
                        </div>
                        <a href="${contextPath }/popup/noticePopup" onClick="itrPopup(this.href,'pop2');return false;">
                            <div class="submemTcontentTxtB2">
                                <div class="submemTcontentTxt1_3">자세히 보기
                                </div>
                            </div>
                        </a>
                    </div><div class="submemTcontentTxtBox">
                    <div class="submemTcontentTxt1">
                        <span>공유</span>
                    </div>
                </div><div class="submemTcontentTxtBox">
                    <div class="submemTcontentTxt1">
                        <span>예약</span>
                    </div>
                </div>
                </div>
            </div>
            <div class="submemTinfoTxtBox">
                <div class="submemTinfoTxt1">
                    <span>※ 앱설치 및 모바일 해상도 테스트 대행은 유/무료 회원에 따라 테스트 실행 디바이스 대수가 다릅니다. (무료 회원 : 10대 / 유료 회원 : 전체 디바이스) </span>
                </div>
            </div>
            <div class="submemTinfoTxtBox2">
                <div class="submemTinfoline">
                </div>
            </div>
            <div class="submemTinfoTxtBox3">
                <div class="submemTinfoTxt1_2">
                    <p>- VAT 10% 포함 가격입니다. <br>
                        - 5시간 이용권 구매 시 10%, 10시간 이용권 구매 시 25%가 할인됩니다. <br>
                        - 상품 유효기간은 결제완료 시점부터 1년(365일) 입니다. <br>
                        - 구매하신 상품은 마이클앱 > 이용현황 에서 확인 하실 수 있습니다. <br>
                        - <span style="color: rgb(255, 0, 0);">구매 후 7일 이내에 클앱 사용 내역이 없을 경우 웹결제 상품에 한해서 청약철회가 가능합니다. </span><br>
                        - 가상계좌 입금 결제 시 입금완료 확인된 후부터 상품 이용이 가능합니다. <br>
                        - 테스트 프로그램 이용 시 java 최신 버전이 설치되어 있어야 합니다.  [<a href="http://java.com/ko/download/index.jsp" target="_blank">다운로드</a>] <br>
                        - 무료 앱 인스톨 및 모바일웹 해상도 테스트는 회원의 요청이 있을 경우에 제공됩니다. (테스트 결과 리포트 포함)  <br>
                        - 무료 체험권 이용자는 회원가입일로부터 30일 이내에 신청해야 무료 테스트 혜택을 이용하실 수 있습니다.  </p>
                </div>
            </div>
        </div>
    </div>
</div>
    <%--subPGInfoContainer end--%>
<div class="tabContent" id="subCISupportContentTab03Txt" style="display:none">
    <div class="submemberThreeContainer">
        <div class="submemThrContBox">
            <div class="submemThrContitem1Box">
                <div class="submemThrContitem1TitleBox">
                    <span class="submThrContTxt1">'개별 계약상품'</span>
                </div>
                <div class="submemThrContitem1TitleBox2">
                    <span class="submThrContTxt1_1">은…</span>
                </div>
                <div class="submemThrContitem1TitleBox3">
                    <span class="submThrContTxt1_3">상품 이용기간과 이용시간, 기능 등을 <br>별도 협의를 통해 구성할 수 있는 <br>맞춤형 상품입니다.</span>
                </div>
            </div>
            <div class="submemThrContitem2Box">
                <div class="submemThrContitem2bg">
                    <div class="submemThrContitem1TitleBox4_1">
                        <span class="submThrContTxt4_1">맞춤형<br>서비스</span>
                    </div>
                    <div class="submemThrContitem1TitleBox4_2">
                        <span class="submThrContTxt4_2">테스트 대행</span>
                    </div>
                    <div class="submemThrContitem1TitleBox5_2">
                        <span class="submThrContTxt5_2">월정액 상품</span>
                    </div>
                    <div class="submemThrContitem1TitleBox6_2">
                        <span class="submThrContTxt5_2">연(年)단위 상품</span>
                    </div>
                    <div class="submemThrContitem1TitleBox7_2">
                        <span class="submThrContTxt5_2">SaaS</span>
                    </div>
                    <div class="submemThrContitem1TitleBox8_2">
                        <span class="submThrContTxt5_2">전용 디바이스</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="submemThrContentTwoContainer">
        <div class="submemThrContentTwoBox">
                <div class="submemThrContentTwoLine"></div>
                <span class="submemThrContentTwoTitle">이용 방법</span>
                <div class="submemThrContentTwoFlowBox">
                    <div class="submThrContTFlowItem1">
                        <span class="submThrContTComment">전화 또는 메일로<br>계약요청</span>
                    </div>
                    <div class="submThrContTFlowTab"></div>
                    <div class="submThrContTFlowItem2">
                        <span class="submThrContTComment">상담 후<br>상품 구성 확정</span>
                    </div>
                    <div class="submThrContTFlowTab"></div>
                    <div class="submThrContTFlowItem3">
                        <span class="submThrContTComment">회원가입 후<br>관리자 계약등록</span>
                    </div>
                    <div class="submThrContTFlowTab"></div>
                    <div class="submThrContTFlowItem4">
                        <span class="submThrContTComment">상품 적용 완료<br>▶ 서비스 이용</span>
                    </div>
                </div>
            </div>
    </div> <!-- .subContentSevenContainer End -->
    <div class="submemThrinfocontent">
        <div class="submemThrcontentbg">
            <div class="submemThrinfoTxtBox3">
                <div class="submemThrinfoTxt1_2">
                    <p>- 상품 구성 및 금액은 개별 문의 바랍니다. <br>
                        - 구매하신 상품은 마이클앱 > 이용현황 에서 확인 하실 수 있습니다. <br>
                        - 수동 테스트 프로그램 이용 시 java 최신 버전이 설치되어 있어야 합니다.  [<a href="http://java.com/ko/download/index.jsp" target="_blank">다운로드</a>]  </p>
                </div>
            </div>
        </div>
    </div>
</div>





<div class="tabContent" id="subCISupportContentTab02Txt">
    <div class="submemberOneContainerBox">
        <div class="submemberOneBg">
            <div class="submemberOneBox">
                <div class="submemberoneTxtBox">
                    <div class="submemberOneTxt1">
                        <p>저렴한 가격으로 <u>Testing Center</u> 구축의 기회!!!!</p>
                    </div>
                    <div class="submemberOneTxt2">
                        <span>“ 클앱 멤버십 ”</span>
                    </div>
                </div>
                <div class="submembericonBox">
                    <div class="submembericon">
                        <div class="submemberContBox">
                            <div class="submembericonTxt1">
                                <span>모바일 서비스를 운영 중이라면</span>
                            </div>
                            <div class="submembericonTxt1_2">
                                <p><span style="color: rgb(47, 124, 212);">990,000 원</span> / 연간</p>
                            </div>
                            <div class="submembericonTxt1_3">
                                <span>(결제일로부터 365일까지)</span>
                            </div>
                            <div class="submemberpayBtn">
                                <a href="${contextPath }/myClapp/payment?productMasterKey=25">
                                    <img src="${contextPath }/resources/images/member_pay_btn.png" alt="결제하기" onMouseOver="this.src='${contextPath }/resources//images/member_pay_btn_r.png';" onMouseOut="this.src='${contextPath }/resources//images/member_pay_btn.png';" />
                                </a>
                            </div>
                        </div>
                        <div class="submemberContBox2">
                            <div class="submembericonTxt2">
                                <span>모바일 프로젝트 중이세요?</span>
                            </div>
                            <div class="submembericonTxt2_2">
                                <p><span style="color: rgb(47, 124, 212);">220,000 원</span> / 월간</p>
                            </div>
                            <div class="submembericonTxt2_3">
                                <span>(결제일로부터 30일까지)</span>
                            </div>
                            <div class="submemberpayBtn2">
                                <a href="${contextPath }/myClapp/payment?productMasterKey=26"><img src="${contextPath }/resources/images/member_pay_btn.png" alt="결제하기" onMouseOver="this.src='${contextPath }/resources//images/member_pay_btn_r.png';" onMouseOut="this.src='${contextPath }/resources//images/member_pay_btn.png';" /></a>
                            </div>
                        </div>
                    </div>
                    <div class="submembericonTxtBox3">
                        <div class="submembericonTxt3">
                            <il>전체 디바이스<br>이용</il></div>
                        <div class="submembericonTxt3">
                            <il>클앱 멤버십<br>인증서 발급</il></div>

                        <div class="submembericonTxt3">
                            <il>자동화 테스트<br>프로그램 교육</il></div>

                        <div class="submembericonTxt3">
                            <il>자동화 스크립트<br>작성지원</il></div>

                        <div class="submembericonTxt3">
                            <il>앱 모니터링 및<br>SNS 홍보 지원</il></div>
                    </div>
                </div>
                <!--
                <div class="subconttitlebtnBox">
                	<div class="subconttitlebtn">
                    	<a href="./join_from_individual.html">
                        	</a><a href="./join_from_individual.html" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('subconttitlebtn','','images/member_title_btn_r.png',0)">
                            <img src="images/member_title_btn.png" alt="" width="184" height="51" id='subconttitlebtn'></a>
					</div>
				</div>-->
            </div>
        </div>
    </div>
    <div class="subintTitleContainer">
        <div class="subtitlebg">
            <div class="subtitleTxtBox">
                <div class="subtitleTxt">[ 클앱 멤버십에 가입하시면! ]
                </div>
            </div>
        </div>
    </div>
        <div class="subintOneContainer">
            <div class="subiOCBg">
                <div class="subintContLine"></div>
                <div class="subintContenttitle">
                    <p>01  클앱 <span style="color: rgb(51, 115, 185);">전체 디바이스 이용</span> (최대 5시간/日)</p>
                </div><!--subintContenttitle-->
                <div class="subintContentBox">
                    <div class="subintContTxtBox">
                        <div class="subintContTxt">
                                        <span>
                                            클앱이 보유하고 있는 <b>모든 디바이스를 1년 동안 단 1대의 가격</b>으로 이용해 보실 수 있습니다.
                                        </span>
                        </div>
                    </div>
                    <div class="subcontImgBoxbg">
                        <div class="subcontImgBox">
                            <div class="subcontImgTxt">
                                <span>1대 가격</span>
                            </div>
                            <div class="subcontImgTxt2">
                                <span>클앱 보유 전체 디바이스</span>
                            </div>
                        </div>
                    </div>
                    <div class="subcontbtnBox">
                        <a href="${contextPath }/clappTesting/autoDevice">
                            <div class="subcontbtnBoxbg">
                                <div class="subcontbtnTxt">
                                    <span>전체 디바이스 보기</span>
                                </div>
                            </div>
                        </a>
                    </div>
                </div><!--subintContLine-->
            </div><!-- .subiOCBg End -->
        </div><!-- .subintOneContainer End -->
        <div class="subintTwoContainer">
            <div class="subiTCBg2">
                <div class="subiTCBox">
                    <div class="subintContLine"></div>
                    <div class="subintContenttitle">
                        <p>02  앱 설치 & 모바일 해상도 <span style="color: rgb(51, 115, 185);">테스트 대행</span></p>
                    </div><!--subintContenttitle-->
                    <div class="subintContentBox">
                        <div class="subintContTxtBox">
                            <div class="subintContTxt">
                                                        <span>
                                                            <b>앱 설치 테스트</b> 또는 <b>모바일 해상도 테스트</b>를 횟수 제한 없이 <b>무료로 대행</b>해 드립니다.
                                                        </span>
                            </div>
                        </div>
                        <div class="subcontImgBoxbg2">
                            <div class="subcontImgBox2">
                                <div class="subcontBox2">
                                    <div class="subcontent2">
                                        <div class="subsubcontTxtBox2">
                                            <div class="subcontTxt2">
                                                <span>클앱의 전체 디바이스 테스트 진행</span>
                                                <span>결과 리포트 제공</span>
                                            </div>
                                        </div>
                                        <div class="subsubcontTxtBox2_2">
                                            <div class="subcontTxt2_2">
                                                <span>클앱 멤버십 회원</span>
                                            </div>
                                        </div>
                                        <div class="subsubcontTxtBox2_3">
                                            <div class="subcontTxt2_3">
                                                <span>테스트 요청</span>
                                            </div>
                                        </div>
                                        <div class="subsubcontTxtBox2_4">
                                            <div class="subcontTxt2_4">
                                                <span>결과 리포트 발송</span>
                                            </div>
                                        </div>
                                        <div class="subsubcontTxtBox2_5">
                                            <div class="subcontTxt2_5">
                                                <span>클앱 담당자가 직접<br>테스트</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="subcontbtnBox">
                            <a href="${contextPath }/popup/noticePopup" onClick="itrPopup(this.href,'pop2');return false;">
                                <div class="subcontbtnBoxbg">
                                    <div class="subcontbtnTxt">
                                        <span>신청하기</span>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div><!--subintContLine-->
                </div><!-- .subiTCBox End -->


                <div class="subContectTxtBox3">
                    <div class="subContectTxt3">
                        <span>※ 앱 설치 테스트 : 앱 설치 여부 확인</span>
                        <span>※ 모바일 해상도 테스트 : 디바이스에서 화면이 제대로 표시 되는지 확인</span>
                        <span>※ 신청횟수는 무제한입니다.</span>
                        <span>※ 테스트 실행 디바이스 갯수는 내부 사정에 인하여 조정 가능합니다. </span>
                    </div>
                </div>
            </div><!-- .subiTCBg2 End -->
        </div><!-- .subintTwoContainer End -->
        <div class="subintOneContainer3">
            <div class="subiOCBg3">
                <div class="subintContLine">
                </div>
                <div class="subintContenttitle">
                    <p>03  클앱 멤버십 <span style="color: rgb(51, 115, 185);">인증서 발급</span></p>
                </div><!--subintContenttitle-->
                <div class="subintContentBox3">
                    <div class="subcontImgBoxbg3">
                        <a href="${contextPath }/product/popup/paymentGuideSample" onClick="itrPopup(this.href,'pop2');return false;">
                            <div class="subcontImgbg3">
                                <div class="subcontbtnTxt3">
                                    <span>샘플 보기</span>
                                </div>
                            </div>
                        </a>
                    </div>
                    <div class="subcontBoxbg3">
                        <div class="subcontImgBoxbg3_2">
                            <div class="subcontlmgarrow"><img src="${contextPath }/resources/images/member_cont_arrow.png" width="12" height="117" alt="체크표시"/></div>
                        </div>
                        <div class="subcontbtnTxt3_2">
                                            <span>가입 시 Testing Certificate 발급 <br>
                                                  한 달에 1번 보유 디바이스 목록 갱신 제공(메일 발송)<br>
                                                  클앱 SNS 홍보 채널에 멤버십 회원 성공 스토리 소개<br>
                                                  모바일 프로젝트 제안 또는 진행 시 품질 보증 수단으로 활용</span>
                        </div>
                    </div>
                </div><!--subintContLine-->
            </div><!-- .subiOCBg3 End -->
        </div><!-- .subintOneContainer3 End -->
        <div class="subintOneContainer4">
            <div class="subiOCBg4">
                <div class="subintContLine">
                </div>
                <div class="subintContenttitle">
                    <p>04 자동화 프로그램 교육 지원</p>
                </div><!--subintContenttitle-->
                <div class="subintContentBox4">
                    <div class="subcontImgBoxbg4">
                        <div class="subcontTxtBox4">
                            <div class="subcontTxt4">
                                            <span>자동화 프로그램 사용에 어려움이 있는 회원들에게 무료 교육 제공<br>
                                                  프로그램 실행 방법부터 자동화 스크립트 작성방법 TIP 전달</span>
                            </div>
                        </div>
                    </div>
                </div><!--subintContLine-->
            </div><!-- .subiOCBg End -->
        </div><!-- .subintOneContainer End -->
        <div class="subintOneContainer5">
            <div class="subiOCBg5">
                <div class="subintContLine">
                </div>
                <div class="subintContenttitle">
                    <p>05  자동화 프로그램 스크립트 작성 대행</p>
                </div><!--subintContenttitle-->
                <div class="subintContentBox5">
                    <div class="subcontImgbgBox5">
                        <div class="subcontImgbg5"><img src="${contextPath }/resources/images/member_cont_05.png" width="412" height="192" padding="0" >
                        </div>
                    </div>
                    <div class="subcontImgBoxbg5_2"><img src="${contextPath }/resources/images/member_cont_arrow_02.png" width="12" height="9" padding="0" alt="체크표시"/></div>
                    <div class="subcontTxt5_2">
                                            <span>스크립트(테스트 시나리오) 작성에 어려움을 겪는 회원들을 <br>
                                                  대신하여 테스트 스크립트 작성 대행</span>
                    </div>
                </div>
            </div><!--subiOCBg5-->
        </div><!--subintOneContainer5-->
        <div class="subintOneContainer6">
            <div class="subiOCBg6">
                <div class="subintContLine">
                </div>
                <div class="subintContenttitle">
                    <p>06  앱 모니터링 및 클앱 SNS를 통한 홍보</p>
                </div><!--subintContenttitle-->
                <div class="subintContentBox6">
                    <div class="subcontImgBox6_1">
                        <div class="subcontImgbg6"><img src="${contextPath }/resources/images/member_cont_06_1.png" width="265" height="323" padding="0" alt=""/>
                        </div>
                        <div class="subcontImgBoxbg6_1"><img src="${contextPath }/resources/images/member_cont_arrow_02.png" width="12" height="9" padding="0" alt="체크표시"/>
                        </div>
                        <div class="subcontTxt6_1">
                            <span>앱스토어 내 리뷰 모니터링</span>
                        </div>
                    </div>
                    <div class="subcontImgbgBox6_2">
                        <div class="subcontImgbg6_2"><img src="${contextPath }/resources/images/member_cont_06_2.png" width="436" height="335" padding="0" alt=""/></div>
                        <div class="subcontImgBoxbg6_2"><img src="${contextPath }/resources/images/member_cont_arrow_02.png" width="12" height="9" padding="0" alt="체크표시"/></div>
                        <div class="subcontTxt6_2">
                            <span>클앱 페이스북, 블로그를 통한 홍보 지원<br></span>
                            <span class="subcontTxt6_3">(페이스북 기준 광고 도달수 1만명 이상 보장)</span>
                        </div>
                    </div>
                </div>
            </div>
        </div><!-- .subintOneContainer6 End -->
        <div class="subintOneContainer7">
            <div class="subintContentBox7">
                <div class="subcontImgBox7">
                    <div class="subcontImgBoxbg7">
                        <div class="subconImg7"><img src="${contextPath }/resources/images/member_cont_07.png" width="24" height="28" padding="0" alt="체크표시"/>
                        </div>
                        <div class="subcontTxt7">
                            <p>무통장 입금을 하시는 분들은 클앱 멤버십 신청서를 작성하여 <span style="color: rgb(51, 115, 185);"><a href="mailto:support@clapp.co.kr"><B><u>support@clapp.co.kr</u></B></a></span>으로 보내주시기 바랍니다.</p>
                        </div>
                    </div>
                </div>

                <div class="subcontbtnBox">
                    <a href="javascript:void(0);">
                        <div class="subcontbtnBoxbg">
                            <div class="subcontbtnTxt" onclick="autoJnlpDownload();">
                                <span>신청서 다운로드</span>
                            </div>
                        </div>
                    </a>
                </div>
            </div>
        </div>
</div>

<!-- .subintOneContainer End -->
<script>
    //3 tab
    $(function(){
        $( '.tab' ).click( function() {
//            console.log($(this).children().attr('class'));
            $('.tabContent').hide();
            $('.tab').children().removeClass('subCISupportContentTabHover')
            var objvalue= $(this).children().attr('class');
            $("#"+objvalue).show();
            $(this).children().addClass('subCISupportContentTabHover');
        });
    });

var goPayment = function(key) {
	var userType = "${userLoginSession.userType}";

	if(userType == 2) {
		var msg = "현재 (기업/단체) 고객님께서는 \n(${ticketInfo.productName}) 개별 계약 상품을 이용하고 계십니다.\n상품 문의는 클앱 고객센터 1661-7083으로 문의 바랍니다.";
		alert(msg);
		return false;
	}

	var usedProductKey = '${ticketInfo.productMasterKey}';
	var goProductKey = key;

	if(usedProductKey != '' && usedProductKey <= goProductKey) {
		if(confirm("현재 (일반)고객님께서는 \n('${ticketInfo.productName}') 상품을 이용하고 계십니다. "+
				"\n다른 상품을 추가 구매하실 경우 현재 사용중인 상품의 잔여티켓은 모두"+
				"\n차감 처리되고 새로 구매하신 상품의 티켓만 사용 가능하오니 신중히"+
			    "\n생각하시고 구매 하시기 바랍니다.")){
            location.href = contextPath+"/myClapp/payment?productMasterKey="+key
        } else {
            return false;
        }
	} else if(usedProductKey != '' && usedProductKey > goProductKey) {
        alert("현재 (일반)고객님께서는 \n('${ticketInfo.productName}') 상품을 이용하고 계십니다. "+
                "\n클앱은 현재 사용중인 상품보다 더 낮은 등급의 상품은 구매가 불가능합니다."+
                "\n고객 여러분의 많은 양해 부탁 드립니다."+
                "\n기타 상품구매와 관련하여 고객센터 1661-7083 또는"+
                "\nsupport@clapp.co.kr로 문의 주시기 바랍니다.");
        return false
    }
    location.href = contextPath+"/myClapp/payment?productMasterKey="+key

};
//소개서 다운로드 링크
var autoJnlpDownload = function(){
	var orgFileName = "CLAPP_JOIN.pdf";
    location.href = contextPath + "/common/fileDownload?path=download&orgFileName="+orgFileName;

};

    function itrPopup(linkUrl,num){
        console.log(linkUrl);
        if(num == "pop1"){
            window.open(linkUrl,  "startpop", "width=700, height=850, scrollbars=no, resizable=no ,status=no ,toolbar=no");

        }
        if(num =="pop2" ) {
            window.open(linkUrl, "startpop", "width=400, height=300, scrollbars=no, resizable=no ,status=no ,toolbar=no");
        }
        if(num =="pop3" ) {
            window.open(linkUrl, "startpop", "width=500, height=500, scrollbars=no, resizable=no ,status=no ,toolbar=no");
        }
    }
</script>
