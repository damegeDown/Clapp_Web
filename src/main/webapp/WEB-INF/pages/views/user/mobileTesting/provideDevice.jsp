<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="dgPageNav" uri="/WEB-INF/tlds/PageNavigation.tld" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<script>
$(function() {
	$('.btnSort').click(function(e) {
		var searchKey = $(this).data('type');
		var searchKey1 = $(this).data('order') == 'asc' ? 'desc' : 'asc';
		$('#inputSortType').val(searchKey);
		$('#inputSortOrder').val(searchKey1);
		
		$('#searchForm').submit();
	});
});
</script>
  <body>
    <c:if test='${var eq "testingDevice"}'>
    <div class="subMTDeviceGnbBottomContainer">
      <div class="subMTDeviceGnbBottomBg">
        <div class="subMTDivceGnbBottomBox">
          <div class="subMTDeviceGnbBottom">
            <span class="subMTDeviceTitle">제공 디바이스 <span class="subMTDeviceCount">(총 ${insertDeviceCount }대)</span></span>
          </div>
        </div>
      </div>
    </div>
    </c:if>
    <c:if test='${var eq "autoDevice"}'>
    <div class="subATDeviceGnbBottomContainer">
      <div class="subATDeviceGnbBottomBg">
        <div class="subATDivceGnbBottomBox">
          <div class="subATDeviceGnbBottom">
            <span class="subATDeviceTitle">제공 디바이스 <span class="subATDeviceCount">(총 ${insertDeviceCount }대)</span></span>
          </div>
        </div>
      </div><!-- .subATDeviceGnbBottomBg End -->
    </div><!-- .subATDeviceGnbBottomContainer End -->
    </c:if>
   <form id="searchForm" action="">
    <input type="hidden" id="inputSortType" name="searchKey" value="${deviceEntity.searchKey }"/>
    <input type="hidden" id="inputSortOrder" name="searchKey1" value="${deviceEntity.searchKey1 }"/>
    <div class="subMTDeviceContentOneContainer">
      <div class="subMTDeviceContentOnebox">
        <div class="subMTDeviceCOBTextBox">
          <p class="subMTDeviceCOBText">
                        국내 출시되는 신규 디바이스 및 사용률 분석결과를 토대로 제공해 드리고 있습니다. <br/>
            제공 디바이스는 아래 리스트를 참고해 주시기 바랍니다. ( <a href="${contextPath}/introduction/supportInquire?inquiryCategory=2"><u>디바이스 추가 요청</u></a> ) 
          </p>
        </div>
        <div class="subMTDeviceCOBInputBox">
          <div class="subMTDeviceCOBInputGroup">
            <input class="subMTDeviceCOBInput" type="text" name="searchValue" />
             <input type="image" class="subMTDeviceSearch" src="${contextPath }/resources/images/mt_device_search_icon.png" />
          </div>
        </div>
      </div> <!-- .subContentOneContainer End -->
    </div>
    <div class="subMTDeviceContentTwoContainer">
      <div class="subMTDeviceContentTwobox">
        <div class="subMTDeviceCTBMenuBox">
          <div class="subMTDeviceCTBMenu">
            <span>
              <div class="subMTDeviceCTBMenuModel">
                모델명
                <span class="subMTDeviceCTBMenuDropdown">
                  <span style="cursor:pointer;" class="btnSort" data-type="DEVICE_MODEL_ENAME" data-order="${deviceEntity.searchKey1 }">
                    <c:choose>
                      <c:when test="${deviceEntity.searchKey eq 'DEVICE_MODEL_ENAME' and deviceEntity.searchKey1 eq 'asc' }">
                        <img src="${contextPath }/resources/images/mt_device_dropup.png" />
                      </c:when>
                      <c:otherwise>
                        <img src="${contextPath }/resources/images/mt_device_dropdown.png" />
                      </c:otherwise>
                    </c:choose>
                  </span>
                </span>
              </div><!-- subMTDeviceCTBMenuModel End -->
            </span>
            <span>
              <div class="subMTDeviceCTBMenuMaker">
                제조사
                <span class="subMTDeviceCTBMenuDropdown">
                  <span style="cursor:pointer;" class="btnSort" data-type="DEVICE_MAKER_CODE" data-order="${deviceEntity.searchKey1 }">
                    <c:choose>
	                    <c:when test="${deviceEntity.searchKey eq 'DEVICE_MAKER_CODE' and deviceEntity.searchKey1 eq 'asc' }">
	                      <img src="${contextPath }/resources/images/mt_device_dropup.png" />
	                    </c:when>
	                    <c:otherwise>
	                      <img src="${contextPath }/resources/images/mt_device_dropdown.png" />
	                    </c:otherwise>
                    </c:choose>
                  </span>
                </span>
              </div><!-- .subMTDeviceCTBMenuMaker End -->
            </span>
            <span>
              <div class="subMTDeviceCTBMenuOS">
                OS
                <span class="subMTDeviceCTBMenuDropdown">
                  <span style="cursor:pointer;" class="btnSort" data-type="DEVICE_OS_CODE" data-order="${deviceEntity.searchKey1 }">
                    <c:choose>
                      <c:when test="${deviceEntity.searchKey eq 'DEVICE_OS_CODE' and deviceEntity.searchKey1 eq 'asc' }">
                        <img src="${contextPath }/resources/images/mt_device_dropup.png" />
                      </c:when>
                      <c:otherwise>
                        <img src="${contextPath }/resources/images/mt_device_dropdown.png" />
                      </c:otherwise>
                    </c:choose>
                  </span>
                </span>
              </div><!-- subMTDeviceCTBMenuOS End -->
            </span>
            <div class="subMTDeviceCTBMenuOSVer">
              OS Ver
            </div><!-- .subMTDeviceCTBMenuOSVer End -->
          </div><!-- .subMTDeviceCTBMenu End -->
        </div><!-- .subMTDeviceCTBMenuBox End -->
        
        <!-- provide device List Start -->
        <c:forEach items="${deviceEntity.deviceList }" var="deviceList" varStatus="i">
        <div class="subMTDeviceCTBDeviceListWrap">
          <div class="subMTDeviceCTBDeviceList">
            <div class="subMTDeviceCTBDeviceImgBox">
              <div class="subMTDeviceCTBDeviceImg ">
                <img src="${contextPath}/common/imgView?fileType=${deviceList.fileTarget}&fileName=${deviceList.fileSavedName}" style="max-width:110px;"/>
              </div><!-- .subMTDeviceCTBDeviceImg -->
            </div><!-- .subMTDeviceCTBDeviceImgBox -->
            <div class="subMTDeviceCTBDeviceNameBox">
              <span class="subMTDeviceCTBDeviceName">
                ${deviceList.deviceModelEname}
              </span><!-- .subMTDeviceCTBDeviceName End -->
            </div><!-- .subMTDeviceCTBDeviceNameBox -->
            <div class="subMTDeviceCTBDeviceMakerBox">
              <span class="subMTDeviceCTBDeviceMaker">${deviceList.deviceMakerCode}</span><!-- .subMTDeviceCTBDeviceMaker -->
            </div><!-- .subMTDeviceCTBDeviceMakerBox -->
            <div class="subMTDeviceCTBDeviceOSBox">
              <span class="subMTDeviceCTBDeviceOS">${deviceList.deviceOsCode }</span><!-- .subMTDeviceCTBDeviceOS -->
            </div><!-- .subMTDeviceCTBDeviceOSBox -->
            <div class="subMTDeviceCTBDeviceOSVerBox">
              <span class="subMTDeviceCTBDeviceOSVer">${deviceList.deviceVersion }</span><!-- .subMTDeviceCTBDeviceOSVer End -->
            </div><!-- .subMTDeviceCTBDeviceOSVerBox End -->
          </div><!-- .subMTDeviceCTBDeviceBox -->
        </div>
        </c:forEach>
         <c:if test="${deviceEntity.deviceList.size() < 1 }">
         <div class="subMTDeviceCTBDeviceListWrap">
            <span class="subMTDeviceCTBDeviceOSVer">죄송합니다.<br>  CLAPP에서 제공하지 않는 디바이스 입니다.</span>
         </div>
        </c:if>
        <!-- <div class="subMTDeviceCTBDeviceName"></div> -->
        <br/>
        <br/>
      </div><!--.subMTDeviceContentTwobox End -->
      </div>
    </form>
  </body>