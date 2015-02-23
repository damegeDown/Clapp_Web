<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<link rel="stylesheet" type="text/css" href="${contextPath }/resources/css/popup.css"/>
<div id="searchUserIdForm" style="display:none">
	<input type="hidden" name="paymentMasterKey" value="${paymentInfo.paymentMasterKey }"/>
	<input type="hidden" name="dataId" value=""/>
	<h3>
		회원 ID 검색 
		<span class="cancelBtn"  onclick="javascript:popupUtils.popupClose('#searchUserIdForm')">X</span>
	</h3>
	<div>
		<input type="text" name="userId" style="width:307px" placeholder="회원으로 가입된 계정만 검색 가능"/><input type="button" class="btn searchBtn" value="검색"/>
	</div>
	<div  style="overflow:auto; height:400px">
		<table class="board-list">
			<thead>
				<tr>
					<th>No.</th>
					<th>이름</th>
					<th>회원 ID</th>
					<th>회원 구분</th>
				</tr>
			</thead>
			<tbody class="resultUserId">
				<tr>
					<td colspan="4">+++조회된 내용이 없습니다.+++</td>
				</tr>
			</tbody>
		</table>
	</div>
</div>