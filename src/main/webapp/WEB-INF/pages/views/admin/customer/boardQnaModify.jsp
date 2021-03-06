<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<script type="text/javascript" src="${contextPath }/resources/js/customer.js"></script>
<div class="sub-content">
<form id="memberForm" enctype="multipart/form-data">
  <div> 
    <h3 class="contents-title floatL">${CommonCode.navigation }</h3>
    <div style="clear:both;"></div>
  </div>
   <c:if test="${boardQnaDetail.boardQnaKey ne null}">
    <input type="hidden" name="boardQnaKey" value="${boardQnaDetail.boardQnaKey }"/>
  </c:if> 
  <table class="board-write box-pd">
    <colgroup>
      <col width="150px"/>
      <col width="830px"/>
    </colgroup>
    <tbody>
      <tr>
        <th>분류</th>
        <td>
        <select name="qnaCategory" id="qnaCategory">
            <option value="">선택</option>
            <c:forEach items="${qnaCategoryCode }" var="code">
            <option value="${code.commonCode }" <c:if test="${boardQnaDetail.qnaCategory eq code.commonName }">selected</c:if>>${code.commonName }</option>
            </c:forEach>
          </select>
        </td>
       </tr>
       <tr>
        <th>질문</th>
        <td>
          <input type="text" class="inp-w600 " name="qnaQuestion" value="${boardQnaDetail.qnaQuestion }"/>
       </tr>
        <tr>
        <th>답변</th>
        <td>
          <textarea class="w780" cols="150" rows="20" id="ir1" name="qnaAnswer" wrap="hard">${boardQnaDetail.qnaAnswer }</textarea>
        </td>
       </tr>
       <tr>
        <th>이미지</th>
        <td>
        	<img id="blah" src="${contextPath}/common/imgView?fileType=${boardQnaDetail.fileTarget}&fileName=${boardQnaDetail.fileSavedName}" class="boardQnaImage" style="max-width:800px"/>
					<input type="hidden" name="fileName" value="${boardQnaDetail.fileName }" data-flag="off"/>
					<input type="hidden" name="fileSavedName" value="${boardQnaDetail.fileSavedName }" data-flag="off"/>
          <div class="marT-5"><span>등록된 이미지 : </span><a href="">${boardQnaDetail.fileName }</a></div>
          <div class="marT-5"><input type="file" name="file" data-flag="off" id="imgInp" accept="image/*" /></div>
        </td>
       </tr> 
       <c:if test="${boardQnaDetail.boardQnaKey ne null}">
       <tr>
       <th>등록 일시</th>
        <td>
       	 <fmt:formatDate pattern="yyyy/MM/dd HH:mm" value="${boardQnaDetail.qnaInsertDate }" />
        </td> 
        </tr>
        </c:if>
       <tr>
        <th>TOP 10 노출 여부</th>
        <td>
          <label><input type="radio" name="qnaTop10Open" value="N" <c:if test="${boardQnaDetail.qnaTop10Open == 'N'}">checked="checked" </c:if>checked/>&nbsp;비노출&nbsp;&nbsp;</label>
          <label><input type="radio" name="qnaTop10Open" value="Y" <c:if test="${boardQnaDetail.qnaTop10Open == 'Y'}">checked="checked" </c:if>/>&nbsp;노출 (TOP 10 가능개수 : <span class="boardQnaTop10">${10 - countExposedBoardQna }</span>개)&nbsp;&nbsp;</label>
        </td>
       </tr>
       <tr>
        <th>등록자</th>
        <td>
        <c:if test="${boardQnaDetail.boardQnaKey > 0}">
          <input type="text" class="inp-w160 " name="qnaInsertName" value="${boardQnaDetail.qnaInsertName}" readonly="readonly"/>
        </c:if> 
        <c:if test="${boardQnaDetail.boardQnaKey eq null}">
          <input type="text" class="inp-w160 " name="qnaInsertName" value="${adminLoginSession.adminName}" readonly="readonly"/>
        </c:if> 
        </td>
       </tr>
    </tbody>
  </table>
  <div class="btn-area">
    <a href="${contextPath}/admin/customer/boardQnaList" class="floatL btn-bottom-orenge">목록</a>
    <div type="button" class="floatL btn-bottom-orenge PreviewBtn">미리보기</div>
    <div class="floatR btn-bottom-orenge onsubmitBtn" >${CommonCode.submitType }</div>
    <c:if test="${boardQnaDetail.boardQnaKey  > 0}">
      <div class="floatR btn-bottom-orenge delSubmitBtn" data-action="/admin/customer/rest/removeBoardQna" data-type="ajax" data-id='${boardQnaDetail.boardQnaKey}' data-msg='삭제'>삭제</div>
    </c:if> 
    <div class="floatR btn-bottom-orenge submitBtn" style="display:none"  data-action="${contextPath}/${CommonCode.submitAction}" data-msg="${CommonCode.submitType }">${CommonCode.submitType }</div>
  </div>
  </form>
</div>
<%@ include file="/WEB-INF/pages/views/popup/popupBoardQna.jsp"%>
<script>
$(function() {
   $.fn.boardQnaDetail.init();
   //스마트 에디터
   EditorUtils.smartEditor('ir1', 'ajax');

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
    $("#imgInp").change(function(){
        //alert(this.value); //선택한 이미지 경로 표시
        readURL(this);
    });
});
</script>
