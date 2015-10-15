<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="dgPageNav" uri="/WEB-INF/tlds/PageNavigation.tld" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<div class="subJoinGnbBottomContainer">
		<div class="subJoinGnbBottomBg">
			<div class="subJoinGnbBottomBox">
				<div class="subJoinGnbBottom">
					<span class="subJoinTitle">결제</span>
				</div>
				<div class="subStartBox">
					<a href="#"><img src="${contextPath }/resources/images/gnb_start.png" onclick="JnlpUtils.startTest()" onmouseover="this.src='${contextPath }/resources/images/gnb_start_r.png';" onMouseOut="this.src='${contextPath }/resources/images/gnb_start.png';" alt="시작하기" /></a>
				</div>
			</div>
		</div>
	</div>
</div> <!-- .subGnbContainer End -->
<form id="LGD_PAYINFO" name="LGD_PAYINFO" method="POST">
	<!-- LGD Pay Form Parameter Setting -->
<%@ include file="/WEB-INF/pages/views/user/myClapp/inc/incPayFormParam.jsp"%> 
<%--<fmt:formatNumber var="totalAmount" pattern="#####" value="${productInfo.productPrice + (productInfo.productPrice * 0.1)}"/>--%>
    <%--부가세 폐지--%>
<fmt:formatNumber var="totalAmount" pattern="#####" value="${productInfo.productPrice}"/>
<input type="hidden" name="LGD_AMOUNT" id="LGD_AMOUNT" value="${totalAmount }">
<input type="hidden" name="paymentUseTime" value="${productInfo.productUseTime}"/>
<input type="hidden" name="paymentTicketAmount" value="${productInfo.productTicketAmount }"/>
<input type="hidden" name="paymentProductPrice" value="${totalAmount }"/>
<input type="hidden" name="userMasterKey" value="${userInfo.userMasterKey }"/>
<input type="hidden" name="productMasterKey" value="${productInfo.productMasterKey }"/>
<input type="hidden" name="paymentUserId" value="${userInfo.userId}"/>
<input type="hidden" name="productExpirationDate" value="${productInfo.productExpirationDate}"/>
<input type="hidden" name="LGD_DISPLAY_BUYEREMAIL"      id="LGD_DISPLAY_BUYEREMAIL"  value="N">                                 <!--가상계좌 이메일 결과 송신 방지-->
<div class="subPayForm">
	<div class="subPayFormSection">
		<div class="subJoinFormRequiredTitleBox">
			<div class="subJoinFormRequiredTitleLine"></div>
			<h3 class="subJoinFormRequiredTitle">결제 정보</h3>
		</div>
		<div class="paymentsProduct">
			<table class="paymentsPrTable">
				<colgroup>
					<col width="*"/>
					<col width="15%"/>
					<col width="15%"/>
					<col width="15%"/>
					<col width="15%"/>
				</colgroup>
				<tr>
					<th>상품명</th>
					<th>상품금액</th>
					<%--<th>부가가치세 (vat)</th>--%>
					<th>할인금액</th>
					<th>결제금액</th>
				</tr> 
				<tr> 
					<td class="td prName">
			          <div class="prMP" style="width:20px">
						<c:if test="${productInfo.productMasterKey > 15 && productInfo.productMasterKey <= 24 }">
							<span class="prMinus"><a href="javascript:PaymentUtils.changeProduct(${productInfo.productMasterKey}-1)"><img src="${contextPath }/resources/images/guide_payment_minus.png" alt="minus" /></a></span>
						</c:if>
					  </div>
					  <div class="prMP" style="width:150px">
							${productInfo.productName }
					  </div>
					  <div class="prMP2"  style="width:20px">
						<c:if test="${productInfo.productMasterKey >=15 && productInfo.productMasterKey < 24 }">
							<span class="prPlus"><a href="javascript:PaymentUtils.changeProduct(${productInfo.productMasterKey}+1)"><img src="${contextPath }/resources/images/guide_payment_plus.png" alt="plus" /></a></span>
			            </c:if>
					  </div>
					</td>
					<td class="td">
                        <c:if test="${productInfo.productMasterKey >=15 && productInfo.productMasterKey <= 18 }">
                            &#8361;<fmt:formatNumber value="${productInfo.productPrice}" />
                        </c:if>
                        <c:if test="${productInfo.productMasterKey >=19 && productInfo.productMasterKey <= 23 }">
                            &#8361;<fmt:formatNumber value="${(productInfo.productPrice) + 11550 }" />
                        </c:if>
                        <c:if test="${productInfo.productMasterKey == 24 }">
                            &#8361;<fmt:formatNumber value="${(productInfo.productPrice) + 38500 }" />
                        </c:if>

                        <c:if test="${productInfo.productMasterKey >= 25 }">
                            &#8361;<fmt:formatNumber value="${productInfo.productPrice}" />
                        </c:if>
					<%--<td class="td"> &#8361;<fmt:formatNumber value="${productInfo.productPrice * 0.1 }" />--%>
					</td>
					<td class="td">
                        <c:if test="${productInfo.productMasterKey >=15 && productInfo.productMasterKey <= 18 }">
                            &#8361;0
                        </c:if>
                        <c:if test="${productInfo.productMasterKey >=19 && productInfo.productMasterKey <= 23 }">
                            &#8361;<fmt:formatNumber value="11550" />
                        </c:if>
                        <c:if test="${productInfo.productMasterKey == 24 }">
                            &#8361;<fmt:formatNumber value="38500" />
                        </c:if>
                        <c:if test="${productInfo.productMasterKey >= 25 }">
                            &#8361;<fmt:formatNumber value="0" />
                        </c:if>
						<%--<div class="prMGroup">--%>
							<%--<c:if test="${productInfo.productMasterKey == 2 }">--%>
							<%--<div class="prMP">--%>
								<%--<span class="prMinus"><a href="javascript:PaymentUtils.modifyTime('doMinus()')"><img src="${contextPath }/resources/images/guide_payment_minus.png" alt="minus" /></a></span>--%>
							<%--</div>--%>
							<%--</c:if>--%>
							<%--<div class="prTB">--%>
								<%--<span class="prTime">${productInfo.productUseTime}</span>시간<br />(<span class="prTicketNum">${productInfo.productTicketAmount }</span>티켓 제공)--%>
							<%--</div>--%>
							<%--<c:if test="${productInfo.productMasterKey == 2 }">--%>
							<%--<div class="prMP2">--%>
								<%--<span class="prPlus"><a href="javascript:PaymentUtils.modifyTime('doPlus()')"><img src="${contextPath }/resources/images/guide_payment_plus.png" alt="plus" /></a></span>--%>
							<%--</div>--%>
							<%--</c:if>--%>
						<%--</div>--%>
					</td>
					<td class="td totalPrice">&#8361; <span class="totalPriceNum"><fmt:formatNumber value="${productInfo.productPrice}" /></span></td>
				</tr>
			</table>
		</div>
        <div class="subJoinFormRequiredTextBox">
            <p class="subJoinFormRequiredText"> - VAT가 포함된 금액입니다. <br>- 10시간 이상 구매하실 분은 상품을 다시 선택 하신 후 결제 해주시기 바랍니다.<br>- 클앱 멤버십 금액은 1일 5시간 사용 기준입니다. </p>
        </div>

    </div>
	<div class="clear"></div>
	<div class="payUserinfo">
		<div class="payUserinfoBox">
			<div class="subJoinFormRequiredTitleBox">
				<div class="subJoinFormRequiredTitleLine"></div>
				<h3 class="subJoinFormRequiredTitle">구매자 정보</h3>
			</div>

			<div class="payUserInfoSec1">
				<div class="puISLeft">
					<span class="puiSLTitle">아이디</span>
				</div>
				<div class="puISRight">
					<span class="puISID">${userInfo.userId}</span>
				</div>
			</div>
			<div class="payUserInfoSec1">
				<div class="puISLeft">
					<span class="puiSLTitle">이름</span>
				</div>
				<div class="puISRight">
					<input type="text" name="puname" class="puISname" value="${userInfo.userName}" />
				</div>
			</div>
			<div class="payUserInfoSec2">
				<div class="puISLeft">
					<span class="puiSLTitle">휴대폰</span>
				</div>
				<div class="puISRight">
					<div class="smisSubBox4">
						 <c:set var="cellPhone" value="${fn:split(userInfo.userCellPhoneNumber,'-')}"/>
				          <select class="smisSelectPhone phoneNum" name="cellPhone1">
				            <option value="0">-선택-</option>
				            <c:forEach items="${cellPhoneCode }" var="code">
				              <option value="${code.commonCode }" <c:if test="${cellPhone[0] eq code.commonCode }">selected</c:if>>${code.commonName }</option>
				            </c:forEach>
				          </select>
				          <span class="simsTelLine1"></span>
				          <input type="text" class="inp-w60 simsTelInput1 phoneNum" name="cellPhone2" value="${cellPhone[1]}" data-name="휴대폰번호" maxlength="4"/>
				          <span class="simsTelLine2"></span> 
				          <input type="text" class="inp-w60 simsTelInput2 phoneNum" name="cellPhone3" value="${cellPhone[2]}" data-name="휴대폰번호" maxlength="4"/>
				          <input type="hidden" class="phoneNumComp" name="userCellPhoneNumber" value="${userInfo.userCellPhoneNumber}"/>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="payMethodSelect">
		<div class="payMethodSelectBox">
			<div class="subJoinFormRequiredTitleBox">
				<div class="subJoinFormRequiredTitleLine"></div> 
				<h3 class="subJoinFormRequiredTitle">결제 수단 선택</h3>
			</div>
			<div class="paymentMethod">
				<div class="paymentMethodRadio">
					<input id="creditcard" class="pMthRadio cd" type="radio" name="LGD_CUSTOM_USABLEPAY" value="SC0010" checked>
					<label class="telLable" for="creditcard">신용카드</label>
					<!-- <input id="mobilepay" class="pMthRadio cm" type="radio" name="LGD_CUSTOM_USABLEPAY" value="SC0060">
					<label class="telLable" for="mobilepay">휴대폰</label> -->
					<input id="bank" class="pMthRadio cb" type="radio" name="LGD_CUSTOM_USABLEPAY" value="SC0040">
					<label class="telLable" for="bank">가상 계좌 입금</label>

                    <%--<input id="moo" class="pMthRadio cb" type="radio" name="LGD_CUSTOM_USABLEPAY" value="SC9999" onclick="$('#notTJ').css('display','');">--%>
                    <%--<label class="telLable" for="moo">무통장입금</label>--%>
				</div>
				
				<p class="payMessage">
					실행되는 보안 플러그인은 암호화 처리되어 안전합니다.
				</p>
                <div class="payMtdBank" style="display: none;" id="notTJ">
                    <div class="payMTDB">
                        <div class="payMTDBLeft">
                            <p class="payMTDBInfo"><span style="color: rgb(51, 115, 185);"><b>입금 계좌</b></span> 기업은행 390-028048-04-011 (주)메디오피아테크 </p>
                        </div>
                    </div>
                </div>

                <div class="payMtdBank" style="display: none;">
					<div class="payMTDB">
						<div class="payMTDBLeft">
							<span class="payMTDBInfo">입금은행</span>
						</div>
						<div class="payMTDBRight">
							<select class="bankAccount">
								<option value="국민은행 111-1111111-111 (CLAPP)">국민은행 111-1111111-111 (CLAPP)</option>
								<option value="국민은행 111-1111111-111 (CLAPP)">국민은행 111-1111111-111 (CLAPP)</option>
								<option value="국민은행 111-1111111-111 (CLAPP)">국민은행 111-1111111-111 (CLAPP)</option>
								<option value="국민은행 111-1111111-111 (CLAPP)">국민은행 111-1111111-111 (CLAPP)</option>
							</select>
						</div>
					</div>
					<div class="payMTDB">
						<div class="payMTDBLeft">
							<span class="payMTDBInfo">입금자명</span>
						</div>
						<div class="payMTDBRight">
							<input type="text" name="payuserbname" class="payBUserName" />
						</div>
					</div>
					<div class="payMTDB">
						<div class="payMTDBLeft">
							<span class="payMTDBInfo">현금영수증</span>
						</div>
						<div class="payMTDBRight">
							<div class="paymentMethodRadio2">
								<input id="agree" class="pMthRadio" type="radio" name="receipt" value="agree">
								<label class="telLable" for="agree">발급</label>
								<input id="disagree" class="pMthRadio" type="radio" name="receipt" value="disagree" checked>
								<label class="telLable" for="disagree">미발급</label>
							</div>
						</div>
					</div>
					<div class="payMTDB">
						<div class="payMTDBLeft">
							<span class="payMTDBInfo">주민등록 또는 휴대폰 번호<br />(사업자 등록번호)</span>
						</div>
						<div class="payMTDBRight">
							<div class="paymentMethodRadio2">
								<input id="earning" class="pMthRadio" type="radio" name="receipt2" value="earning" checked>
								<label class="telLable" for="earning">소득공제용</label>
								<input id="expenditure" class="pMthRadio" type="radio" name="receipt2" value="expenditure">
								<label class="telLable" for="expenditure">지출증빙용</label>
							</div>
						</div>
					</div>
					<div class="payMTDB">
						<div class="payMTDBLeft">

						</div>
						<div class="payMTDBRight">
							<input type="text" name="payuserbname" class="payBUserName" placeholder="&#34;-&#34;를 뺀 숫자만 입력하세요"/>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div> <!-- .subJoinFormIndividual End -->

