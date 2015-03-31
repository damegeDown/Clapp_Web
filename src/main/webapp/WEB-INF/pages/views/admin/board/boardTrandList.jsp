<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="dgPageNav" uri="/WEB-INF/tlds/PageNavigation.tld" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<script type="text/javascript" src="${contextPath }/resources/js/board.js"></script>
<div class="sub-content">
	<div>
		<h3 class="contents-title floatL"> ${CommonCode.navigation } </h3> 
		<div style="clear:both;"></div>
		<form id="searchForm" action="">
		<div class="search-box">
			<div class="marT-5">
				<span class="span-w60" style="padding-right: 26px">등록일</span>
				<input type="text" id="from" class="date" name="startDate"  value="${boardEntity.startDate}"/> ~ <input type="text" id="to" class="date" name="endDate" value="${boardEntity.endDate }"/>
				<span class="marL-15 span-w60">게시판 구분</span>
				<select class="sel-w100" name="searchValue">
					<option value="">전체</option>
		            <c:forEach items="${TrandCategoryCode }" var="code">
		            <option value="${code.commonCode }" <c:if test="${boardEntity.searchValue eq code.commonCode }">selected</c:if>>${code.commonName }</option>
		            </c:forEach>
				</select>
				<span class="marL-15 span-w60">출처</span>
        	 		<input type="text" class="inp-w150" name="searchValue1" value="" placeholder="띄어쓰기 없이 입력"/>
			</div>
			<div class="marT-5">
				<span class="span-w60">게시물 검색</span>
				<select class="sel-w100" name="searchKey">
		            <option value="">전체</option>
		            <option value="1" <c:if test="${boardEntity.searchKey eq 1}"> selected</c:if>>제목</option>
		            <option value="2" <c:if test="${boardEntity.searchKey eq 2}"> selected</c:if>>내용</option>
		            <option value="3" <c:if test="${boardEntity.searchKey eq 3}"> selected</c:if>>제목+내용</option>
		        </select>
				<input type="text" class="inp-w360" name="searchValue2" value="" placeholder="띄어쓰기 없이 입력"/>
				<span class="marL-15 span-w50"></span> 
				<input type="submit" class="btn" value="검색"/>
				<input type="reset" class="btn" value="초기화"/>
			</div>
			<div style="clear:both"></div>
			</div>
			<div style="margin:5px; color:red">※ 트렌드 리뷰의 업계 동향, 리뷰 · 전망, 케이스 스터디 에 노출되는 게시물 관리 입니다. (소셜 · 블로그는 별도 메뉴로 관리)</div>
			<div style="border-top:2px dotted #999;margin-bottom:30px"></div>
			<div style="clear:both;"></div>
			<div style="width:100%;">
   				<h3 class="floatL part-title">> 검색결과 <span class="colorSkyBlue">${boardEntity.dataSize }</span> 건</h3>
   				<div class=" floatR">
		          <select class="sel-w100 sortListSize" name="sortListSize">
		            <c:forEach items="${sortListSizeCode }" var="code">
		            <option value="${code.commonCode }" <c:if test="${boardEntity.sortListSize eq code.commonCode }">selected</c:if>>${code.commonName }</option>
		            </c:forEach>
		          </select>
		        </div>
   			</div>
		</form>
	</div>
	<table class="board-list">
		<colgroup>
			<col width="5%"/>
			<col width="10%"/>
			<col width="10%"/>
			<col width="40%"/>
			<col width="15%"/>
			<col width="10%"/>
		</colgroup> 
		<thead>
			<tr>
                <th>선택</th>
				<th>No.</th>
				<th>게시판 구분</th>
				<th>제목</th>
				<th>출처</th>
				<th>등록일시</th>
			</tr>
		</thead>
		<tbody>
		 <c:forEach items="${boardEntity.boardTrandList }" var="boardTrandList" varStatus="i"> 
			<tr>
                <td>
                <input type="checkbox" name="boardTrandKeyArr" class="chk" value="${boardTrandList.boardTrandKey }">
                </td>
				<td>${boardEntity.dataSize-(boardEntity.pageListSize*(boardEntity.currentPage-1))-i.index}</td> 
				<td>${boardTrandList.trandCategory }</td>
				<td style="cursor:pointer" class="trandTitle" data-key="${boardTrandList.boardTrandKey }">${boardTrandList.trandTitle}</td>
				<td><a href="http://${boardTrandList.trandOriginLink }" target="new">${boardTrandList.trandOrigin }</a></td>
				<td><fmt:formatDate pattern="yyyy/MM/dd HH:mm" value="${boardTrandList.trandInsertDate }" /></td>
			</tr>
		</c:forEach> 
		 <c:if test="${boardEntity.boardTrandList.size() < 1 }">
			<tr>
			 <td colspan="5">+++조회된 내용이 없습니다.+++</td>
			</tr> 
		</c:if>
		</tbody>
	</table>
	<div class="btn-area">
        <a href="#" class="floatL btn-bottom-orenge boardTopOpen"><span>최상단 노출</span></a>
        <a href="${contextPath }/admin/board/boardTrandForm" class="floatR btn-bottom-orenge">등록</a>
  </div>
	<div class="paging-area">
	  <dgPageNav:PageNavigation pageParamName="currentPage" linkUrl="${contextPath}/admin/board/boardTrandList" pageNavigationEntity="${boardEntity}" />
	</div>
</div>
<script>
  $(function() {
    $.fn.boardTrandList.init();
  });
</script>