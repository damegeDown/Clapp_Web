<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<script type="text/javascript" src="${contextPath }/resources/js/ticket.js"></script>
<div class="sub-content">
<form id="memberForm" enctype="multipart/form-data">
    <input type="hidden" name="userTicketMasterKey" data-flag="off" value="0"/>
    <input type="hidden" name="userMasterKey" data-flag="off" value="0"/>
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
      <tr class="trUserId" >
        <th>대상 회원 ID</th>
        <td>
          <p class="serviceTargetRow" style="margin-top:5px">
          <label><input type="radio" class="inp-w40 serviceTargetType" name="serviceTargetType" value="1" /> 전체 (member_all)</label>
          </p>
          <p class="serviceTargetRow" style="margin-top:5px">
          <label><input type="radio" class="inp-w40 serviceTargetType" name="serviceTargetType" value="2" /> 일반 전체 (person_all)</label>
          </p>
          <p style="margin-top:5px">
          <label><input type="radio" class="inp-w40 serviceTargetType" name="serviceTargetType" value="3" /> 기업/단체 전체 (company_all)</label>
          </p>
          <p style="margin-top:5px">
          <label><input type="radio" class="inp-w40 serviceTargetType" name="serviceTargetType" value="4" checked/> 개별 계정 (개별 회원 또는 별도 계약건)</label>
          </p>  
          <div class="addUser">
            <input type="text" style="margin-left: 18px;"class="inp-w360 inactiveMode"  readonly name="userIdArr" value="" placeholder="정확한 이메일주소를 입력해 주세요. 예) aaaaa@aa.co.kr" data-id="1"/>
            <input type="button" class="btn searchUserIdBtn" value="검색"/><input type="button" class="btn addUserIdBtn" value="+" style="display: none"/>
          </div>
      </tr>
      <tr class="targetName">
        <th>이름, 기업/단체명</th>
        <td>
	        <input type="hidden" name="contractMasterKey" class="contractMasterKey" data-flag="off">
          <input type="text" class="inp-w450 inactiveMode" name="serviceTargetName" placeholder="개별 계정에 부여할 때만 입력 ( 전체, 일반 전체, 기업/단체 전체는 자동 입력됨 )" />
        </td>
      </tr>
      <tr class="productName">
        <th>적용상품명</th>
        <td>
           <p><label><input type="radio" class="inp-w40 serviceUpdateType" name="serviceUpdateType" value="1" /> 신규</label>
            <label><input type="radio" class="inp-w40 serviceUpdateType" name="serviceUpdateType" value="2" /> 기존상품 수정</label></p>
            <div class="appendTo">
                <div class="ticketRestType"  id="restNew" style="display:none">
                    <select class="sel-w180" name="productMasterKey" >
                        <c:forEach items="${productInfo.productList }" var="code">
                            <option value="${code.productMasterKey }" data-applyDate="${code.productExpirationDate }" >${code.productName }</option>
                        </c:forEach>
                    </select>
                    &nbsp;&nbsp;사용자 단에 노출될 상품명 (별도 계약건에 한함)
                </div>
                <div class="ticketRestType" id="restUpdate" style="display:none">
                    <div id="serviceProductName">
                        <select name="serviceProductSelect" class="serviceProductName">
                            <option value="">선택</option>
                        </select>
                    </div>
                </div>
            </div>
            <input type="text" name="serviceProductName" class="inactiveMode" readonly/>
            <input type="hidden" name="serviceRestType" />
        </td>
     </tr>
     <tr>
       <th>계정당 적용시간</th>
        <td>
            <input type="text" class="inp-w160 serviceApplyTicketAmount_" name="serviceApplyTicketAmount_" placeholder="숫자만 입력"/>&nbsp;&nbsp;분 ( 반드시 1계정당 적용할 시간을 입력해 주세요. 5분 단위로만 적립/차감이 가능합니다. )
            <input type="hidden" class="inp-w160 serviceApplyTicketAmount" name="serviceApplyTicketAmount" placeholder="숫자만 입력"/>
        </td>
     </tr>
     <tr>  
	 	   <th>상품종료일자 지정</th>
	 	   <td><input type="text" class="inactiveMode datetimepicker" name="ticketStartExpirationDate" /> ~ <input type="text" name="ticketEndExpirationDate" class="inactiveMode datetimepicker"/></td>
	 </tr>
     <tr>
       <th>적용사유</th>
       <td>
           <select class="sel-w70" name="serviceApplyReason" onchange="reasonChange(this)">
             <option value="">선택</option>
             <c:forEach items="${serviceApplyReasonCode}" var="code">
                 <c:if test="${code.commonCode < 7}">
                    <option value="${code.commonCode }">${code.commonName }</option>
                 </c:if>
             </c:forEach>
           </select>
           <span style="display:none"><input type="text" style="width:600px" name="serviceApplyReasonDetail" maxlength="50" data-flag="off"></span>
       </td>
     </tr>
     <tr>
       <th>적용 담당자</th>
       <td>
       <input type="text" class="inp-w160 " name="serviceApplyOperatorName" value="${adminLoginSession.adminName} "/>
       </td>
     </tr>
    </tbody>
  </table>
  <div class="btn-area">
    <a href="${contextPath}/admin/ticket/ticketProductServiceList" class="floatL btn-bottom-orenge">목록</a>
    <div class="floatR btn-bottom-orenge submitBtn" data-action="${contextPath}/${CommonCode.submitAction}" data-msg="${CommonCode.submitType }">${CommonCode.submitType }</div>
  </div>
  </form>
