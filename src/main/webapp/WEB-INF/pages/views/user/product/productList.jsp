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
							<a href="#"><img src="${contextPath }/resources/images/gnb_start.png"  onclick="JnlpUtils.startTest()" onmouseover="this.src='${contextPath }/resources/images/gnb_start_r.png';" onMouseOut="this.src='${contextPath }/resources/images/gnb_start.png';" alt="시작하기" /></a>
						</div>
					</div>
				</div>
			</div>
		</div> <!-- .subGnbContainer End -->
		<div class="subPGTabContainer">
			<div class="subPGTabBg">
				<div class="subPGTabBox">
					<div class="subPGTab">
						<a href="#all" class="subPGTab01">
								<span>All</span>
						</a>
<!-- 						<a href="#free" class="subPGTab02">
								<span>Free</span>
						</a> -->
						<a href="#basic" class="subPGTab03">
								<span>Basic</span>
						</a>
						<a href="#monthly" class="subPGTab04">
								<span>Monthly</span>
						</a>
						<a href="#annual" class="subPGTab05">
							<div>
								<span>Annual</span>
							</div><!-- .subPGTab05 End -->
						</a>
						<a href="#enterprize" class="subPGTab06">
							<div>
								<span>Enterprise</span>
							</div><!-- .subPGTab06 End -->
						</a>
					</div><!-- .subCIArticleGnbBottomBox End -->
				</div><!-- .subCIArticleGnbBottomBox -->
			</div><!-- .subCIArticleGnbBottomBg -->
		</div><!-- .subTCIArticleGnbBottomContainer End -->

		<div class="subPGInfoContainer">
			<div class="subPGInfoBg">
				<div class="subPGInfoBox">
					<div class="subPGInfoContBox">
						<div class="subPGInfoCont">
							<p>
								CLAPP을 이용하기 위한 상품 정보입니다.
							</p>
						</div>
					</div><!-- .subPGInfoContBox End -->
					<div class="subPGInfoDownloadBox">
						<div class="subPGInfoDownloadTxt">
							<p>서비스 소개서 다운로드</p>
						</div>
						<div class="subPGInfoDownloadImg" onclick="autoJnlpDownload();">
							<a href="#"><img src="${contextPath }/resources/images/contents_btn_download_board.png"  onmouseover="this.src='${contextPath }/resources/images/contents_btn_download_board_r.png';" onMouseOut="this.src='${contextPath }/resources/images/contents_btn_download_board.png';" alt="download" /></a>
						</div>
					</div><!-- .subPGInfoDownloadBox End -->
				</div><!-- .subPGInfoBox End -->
			</div><!-- .subPGInfoBg End -->
		</div><!-- .subPGInfoContainer End -->
		<c:if test = "${userLoginSession.userMasterKey eq null}"> 
		<div class="subPGProductOneContainer">
          <div align="center" style="padding-top: 30px;">
            <a href="${contextPath}/members/memberJoin"><img src="${contextPath }/resources/images/event_product.jpg" /></a>
          </div>
		</div><!-- .subPGProductTwoContainer End -->

