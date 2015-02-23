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
					${adminDetail.accessIpAddress }
				</td>
			</tr>
			<tr>
				<th>아이디</th>
				<td>
					${adminDetail.adminId }
				</td>
			</tr>
			<tr> 
				<th>비밀번호</th>
				<td>
					${adminDetail.adminPassword } 
				</td>
			</tr>
			<tr>
				<th>이름</th> 
				<td>
					${adminDetail.adminName }
				</td>
			</tr>
			<tr>
				<th>소속(실/팀)</th>
				<td>
					${adminDetail.adminCompanyName } 
					<span style="margin:0 10px;font-size:16px; font-weight:bold">/</span> 
					${adminDetail.adminTeamName }
				</td>
			</tr>
			<tr>
				<th>권한<br/>(${adminDetail.adminGrant  })</th>
				<td class="permission">
					<div>
						<dl>
							<dt> ► 관리 마스터<dt>
							<dd>- 운영자 관리</dd>
							<dd>- 메인팝업 관리</dd>
							<dd>- 분석/통계 관리</dd>
						</dl>
						<dl>
							<dt> ► 회원 정보<dt>
							<dd>- 일반회원 관리</dd>
							<dd>- 기업 / 단체회원 관리</dd>
							<dd>- 탈퇴계정 관리</dd>
						</dl>				
						<dl>
							<dt> ► 결제 내역<dt>
							<dd>- 웹 결제 관리</dd>
							<dd>- 웹 결제 통계</dd>
							<dd>- 개별 계약 관리</dd>
							<dd>- 개별 계약 통계</dd>
						</dl>				
						<dl>
							<dt> ► 상품 / 티켓 관리<dt>
							<dd>- 상품 관리(예정)</dd>
							<dd>- 티켓 사용내역 관리</dd>
							<dd>- 티켓 / 상품 적용 서비스</dd>
						</dl>
					</div>
					<div style="clear:both">
						<dl>
							<dt> ► 제공 디바이스</dt>
						</dl>
						<dl>
							<dt> ► 트렌드 리뷰 관리<dt>
							<dd>- 업계동향</dd>
							<dd>- 리뷰 / 전망</dd>
							<dd>- 케이스 스터디</dd>
						</dl>
						<dl>
							<dt> ► eCRM 관리<dt>
							<dd>- 수시발송용 메일</dd>
							<dd>- 타켓 메일</dd>
							<dd>- 고객 만족도 조사</dd>
							<dd>- 설문 관리</dd>
						</dl>
						<dl>
							<dt> ► 고객 지원<dt>
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
			<div class="floatR btn-bottom-orenge submitBtn" data-action="/admin/management/rest/removeAdmin" data-type="ajax" data-id='${adminEntity.getAdminMasterKey()}' data-message='해당 관리자의 권한 제거 및 계정을 삭제하시겠습니까?'>삭제</div>
		</c:if>
		<div class="floatR btn-bottom-orenge" onclick="goDetail()">수정</div>
	</div>
	</form>
</div>
<script>
$(function() {
  $.fn.AdminDetail.init();	
});
var goDetail =function() {
	location.href = "${contextPath }/admin/management/adminModify?adminMasterKey=${adminDetail.adminMasterKey}";
}
</script>