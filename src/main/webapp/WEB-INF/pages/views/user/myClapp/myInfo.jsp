<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="dgPageNav" uri="/WEB-INF/tlds/PageNavigation.tld" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<script type="text/javascript" src="${ contextPath }/resources/js/myClapp.js"></script>
<div class="subJoinGnbBottomContainer">
		<div class="subJoinGnbBottomBg">
			<div class="subJoinGnbBottomBox">
				<div class="subJoinGnbBottom">
					<span class="subJoinTitle">마이 클앱</span>
				</div>
				<div class="subStartBox">
					<a href="#"><img src="${contextPath }/resources/images/gnb_start.png"  onclick="JnlpUtils.startTest()" onmouseover="this.src='${contextPath }/resources/images/gnb_start_r.png';" onMouseOut="this.src='${contextPath }/resources/images/gnb_start.png';" alt="시작하기" /></a>
				</div>
			</div>
		</div>
	</div>
</div> <!-- .subGnbContainer End -->
<%@ include file="/WEB-INF/pages/views/user/myClapp/inc/incSubMenu.jsp"%>
<form id="userInfoForm">
<input type="hidden" name="certificationNum" data-flag="off"/>
<div class="subModifyFormIndividual">
	<div class="subModifyFormRequiredSection">
		<div class="clear"></div>
		<div class="subJoinFormRequiredTitleBox">
			<div class="subJoinFormRequiredTitleLine"></div>
			<h3 class="subJoinFormRequiredTitle">정보 수정 · 확인</h3>
		</div>
		<div class="clear"></div>
		<div class="subModifyInputSection">
			<div class="smis1">
				<div class="smisLeft">
					<span class="smisTitle">아이디 (이메일 형식)</span>
				</div>
				<div class="smisRight">
					<span class="smisEmail">${userInfo.userId }</span>
				</div>
			</div>
			<div class="smis2">
				<div class="smisLeft">
					<span class="smisTitle">
						<c:choose>
						<c:when test="${userInfo.userType eq 1 }">
							이름
						</c:when>
						<c:otherwise>
							기업•단체명
						</c:otherwise>
						</c:choose>							
					</span>
				</div>
				
				<div class="smisRight">
					<span class="smisName">
					<c:choose>
						<c:when test="${userInfo.userType eq 2 }">
							<span style="float:left">${userInfo.userCompanyName }</span>
							<span class="smisCorpMessage">
								&nbsp;(이직 또는 퇴사 등으로 변경 원할 시, 고객지원 전화 또는 1:1문의 요망)
							</span>
						</c:when>
						<c:otherwise>
							<span style="float:left">${userInfo.userName }</span>
						</c:otherwise>
						</c:choose>
