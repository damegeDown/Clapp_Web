<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="dgPageNav" uri="/WEB-INF/tlds/PageNavigation.tld" %>
<%@ taglib prefix="Stirngs" uri="/WEB-INF/tlds/Strings.tld" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<body>
			<div class="subMTGnbBottomContainer">
				<div class="subMTGnbBottomBox">
					<div class="subMTGnbBottom">
						<ul>
							<li class="smtgbItem2"><a href="${contextPath}/trandReview/trandReviewMain" class="smtGRTr">트렌드 리뷰</a></li>
							<li></li>
							<li class="smtgbItem2"><a href="${contextPath}/trandReview/trandList" class="smtGRTr">업계 동향</a></li>
							<li></li>
							<li class="smtgbItem2"><a href="${contextPath}/trandReview/reviewList" class="smtGRTr">리뷰 · 전망</a></li>
							<li></li>
							<li class="smtgbItem2"><a href="${contextPath}/trandReview/caseList" class="smtGRTr">케이스 스터디</a></li>
							<li></li>
							<li class="smtgbItem2"><a href="${contextPath}/trandReview/socialList" class="smtGRTr smtGRTrActive">소셜 · 블로그</a></li>
						</ul>
					</div>
					<div class="subMTStartBox">
						<a href="#"><img src="${contextPath}/resources/images/gnb_start.png" onclick="JnlpUtils.startTest()"	onmouseover="this.src='${contextPath}/resources/images/gnb_start_r.png';" onMouseOut="this.src='${contextPath}/resources/images/gnb_start.png';" alt="시작하기" /></a>
					</div>
				</div>
			</div>
		<div class="subTRIndustryGnbBottomContainer">
			<div class="subTRIndustryGnbBottomBg">
				<div class="subTRIndustryGnbBottomBox">
					<div class="subTRIndustryGnbBottom">
						<span class="subTRIndustryTitle">소셜&nbsp;&middot;&nbsp;블로그</span>
					</div><!-- .subTRIndustryGnbBottomBox End -->
				</div><!-- .subTRIndustryGnbBottomBox -->
			</div><!-- .subTRIndustryGnbBottomBg -->
		</div><!-- .subTRIndustryGnbBottomContainer End -->

		<div class="subTRSocialListContentThreeContainer">
			<div class="subTRSocialListCHCBoxBg">
				
				<div class="subTRIndusrtyContentTopBox"></div><!-- .subTRIndusrtyContentTopBox -->
				<!-- provide device List Start -->
				<div class="subTRSocialCHCListBox">
					<c:forEach items="${boardEntity.boardSocialBlogList }" var="boardSocialBlogList" varStatus="i">
						 <div class="subTRSocialCHCList subTRReviewCHCListLine direct" id="boardKey${boardSocialBlogList.boardSocialBlogKey}">
							<div class="subTRSocialCHCListCols">
								<div class="subTRSocialCHCListColsLinkBox">
									<c:set var="link" value="#"/>
									<c:set var="target" value=""/>
									<c:if test="${boardSocialBlogList.facebookLink  ne null}">
										<c:set var="link" value="${boardSocialBlogList.facebookLink}"/>
										<c:set var="target" value="_blank"/>
									</c:if>
									<a href="${link }" target="${target }">
										<div class="subTRSocialCHCImgBox alignCenter" style="display:table">
											<div class="subTRSocialCHCImg" style="display:table-cell;vertical-align:middle;width:80px">
												<img src="${contextPath}/common/imgView?fileType=${boardSocialBlogList.fileTarget}&fileName=${boardSocialBlogList.fileSavedName}" style="max-width:80px; max-height:80px"/>
											</div>
										</div><!-- .subTRSocialContentListRow End -->
										<div class="subTRSocialCHCTextBox">
											<div class="subTRSocialCHCText">
												<p>
													<Stirngs:cutTextTag ellipsis=".." length="120" text="${boardSocialBlogList.socialBlogContent}"/>
												</p>
												<span>
													${boardSocialBlogList.socialBlogInsertYearDay}
												</span>
											</div>
										</div>
									</a>
								</div>
							</div><!-- .subTRReviewContentListCols -->
						</div><!-- .subTRReviewContentList End -->
					 </c:forEach>
					</div>
				 </div>

				</div><!-- .subTRIndusrtyContentListBox End -->

				<div class="subTRIndusrtyContentBottomBox">
					<div class="subTRIndusrtyContentMoreImgBox">
						<div class="subTRIndusrtyContentMoreImg">
							<c:if test="${boardEntity.dataSize > 12}">
								<span class="nextPage" data-url="socialList" alt="">
									<img class="images" src="${contextPath}/resources/images/contents_btn_submit_board.png"	onmouseover="this.src='${contextPath}/resources/images/contents_btn_submit_board_more.png';" onMouseOut="this.src='${contextPath}/resources/images/contents_btn_submit_board.png';" alt="more" />
								</span>
							</c:if>
							<input type="hidden" id="currentPage" value="${boardEntity.currentPage}" name="currentPage"/>
						</div><!-- .subTRIndusrtyContentMoreImg End-->
					</div><!-- .subTRIndusrtyContentMoreImgBox End -->
				</div><!-- .subTRIndusrtyContentBottomBox End -->
