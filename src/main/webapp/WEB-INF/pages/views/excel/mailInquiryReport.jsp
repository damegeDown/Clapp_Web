<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="numbers" uri="/WEB-INF/tlds/Numbers.tld" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<div style="width:100%;">
    <%--<h3 class="floatL" style="margin:15px 0 10px 0"></h3>--%>
    <div class="floatL" style="margin-top:15px">>이메일 문의 / 답변</div>
</div>
<table class="board-list">
	<thead> 
		<tr>
			<th>분류</th>
			<th>건수</th>
		</tr>
	</thead>
	<c:if test="${statisticsLength == 0 }">
		<tbody>
			<td colspan="3">조회한 내용이 없습니다.</td>
		</tbody>
	</c:if>
    <c:if test="${inquirySearchCount.totalCount == 0 }">
        <tbody>
        <td colspan="2" class="al-center">조회한 내용이 없습니다.</td>
        </tbody>
    </c:if>
    <c:if test="${inquirySearchCount.totalCount > 0 }">
        <tbody>
        <tr class="cursor" style="cursor:pointer; ">
            <td>문의건수</td>
            <td>${inquirySearchCount.totalCount} 건</td>
        </tr>
        <tr class="cursor" style="cursor:pointer; ">
            <td>답변건수</td>
            <td>${inquirySearchCount.answerCount} 건</td>
        </tr>
        <tr class="cursor" style="cursor:pointer; ">
            <td>미답변 건수</td>
            <td>${inquirySearchCount.notAnswerCount} 건</td>
        </tr>
        </tbody>
    </c:if>
</table>
<br/>
    <div style="width:100%;">
        <div class="floatL" style="margin-top:15px">${CommonCode.searchReason }</div>
    </div>
    <c:set var="statisticsAnswerLength" value="${statisticsAnswerList.size() }"/>
    <table class="board-list-r">
        <colgroup>
            <col width="40%"/>
            <col width="30%"/>
            <col width="30%"/>
        </colgroup>
        <thead>
        <tr>
            <th>점수(만족도)</th>
            <th>건수</th>
            <th>비율</th>
        </tr>
        </thead>
        <c:if test="${statisticsAnswerLength == 0 }">
            <tbody>
            <td colspan="3" class="al-center">조회한 내용이 없습니다.</td>
            </tbody>
        </c:if>
        <c:if test="${statisticsAnswerLength > 0}">
            <tbody>
            <c:forEach items="${statisticsAnswerList }" var="statisticsList" varStatus="i">
                <tr class="cursor" style="cursor:pointer; ">
                    <td>0</td>
                    <!-- 일반 -->
                    <td>
                        0 건
                    </td>
                    <!-- 기업/단체가입 -->
                    <td>
                        0 %
                    </td>
                </tr>
            </c:forEach>
            </tbody>
            <tfoot>
            <tr class="last">
                <th>합계</th>
                <th>0 건</th>
                <th>100%</th>
            </tr>
            </tfoot>
        </c:if>
</table>