<%-- 						<span style="float:left">${userInfo.userName }</span>
						<c:if test="${userInfo.userType eq 2 }">
							<span class="smisCorpMessage">
								&nbsp;(이직 또는 퇴사 등으로 변경 원할 시, 고객지원 전화 또는 1:1문의 요망)
							</span>
						</c:if> --%>
					</span>
				</div>
			</div>
			<c:if test="${userInfo.userType eq 2}">
			<div class="smis5">
				<div class="smisLeft">
					<span class="smisTitle">구분</span>
				</div>
				<div class="smisRight">
					<div class="smisRadioGroup">
						<input id="d" class="smisCRadio" type="radio" name="userCompanyGroupType" value="1" <c:if test="${userInfo.userCompanyGroupType eq 1 }">checked</c:if>>
						<label class="smisLable" for="d">기업</label>
						<input id="e" class="smisCRadio" type="radio" name="userCompanyGroupType" value="2" <c:if test="${userInfo.userCompanyGroupType eq 2 }">checked</c:if>>
						<label class="smisLable" for="e">단체</label>
					</div>
				</div>
			</div>
			<div class="smis6">
				<div class="smisLeft">
					<span class="smisTitle">사업자등록번호</span>
				</div>
				<div class="smisRight">
					<div class="smisCorpNo">
						<c:set var="compNum" value="${fn:split(userInfo.userCompanyNumber,'-')}"/>
						<input type="text" class="inp-w60 simsTelInput1 phoneNum" name="cellPhone1" value="${compNum[0]}" data-name="사업자등록번호"/>
						<span class="simsTelLine1"></span>
						<input type="text" class="inp-w60 simsTelInput1 phoneNum" name="cellPhone2" value="${compNum[1]}" data-name="사업자등록번호"/>
						<span class="simsTelLine2"></span> 
						<input type="text" class="inp-w60 simsTelInput2 phoneNum" name="cellPhone3" value="${compNum[2]}" data-name="사업자등록번호"/>
						<input type="hidden" class="phoneNumComp" name="userCompanyNumber" value="${userInfo.userCompanyNumber}"/>
						<p class="smisCorpMessage">
							타 기업의 사업자등록번호를 무단으로 도용하실 경우에는 법적인 처벌을 받습니다.
						</p>
					</div>
				</div>
			</div>
			<div class="smis7">
				<div class="smisLeft">
					<span class="smisTitle">담당자명</span>
				</div>
				<div class="smisRight">
					<input type="text" class="smisRepName" name="userName"  value="${userInfo.userName }"/>
				</div>
			</div>
			</c:if>
			<div class="smis3">
				<div class="smisLeft">
					<span class="smisTitle">휴대폰 번호</span>
				</div>
				<div class="smisRight" style="padding-top:10px;padding-left:50px">
					<span >
						<c:set var="cellPhone" value="${fn:split(userInfo.userCellPhoneNumber,'-')}"/>
						<select class="smisSelectPhone phoneNum" name="cellPhone1">
						  <option value="0">-선택-</option>
						  <c:forEach items="${cellPhoneCode }" var="code">
						<option value="${code.commonCode }" <c:if test="${cellPhone[0] eq code.commonCode }">selected</c:if>>${code.commonName }</option>
						</c:forEach>
						</select>
						<span class="simsTelLine1"></span>
						<input type="text" class="inp-w60 simsTelInput1 phoneNum" name="cellPhone2" value="${cellPhone[1]}" data-name="휴대폰번호" maxlength="4"/>
						<span class="simsTelLine2"></span> 
						<input type="text" class="inp-w60 simsTelInput2 phoneNum" name="cellPhone3" value="${cellPhone[2]}" data-name="휴대폰번호" maxlength="4"/>
						<input type="hidden" class="phoneNumComp" name="userCellPhoneNumber" value="${userInfo.userCellPhoneNumber}"/>
						<input type="button" class="authBtn"  onclick="javascript:sendUserCertificationNum('${userInfo.userCellPhoneNumber}')" value="인증받기"/>
					</span>
					<p class="smisCorpMessage" style="margin-top:10px">
		            	* 휴대폰 번호가 변경되었을 시에만 번호 변경 후 , 다시 인증받기 버튼을 클릭해 주세요.
		            	<br/>&nbsp;&nbsp;&nbsp;(해외 거주자의 경우, 클앱 고객지원 1661-7083 으로 문의)
		            </p>
				</div>
			</div>
			<div class="clear"></div>
			<div class="smis5" style="height:100px">
				<div class="smisLeft">
					<span class="smisTitle">인증번호 재입력</span>
				</div>
				<div class="smisRight" style="padding-top:10px;padding-left:50px">
					<span><input type="text" class="sicPwConf" placeholder="휴대폰 번호 변경시에만 입력(인증번호 6자리 입력)" name="certificationNumConf" data-flag="off" maxlength="6"/></span>
					<p class="smisCorpMessage" style="margin-top:10px;color:blue">3분 이내 입력 ( 남은시간 : <span class="min">3</span>분 : <span class="sec">00</span>초 )</p>
				</div>
			</div>
			<div class="clear"></div>
			<div class="smis5">
				<div class="smisLeft2">
					<input id="sjfrnotice" class="sjfrnotice" type="checkbox" name="userMailReceptionYn" value="Y" <c:if test="${userInfo.userMailReceptionYn eq 'Y' }">checked</c:if> />
					<label for="sjfrnotice" class="sjfrNoticeLabel">공지/이벤트/알림 메일 수신</label>
				</div>
				<div class="simsRight2">
					<ul class="simsUl">
						<li><a href="${contextPath }/myClapp/modifyPassword">비밀번호 변경</a></li>
						<li class="simsUlLine"></li>
						<li><a href="${contextPath }/myClapp/dropOut">회원탈퇴</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div> <!-- .subJoinRequiredSection End -->
</div> <!-- .subModifyFormIndividual End -->
<div class="subJoinTermsPrivacyNextContainer">
	<div class="subInfoBtnBox2 myInfo">
		<img src="${contextPath }/resources/images/buttons_modify.png" onMouseOver="this.src='${contextPath }/resources/images/buttons_modify_r.png';" onMouseOut="this.src='${contextPath }/resources/images/buttons_modify.png';" alt="수정" onclick="doModifyUser('${userInfo.userCellPhoneNumber}');"/>
		<div class="submitBtn" data-action="${contextPath }/myClapp/rest/modifyUserInfo" data-msg="수정"></div>
		<a href="/">
			<img src="${contextPath }/resources/images/buttons_cancel.png" onMouseOver="this.src='${contextPath }/resources/images/buttons_cancel_r.png';" onMouseOut="this.src='${contextPath }/resources/images/buttons_cancel.png';" alt="취소" />
		</a>
	</div>
</div>
</form>
