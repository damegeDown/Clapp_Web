<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<script type="text/javascript" src="${contextPath }/resources/js/management.js"></script>
<style>
	.permission dl {width:23%; height:110px; float:left; margin-right:10px; border-right:1px dotted #999}
	.permission dl dd {margin:5px 0 0 18px}
</style>
<div class="sub-content">
  <div>
		<h3 class="contents-title floatL">${CommonCode.navigation }</h3>
		<div style="clear:both;"></div>
	</div>
	<form id="adminForm">
	<input type="hidden" name="adminMasterKey" value="${adminDetail.adminMasterKey eq null ? 0 : adminDetail.adminMasterKey }" data-flag="off"/>
	<input type="hidden" name="adminGrant" value="${adminDetail.adminGrant }" data-name="권한"/>
	<table class="board-write box-pd">
		<colgroup>
			<col width="150px"/>
			<col width="830px"/>
		</colgroup>
		<tbody>
			<tr>
				<th>허용 IP</th>
				<td>
					<input type="text" class="inp-w160 notHangul" name="accessIpAddress" value="${adminDetail.accessIpAddress }" style="ime-mode:disabled;"/>
				</td>
			</tr>
			<tr>
				<th>아이디</th>
				<td>
					<input type="text" class="inp-w160 notHangul" name="adminId" value="${adminDetail.adminId }" style="ime-mode:disabled;" data-format="engnum"/>
				</td>
			</tr>
			<tr> 
				<th>비밀번호</th>
				<td>
					<input type="text" class="inp-w160 notHangul" 
					name="adminPassword" value="${adminDetail.adminPassword }" 
					style="ime-mode:disabled;" placeholder="영/숫자 조합 6자리 이상" data-format="engnum" data-minLength="6"/>
				</td>
			</tr>
			<tr>
				<th>이름</th> 
				<td>
					<input type="text" class="inp-w160" name="adminName" value="${adminDetail.adminName }" />
				</td>
			</tr>
			<tr>
				<th>소속(실/팀)</th>
				<td>
					<input type="text" class="inp-w160" name="adminCompanyName" value="${adminDetail.adminCompanyName }" placeholder="소속회사명"/> 
					<span style="margin:0 10px;font-size:16px; font-weight:bold">/</span> 
					<input type="text" class="inp-w160" name="adminTeamName" value="${adminDetail.adminTeamName }" placeholder="소속 실/팀명(협력사의 경우, 협력사)"/>
				</td>
			</tr>
			<tr>
				<th>권한</th>
				<td class="permission">
					<div>
						<dl>
							<dt><label><input type="checkbox" name="permissionMaster" class="master" value="Y" data-grant="관리마스터" <c:if test="${adminDetail.permissionMaster eq 'Y' }">checked="checked"</c:if>/> ► 관리 마스터</label><dt>
							<dd>- 운영자 관리</dd>
							<dd>- 메인팝업 관리</dd>
							<dd>- 분석/통계 관리</dd>
						</dl>
						<dl>
							<dt><label><input type="checkbox" name="permissionUser" value="Y" data-grant="회원정보" <c:if test="${adminDetail.permissionUser eq 'Y' }">checked="checked"</c:if>/> ► 회원 정보</label><dt>
							<dd>- 일반회원 관리</dd>
							<dd>- 기업 / 단체회원 관리</dd>
							<dd>- 탈퇴계정 관리</dd>
						</dl>				
						<dl>
							<dt><label><input type="checkbox" name="permissionPayment" value="Y" data-grant="결제내역" <c:if test="${adminDetail.permissionPayment eq 'Y' }">checked="checked"</c:if>/> ► 결제 내역</label><dt>
							<dd>- 웹 결제 관리</dd>
							<dd>- 웹 결제 통계</dd>
							<dd>- 개별 계약 관리</dd>
							<dd>- 개별 계약 통계</dd>
						</dl>				
						<dl>
							<dt><label><input type="checkbox" name="permissionProduct" value="Y" data-grant="상품/티켓관리" <c:if test="${adminDetail.permissionProduct eq 'Y' }">checked="checked"</c:if>/> ► 상품 / 티켓 관리</label><dt>
							<dd>- 상품 관리(예정)</dd>
							<dd>- 티켓 사용내역 관리</dd>
							<dd>- 티켓 / 상품 적용 서비스</dd>
						</dl>
					</div>
					<div style="clear:both">
						<dl>
							<dt><label><input type="checkbox" name="permissionDevice" value="Y" data-grant="제공디바이스" <c:if test="${adminDetail.permissionDevice eq 'Y' }">checked="checked"</c:if>/> ► 제공 디바이스</label></dt>
						</dl>
						<dl>
							<dt><label><input type="checkbox" name="permissionTrend" value="Y" data-grant="트렌드리뷰관리" <c:if test="${adminDetail.permissionTrend eq 'Y' }">checked="checked"</c:if>/> ► 트렌드 리뷰 관리</label><dt>
							<dd>- 업계동향</dd>
							<dd>- 리뷰 / 전망</dd>
							<dd>- 케이스 스터디</dd>
						</dl>
						<dl>
							<dt><label><input type="checkbox" name="permissionEcrm" value="Y" data-grant="eCRM관리" <c:if test="${adminDetail.permissionEcrm eq 'Y' }">checked="checked"</c:if>/> ► eCRM 관리</label><dt>
							<dd>- 수시발송용 메일</dd>
							<dd>- 타켓 메일</dd>
							<dd>- 고객 만족도 조사</dd>
							<dd>- 설문 관리</dd>
						</dl>
						<dl>
							<dt><label><input type="checkbox" name="permissionCustomer" value="Y" data-grant="고객지원" <c:if test="${adminDetail.permissionCustomer eq 'Y' }">checked="checked"</c:if>/> ► 고객 지원</label><dt>
							<dd>- 이메일문의 / 답변</dd>
							<dd>- 유선상담내역</dd>
							<dd>- 공지사항</dd>
							<dd>- 도움말</dd>
						</dl>
					</div>				
				</td>
			</tr>
		</tbody>
	</table>
	<div class="btn-area">
		<a href="${contextPath }/admin/management/adminList" class="btn-bottom-orenge floatL">목록</a>
		<c:if test="${adminEntity.getAdminMasterKey()  > 0}">
			<input type="reset" class="floatR btn-bottom-orenge  " value="취소" style="border:none"/>
		</c:if>
		<div class="floatR btn-bottom-orenge submitBtn" data-action="${contextPath}/${CommonCode.submitAction}" data-msg="${CommonCode.submitType }">${CommonCode.submitType }</div>
	</div>
	</form>
</div>
<script>
$(function() {
  $.fn.AdminDetail.init();	
})
</script>