<%-- 		<div class="subPGProductOneContainer">
			<div class="subPGPOCBg">
				<div class="subPGPOCBox">
					<div class="subPGPOCKindBox">
						<div class="subPGPOCKind">
							<span>Free</span>
						</div>
					</div>
					<div class="subPGPOCFncBox">
						<div class="subPGPOCFncContBox">
							<div class="subPGPOCFncCont">
								<p>
									신규 가입시 제공되는 상품으로 CLAPP 모바일 테스팅을 무료로<br />체험할 수 있습니다.
								</p>
							</div>
						</div>
						<div class="subPGPOCFncImgBox">
							<div class="subPGPOCFncImg">
								<div class="subPGPOCFncIcon01">
									<img src="${contextPath }/resources/images/guide_fnc_test.png" alt="" />
									<span>수동 테스트</span>
								</div>
								<div class="subPGPOCFncIcon02">
									<img src="${contextPath }/resources/images/guide_fnc_one.png" alt="" />
									<span>1개 디바이스<br />이용</span>
								</div>
							</div>
						</div>
					</div>
					<div class="subPGPOCBtnBox">
						<div class="subPGPOCBtn">
							<div class="subPGPOCBtnTitle">
								<span class="subPGPOCBold">무료</span><span class="subPGPOCMedium">(신규 가입시 제공)</span>
							</div>
							<div class="subPGPOCBtnSubTitle">
								<span>30분 사용 (2티켓 제공: 유효기간 : 30일)</span>
							</div>
							<a href="${contextPath}/members/memberJoin">
								<div class="subPGPOCBtnImg">
									<img src="${contextPath }/resources/images/buttons_news.png" onMouseOver="this.src='${contextPath }/resources/images/buttons_news_r.png';" onMouseOut="this.src='${contextPath }/resources/images/buttons_news.png';" alt="" />
								</div>
							</a>
						</div>
					</div>
				</div><!-- .subPGPOCBox End -->
			</div><!-- .subPGPOCBg End -->
		</div><!-- .subPGProductOneContainer End --> --%>
		</c:if>
		<div class="subPGProductTwoContainer">
			<div class="subPGPTCBg">
				<div class="subPGPTCBox">
					<div class="subPGPOCKindBox">
						<div class="subPGPOCKind">
							<span>Basic</span>
						</div>
					</div>
					<div class="subPGPOCFncBox">
						<div class="subPGPOCFncContBox">
							<div class="subPGPOCFncCont">
								<p>
									시간 단위 결제 상품으로 디바이스 예약을 할 수 있고, 테스트 항목이 <br />적은 경우 유용하게 사용 가능합니다.
								</p>
							</div>
						</div>
						<div class="subPGPOCFncImgBox">
							<div class="subPGPOCFncImg">
								<div class="subPGPOCFncIcon01">
									<img src="${contextPath }/resources/images/guide_fnc_test.png" alt="" />
									<span>수동 테스트</span>
								</div>
								<div class="subPGPOCFncIcon02">
									<img src="${contextPath }/resources/images/guide_fnc_one.png" alt="" />
									<span>디바이스<br />All 이용</span>
								</div>
								<div class="subPGPOCFncIcon01">
									<img src="${contextPath }/resources/images/guide_fnc_booking.png" alt="" />
									<span>예약 기능</span>
								</div>
							</div>
						</div>
					</div>
					<div class="subPGPOCBtnBox">
						<div class="subPGPTCBtn">
							<div class="subPGPTCBtnTitle">
								<span class="subPGPTCBold">￦ 25,000</span><span class="subPGPTCMedium">(계정당)</span>
							</div>
							<div class="subPGPTCBtnSubTitle">
								<span>1시간 사용 (4티켓 제공)</span>
							</div>
							<a href="#" onclick="goPayment(2)">
								<div class="subPGPOCBtnImg">
									<img src="${contextPath }/resources/images/buttons_purchase.png" onMouseOver="this.src='${contextPath }/resources/images/buttons_purchase_r.png';" onMouseOut="this.src='${contextPath }/resources/images/buttons_purchase.png';" alt="" />
								</div>
							</a>
						</div>
					</div>
				</div><!-- .subPGPOCBox End -->
			</div><!-- .subPGPOCBg End -->
		</div><!-- .subPGProductOneContainer End -->

		<div class="subPGProductThreeContainer">
			<div class="subPGPHCBg">
				<div class="subPGPHCBox">
					<div class="subPGPOCKindBox">
						<div class="subPGPHCKind">
							<span>Monthly<br />Silver</span>
						</div>
					</div>
					<div class="subPGPOCFncBox">
						<div class="subPGPOCFncContBox">
							<div class="subPGPOCFncCont">
								<p>
									단기 테스트를 위한 상품으로 CLAPP 자동화를 통해 반복적인 테스트를 <br />자동으로 수행할 수 있습니다.
								</p>
							</div>
						</div>
						<div class="subPGPOCFncImgBox">
							<div class="subPGPOCFncImg">
								<div class="subPGPOCFncIcon02">
									<img src="${contextPath }/resources/images/guide_fnc_test.png" alt="" />
									<span>수동/자동<br />테스트</span>
								</div>
								<div class="subPGPOCFncIcon02">
									<img src="${contextPath }/resources/images/guide_fnc_all.png" alt="" />
									<span>디바이스<br />All 이용</span>
								</div>
								<div class="subPGPOCFncIcon01">
									<img src="${contextPath }/resources/images/guide_fnc_booking.png" alt="" />
									<span>예약 기능</span>
								</div>
							</div>
						</div>
					</div>
					<div class="subPGPOCBtnBox">
						<div class="subPGPHCBtn">
							<div class="subPGPHCBtnTitle">
								<span class="subPGPHCBold">1개월  ￦130,000</span><span class="subPGPHCMedium">월 (계정당)</span>
							</div>
							<div class="subPGPHCBtnSubTitle">
								<span>5시간 사용 (20티켓 제공)</span>
							</div>
							<a href="#" onclick="goPayment(3)">
								<div class="subPGPOCBtnImg1">
									<img src="${contextPath }/resources/images/buttons_purchase2.png" onMouseOver="this.src='${contextPath }/resources/images/buttons_purchase2_r.png';" onMouseOut="this.src='${contextPath }/resources/images/buttons_purchase2.png';" alt="" />
								</div>
							</a>
							
							<div class="subPGPHCBtnTitle">
								<span class="subPGPHCBold">3개월  ￦ 351,000</span><span class="subPGPHCMedium">월 (계정당)</span>
							</div>
							<div class="subPGPHCBtnSubTitle">
								<span>15시간 사용 (60티켓 제공)</span>
							</div>
							<a href="#" onclick="goPayment(4)">
								<div class="subPGPOCBtnImg1">
									<img src="${contextPath }/resources/images/buttons_purchase2.png" onMouseOver="this.src='${contextPath }/resources/images/buttons_purchase2_r.png';" onMouseOut="this.src='${contextPath }/resources/images/buttons_purchase2.png';" alt="" />
								</div>
							</a>
							
							<div class="subPGPHCBtnTitle">
								<span class="subPGPHCBold">6개월  ￦ 702,000</span><span class="subPGPHCMedium">월 (계정당)</span>
							</div>
							<div class="subPGPHCBtnSubTitle">
								<span>30시간 사용 (120티켓 제공)</span>
							</div>
							<a href="#" onclick="goPayment(5)">
								<div class="subPGPOCBtnImg1">
									<img src="${contextPath }/resources/images/buttons_purchase2.png" onMouseOver="this.src='${contextPath }/resources/images/buttons_purchase2_r.png';" onMouseOut="this.src='${contextPath }/resources/images/buttons_purchase2.png';" alt="" />
								</div>
							</a>
							
						</div>
					</div>
				</div><!-- .subPGPHCBox End -->
			</div><!-- .subPGPHCBg End -->
		</div><!-- .subPGProductThreeContainer End -->

		<div class="subPGProductFourContainer">
			<div class="subPGPFCBg">
				<div class="subPGPFCBox">
					<div class="subPGPOCKindBox">
						<div class="subPGPFCKind">
							<span>Monthly<br />Gold</span>
						</div>
					</div>
					<div class="subPGPOCFncBox">
						<div class="subPGPOCFncContBox">
							<div class="subPGPOCFncCont">
								<p>
									자동 테스트 기능과 테스트 화면을 다른 사람과 공유할 수 있는 기능이 <br />제공됩니다.
								</p>
							</div>
						</div>
						<div class="subPGPOCFncImgBox">
							<div class="subPGPOCFncImg">
								<div class="subPGPOCFncIcon02">
									<img src="${contextPath }/resources/images/guide_fnc_test.png" alt="" />
									<span>수동/자동<br />테스트</span>
								</div>
								<div class="subPGPOCFncIcon02">
									<img src="${contextPath }/resources/images/guide_fnc_all.png" alt="" />
									<span>디바이스<br />All 이용</span>
								</div>
								<div class="subPGPOCFncIcon01">
									<img src="${contextPath }/resources/images/guide_fnc_booking.png" alt="" />
									<span>예약 기능</span>
								</div>
									<div class="subPGPOCFncIcon01">
									<img src="${contextPath }/resources/images/guide_fnc_share.png" alt="" />
									<span>공유 기능</span>
								</div>
							</div>
						</div>
					</div>
					<div class="subPGPOCBtnBox">
						<div class="subPGPHCBtn">
							<div class="subPGPHCBtnTitle">
								<span class="subPGPHCBold">1개월  ￦400,000</span><span class="subPGPHCMedium">월 (계정당)</span>
							</div>
							<div class="subPGPHCBtnSubTitle">
								<span>20시간 사용 (80티켓 제공)</span>
							</div>
							<a href="#" onclick="goPayment(6)">
								<div class="subPGPOCBtnImg1">
									<img src="${contextPath }/resources/images/buttons_purchase2.png" onMouseOver="this.src='${contextPath }/resources/images/buttons_purchase2_r.png';" onMouseOut="this.src='${contextPath }/resources/images/buttons_purchase2.png';" alt="" />
								</div>
							</a>
							
							<div class="subPGPHCBtnTitle">
								<span class="subPGPHCBold">3개월  ￦ 1,080,000</span><span class="subPGPHCMedium">월 (계정당)</span>
							</div>
							<div class="subPGPHCBtnSubTitle">
								<span>60시간 사용 (240티켓 제공)</span>
							</div>
							<a href="#" onclick="goPayment(7)">
								<div class="subPGPOCBtnImg1">
									<img src="${contextPath }/resources/images/buttons_purchase2.png" onMouseOver="this.src='${contextPath }/resources/images/buttons_purchase2_r.png';" onMouseOut="this.src='${contextPath }/resources/images/buttons_purchase2.png';" alt="" />
								</div>
							</a>
							
							<div class="subPGPHCBtnTitle">
								<span class="subPGPHCBold">6개월  ￦ 2,160,000</span><span class="subPGPHCMedium">월 (계정당)</span>
							</div>
							<div class="subPGPHCBtnSubTitle">
								<span>120시간 사용 (480티켓 제공)</span>
							</div>
							<a href="#" onclick="goPayment(8)">
								<div class="subPGPOCBtnImg1">
									<img src="${contextPath }/resources/images/buttons_purchase2.png" onMouseOver="this.src='${contextPath }/resources/images/buttons_purchase2_r.png';" onMouseOut="this.src='${contextPath }/resources/images/buttons_purchase2.png';" alt="" />
								</div>
							</a>
							
						</div>
					</div>
				</div><!-- .subPGPHCBox End -->
			</div><!-- .subPGPHCBg End -->
		</div><!-- .subPGProductThreeContainer End -->

		<div class="subPGProductFiveContainer">
			<div class="subPGPVCBg">
				<div class="subPGPVCBox">
					<div class="subPGPOCKindBox">
						<div class="subPGPVCKind">
							<span>Monthly<br />Diamond</span>
						</div>
					</div>
					<div class="subPGPOCFncBox">
						<div class="subPGPOCFncContBox">
							<div class="subPGPVCFncCont">
								<p>
									중기 테스트를 위한 상품으로 CLAPP의 모든 기능을 사용할 수 있습니다.
								</p>
							</div>
						</div>
						<div class="subPGPOCFncImgBox">
							<div class="subPGPOCFncImg">
								<div class="subPGPOCFncIcon02">
									<img src="${contextPath }/resources/images/guide_fnc_test.png" alt="" />
									<span>수동/자동<br />테스트</span>
								</div>
								<div class="subPGPOCFncIcon02">
									<img src="${contextPath }/resources/images/guide_fnc_all.png" alt="" />
									<span>디바이스<br />All 이용</span>
								</div>
								<div class="subPGPOCFncIcon01">
									<img src="${contextPath }/resources/images/guide_fnc_booking.png" alt="" />
									<span>예약 기능</span>
								</div>
								<div class="subPGPOCFncIcon01">
									<img src="${contextPath }/resources/images/guide_fnc_share.png" alt="" />
									<span>공유 기능</span>
								</div>
								<div class="subPGPOCFncIcon01">
									<img src="${contextPath }/resources/images/guide_fnc_report.png" alt="" />
									<span>보고서 기능</span>
								</div>
							</div>
						</div>
					</div>
					<div class="subPGPOCBtnBox">
						<div class="subPGPVCBtn">
							<div class="subPGPVCBtnTitle">
								<span class="subPGPVCMedium">개별 계약 상품</span>
							</div>
							<a href="${contextPath }/myClapp/myInquiry?inquiryCategory=3">
								<div class="subPGPOCBtnImg">
									<img src="${contextPath }/resources/images/buttons_inquire.png" onMouseOver="this.src='${contextPath }/resources/images/buttons_inquire_r.png';" onMouseOut="this.src='${contextPath }/resources/images/buttons_inquire.png';" alt="" />
								</div>
							</a>
						</div>
					</div>
				</div><!-- .subPGPHCBox End -->
			</div><!-- .subPGPHCBg End -->
		</div><!-- .subPGProductThreeContainer End -->

		<div class="subPGProductSixContainer">
			<div class="subPGPSCBg">
				<div class="subPGPSCBox">
					<div class="subPGPOCKindBox">
						<div class="subPGPSCKind">
							<span class="subPGPSCKindTit">Annual<br />Silver</span>
							<span class="subPGPSCKindDis">23%</span>
							<span class="subPGPSCKindTxt">할인</span>
						</div>
					</div>
					<div class="subPGPOCFncBox">
						<div class="subPGPOCFncContBox">
							<div class="subPGPSCFncCont">
								<p>
									Monthly Silver 12개월 결제시보다<br /> 
									23% 할인된 가격으로 CLAPP 서비스를 제공합니다.
								</p>
							</div>
						</div>
						<div class="subPGPOCFncImgBox">
							<div class="subPGPOCFncImg">
								<div class="subPGPOCFncIcon02">
									<img src="${contextPath }/resources/images/guide_fnc_test2.png" alt="" />
									<span>수동/자동<br />테스트</span>
								</div>
								<div class="subPGPOCFncIcon02">
									<img src="${contextPath }/resources/images/guide_fnc_all2.png" alt="" />
									<span>디바이스<br />All 이용</span>
								</div>
								<div class="subPGPOCFncIcon01">
									<img src="${contextPath }/resources/images/guide_fnc_booking2.png" alt="" />
									<span>예약 기능</span>
								</div>		
							</div>
						</div>
					</div>
					<div class="subPGPOCBtnBox">
						<div class="subPGPSCBtn">
							<div class="subPGPSCBtnDiscount">
								<span>￦ 1,560,000 / 년 (계정당)</span>
							</div>
							<div class="subPGPSCBtnTitle">
								<span class="subPGPSCBold">￦ 1,200,000 / 년</span><span class="subPGPSCMedium">(계정당)</span>
							</div>
							<div class="subPGPSCBtnSubTitle">
								<span>월 5시간 이용 (월 20티켓 제공)</span>
							</div>
							<a href="${contextPath }/myClapp/myInquiry?inquiryCategory=3">
								<div class="subPGPSCBtnImg">
									<img src="${contextPath }/resources/images/buttons_inquire2.png" onMouseOver="this.src='${contextPath }/resources/images/buttons_inquire2_r.png';" onMouseOut="this.src='${contextPath }/resources/images/buttons_inquire2.png';" alt="" />
								</div>
							</a>
						</div>
					</div>
				</div><!-- .subPGPHCBox End -->
			</div><!-- .subPGPHCBg End -->
		</div><!-- .subPGProductThreeContainer End -->

		<div class="subPGProductSevenContainer">
			<div class="subPGPECBg">
				<div class="subPGPECBox">
					<div class="subPGPOCKindBox">
						<div class="subPGPSCKind">
							<span class="subPGPECKindTit">Annual<br />Gold</span>
							<span class="subPGPECKindDis">25%</span>
							<span class="subPGPECKindTxt">할인</span>
						</div>
					</div>
					<div class="subPGPOCFncBox">
						<div class="subPGPOCFncContBox">
							<div class="subPGPECFncCont">
								<p>
									Monthly Gold 12개월 결제시보다 <br />
									25% 할인된 가격으로 CLAPP 서비스를 제공합니다.
								</p>
							</div>
						</div>
						<div class="subPGPOCFncImgBox">
							<div class="subPGPOCFncImg">
								<div class="subPGPOCFncIcon02">
									<img src="${contextPath }/resources/images/guide_fnc_test2.png" alt="" />
									<span>수동/자동<br />테스트</span>
								</div>
								<div class="subPGPOCFncIcon02">
									<img src="${contextPath }/resources/images/guide_fnc_all2.png" alt="" />
									<span>디바이스<br />All 이용</span>
								</div>
								<div class="subPGPOCFncIcon01">
									<img src="${contextPath }/resources/images/guide_fnc_booking2.png" alt="" />
									<span>예약 기능</span>
								</div>
								<div class="subPGPOCFncIcon01">
									<img src="${contextPath }/resources/images/guide_fnc_share2.png" alt="" />
									<span>공유 기능</span>
								</div>
							</div>
						</div>
					</div>
					<div class="subPGPOCBtnBox">
						<div class="subPGPECBtn">
							<div class="subPGPECBtnDiscount">
								<span>￦ 4,800,000 / 년 (계정당)</span>
							</div>
							<div class="subPGPECBtnTitle">
								<span class="subPGPECBold">￦ 3,600,000 / 년</span><span class="subPGPECMedium">(계정당)</span>
							</div>
							<div class="subPGPECBtnSubTitle">
								<span>월 20시간 이용 (월 80티켓 제공)</span>
							</div>
							<a href="${contextPath }/myClapp/myInquiry?inquiryCategory=3">
								<div class="subPGPECBtnImg">
									<img src="${contextPath }/resources/images/buttons_inquire2.png" onMouseOver="this.src='${contextPath }/resources/images/buttons_inquire2_r.png';" onMouseOut="this.src='${contextPath }/resources/images/buttons_inquire2.png';" alt="" />
								</div>
							</a>
						</div>
					</div>
				</div><!-- .subPGPHCBox End -->
			</div><!-- .subPGPHCBg End -->
		</div><!-- .subPGProductThreeContainer End -->

		<div class="subPGProductEightContainer">
			<div class="subPGPGCBg">
				<div class="subPGPGCBox">
					<div class="subPGPOCKindBox">
						<div class="subPGPGCKind">
							<span>Annual<br />Diamond</span>
						</div>
					</div>
					<div class="subPGPOCFncBox">
						<div class="subPGPOCFncContBox">
							<div class="subPGPGCFncCont">
								<p>
									CLAPP의 모든 기능을 사용할 수 있는 장기 테스트를 위한 상품입니다.
								</p>
							</div>
						</div>
						<div class="subPGPOCFncImgBox">
							<div class="subPGPOCFncImg">
								<div class="subPGPOCFncIcon02">
									<img src="${contextPath }/resources/images/guide_fnc_test2.png" alt="" />
									<span>수동/자동<br />테스트</span>
								</div>
								<div class="subPGPOCFncIcon02">
									<img src="${contextPath }/resources/images/guide_fnc_all2.png" alt="" />
									<span>디바이스<br />All 이용</span>
								</div>
								<div class="subPGPOCFncIcon01">
									<img src="${contextPath }/resources/images/guide_fnc_booking2.png" alt="" />
									<span>예약 기능</span>
								</div>
								<div class="subPGPOCFncIcon01">
									<img src="${contextPath }/resources/images/guide_fnc_share2.png" alt="" />
									<span>공유 기능</span>
								</div>
								<div class="subPGPOCFncIcon01">
									<img src="${contextPath }/resources/images/guide_fnc_report2.png" alt="" />
									<span>보고서 기능</span>
								</div>
							</div>
						</div>
					</div>
					<div class="subPGPOCBtnBox">
						<div class="subPGPGCBtn">
							<div class="subPGPGCBtnTitle">
								<span class="subPGPGCMedium">개별 계약 상품</span>
							</div>
							<a href="${contextPath }/myClapp/myInquiry?inquiryCategory=3">
								<div class="subPGPGCBtnImg">
									<img src="${contextPath }/resources/images/buttons_inquire2.png" onMouseOver="this.src='${contextPath }/resources/images/buttons_inquire2_r.png';" onMouseOut="this.src='${contextPath }/resources/images/buttons_inquire2.png';" alt="" />
								</div>
							</a>
						</div>
					</div>
				</div><!-- .subPGPHCBox End -->
			</div><!-- .subPGPHCBg End -->
		</div><!-- .subPGProductThreeContainer End -->

		<div class="subPGProductNineContainer">
			<div class="subPGPNCBg">
				<div class="subPGPNCBox">
					<div class="subPGPOCKindBox">
						<div class="subPGPNCKind">
							<span>Enterprise<br />Gold</span>
						</div>
					</div>
					<div class="subPGPOCFncBox">
						<div class="subPGPOCFncContBox">
							<div class="subPGPNCFncCont">
								<p>
									커스터마이징을 위한 상품으로 별도의 도메인에 맞춤형 CLAPP 테스팅과 <br />CLAPP 자동화 기능을 제공합니다.
								</p>
							</div>
						</div>
						<div class="subPGPOCFncImgBox">
							<div class="subPGPOCFncImg">
								<div class="subPGPOCFncIcon02">
									<img src="${contextPath }/resources/images/guide_fnc_domain.png" alt="" />
									<span>별도의 서브<br />도메인 제공</span>
								</div>
								<div class="subPGPOCFncIcon02">
									<img src="${contextPath }/resources/images/guide_fnc_web.png" alt="" />
									<span>Web Page<br />맞춤형 제공</span>
								</div>
								<div class="subPGPOCFncIcon02">
									<img src="${contextPath }/resources/images/guide_fnc_jnlp.png" alt="" />
									<span>JNLP<br />맞춤형 제공</span>
								</div>
							</div>
						</div>
					</div>
					<div class="subPGPOCBtnBox">
						<div class="subPGPNCBtn">
							<div class="subPGPNCBtnTitle">
								<span class="subPGPNCMedium">개별 계약 상품</span>
							</div>
							<a href="${contextPath }/myClapp/myInquiry?inquiryCategory=3">
								<div class="subPGPNCBtnImg">
									<img src="${contextPath }/resources/images/buttons_inquire2.png" onMouseOver="this.src='${contextPath }/resources/images/buttons_inquire2_r.png';" onMouseOut="this.src='${contextPath }/resources/images/buttons_inquire2.png';" alt="" />
								</div>
							</a>
						</div>
					</div>
				</div><!-- .subPGPHCBox End -->
			</div><!-- .subPGPHCBg End -->
		</div><!-- .subPGProductThreeContainer End -->

		<div class="subPGProductNineContainer">
			<div class="subPGPNCBg">
				<div class="subPGPNCBox">
					<div class="subPGPOCKindBox">
						<div class="subPGPNCKind">
							<span>Enterprise<br />Diamond</span>
						</div>
					</div>
					<div class="subPGPOCFncBox">
						<div class="subPGPOCFncContBox">
							<div class="subPGPNCFncCont">
								<p>
									커스터마이징을 위한 상품으로 별도의 도메인에 맞춤형 CLAPP 테스팅과 <br />CLAPP 자동화 기능을 제공합니다.
								</p>
							</div>
						</div>
						<div class="subPGPOCFncImgBox">
							<div class="subPGPOCFncImg">
								<div class="subPGPOCFncIcon02">
									<img src="${contextPath }/resources/images/guide_fnc_domain.png" alt="" />
									<span>별도의 서브<br />도메인 제공</span>
								</div>
								<div class="subPGPOCFncIcon02">
									<img src="${contextPath }/resources/images/guide_fnc_web.png" alt="" />
									<span>Web Page<br />맞춤형 제공</span>
								</div>
								<div class="subPGPOCFncIcon02">
									<img src="${contextPath }/resources/images/guide_fnc_jnlp.png" alt="" />
									<span>JNLP<br />맞춤형 제공</span>
								</div>
							</div>
						</div>
					</div>
					<div class="subPGPOCBtnBox">
						<div class="subPGPNCBtn">
							<div class="subPGPNCBtnTitle">
								<span class="subPGPNCMedium">개별 계약 상품</span>
							</div>
							<a href="${contextPath }/myClapp/myInquiry?inquiryCategory=3">
								<div class="subPGPNCBtnImg">
									<img src="${contextPath }/resources/images/buttons_inquire2.png" onMouseOver="this.src='${contextPath }/resources/images/buttons_inquire2_r.png';" onMouseOut="this.src='${contextPath }/resources/images/buttons_inquire2.png';" alt="" />
								</div>
							</a>
						</div>
					</div>
				</div><!-- .subPGPHCBox End -->
			</div><!-- .subPGPHCBg End -->
		</div><!-- .subPGProductThreeContainer End -->
    <div id="all"></div>
	<div id="free"></div>
	<div id="basic"></div>
	<div id="monthly"></div>
	<div id="annual"></div>
	<div id="enterprize"></div>
