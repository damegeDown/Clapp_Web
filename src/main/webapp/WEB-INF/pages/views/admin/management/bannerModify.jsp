<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<script type="text/javascript" src="${contextPath }/resources/js/management.js"></script>

<div class="sub-content">
    <form id="bannerForm" enctype="multipart/form-data">
        <div>
            <h3 class="contents-title floatL">${CommonCode.navigation }</h3>

            <div style="clear:both;"></div>
        </div>
        <c:if test="${bannerDetail.bannerInquiryKey ne null}">
            <input type="hidden" name="bannerInquiryKey" value="${bannerDetail.bannerInquiryKey }"/>
        </c:if>
        <table class="board-write box-pd">
            <colgroup>
                <col width="150px"/>
                <col width="830px"/>
            </colgroup>
            <tbody>
            <tr>
                <th>배너 제목</th>
                <td>
                    <input type="text" class="inp-w410 " name="bannerTitle" value="${bannerDetail.bannerTitle}"
                           placeholder="20자 이내 팝업 설명용 (관리차원)"/>
                </td>
            </tr>
            <tr>
                <th>시작 일시</th>
                <td>
                    <fmt:formatDate var="startDate" pattern="yyyy/MM/dd HH:mm"
                                    value="${bannerDetail.bannerStartDate }"/>
                    <input type="text" class="inp-w160 datetimepicker" name="bannerStartDate" value="${startDate }"/>
                </td>
            </tr>
            <tr>
                <th>종료 일시</th>
                <td>
                    <fmt:formatDate var="endDate" pattern="yyyy/MM/dd HH:mm" value="${bannerDetail.bannerEndDate }"/>
                    <input type="text" class="inp-w160 datetimepicker" name="bannerEndDate" value="${endDate }"/>
                </td>
            </tr>
            <tr>
                <th>배너 이미지 등록</th>
                <td>
                    <img id="blah"
                         src="${contextPath}/common/imgView?fileType=${bannerDetail.fileTarget}&fileName=${bannerDetail.fileSavedName}"
                         style="max-width:800px"/>
                    <input type="hidden" name="fileName" value="${bannerDetail.fileName }" data-flag="off"/>
                    <input type="hidden" name="fileSavedName" value="${bannerDetail.fileSavedName }" data-flag="off"/>

                    <div class="marT-5"><span>등록된 이미지 : </span><a href="">${bannerDetail.fileName }</a></div>
                    <div class="marT-5"><input type="file" name="file" id="imgInp" data-flag="off"/></div>
                </td>
            </tr>
            <tr>
                <th>상태</th>
                <td>
                    <select class="sel-w100 floatL" name="bannerStatus">
                        <c:forEach items="${bannerStatus}" var="code">
                            <option value="${code.commonCode }"
                                    <c:if test="${bannerDetail.bannerStatus eq code.commonCode }">selected</c:if>>${code.commonName }</option>
                        </c:forEach>
                    </select>
                </td>
            </tr>
            <tr>
                <th>노출순서</th>
                <td>
                    <input type="text" class="inp-w60" style="text-align: right;" name="bannerViewSeq"
                           value="${bannerDetail.bannerViewSeq}" placeholder="0"/>
                </td>
            </tr>
            <tr>
                <th>링크구분</th>
                <td>
                    <select class="sel-w100 floatL" name="bannerLinkType">
                        <c:forEach items="${bannerLinkType}" var="code">
                            <option value="${code.commonCode }"
                                    <c:if test="${bannerDetail.bannerLinkType eq code.commonCode }">selected</c:if>>${code.commonName }</option>
                        </c:forEach>
                    </select>
                </td>
            </tr>
            <tr>
                <th>링크 URL</th>
                <td>
                    <input type="text" class="inp-w410" name="bannerLinkUrl" value="${bannerDetail.bannerLinkUrl}"
                           placeholder="배너연결URL"/>
                </td>
            </tr>

            </tbody>
        </table>
        <div class="btn-area">
            <a href="${contextPath}/admin/management/bannerList" class="floatL btn-bottom-orenge">목록</a>
            <!-- <div class="floatR btn-bottom-orenge onsubmitBtn" >${CommonCode.submitType }1</div> -->
            <div class="floatR btn-bottom-orenge submitBtn" data-action="${contextPath}/${CommonCode.submitAction}"
                 data-msg="${CommonCode.submitType }">${CommonCode.submitType }</div>
        </div>
    </form>
</div>
<script>
    $(function () {
        // $.fn.BannerDetail.init();
        // lwj up
        function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader(); //파일을 읽기 위한 FileReader객체 생성
                reader.onload = function (e) {
                    //파일 읽어들이기를 성공했을때 호출되는 이벤트 핸들러
                    $('#blah').attr('src', e.target.result);
                    //이미지 Tag의 SRC속성에 읽어들인 File내용을 지정
                    //(아래 코드에서 읽어들인 dataURL형식)
                }
                reader.readAsDataURL(input.files[0]);
                //File내용을 읽어 dataURL형식의 문자열로 저장
            }
        }//readURL()--

        //file 양식으로 이미지를 선택(값이 변경) 되었을때 처리하는 코드
        $("#imgInp").change(function () {
            //alert(this.value); //선택한 이미지 경로 표시
            readURL(this);
        });
    })
</script>