<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="dgPageNav" uri="/WEB-INF/tlds/PageNavigation.tld" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="Strings" uri="/WEB-INF/tlds/Strings.tld" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<script type="text/javascript" src="${contextPath }/resources/js/customer.js"></script>
<div>
    <h3 class="contents-title floatL">테스트 대행 신청관리(총 <span class="colorSkyBlue">${applyTotalCount}</span> 건 )</h3>
    <div style="clear:both;"></div>
    <form id="searchForm" action="">
        <div class="search-box">
            <div class="marT-5">
                <span class="span-w50" style="padding-left: 11px;">신청일</span>
                <input type="text" id="from" class="date" name="startDate"  value="${applyFormEntity.startDate}"/> ~ <input type="text" id="to" class="date" name="endDate" value="${applyFormEntity.endDate}"/>
                <span class="span-w50" style="padding-left: 25px;">이용상품</span>
                <select class="sel-w107" name="testsearchKey1">
                    <option value="">전체</option>
                    <c:forEach items="${applyCategoryCode }" var="code">
                        <option value="${code.commonCode }" <c:if test="${applyFormEntity.testsearchKey1 eq code.commonCode }">selected</c:if>>${code.commonName }</option>
                    </c:forEach>
                </select>
                <span class="span-w80" style="padding-left: 20px; text-align:center;">의뢰테스트</span>
                <select class="sel-w160" name="testsearchKey2">
                    <option value="">전체</option>
                    <option value="test1" <c:if test="${applyFormEntity.testsearchKey2 eq 'test1' }">selected</c:if>>앱설치 테스트</option>
                    <option value="test2" <c:if test="${applyFormEntity.testsearchKey2 eq 'test2'}">selected</c:if>>모바일웹 해상도 테스트</option>
                </select>
                <span class="span-w30" style="padding-left: 25px;">상태</span>
                <select class="sel-w107" name="testsearchKey3">
                    <option value="">전체</option>
                    <option value="0" >대기</option>
                    <option value="1" >완료</option>
                </select>
            </div>
            <div class="marT-5">
                <span class="span-w50" style="padding-left: 11px;">회원 ID</span>
                <input type="text" class="inp-w200" name="testSearchKeyValue1" placeholder="sample@clapp.co.kr"/>
                <span class="span-w100" style="padding-left: 30px; padding-right: 7px;">이름/기업,단체명</span>
                <input type="text" class="inp-w600" name="testSearchKeyValue2" placeholder="띄어쓰기 없이 입력 / 기업의 경우 (주) 빼고 입력"/>
                <span class="marL-15 span-w300"> </span>
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
                <span class="colorSkyBlue"></span> 건
            </h3>
            <div class=" floatR">
                <select class="sel-w100 sortListSize" name="sortListSize">
                    <c:forEach items="${sortListSizeCode }" var="code">
                        <option value="${code.commonCode }" <c:if test="${applyFormEntity.sortListSize eq code.commonCode }">selected</c:if>>${code.commonName }</option>
                    </c:forEach>
                </select>
            </div>
        </div>
    </form>
</div>
<table class="board-list">
    <colgroup>
        <col width="7%"/>
        <col width="9%"/>
        <col width="14%"/>
        <col width="12%"/>
        <col width="12%"/>
        <col width="7%"/>
        <col width="12%"/>
        <col width="10%"/>
        <col width="10%"/>
        <col width="7%"/>
    </colgroup>
    <thead>
        <tr>
            <th>No.</th>
            <th>이용상품</th>
            <th>의뢰 테스트</th>
            <th>회원 ID</th>
            <th>메일 주소</th>
            <th>이름</th>
            <th>전화번호</th>
            <th>신청일</th>
            <th>결과 발송일</th>
            <th>상태</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach items="${applyFormEntity.testRequestList }" var="testRequestList" varStatus="i">
        <tr>
            <td>${applyFormEntity.dataSize-(applyFormEntity.pageListSize*(applyFormEntity.currentPage-1))-i.index}</td>
            <td>${testRequestList.applyType}</td>
            <td style="cursor:pointer" class="testTitle" data-key="${testRequestList.applyFormKey}">
                <c:if test="${testRequestList.applyContents == 'test1'}">앱설치 테스트</c:if>
                <c:if test="${testRequestList.applyContents == 'test2'}">모바일 웹 해상도 테스트</c:if>
            </td>
            <td>${testRequestList.userId}</td>
            <td><p><a href="mailto:${testRequestList.applyEmail}">${testRequestList.applyEmail}</a></p></td>
            <td>${testRequestList.applyInsertName}</td>
            <td>${testRequestList.applyPhoneNumber}</td>
            <td><fmt:formatDate pattern="yyyy/MM/dd" value="${testRequestList.applyInsertDate}" /></td>
            <td><fmt:formatDate pattern="yyyy/MM/dd" value="${testRequestList.resultDate}" /></td>
            <td>
                <c:if test="${testRequestList.resultType == 1}">완료</c:if>
                <c:if test="${testRequestList.resultType != 1}">대기</c:if>
            </td>
        </tr>
        </c:forEach>
        <c:if test="${applyFormEntity.testRequestList.size() < 1 }">
            <tr>
                <td colspan="8">+++조회된 내용이 없습니다.+++</td>
            </tr>
        </c:if>
    </tbody>
</table>


</div>
<div class="paging-area">
    <dgPageNav:PageNavigation pageParamName="currentPage" linkUrl="${contextPath}/admin/customer/testRequestList" pageNavigationEntity="${applyFormEntity}" />
    <%--<a class='paging-first' href='#'><img src='${contextPath }/resources/img/icon-first.gif'/></a><a class='paging-prev' href='#'><span><img src='${contextPath }/resources/img/icon-prev.gif'/></span></a><a class='on' href='#'><span><b>1</b></span></a><a class='paging-next' href='#'><span><img src='${contextPath }/resources/img/icon-next.gif'/></span></a><a class='paging-last' href='#'><span><img src='${contextPath }/resources/img/icon-last.gif'/></span></a>--%>
</div>
<script>
    $(function() {
        $.fn.testRequestList.init();
    });
</script>