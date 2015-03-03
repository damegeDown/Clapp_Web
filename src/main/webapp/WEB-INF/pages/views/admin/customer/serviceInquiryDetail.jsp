<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="Strings" uri="/WEB-INF/tlds/Strings.tld" %>
<% pageContext.setAttribute("newLineChar", "\n"); %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<script type="text/javascript" src="${contextPath }/resources/js/customer.js"></script>
<div class="sub-content">
  <form id="serviceInquiryForm">
    <div> 
      <h3 class="contents-title floatL">${CommonCode.navigation }</h3>
      <div style="clear:both;"></div>
    </div>
    <table class="board-write box-pd">
      <colgroup>
        <col width="150px"/>
        <col width="830px"/>
      </colgroup>
      <tbody>
        <tr>
          <th>문의 분류</th>
          <td>
           ${serviceInquiryDetail.inquiryCategory }
          </td>
        </tr>
         <tr>
          <th>문의 제목</th>
          <td>
           ${serviceInquiryDetail.inquiryTitle}
           <Strings:cutTextTag length="40" text="${serviceInquiryDetail.inquiryContents}" ellipsis=".."/>
          </td>
         </tr>
         <tr>
          <th>문의 일시</th>
          <td>
          <fmt:formatDate pattern="yyyy/MM/dd HH:mm" value="${serviceInquiryDetail.inquiryInsertDate }" />
          </td>
         </tr> 
         <tr>
          <th>문의자</th>
          <td>
           ${serviceInquiryDetail.inquiryName}
          </td>
         </tr>
         <tr>
          <th>이메일 주소</th>
          <td>
           ${serviceInquiryDetail.inquiryEmail}
          </td>
         </tr>
         <tr>
          <th>연락처</th>
          <td>
           ${serviceInquiryDetail.inquiryPhoneNumber}
          </td>
         </tr>
         <tr>
          <th>내용</th>
          <td>
           ${serviceInquiryDetail.inquiryContents}
          </td>
         </tr>
         <tr>
          <th>파일첨부</th>
          <td>
          	<a href="${contextPath}/common/fileDownload?path=inquiry&orgFileName=${serviceInquiryDetail.fileSavedName}">${serviceInquiryDetail.fileName}</a>
          </td>
         </tr>
      </tbody>
    </table>
    </form>
    <br>
    <br>
    <form id="serviceInquiryAnswerForm" enctype="multipart/form-data">
    <c:if test="${serviceInquiryDetail.serviceInquiryKey ne null}">
    <input type="hidden" name="serviceInquiryKey" value="${serviceInquiryDetail.serviceInquiryKey }"/>
    </c:if>
    <input type="hidden" name="inquiryName" value="${serviceInquiryDetail.inquiryName }"/>
    <input type="hidden" name="inquiryEmail" value="${serviceInquiryDetail.inquiryEmail}"/>
    <input type="hidden" name="inquiryContents" value=" ${serviceInquiryDetail.inquiryContents}"/>
    <div class="al-center" style="color:#fff !important; background:#f47d21;padding:10px">답변 달기</div>
    <c:if test="${serviceInquiryEntity.serviceInquiryKey ne null}"> 
      <table class="board-write box-pd">
        <colgroup>
          <col width="150px"/>
          <col width="830px"/>
        </colgroup>
        <tbody>
        <c:forEach items="${serviceInquiryEntity.serviceInquiryAnswerList }" var="serviceInquiryAnswerList" varStatus="i"> 
          <tr>
            <th>답변 제목</th>
            <td>
              ${serviceInquiryAnswerList.answerTitle }
            </td>
          </tr>
           <tr>
            <th>답변 내용</th>
            <td>
              ${fn:replace(serviceInquiryAnswerList.answerContents , newLineChar, '<br/>')}
            </td>
           </tr>
           <tr>
            <th>처리자</th>
            <td>
            <c:if test="${serviceInquiryEntity.serviceInquiryKey eq null }">
            ${adminLoginSession.adminName}
           </c:if>
           <c:if test="${serviceInquiryEntity.serviceInquiryKey > 0 }">
             ${serviceInquiryAnswerList.answerInsertName}
           </c:if> 
            </td>
           </tr> 
           <c:if test="${serviceInquiryEntity.serviceInquiryAnswerList.size() - 1 > i.index}">
           <tr><td height="10" colspan="2"></td>
           </c:if>
<%--            <c:if test="${serviceInquiryEntity.serviceInquiryKey > 0 }">
           <th></th>
           </c:if>  --%>
           </tr>
           </c:forEach>
        </tbody>
      </table>
    </c:if>
    <br/> 
     <table class="board-write box-pd answerForm" <c:if test="${serviceInquiryEntity.serviceInquiryAnswerList.size() > 0}"> style="display:none"</c:if>>
      <colgroup>
        <col width="150px"/>
        <col width="830px"/>
      </colgroup>
      <tbody>
        <tr>
          <th>답변 제목</th>
          <td>
           <input type="text" name="answerTitle" class="inp-w800" value=""data-flag="off"/>
          </td>
        </tr>
         <tr>
          <th>답변 내용</th>
          <td>
           <textarea rows="5" cols="100" name="answerContents" class="txt-w800"data-flag="off"></textarea>
          </td>
         </tr>
         <tr>
          <th>처리자</th>
          <td>
           <c:if test="${serviceInquiryEntity.serviceInquiryKey eq null }">
          <input type="text" name="answerInsertName" class="inp-w800" value="${serviceInquiryAnswerList.answerInsertName}" readonly="readonly" data-flag="off"/>
         </c:if>
         <c:if test="${serviceInquiryEntity.serviceInquiryKey > 0 }">
          <input type="text" class="inp-w800 " name="answerInsertName" value="${adminLoginSession.adminName}" readonly="readonly" data-flag="off"/>
         </c:if>
          </td>
         </tr> 
      </tbody>
    </table>
    <div class="btn-area">
      <a href="${contextPath}/admin/customer/serviceInquiryList" class="floatL btn-bottom-orenge">목록</a>
       <c:if test="${serviceInquiryEntity.serviceInquiryAnswerList.size() > 0}">
       <div class="floatR btn-bottom-orenge addAnswerFormBtn">답변추가</div>
       <div class="floatR btn-bottom-orenge submitBtn" id="answer" data-action="${contextPath}/${CommonCode.submitAction}" data-msg="${CommonCode.submitType }" style="display: none">${CommonCode.submitType }</div>
       </c:if>
         <c:if test="${serviceInquiryEntity.serviceInquiryAnswerList.size() eq 0}" >
       <div class="floatR btn-bottom-orenge submitBtn" data-action="${contextPath}/${CommonCode.submitAction}" data-msg="${CommonCode.submitType }">${CommonCode.submitType }</div>
       </c:if> 
    </div>
  </form>
</div>
<script>
$(function(){
     $( document ).ready( function() {
      $(".addAnswerFormBtn").click( function() {
              $(".answerForm").show();
              $(".addAnswerFormBtn").hide();
              $("#answer").show();
            } );
          } ); 
          } ); 
</script>
