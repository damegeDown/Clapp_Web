<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="dgPageNav" uri="/WEB-INF/tlds/PageNavigation.tld" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
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
<form:form id="modifyPasswordForm" method="post" action="${contextPath }/myClapp/doModifyPassword" commandName="formUsreInfoEntity">
<input type="hidden" name="userId" data-flag="off" value=""/>
<div class="subMyClappTitleContainer">
	<div class="subMyClappTitleBox">
		<div class="subMyClappTitleLine"></div>
		<span class="subMyClappTitle">비밀번호 변경</span>
	</div>
</div> <!-- .subMyClappTitleContainer End -->
<div class="subPwChangeContentContainer">
	<div class="subPwChangeContentBox">
		<div class="subPCTop">
			<div class="subPCTLeft">
				<span class="subPCTitle">변경할 비밀번호</span>
			</div>
			<div class="subPCTRight">
				<input type="password" class="subPwChange1" name="userPassword" placeholder="영문, 숫자 또는 영/숫자 조합 6자 이상" value="${formUsreInfoEntity.userPassword }"/>
				<p class="subPwChange1alert">
					<form:errors path="userPassword" />
				</p>
			</div>
		</div>
		<div class="subPCBottom">
			<div class="subPCBLeft">
				<span class="subPCTitle">변경할 비밀번호 확인</span>
			</div>
			<div class="subPCBRight">
				<input type="password" class="subPwChange2" name="userPasswordConf" value="${formUsreInfoEntity.userPasswordConf }"/>
				<p class="subPwChange2alert">
					<form:errors path="userPasswordConf" />
				</p>
			</div>
		</div>
	</div>
</div>
<div class="subPwChangeBtnContainer">
	<div class="subPwChangeBtnBox">
		<input type="image" src="${contextPath }/resources/images/buttons_passmod.png" onMouseOver="this.src='${contextPath }/resources/images/buttons_passmod_ri.png';" onMouseOut="this.src='${contextPath }/resources/images/buttons_passmod.png';" alt="비밀번호 변경" />
	</div>
</div>
</form:form>