</div>
<!-- 회원 검색 팝업 -->
<%@ include file="/WEB-INF/pages/views/popup/popupSearchUserId.jsp"%>
<script>
    //적용상품명 클릭시 상품 시작일 종료일 표시
    $(".serviceProductName").change(function (){
        var utMasterKey = $(".serviceProductName option:selected").val();
        $("input[name=userTicketMasterKey]").val(utMasterKey);
        $.ajax({
            url: "/admin/member/rest/selectProductList",
            type: "post",
            dataType: "json",
            data: {userTicketMasterKey: utMasterKey},
            success: function (data) {
                var dataLen = data.dataList.length;

                if (dataLen > 0) {
                    for (var i = 0; i < dataLen; i++) {
                        $("input[name=ticketStartExpirationDate]").val(data.dataList[i].ticketStartDate);
                        $("input[name=ticketEndExpirationDate]").val(data.dataList[i].ticketEndDate);
                        $("input[name=serviceProductName]").val(data.dataList[i].productName);
                    }
                }
            }
        });
    });
    //시간 입력 후 포커스 아웃시 실 DB 에 입력할 값을 티켓단위로 변경
    $("input[name=serviceApplyTicketAmount_]")
            .focusout(function() {
                var ticket = Number(5);
                var ticketAmount = Number($(this).val());
                var applyTicketAmount = ticketAmount / ticket;
                $("input[name=serviceApplyTicketAmount]").val(applyTicketAmount);
            });


  $(function() {
    var companyName = '${companyNameList}';
    companyName = companyName.replace("[", "").replace("]","").split(",");
    var tagsArr = [];
    for(var i = 0; i < companyName.length; i++) {
      tagsArr.push(companyName[i].trim());
    }
    var availableTags = tagsArr;
    $( "#tags" ).autocomplete({
      source: availableTags
    });
  });
  $(function() {
    //회원 아이디 함수
    $.fn.Common.init();
    $.fn.ticketProductServiceForm.init();
    
    $("select[name=productMasterKey]").change(function() {
		var productName = $(this).find("option[value="+$(this).val()+"]").text();
		var applyDate = $(this).find("option[value="+$(this).val()+"]").attr("data-applyDate");
		$("input[name=serviceProductName]").val(productName);
		$("input[name=expirationDate]").val(applyDate);
		setDate(applyDate);
	});
  	$("input[name=contractExpirationDate]").change(function() {
		setDate($(this).val());
	});
  });
	var setDate = function(addDate) {
		console.log(addDate);
		var dt = new Date();
		// Display the month, day, and year. getMonth() returns a 0-based number.
		dt.setDate(Number(dt.getDate())+ Number(addDate));
		
		var month = dt.getMonth()+1;
		var day = dt.getDate();
		var year = dt.getFullYear();
		console.log(year+'/' +month+ '/' +day);  
	}
    var reasonChange = function(_this) {
        if($(_this).val() == 6) {
            $("input[name=serviceApplyReasonDetail]").parents("span").show();
        } else {
            $("input[name=serviceApplyReasonDetail]").parents("span").hide();
        }
    }
	$('.serviceTargetType').on('change',function() {
	  var serviceTargetTypeVal = $(this, '.serviceTargetType').val();
	  if(serviceTargetTypeVal > 3) {
		  $('.inactiveMode').attr("disabled", false).val('');
		  $('.inactiveMode').attr("data-flag", "on");
	  } else {
		  $('.inactiveMode').attr("disabled", true).val('');
		  $('.inactiveMode').attr("data-flag", "off");
	  }
  });
  $('.searchUserIdBtn').on('click',function() {
	  $('.addUserIdBtn').show();
  });
    var removeObj;
    //3 tab
    $(function(){
        $( "input[name=serviceUpdateType]" ).click( function() {

            if(removeObj){
                removeObj.appendTo(".appendTo");
                if ($(this).val() == 2) {
                    removeObj = $("#restNew").detach();
                    $("input[name=serviceRestType]").val("restUpdate");
                } else {
                    removeObj = $("#restUpdate").detach();
                    $("input[name=serviceRestType]").val("restNew");
                }
//                removeObj=null;
            }else {
                $(".ticketRestType").show();
                if ($(this).val() == 2) {
                    removeObj = $("#restNew").detach();
                    $("input[name=serviceRestType]").val("restUpdate");
                } else {
                    removeObj = $("#restUpdate").detach();
                    $("input[name=serviceRestType]").val("restNew");
                }
            }

        });
    });
</script>