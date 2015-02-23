<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="dgPageNav" uri="/WEB-INF/tlds/PageNavigation.tld" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<h3 class="contents-title">메인 팝업 관리</h3>
<div class="sub-content">
	<div class="search-box">
		<select class="sel-w100">
			<option>전체</option>
			<option>전체</option>
			<option>전체</option>
		</select>
		<input type="text" class="inp-w180 marL-5"/>
		<a href="#" class="btn">검색</a>
	</div>
	<table class="board-list">
		<colgroup>
			<col width="100px"/>
			<col width="780px"/>
			<col width="100px"/>
		</colgroup>
		<thead>
			<tr>
				<th>구분</th>
				<th>제목</th>
				<th>조회수</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>Q</td>
				<td>
					<div class="floatL"><a href="#" class="subject">[회원가입] 회원가입은 어떻게 하나요?</a></div>
					<a href="faq-edit.jsp" class="floatR btn">수정</a>
				</td>
				<td>23</td>
			</tr>
			<tr class="content">
				<td>A</td>
				<td colspan="2" class="al-left">
					회원가입은 상단 join버튼 클릭 후 절차에 따라 진행하시면 되겠습니다.<br/>
					감사합니다.
				</td>
			</tr>
			<tr>
				<td>Q</td>
				<td>
					<div class="floatL"><a href="#" class="subject">[회원가입] 회원가입은 어떻게 하나요?</a></div>
					<a href="#" class="floatR btn">수정</a>
				</td>
				<td>12</td>
			</tr>
			<tr>
				<td>Q</td>
				<td>
					<div class="floatL"><a href="#" class="subject">[회원가입] 회원가입은 어떻게 하나요?</a></div>
					<a href="#" class="floatR btn">수정</a>
				</td>
				<td>32</td>
			</tr>
			<tr>
				<td>Q</td>
				<td>
					<div class="floatL"><a href="#" class="subject">[회원가입] 회원가입은 어떻게 하나요?</a></div>
					<a href="#" class="floatR btn">수정</a>
				</td>
				<td>23</td>
			</tr>
			<tr>
				<td>Q</td>
				<td>
					<div class="floatL"><a href="#" class="subject">[회원가입] 회원가입은 어떻게 하나요?</a></div>
					<a href="#" class="floatR btn">수정</a>
				</td>
				<td>23</td>
			</tr>
			<tr>
				<td>Q</td>
				<td>
					<div class="floatL"><a href="#" class="subject">[회원가입] 회원가입은 어떻게 하나요?</a></div>
					<a href="#" class="floatR btn">수정</a>
				</td>
				<td>23</td>
			</tr>
			<tr>
				<td>Q</td>
				<td>
					<div class="floatL"><a href="#" class="subject">[회원가입] 회원가입은 어떻게 하나요?</a></div>
					<a href="#" class="floatR btn">수정</a>
				</td>
				<td>23</td>
			</tr>
			<tr>
				<td>Q</td>
				<td>
					<div class="floatL"><a href="#" class="subject">[회원가입] 회원가입은 어떻게 하나요?</a></div>
					<a href="#" class="floatR btn">수정</a>
				</td>
				<td>23</td>
			</tr>
			<tr>
				<td>Q</td>
				<td>
					<div class="floatL"><a href="#" class="subject">[회원가입] 회원가입은 어떻게 하나요?</a></div>
					<a href="#" class="floatR btn">수정</a>
				</td>
				<td>23</td>
			</tr>
			<tr>
				<td>Q</td>
				<td>
					<div class="floatL"><a href="#" class="subject">[회원가입] 회원가입은 어떻게 하나요?</a></div>
					<a href="#" class="floatR btn">수정</a>
				</td>
				<td>23</td>
			</tr>
		</tbody>
	</table>
	<div class="paging-area">
		<a href="#"><img src="img/icon-first.gif"/></a>
		<a href="#"><img src="img/icon-prev.gif"/></a>
		<a href="#" class="on">1</a>
		<a href="#">2</a>
		<a href="#">3</a>
		<a href="#">4</a>
		<a href="#">5</a>
		<a href="#"><img src="img/icon-next.gif"/></a>
		<a href="#"><img src="img/icon-last.gif"/></a>
	</div>
</div>