<script>
var goPayment = function(key) { 
	var userType = "${userLoginSession.userType}";
	
	if(userType == 2) {
		var msg = "현재 (기업/단체) 고객님께서는 \n(${ticketInfo.productName}) 개별 계약 상품을 이용하고 계십니다.\n상품 문의는 클앱 고객센터 1661-7083으로 문의 바랍니다.";
		alert(msg);
		return false;
	}
	
	var usedProductKey = '${ticketInfo.productMasterKey}';
	var goProductKey = key;
    alert(key);
    alert(usedProductKey)
	if(usedProductKey != '' && usedProductKey <= goProductKey) {
		if(confirm("현재 (일반)고객님께서는 \n('${ticketInfo.productName}') 상품을 이용하고 계십니다. "+
				"\n다른 상품을 추가 구매하실 경우 현재 사용중인 상품의 잔여티켓은 모두"+
				"\n차감 처리되고 새로 구매하신 상품의 티켓만 사용 가능하오니 신중히"+
			    "\n생각하시고 구매 하시기 바랍니다.")){
            location.href = contextPath+"/myClapp/payment?productMasterKey="+key
        }
	} else if(usedProductKey != '' && usedProductKey > goProductKey) {
        alert("현재 (일반)고객님께서는 \n('${ticketInfo.productName}') 상품을 이용하고 계십니다. "+
                "\n클앱은 현재 사용중인 상품보다 더 낮은 등급의 상품은 구매가 불가능합니다."+
                "\n고객 여러분의 많은 양해 부탁 드립니다."+
                "\n기타 상품구매와 관련하여 고객센터 1661-7083 또는"+
                "\nsupport@clapp.co.kr로 문의 주시기 바랍니다.");
        return false
    }

};
//소개서 다운로드 링크
var autoJnlpDownload = function(){ 
	var orgFileName = "CLAPP_INFO_20150415.pdf";
    location.href = contextPath + "/common/fileDownload?path=download&orgFileName="+orgFileName;
	  
};
</script>
