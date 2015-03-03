<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="dgPageNav" uri="/WEB-INF/tlds/PageNavigation.tld" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<script type="text/javascript" src="${contextPath }/resources/js/member.js"></script>
<div class="sub-content"> 
	<div>
		<h3 class="contents-title floatL">${CommonCode.navigation } ( 누적 : <span class="colorSkyBlue">${count}</span> 명 )</h3> 
		<div style="clear:both;"></div>
		<div class="search-box">
			<form id="searchForm" action="">
					<div class="marT-5">
						<span class="span-w120">회원 ID (이메일 계정)</span>
						<input type="text" name="searchValue" class="inp-w300" value="${dropOutUserEntity.searchValue }" placeholder="sample@clapp.co.kr"/>
						<span class="span-w80 marL-15">기업/단체명</span>
						<input type="text" name="searchValue1" class="inp-w200" value="${dropOutUserEntity.searchValue1 }" placeholder="띄어쓰기 없이 입력"/><br/>
					</div>
					<div class="marT-5">
					 <span class="span-w120">구분</span>
						<select name="searchValue2" class="sel-w140">
            <option value="">전체</option>
	            <c:forEach items="${userCompanyGroupTypeCode }" var="code">
	            <option value="${code.commonCode }" <c:if test="${memberEntity.searchValue2 eq code.commonCode }">selected</c:if>>${code.commonName }</option>
	            </c:forEach>
            </select>
            <span class="marL-15 span-w80" style="padding-left:10px; padding-left: 160px;">사업자등록번호</span>
            <c:set var="companyNum" value="${fn:split(memberEntity.searchValue3,'-')}"/>
            <input type="text" class="inp-w120 phoneNum" value="${companyNum[0]}" maxlength="3"/> - 
            <input type="text" class="inp-w80 phoneNum" value="${companyNum[1]}" maxlength="3"/> - 
            <input type="text" class="inp-w140 phoneNum" value="${companyNum[2]}" maxlength="5"/>
            <input type="hidden" class="phoneNumComp" name="searchValue3" value="${memberEntity.searchValue3}"/>
					</div>
					<div class="marT-5">
					 <div class="floatL">
	           <span class="span-w120">담당자명</span>
	           <input type="text" class="inp-w140" name="searchValue4" value="${memberEntity.searchValue4 }"/>
           </div>
             <div class="floatL">
               <span class="marL-15 span-w80 floatL" style="padding-left:17px; padding-top: 6px;padding-left: 163px; padding-right: 4px;">지역</span>
               <select class="floatL sel-w80" name="userAreaType" data-type="AREA" data-wrap="userArea">
                 <option value="">-선택-</option>
                 <option value="1" data-val="1">국내</option>
                 <option value="2" data-val="2">해외</option>
               </select>
               <span class="userArea"><!-- 지역 --></span>
               <span class="userAreaDetail"><!-- 상세지역 --></span>
             </div>
          </div>
          <div class="marT-5" style="clear:both">
           <div class="marT-5">
             <div class="floatL">
	            <span class="span-w120" style="padding-top: 13px;">연락처</span>
	            <c:set var="phoneNum" value="${fn:split(memberEntity.searchValue5,'-')}"/>
	            <input type="text" class="inp-w60 phoneNum" value="${phoneNum[0]}" maxlength="4" placeholder="국번"/> - 
	            <input type="text" class="inp-w60 phoneNum" value="${phoneNum[1]}" maxlength="4"/> - 
	            <input type="text" class="inp-w60 phoneNum" value="${phoneNum[2]}" maxlength="4"/>
	            <input type="hidden" class="phoneNumComp" name="searchValue5" value="${memberEntity.searchValue5}"/>
							</div>
							<span class="marL-15 span-w80" style="margin-left: 116px;">업종</span>
							<select name="searchValue6" class="sel-w140" style="width: 197px;">
							<option value="">전체</option>
								<c:forEach items="${userCompanyBusinessTypeCode }" var="code">
								<option value="${code.commonCode }" <c:if test="${memberEntity.searchValue6 eq code.commonCode }">selected</c:if>>${code.commonName }</option>
								</c:forEach>
							</select>
						  <span class="marL-15"></span>
							<input type="submit" class="btn" value="검색"/>
							<input type="reset" class="btn" value="초기화"/>
					 </div>
			</form>
			</div>
			<div style="clear:both"></div>
		</div>
		<div style="margin:5px; color:red">※ 선택 항목별 검색의 경우, 해당 항목을 입력한 회원의 정보만 노출됩니다. (선택 항목을 선택하지 않은 회원은 검색되지 않음)</div>
		<div style="margin:5px; color:red">※ 개인정보 보호를 위해 비밀번호는 암호화 처리되어 DB에 저장됩니다. (개별 요청으로 비밀번호 변경처리는 가능함)</div>
		<div style="border-top:2px dotted #999;margin-bottom:30px"></div>
		<div style="clear:both;"></div>
		 <div style="width:100%;">
 			<h3 class="floatL part-title">> 검색결과 <span class="colorSkyBlue">${memberEntity.dataSize }</span> 건</h3>
		 </div>
	</div>
	<table class="board-list">
		<colgroup>
			<col width="3%"/>
			<col width="15%"/>
			<col width="10%"/>
			<col width="5%"/>
			<col width="7%"/>
			<col width="10%"/>
			<col width="10%"/>
			<col width="7%"/>
			<col width="10%"/>
			<col width="7%"/>
			<col width="7%"/>
		</colgroup> 
		<thead>
			<tr>
				<th>No.</th>
				<th>회원 ID</th>
				<th>기업/단체명</th>
				<th>구분</th>
				<th>담당자명</th>
				<th>연락처</th>
				<th>사업자등록번호</th>
				<th>지역(선택)</th>
				<th>업종(선택)</th>
				<th>가입일시</th>
				<th>탈퇴처리</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${memberEntity.memberList }" var="companyList" varStatus="i">
				<tr>
					<td>${memberEntity.dataSize-(memberEntity.pageListSize*(memberEntity.currentPage-1))-i.index}</td>
					<td style="cursor:pointer" class="userId" data-key="${companyList.userMasterKey }">${companyList.userId }</td>
					<td>${companyList.userCompanyName }</td>
					<td>${companyList.userCompanyGroupType }</td>
					<td>${companyList.userName }</td>
					<td>${companyList.userCellPhoneNumber }</td>
					<td>${companyList.userCompanyNumber }</td>
					<td>${companyList.userAreaDetail }</td>
					<td>${companyList.userCompanyBusinessType}</td>
					<td><fmt:formatDate pattern="yyyy/MM/dd HH:mm" value="${companyList.userJoinDate }" /></td>
					<td class="removeMember" data-key="${companyList.userMasterKey }"><a href="#" class="btnSmall-bottom-gray">탈퇴</a></td> 
				</tr>
			</c:forEach>
			<c:if test="${memberEntity.memberList.size() < 1 }">
        <tr>
          <td colspan="11">+++조회된 내용이 없습니다.+++</td>
        </tr> 
        </c:if>
		</tbody>
	</table>
	<div class="paging-area">
	 <dgPageNav:PageNavigation pageParamName="currentPage" linkUrl="${contextPath}/admin/member/companyList" pageNavigationEntity="${memberEntity}" />
	</div> 
</div>
<%@ include file="/WEB-INF/pages/views/popup/popupDropMember.jsp"%>
<script>
$(function() {
   //지역 저장된 값을 세팅
   var userAreaType = "${memberEntity.userAreaType}";
   var userArea = "${memberEntity.userArea}";
   var userAreaDetail = "${memberEntity.userAreaDetail}";
	$.fn.CompanyList.setArea(userAreaType, userArea, userAreaDetail);
	$.fn.CompanyList.init('${adminLoginSession.adminId}');
}); 
</script>
