<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="dgPageNav" uri="/WEB-INF/tlds/PageNavigation.tld" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<script type="text/javascript" src="${contextPath }/resources/js/customer.js"></script>
<div class="sub-content">
  <div>
     <h3 class="contents-title floatL"> ${CommonCode.navigation }</h3> 
    <div style="clear:both;"></div>
      <form id="searchForm" action="">
    <div class="search-box">
        <div class="marT-5">
          <span class="span-w50" style="padding-left: 11px;">등록일</span>
           <input type="text" id="from" class="date" name="startDate"  value="${boardNoticeEntity.startDate}"/> ~ <input type="text" id="to" class="date" name="endDate" value="${boardNoticeEntity.endDate }"/>
           <span class="span-w50" style="padding-left: 30px;">노출 여부</span>
           <select class="sel-w107" name="searchValue">
             <option value="">전체</option>
             <option value="노출">노출</option>
             <option value="대기">대기</option>
<%--              <c:forEach items="${noticeOpenCode }" var="code">
            <option value="${code.commonCode }" <c:if test="${boardNoticeEntity.searchValue eq code.commonCode }">selected</c:if>>${code.commonName }</option>
            </c:forEach> --%>
          </select>
        </div>
        <div class="marT-5">
          <span class="span-w20">게시물 검색</span>
          <select class="sel-w100" name="searchKey">
            <option value="">전체</option>
            <option value="1" <c:if test="${boardNoticeEntity.searchKey eq 1}"> selected</c:if>>제목</option>
            <option value="2" <c:if test="${boardNoticeEntity.searchKey eq 2}"> selected</c:if>>내용</option>
            <option value="3" <c:if test="${boardNoticeEntity.searchKey eq 3}"> selected</c:if>>제목+내용</option>
          </select>
          <input type="text" class="inp-w410" name="searchValue1" value="" placeholder="띄어쓰기 없이 입력"/>
          <span class="marL-15 span-w50"></span> 
          <input type="submit" class="btn" value="검색"/>
          <input type="reset" class="btn" value="초기화"/>
        </div>
        <div style="clear:both"></div>
        </div>
        <div style="margin:5px; color:red"></div>
        <div style="border-top:2px dotted #999;margin-bottom:30px"></div>
        <div style="clear:both;"></div>
        <div style="width:100%;">
	        <h3 class="floatL part-title">> 검색결과 : 
				<span class="colorSkyBlue">${boardNoticeEntity.dataSize }</span> 건
			</h3>
	        <div class=" floatR"> 
	          <select class="sel-w100 sortListSize" name="sortListSize">
	            <c:forEach items="${sortListSizeCode }" var="code">
	            <option value="${code.commonCode }" <c:if test="${boardNoticeEntity.sortListSize eq code.commonCode }">selected</c:if>>${code.commonName }</option>
	            </c:forEach>
	          </select>
	        </div>
        </div>
      </form>
  </div>
  <table class="board-list">
    <colgroup>
      <col width="10%"/>
      <col width="30%"/>
      <col width="20%"/>
      <col width="20%"/>
      <col width="15%"/>
    </colgroup> 
    <thead>
      <tr>
        <th>No.</th>
        <th>제목</th>
        <th>등록 일시</th>
        <th>노출 여부</th>
        <th>삭제</th>
      </tr>
    </thead>
    <tbody>
     <c:forEach items="${boardNoticeEntity.boardNoticeList }" var="boardNoticeList" varStatus="i"> 
      <tr>
        <td>${boardNoticeEntity.dataSize-(boardNoticeEntity.pageListSize*(boardNoticeEntity.currentPage-1))-i.index}</td> 
        <td style="cursor:pointer" class="noticeTitle" data-key="${boardNoticeList.boardNoticeKey }">${boardNoticeList.noticeTitle}</td>
        <td><fmt:formatDate pattern="yyyy/MM/dd HH:mm" value="${boardNoticeList.noticeInsertDate }" /></td>
        <td>${boardNoticeList.noticeOpenYn}  
           <c:if test="${boardNoticeList.noticeOpenYn eq '대기'}"> <br>  
	          <fmt:formatDate pattern="yyyy/MM/dd HH:mm" value="${boardNoticeList.noticeOpenDate }" />
	        </c:if> 
	      </td>
        <td>
            <a href="#" class="btnSmall-bottom-gray removeNotice" data-id="${boardNoticeList.boardNoticeKey}" >삭제</a>
        </td>
      </tr>
    </c:forEach> 
     <c:if test="${boardNoticeEntity.boardNoticeList.size() < 1 }">
      <tr>
       <td colspan="5">+++조회된 내용이 없습니다.+++</td>
      </tr> 
    </c:if> 
    </tbody>
  </table>
  </div>
  <div class="btn-area">
    <a href="${contextPath }/admin/customer/boardNoticeModify" class="floatR btn-bottom-orenge">등록</a>
  </div>
  <div class="paging-area">
     <dgPageNav:PageNavigation pageParamName="currentPage" linkUrl="${contextPath}/admin/customer/boardNoticeList" pageNavigationEntity="${boardNoticeEntity}" />
  </div>
</div>
<script>
  $(function() {
    $.fn.boardNoticeList.init();
  });
</script>