<div class="subJoinTermsPrivacyNextContainer">
	<div class="subJoinTermsPrivacyNextButtonBox2">
			<img src="${contextPath }/resources/images/buttons_payment.png" onclick="PaymentOK()" onMouseOver="this.src='${contextPath }/resources/images/buttons_payment_r.png';" onMouseOut="this.src='${contextPath }/resources/images/buttons_payment.png';" alt="결제" />
		<a href="${contextPath }/product/productList">
			<img src="${contextPath }/resources/images/buttons_cancel.png" onMouseOver="this.src='${contextPath }/resources/images/buttons_cancel_r.png'" onMouseOut="this.src='${contextPath }/resources/images/buttons_cancel.png';"  alt="취소" />
		</a>
	</div>
</div>

</form>
<!--  UTF-8 인코딩 사용 시는 xpay.js 대신 xpay_utf-8.js 을  호출하시기 바랍니다.-->
<script type="text/javascript" src="//xpay.uplus.co.kr<%="test".equals("${payLgdInfo.CST_PLATFORM}")?(request.getScheme().equals("https")?":7443":":7080"):""%>/xpay/js/xpay_utf-8.js"></script>
<script>
function PaymentOK(){

    var isChecked = $('input[name="LGD_CUSTOM_USABLEPAY"]:checked').val();
    if(isChecked=="SC9999"){
        $(location).attr('href','${contextPath }/introduction/supportInquire');
    }else {
        var aaa = PaymentUtils.doPayment();
    }
}
var PaymentUtils = (function() {



    "use strict";
    var useTime = 0;
    var ticketAmount = 0;
    var totalPrice = 0;
    //사용시간 변경시
    var modifyTime = function(type) {
        this.useTime = $(".prTime").text().replace(/,/gi, '');
        this.ticketAmount = $(".prTicketNum").text().replace(/,/gi, '');
        this.totalPrice = $(".totalPriceNum").text().replace(/,/gi, '');
        eval(type);
    };
    var doPlus = function() {
        PaymentUtils.useTime  = Number(PaymentUtils.useTime) + 1 ;
        PaymentUtils.ticketAmount = Number(PaymentUtils.ticketAmount) + (PaymentUtils.ticketAmount / (PaymentUtils.useTime - 1));
        PaymentUtils.totalPrice = Number(PaymentUtils.totalPrice) + (PaymentUtils.totalPrice / (PaymentUtils.useTime - 1));
        if(PaymentUtils.useTime > 4) {
            PaymentUtils.changeProduct(3);
        }
        setTime();
    };
    var doMinus = function() {
        PaymentUtils.useTime  = Number(PaymentUtils.useTime) - 1 ;
        PaymentUtils.ticketAmount = Number(PaymentUtils.ticketAmount) - (PaymentUtils.ticketAmount/ (PaymentUtils.useTime + 1));
        PaymentUtils.totalPrice = Number(PaymentUtils.totalPrice) - (PaymentUtils.totalPrice / (PaymentUtils.useTime + 1));
        if(PaymentUtils.useTime < 1) {
            alert("1시간 미만으로는 선택하실 수 없습니다.");
            return false;
        }
        setTime();
    };
    var setTime = function() {
        $(".prTime").text(PaymentUtils.useTime.format());
        $(".prTicketNum").text(PaymentUtils.ticketAmount.format());
        $(".totalPriceNum").text(PaymentUtils.totalPrice.format());
        $("input[name=LGD_AMOUNT]").val(PaymentUtils.totalPrice);
        $("input[name=paymentUseTime]").val(PaymentUtils.useTime.format());
        $("input[name=paymentTicketAmount]").val(PaymentUtils.ticketAmount.format());
    };
    var changeProduct = function(key) {
        location.href = contextPath+"/myClapp/payment?productMasterKey="+key;
    };
    var doPayment = function() {
        var paErrMsg = null;
        paErrMsg = '${payErrMsg}';

            if(paErrMsg != "" && !paErrMsg != null){
                alert('${payErrMsg}');
                return false;
            }
            // 가상계좌 선택시 메일발송 내부 폼메일로 전환
            $("input[name=LGD_CUSTOM_USABLEPAY]:checked").each(function() {
                var test = $(this).val();
                if(test ='SC0040'){
                    $("input[name=LGD_DISPLAY_BUYEREMAIL]").val("N");
                }
            });



        <%--if('${userLoginSession.userType}' == 2) {--%>
            <%--alert("기업회원은 CLAPP으로 문의 바랍니다.");--%>
            <%--return false;--%>
        <%--}--%>
        // 암호화된 Hashdata 가져오기

        $('#LGD_PAYINFO').ajaxSubmit ({
            type : 'POST',
            dataType : 'json',
            url : contextPath + '/myClapp/rest/encryptHashdata',
            data : {
                LGD_MERTKEY : '${payLgdInfo.LGD_MERTKEY }'
            },
            success : function(r) {
                if(r.resultCode == 'success') {
                    $('#LGD_HASHDATA').val(r.resultDATA);
                    doPay_ActiveX();
                } else {
                    alert(r.resultMsg);
                    return false;
                }
            },
            fail : function() {
                alert("error");
            }
        });
        return false;
    };

    var doPay_ActiveX = function() {

        var ret = xpay_check(document.getElementById('LGD_PAYINFO'), '${payLgdInfo.CST_PLATFORM }');

        if (ret == "00") {	//ActiveX 로딩 성공
            var LGD_RESPCODE = dpop.getData('LGD_RESPCODE'); //결과코드
            var LGD_RESPMSG = dpop.getData('LGD_RESPMSG');	 //결과메세지
            if( "0000" == LGD_RESPCODE ) { // 인증성공
                var LGD_PAYKEY = dpop.getData('LGD_PAYKEY'); //LG유플러스 인증KEY
                var msg = "인증결과 : " + LGD_RESPMSG + "\n";
                msg += "LGD_PAYKEY : " + LGD_PAYKEY +"\n\n";
                document.getElementById('LGD_PAYKEY').value = LGD_PAYKEY;
// 				document.getElementById('LGD_PAYINFO').submit();
                $('#LGD_PAYINFO').ajaxSubmit ({
                    type : 'POST',
                    dataType : 'json',
                    url : contextPath + '/myClapp/rest/doPayment',
                    success : function(r) {
                        if(r.resultCode == "success") {
                            location.href = contextPath + "/myClapp/paymentComplete?paymentMasterKey=" + r.resultDATA;
                        } else {
                            alert(r.resultMSG);
                        }
                    },
                    error: function(r) { alert("error : "+r.resultMSG); }
                });
            } else {
                alert("인증이 실패하였습니다. " + LGD_RESPMSG);
            }
        } else {
            alert("LG U+ 전자결제를 위한 ActiveX Control이 설치되지 않았습니다.");
            xpay_showInstall();
        }
    };
    return {
        doPay_ActiveX : doPay_ActiveX,
        doPayment : doPayment,
        modifyTime : modifyTime,
        changeProduct : changeProduct
    };

})();

var insertPay = (function() {

    //
})();

</script>

