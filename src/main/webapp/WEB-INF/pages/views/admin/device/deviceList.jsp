<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="dgPageNav" uri="/WEB-INF/tlds/PageNavigation.tld" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<script type="text/javascript" src="${contextPath }/resources/js/device.js"></script>
<div class="sub-content">
  <div>
    <h3 class="contents-title floatL">${CommonCode.navigation } 제공디바이스 ( 총 : <span class="colorSkyBlue">${insertDeviceCount}</span> 대 )</h3> 
    <div style="clear:both;"></div>
    <div style="width:100%;">
		<h3 class="floatL part-title">> 대표 디바이스 <span class="colorSkyBlue">11</span>개 : 사이트 메인, 모바일 테스팅, 테스트 자동화 화면에 노출</h3>
	</div>
    <table class="board-list">
      <colgroup>
        <col width="5%"/>
        <col width="5%"/>
        <col width="5%"/>
        <col width="20%"/> 
        <col width="20%"/> 
        <col width="10%"/> 
        <col width="10%"/> 
        <col width="10%"/>  
        <col width="10%"/> 
        <col width="10%"/> 
      </colgroup>
      <thead>
        <tr>
          <th>위치</th>
          <th>선택</th>
          <th>노출 순번</th>
          <th>모델명 (영문명)</th>
          <th>모델명 (한글명)</th>
          <th>제조사</th>
          <th>OS</th>
          <th>버전</th>
          <th>등록일시</th>
          <th>대표 비노출</th>
        </tr>
      </thead>
      <tbody>
        <input type="hidden" name="topDeviceCount" class="topDeviceCount" value="${deviceEntity.deviceSelectedList.size()}"/>
        <c:forEach items="${deviceEntity.deviceSelectedList }" var="deviceSelected" varStatus="j">
        <tr>
        	<td>
            <span class="pointer btnChangeSeq" data-seq="up">
           	 <img src="${contextPath }/resources/img/device_dropup.png" />
            </span>
            <span class="pointer btnChangeSeq" data-seq="down">
            	<img src="${contextPath }/resources/img/device_dropdown.png" />
            </span>
        	</td>
          <td>
          	<input type="hidden" name="deviceKey" class="deviceKey" value="${deviceSelected.deviceKey }" data-index="${j.index }"/>
          	<input type="checkbox" name="deviceKeyArr" class="chk" value="${deviceSelected.deviceKey }">
          </td>
          <td>${j.index+1}
          </td>
          <td class="deviceModelEname pointer" data-key="${deviceSelected.deviceKey }">${deviceSelected.deviceModelEname}</td>
          <td>${deviceSelected.deviceModelKname}</td>
          <td>${deviceSelected.deviceMakerCode }</td>
          <td>${deviceSelected.deviceOsCode }</td>
          <td>${deviceSelected.deviceVersion }</td> 
          <td><fmt:formatDate pattern="yyyy/MM/dd HH:mm" value="${deviceSelected.deviceInsertDate }" /></td>
          <td class="removeUnitDevice" data-key="${deviceSelected.deviceKey }"><a href="#" class="btnSmall-bottom-gray">비노출</a></td> 
        </tr>
        </c:forEach>
        <c:if test="${deviceEntity.deviceSelectedList.size() < 1 }">
          <tr>
           <td colspan="9">+++노출된 대표 디바이스가 없습니다.+++</td>
          </tr> 
        </c:if>
      </tbody>
    </table>
    <div style="margin-top:10px">
      <a href="#" id="deviceTop10Close" class="floatL btn-bottom-orenge"><span>선택한 디바이스 대표 비노출</span></a>
      <a href="#" id="deviceTop10Save" class="floatR btn-bottom-orenge">저장</a>
    </div>
  </div>
  <div style="clear:both;"></div>
  <div style="margin-top:20px">
    <div class="search-box">
      <form id="searchForm" action="">
        <div class="marT-5">
          <span class="span-w80">모델명</span>
          <input type="text" class="inp-w300" name="searchValue" value="${deviceEntity.searchValue }" placeholder="영문은 대/소문자 구분 없음, 한글로 갤럭시로 검색 가능"/>
          <span class="marL-15 span-w60">제조사</span>
          <select name="searchValue1">
            <option value="">전체</option>
              <c:forEach items="${deviceMakerCodeNum }" var="code">
            <option value="${code.commonCode }" <c:if test="${deviceEntity.searchValue1 eq code.commonCode }">selected</c:if>>${code.commonName }</option>
          </c:forEach>
          </select>
          <div class="marT-5">
            <span class="span-w80">OS</span>
            <select name="searchValue2">
              <option value="">전체</option>
                <c:forEach items="${deviceOsCodeNum }" var="code">
              <option value="${code.commonCode }" <c:if test="${deviceEntity.searchValue2 eq code.commonCode }">selected</c:if>>${code.commonName }</option>
            </c:forEach>
            </select>
            <span class="marL-15 span-w30">버전</span>
            <input type="text" class="inp-w300" name="searchValue3" value="" placeholder="정확히 입력요망 (예 : 4.4.2)"/>
            <span class="marL-15 span-w50"></span>
            <input type="submit" class="btn" value="검색"/>
            <input type="reset" class="btn" value="초기화"/>
          </div>
        </div>
        <div style="clear:both"></div>
    </div>
    <div style="clear:both"></div>
    <div style="margin:5px; color:red">※ 한글 모델명은 단어 검색의 편의상 관리자가 입력한 정보로, 실제 사용자 단에는 노출되지 않습니다.</div>
    <div style="margin:5px; color:red">※ 디바이스에 따른 이미지는 상세 보기 화면에서 제공합니다.</div>
      <div style="border-top:2px dotted #999;margin-bottom:30px"></div>
    <div style="width:100%;">
      <h3 class="floatL part-title">> 검색결과 <span class="colorSkyBlue">${deviceEntity.dataSize }</span>  건</h3>
      <div class=" floatR">
        <select class="deviceSort" name="deviceSort">
          <c:forEach items="${deviceSortCode }" var="code">
           <option value="${code.commonCode }" <c:if test="${deviceEntity.deviceSort eq code.commonCode }">selected</c:if>>${code.commonName }</option>
          </c:forEach>
        </select>
          <select class="sel-w100 sortListSize" name="sortListSize">
            <c:forEach items="${sortListSizeCode }" var="code">
            <option value="${code.commonCode }" <c:if test="${deviceEntity.sortListSize eq code.commonCode }">selected</c:if>>${code.commonName }</option>
            </c:forEach>
          </select>
      </div>
    </div>
    </form>
    <table class="board-list">
      <%-- <colgroup>
        <col width="100px"/>
        <col width="780px"/>
        <col width="100px"/>
      </colgroup> --%>
      <thead>
      <tr>
        <th>선택</th>
        <th>No</th>
        <th>모델명 (영문명)</th>
        <th>모델명 (한글명)</th>
        <th>제조사</th>
        <th>OS</th>
        <th>버전</th>
        <th>등록일시</th>
        <th>수정/삭제</th>
      </tr>
      </thead>
      <tbody>
        <c:forEach items="${deviceEntity.deviceList }" var="deviceList" varStatus="i">
        <tr>
          <td><input type="hidden" name="deviceTop10Open" value="${deviceList.deviceTop10Open}"/>
          <input type="checkbox" name="deviceKeyArr" class="chk" value="${deviceList.deviceKey }"></td>
          <td>${deviceEntity.dataSize-(deviceEntity.pageListSize*(deviceEntity.currentPage-1))-i.index}</td>
          <td style="cursor:pointer" class="deviceModelEname" data-key="${deviceList.deviceKey }">${deviceList.deviceModelEname}</td>
          <td>${deviceList.deviceModelKname}</td>
          <td>${deviceList.deviceMakerCode}</td>
          <td>${deviceList.deviceOsCode }</td>
          <td>${deviceList.deviceVersion }</td> 
          <td><fmt:formatDate pattern="yyyy/MM/dd HH:mm" value="${deviceList.deviceInsertDate }" /></td>
          <td class="removeDevice" data-id="${deviceList.deviceKey }"><a href="#" class="btnSmall-bottom-gray">삭제</a></td> 
        </tr>
        </c:forEach>
        <c:if test="${deviceEntity.deviceList.size() < 1 }">
          <tr>
            <td colspan="9">+++조회된 내용이 없습니다.+++</td>
          </tr> 
        </c:if>
      </tbody>
    </table>
    <div class="btn-area">
      <a href="#" id="deviceTop10Open" class="floatL btn-bottom-orenge"><span>선택한 디바이스 대표 노출</span></a> 
      <a href="${contextPath }/admin/device/deviceDetail" class="floatR btn-bottom-orenge">등록</a>
    </div>
    <div class="paging-area">
     <dgPageNav:PageNavigation pageParamName="currentPage" linkUrl="${contextPath}/admin/device/deviceList" pageNavigationEntity="${deviceEntity}" />
    </div>  
  </div>
</div>
<script>
  $(function() {
    $.fn.DeviceList.init();
  });
</script>