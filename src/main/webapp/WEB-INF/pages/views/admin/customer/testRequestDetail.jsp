<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="dgPageNav" uri="/WEB-INF/tlds/PageNavigation.tld" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="Strings" uri="/WEB-INF/tlds/Strings.tld" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<div class="sub-content">
    <form id="memberForm" enctype="multipart/form-data" method="post">
        <div>
            <h3 class="contents-title floatL">무료 테스트 신청관리 > 상세보기</h3>
            <div style="clear:both;"></div>
            <br>
        </div>

        <table class="board-write box-pd">
            <colgroup>
                <col width="150px"/>
                <col width="830px"/>
            </colgroup>
            <tbody>
            <tr>
                <th>구분</th>
                <td>${applyFormDetail.applyType}</td>
            </tr>
            <tr>
                <th>회원 ID</th>
                <td>
                    ${applyFormDetail.userId}
                </td>
            </tr>
            <tr>
                <th>이메일 주소</th>
                <td>
                    ${applyFormDetail.applyEmail}
                </td>
            </tr>
            <tr>
                <th>이름(기업명)</th>
                <td>
                    ${applyFormDetail.applyInsertName}
                </td>
            </tr>
            <tr>
                <th>연락처</th>
                <td>
                    ${applyFormDetail.applyPhoneNumber}
                            </td>
            </tr>

            <tr>
                <th>의뢰 테스트</th>
                <c:if test="${applyFormDetail.applyContents eq 'test1'}" >
                <td>
                    <div class="marT-5">앱설치 테스트</div>
                    <div class="marT-10">
                        <p><a href="${contextPath}/common/fileDownload?path=applyform&orgFileName=${applyFile.fileSavedName}">${applyFile.fileName}</a></p>
                        <%--<a href="javascript:void(0)" onclick="autoJnlpDownload();">123.apk</a></div>--%>
                    </div>
                </td>
                </c:if>
                <c:if test="${applyFormDetail.applyContents eq 'test2'}" >
                <td>
                    <div class="marT-5">모바일 웹 해상도 테스트</div>
                    <div class="marT-10">

                        ${applyFormDetail.applyUrl}
                    </div>
                </td>
               </c:if>
            </tr>

            <tr>
                <th>파일설명</th>
                <td>
                    ${applyFormDetail.fileMemo}
                </td>
            </tr>
            <tr>
                <th>상태</th>
                <td>
                    <c:if test="${applyFormDetail.resultType == 1}">완료</c:if>
                    <c:if test="${applyFormDetail.resultType != 1}">대기</c:if>
                </td>
            </tr>
            <tr>
                <th>테스팅 결과 등록</th>
                <td>
                    <div class="marT-5">
                        <p><a href="${contextPath}/common/fileDownload?path=testingresult&orgFileName=${resultFile.fileSavedName}">${resultFile.fileName}</a></p>
                        <input type="file" name="fileName" id="testInp" data-flag="off"  />
                    </div>

                    <input type="hidden" name="applyFormKey" value=" ${applyFormDetail.applyFormKey}">
                </td>
            </tr>
            </tbody>
        </table>
        <div class="btn-area">
            <a href="/admin/customer/testRequestList" class="floatL btn-bottom-orenge">목록</a>
            <c:if test="${resultFile.fileSavedName ne null}">
                <div class="floatR btn-bottom-orenge submitBtn" data-action="/admin/customer/rest/testRequestFileUpdate" data-msg="수정">수정</div>
            </c:if>
            <c:if test="${resultFile.fileSavedName eq null}">
                <div class="floatR btn-bottom-orenge submitBtn" data-action="/admin/customer/rest/testRequestAdvice" data-msg="등록">등록</div>
            </c:if>
        </div>
    </form>
</div>