</body>
<script>
$(function(){
/* 		scrollPage();
		$("#currentPage").val(1);
		
		$(window).scroll(function() {
			if ($(window).scrollTop() == $(document).height() - $(window).height()) {
				//$(".nextPage").click().unbind("click");
				
			}
		}); */
		/* function scrollPage() { */
			$(".nextPage").on("click", function() {
				var nextPage = parseInt($("#currentPage").val()) + 1;
				$.ajax({
						url : contextPath + 'rest/socialList',
						dataType : 'json',
						data : {currentPage : nextPage},
						success : function(result) {
							flag = 1;
							if (result.resultCode == 'success') {
								var resultList = result.resultDATA.boardSocialBlogList;
								var pageTotalCount = result.resultDATA.pageTotalCount;
								var currentPage = result.resultDATA.currentPage;
								var contents = "";
								for (var i = 0; i < resultList.length; i++) {
									var link = "#";
									var target = "";
									if(resultList[i].facebookLink) {
										link = resultList[i].facebookLink;
										target = "_blank";
									}
									contents +=	
									"<div class='subTRSocialCHCList subTRReviewCHCListLine direct' id='boardKey"+resultList[i].boardSocialBlogKey+"'>"+
										"<div class='subTRSocialCHCListCols'>"+
											"<div class='subTRSocialCHCListColsLinkBox'>"+
												"<a href='"+link +"' target='"+target+"'>"+
													"<div class='subTRSocialCHCImgBox alignCenter' style='display:table'>"+
														"<div class='subTRSocialCHCImg' style='display:table-cell;vertical-align:middle;width:80px'>"+
														"<img src='${contextPath}/common/imgView?fileType="+resultList[i].fileTarget+"&fileName="+resultList[i].fileSavedName+"' style='max-width:80px;max-height:80px;'/>"+
														"</div>"+
													"</div>"+
													"<div class='subTRSocialCHCTextBox' style='float:left;width:85%'>"+
														"<div class='subTRSocialCHCText'>"+
															"<p>"+
															resultList[i].socialBlogTitle+
															"</p>"+
															"<span>"+
															resultList[i].socialBlogInsertYearDay+
															"</span>"+
														"</div>"+
													"</div>"+
												"</a>"+
											"</div>"+
										"</div>"+
									"</div>";
									}
								$(".subTRSocialCHCList:last").after(contents);
								$("#currentPage").val(nextPage);
								/* scrollPage(); */
								if(pageTotalCount <= currentPage) {
										$(".images").hide();
										return false;
									}
							}
						},
						fail : function() {
							alert('error');
						}
					});
			});
		/* } */
	});
</script>