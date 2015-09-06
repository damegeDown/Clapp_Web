<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<input type="hidden" name="CST_PLATFORM"			id="CST_PLATFORM"		value="${payLgdInfo.CST_PLATFORM }">	<!-- 테스트, 서비스 구분 -->
<input type="hidden" name="CST_MID"					id="CST_MID"			value="${payLgdInfo.CST_MID }">			<!-- 상점아이디 -->
<input type="hidden" name="LGD_MID"					id="LGD_MID"			value="${payLgdInfo.LGD_MID }">			<!-- 상점아이디 -->
<input type="hidden" name="LGD_OID"					id="LGD_OID"			value="${payLgdInfo.LGD_OID }">			<!-- 주문번호 -->
<input type="hidden" name="LGD_PRODUCTINFO"			id="LGD_PRODUCTINFO"	value="${payLgdInfo.LGD_PRODUCTINFO }">	<!-- 상품정보 -->
<input type="hidden" name="LGD_BUYER"				id="LGD_BUYER"			value="${payLgdInfo.LGD_BUYER }">		<!-- 구매자 -->
<input type="hidden" name="LGD_BUYERID"				id="LGD_BUYERID"		value="${payLgdInfo.LGD_BUYERID }">		<!-- 구매자ID -->
<input type="hidden" name="LGD_BUYEREMAIL"			id="LGD_BUYEREMAIL"		value="${payLgdInfo.LGD_BUYEREMAIL }">	<!-- 구매자 이메일 -->
<input type="hidden" name="LGD_BUYERPHONE"			id="LGD_BUYERPHONE"		value="${payLgdInfo.LGD_BUYERPHONE }">	<!-- 구매자 휴대폰 -->
<input type="hidden" name="LGD_CUSTOM_SKIN"			id="LGD_CUSTOM_SKIN" 	value="${payLgdInfo.LGD_CUSTOM_SKIN }">	<!-- 결제창 SKIN -->
<input type="hidden" name="LGD_TIMESTAMP"			id="LGD_TIMESTAMP"		value="${payLgdInfo.LGD_TIMESTAMP }">	<!-- 타임스탬프 -->
<input type="hidden" name="LGD_CASNOTEURL"			id="LGD_CASNOTEURL"		value="${payLgdInfo.LGD_CASNOTEURL }">	<!-- 가상계좌(무통장) 결제 처리 URL -->
<input type="hidden" name="LGD_CUSTOM_PROCESSTYPE"	id="LGD_CUSTOM_PROCESSTYPE"		value="${payLgdInfo.LGD_CUSTOM_PROCESSTYPE }">	<!-- 트랜잭션 처리방식 -->
<input type="hidden" name="LGD_VERSION"				id="LGD_VERSION"		value="XPay_2.5">
<input type="hidden" name="LGD_HASHDATA"			id="LGD_HASHDATA">		<!-- MD5 해쉬암호값 -->
<input type="hidden" name="LGD_PAYKEY"				id="LGD_PAYKEY">		<!-- LG유플러스 PAYKEY(인증후 자동셋팅)-->
<input type="hidden" name="LGD_INSTALLRANGE"				id="LGD_INSTALLRANGE" value="0">		<!-- 할부 기간-->
<!-- <input type="hidden" name="LGD_CLOSEDATE"				id="LGD_CLOSEDATE" value="20150126120000">		입금기한 -->

<!-- 페이지별 개별 셋팅 -->
<!-- <input type="hidden" name="LGD_AMOUNT"				id="LGD_AMOUNT"> -->			<!-- 결제금액 -->
<!-- <input type="hidden" name="LGD_CUSTOM_USABLEPAY"	id="LGD_CUSTOM_USABLEPAY"> -->	<!-- 결제방법 -->