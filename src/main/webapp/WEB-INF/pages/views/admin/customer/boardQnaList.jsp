<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="dgPageNav" uri="/WEB-INF/tlds/PageNavigation.tld" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<script type="text/javascript" src="${contextPath }/resources/js/customer.js"></script>
<div class="sub-content">
	<div>
		<h3 class="contents-title floatL">${CommonCode.navigation }</h3> 
		<div style="clear:both;"></div>
		<div style="width:100%;">
	        <h3 class="floatL part-title">> TOP 10 : 도움말 화면 최상단에 노출 (사용자가 제일 궁금해 하는 사항)</h3>
	    </div>
		<table class="board-list">
			<colgroup>
				<col width="5%"/>
				<col width="5%"/>
				<col width="10%"/> 
				<col width="30%"/> 
				<col width="15%"/> 
				<col width="10%"/> 
			</colgroup>
			<thead>
				<tr>
					<th>선택</th>
					<th>No</th>
					<th>분류</th>
					<th>질문</th>
					<th>등록일시</th>
					<th>TOP 비노출</th>
				</tr>
			</thead>
			<tbody>
			   <input type="hidden" name="topQnaCount" class="topQnaCount" value="${boardQnaEntity.boardQnaSelectedList.size()}"/>
 				<c:forEach items="${boardQnaEntity.boardQnaSelectedList }" var="boardQnaSelected" varStatus="j">
				<tr>
					<td><input type="checkbox" name="boardQnaKeyArr" class="chk" value="${boardQnaSelected.boardQnaKey }"></td>
					<td>${boardQnaEntity.boardQnaSelectedList.size()-j.index}</td>
					<td>${boardQnaSelected.qnaCategory}</td>
					<td style="cursor:pointer" class="qnaQuestion" data-key="${boardQnaSelected.boardQnaKey }">${boardQnaSelected.qnaQuestion}</td>
					<td><fmt:formatDate pattern="yyyy/MM/dd HH:mm" value="${boardQnaSelected.qnaInsertDate}" /></td>
					<td class="removeUnitQna" data-key="${boardQnaSelected.boardQnaKey }"><a href="#" class="btnSmall-bottom-gray">비노출</a></td> 
				</tr>
				</c:forEach>
				<c:if test="${boardQnaEntity.boardQnaSelectedList.size() < 1 }">
          <tr>
            <td colspan="6">+++노출된 도움말이 없습니다.+++</td>
          </tr> 
        </c:if>
			</tbody>
		</table>
		<div style="margin-top:10px">
		  <a href="#" id="qnaTop10Close" class="floatL btn-bottom-orenge"><span>선택한 도움말 비노출</span></a>
		</div>
	</div>
	<div style="clear:both;"></div>
	<div style="margin-top:20px">
		<form id="searchForm" action="">
		<div class="search-box">
				<div class="marT-5">
	        <div class="marT-5">
	          <span class="span-w50" style="padding-left: 11px;">등록일</span>
	           <input type="text" id="from" class="date" name="startDate"  value="${boardQnaEntity.startDate}"/> ~ <input type="text" id="to" class="date" name="endDate" value="${boardQnaEntity.endDate }"/>
	           <span class="span-w60" style="padding-left: 20px;">도움말 분류</span>
	           <select class="sel-w107" name="searchValue">
	             <option value="">전체</option>
	            <c:forEach items="${qnaCategoryCode }" var="code">
	            <option value="${code.commonCode }" <c:if test="${boardQnaEntity.searchValue eq code.commonCode }">selected</c:if>>${code.commonName }</option>
	            </c:forEach> 
	          </select>
	        </div>
	        <div class="marT-5">
	          <span class="span-w20">게시물 검색</span>
	          <select class="sel-w100" name="searchKey">
	            <option value="">전체</option>
	            <option value="1"  <c:if test="${boardQnaEntity.searchKey eq 1}"> selected</c:if>>제목</option>
	            <option value="2"  <c:if test="${boardQnaEntity.searchKey eq 2}"> selected</c:if>>내용</option>
	            <option value="3"  <c:if test="${boardQnaEntity.searchKey eq 3}"> selected</c:if>>제목+내용</option>
	          </select>
	          <input type="text" class="inp-w410" name="searchValue1" value="" placeholder="띄어쓰기 없이 입력"/>
						<span class="marL-15 span-w50"></span>
						<input type="submit" class="btn" value="검색"/>
						<input type="reset" class="btn" value="초기화"/>
					</div>
				</div>
				<div style="clear:both"></div>
		</div>
		<div style="clear:both"></div>
  		<div style="border-top:2px dotted #999;margin-bottom:30px"></div>
		<div style="width:100%;">
			<h3 class="floatL part-title">> 검색결과 <span class="colorSkyBlue">${boardQnaEntity.dataSize }</span> 건</h3>
			<div class=" floatR">
		        <select class="sel-w100 sortListSize" name="sortListSize">
		          <c:forEach items="${sortListSizeCode }" var="code">
		          <option value="${code.commonCode }" <c:if test="${boardQnaEntity.sortListSize eq code.commonCode }">selected</c:if>>${code.commonName }</option>
		          </c:forEach>
		        </select>
			</div>
		</div>
		</form>
		<table class="board-list">
			<colgroup>
        <col width="5%"/>
        <col width="5%"/>
        <col width="10%"/> 
        <col width="30%"/> 
        <col width="15%"/> 
        <col width="10%"/> 
			</colgroup>
			<thead>
			<tr>
        <th>선택</th>
        <th>No</th>
        <th>분류</th>
        <th>질문</th>
        <th>등록일시</th>
        <th>삭제</th>
			</tr>
			</thead>
			<tbody>
 				<c:forEach items="${boardQnaEntity.boardQnaList }" var="boardQnaList" varStatus="i">
				<tr>
 					<td><input type="hidden" name="qnaTop10Open" value="${boardQnaList.qnaTop10Open}"/>
					<input type="checkbox" name="boardQnaKeyArr" class="chk" value="${boardQnaList.boardQnaKey }"></td>
					<td>${boardQnaEntity.dataSize-(boardQnaEntity.pageListSize*(boardQnaEntity.currentPage-1))-i.index}</td>
					<td>${boardQnaList.qnaCategory }</td>
					<td style="cursor:pointer" class="qnaQuestion" data-key="${boardQnaList.boardQnaKey }">${boardQnaList.qnaQuestion}</td>
					<td><fmt:formatDate pattern="yyyy/MM/dd HH:mm" value="${boardQnaList.qnaInsertDate}" /></td>
					<td><a href="#" class="btnSmall-bottom-gray removeQna" data-id="${boardQnaList.boardQnaKey}" >삭제</a></td>
				</tr>
				</c:forEach>
				<c:if test="${boardQnaEntity.boardQnaList.size() < 1 }">
					<tr>
					  <td colspan="6">+++조회된 내용이 없습니다.+++</td>
					</tr> 
				</c:if>
			</tbody>
		</table>
		<div class="btn-area">
			<a href="#" id="qnaTop10Open" class="floatL btn-bottom-orenge"><span>선택한 도움말 TOP 노출</span></a> 
			<a href="${contextPath }/admin/customer/boardQnaDetail" class="floatR btn-bottom-orenge">도움말 등록</a>
		</div>
		<div class="paging-area">
 		 <dgPageNav:PageNavigation pageParamName="currentPage" linkUrl="${contextPath}/admin/customer/boardQnaList" pageNavigationEntity="${boardQnaEntity}" />
		</div>  
	</div>
</div>
<script>
	$(function() {
		$.fn.boardQnaList.init();
	});
</script>